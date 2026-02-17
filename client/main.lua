local isTrackerOpen = true 
local lastPlantCount = 0
local isCursorActive = false

--RegisterNetEvent('vorp:SelectedCharacter', function()
CreateThread(function()
    TriggerServerEvent('bcc-farming:NewClientConnected')
    TriggerEvent('bcc-farming:ShowSmellingPlants')
end)
--end)

function PlayAnim(animDict, animName, time, raking, loopUntilTimeOver)
    -- Validate inputs
    if not animDict or not animName then
        DBG:Error('Invalid animation dictionary or name for PlayAnim: ' .. tostring(animDict) .. ', ' .. tostring(animName))
        return
    end

    local playerPed = PlayerPedId()
    if not DoesEntityExist(playerPed) or playerPed == 0 then
        DBG:Error('Player ped does not exist')
        return
    end

    -- Load animation dictionary
    RequestAnimDict(animDict)
    local timeout = 10000
    local startTime = GetGameTimer()

    while not HasAnimDictLoaded(animDict) do
        if GetGameTimer() - startTime > timeout then
            print('Failed to load animation dictionary:', animDict)
            return
        end
        Wait(10)
    end

    local animTime = time

    -- Set animation flags
    local flag = 16 -- Default flag for one-time playback
    if loopUntilTimeOver then
        flag = 1    -- Flag for looping
        animTime = -1
    end

    -- Play animation
    TaskPlayAnim(playerPed, animDict, animName, 1.0, 1.0, animTime, flag, 0, true, 0, false, 0, false)

    -- Handle rake object if needed
    local rakeObj = nil
    if raking then
        local playerCoords = GetEntityCoords(playerPed)
        rakeObj = CreateObject('p_rake02x', playerCoords.x, playerCoords.y, playerCoords.z, true, true, false)
        if rakeObj and rakeObj ~= 0 then
            AttachEntityToEntity(rakeObj, playerPed, GetEntityBoneIndexByName(playerPed, 'PH_R_Hand'), 0.0, 0.0, 0.19,
            0.0, 0.0, 0.0, false, false, true, false, 0, true, false, false)
        else
            DBG:Warning('Failed to create rake object')
        end
    end

    -- Wait for animation to complete
    Wait(time)

    -- Clean up rake object
    if raking and rakeObj and DoesEntityExist(rakeObj) then
        DeleteObject(rakeObj)
    end

    ClearPedTasks(playerPed)
end

AddEventHandler('bcc-farming:ShowSmellingPlants', function()
    CreateThread(function()
        local blips = {}
        local lastNotificationTime = 0
        local notificationCooldown = Config.smelling.notifications.cooldown * 1000 -- Convert to milliseconds
        local lastBlipUpdateTime = 0
        local blipUpdateCooldown = Config.smelling.blip.frequency * 1000 -- Convert to milliseconds
        local blipDuration = Config.smelling.blip.duration * 1000 -- Convert to milliseconds

        while true do
            Wait(5000)

            -- Get player ped
            local playerPed = PlayerPedId()
            if playerPed == 0 or not DoesEntityExist(playerPed) then
                DBG:Warning("Player ped does not exist, waiting to retry...")
                goto continueLoop
            end

            -- Get and validate player coords
            local playerCoords = GetEntityCoords(playerPed)
            if not playerCoords or playerCoords == vector3(0, 0, 0) then
                DBG:Warning("Invalid player coordinates, waiting to retry...")
                goto continueLoop
            end

            -- Get smelling plants from server
            local smellingPlants = Core.Callback.TriggerAwait('bcc-farming:DetectSmellingPlants', playerCoords)

            -- Validate response
            if not smellingPlants then
                --DBG:Info('No smelling plants found or invalid data received')
                goto continueLoop
            end

            if smellingPlants == false then
                DBG:Info('Server returned false, likely due to job restriction or error')
                goto continueLoop
            end

            if type(smellingPlants) ~= "table" or #smellingPlants == 0 then
                DBG:Info('Empty smelling plants table received')
                goto continueLoop
            end

            DBG:Info('Received ' .. tostring(#smellingPlants) .. ' smelling plants to show')

            -- Show notification with cooldown
            if Config.smelling.notifications.enabled then
                local currentTime = GetGameTimer()
                if currentTime - lastNotificationTime > notificationCooldown then
                    Notify(_U('SmellPlant'), "info", 5000)
                    lastNotificationTime = currentTime
                end
            end

            -- Create blips for all smelling plants
            if Config.smelling.blip.enabled then
                -- Check if it's time to update blips
                local currentTime = GetGameTimer()
                if currentTime - lastBlipUpdateTime > blipUpdateCooldown then
                    -- Clear previous blips
                    for _, blip in pairs(blips) do
                        RemoveBlip(blip)
                    end
                    blips = {}

                    local blip
                    for _, plant in pairs(smellingPlants) do
                        -- Validate plant data
                        if not plant or not plant.plantName or not plant.coords or not plant.coords.x or not plant.coords.y or not plant.coords.z then
                            DBG:Warning("Invalid plant data in smellingPlants table")
                            goto continuePlant
                        end

                        DBG:Info('Showing smelling plant: ' .. plant.plantName .. ' at coords: ' .. plant.coords.x .. ', ' .. plant.coords.y .. ', ' .. plant.coords.z)

                        -- Create blip
                        blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, plant.coords.x, plant.coords.y,
                            plant.coords.z)

                        if blip and blip ~= 0 then
                            SetBlipSprite(blip, joaat(Config.smelling.blip.sprite), true)
                            Citizen.InvokeNative(0x9CB1A1623062F402, blip, _U('SmellablePlant') .. plant.plantName)
                            Citizen.InvokeNative(0x662D364ABF16DE2F, blip, joaat(Config.BlipColors[Config.smelling.blip.color]))
                            table.insert(blips, blip)
                        else
                            DBG:Warning("Failed to create blip for plant: " .. plant.plantName)
                        end
                        ::continuePlant::
                    end

                    lastBlipUpdateTime = currentTime

                    -- Remove all blips after the configured duration
                    if #blips > 0 then
                        Wait(blipDuration)
                        for _, plantBlip in pairs(blips) do
                            RemoveBlip(plantBlip)
                        end
                        blips = {}
                    end
                end
            end
            ::continueLoop::
        end
    end)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    ClearPedTasksImmediately(PlayerPedId())
end)

-- เมื่อผู้เล่นเลือกตัวละครเสร็จ ให้เรียกขอข้อมูลต้นไม้จาก Server
RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    TriggerServerEvent('bcc-farming:NewClientConnected')
end)

-- (Option เสริม) สำหรับตอน Restart Script แล้วให้ต้นไม้ขึ้นทันทีโดยไม่ต้องออกเข้าใหม่
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    TriggerServerEvent('bcc-farming:NewClientConnected')
end)

-- =============================================================
--  FARMING TRACKER UI LOGIC (UPDATED)
-- =============================================================
-- ฟังก์ชันช่วยเปิด/ปิด NUI
local function ToggleNuiState(state)
    isTrackerOpen = state
    SendNUIMessage({
        action = "toggleTracker",
        show = state
    })
end

-- คำสั่งเปิด/ปิด Tracker แบบ Manual (/farmtracker)
RegisterCommand("farmtracker", function()
    -- เงื่อนไข: ต้องมีพืชอยู่อย่างน้อย 1 ต้น ถึงจะกดเปิด/ปิดได้
    if lastPlantCount > 0 then
        -- สลับสถานะ (เปิด -> ปิด, ปิด -> เปิด)
        ToggleNuiState(not isTrackerOpen)
        
        -- ถ้าสั่งเปิด ให้ขอข้อมูลใหม่ทันทีเพื่อความชัวร์
        if isTrackerOpen then
            TriggerServerEvent('bcc-farming:RequestMyPlants')
        end
    else
        -- กรณีไม่มีพืช แจ้งเตือนผู้เล่น
        Notify("ไม่พบข้อมูลพืชของคุณ", "error", 3000)
        
        -- ถ้ามันเปิดค้างอยู่ (กรณีบั๊ก) สั่งปิดทันที
        if isTrackerOpen then
            ToggleNuiState(false)
        end
    end
end)

-- Callback จาก NUI เมื่อกดปุ่มปิด X
RegisterNUICallback('closeTracker', function(data, cb)
    ToggleNuiState(false)
    cb('ok')
end)

-- รับข้อมูลรายการพืชจาก Server เพื่อประมวลผล
RegisterNetEvent('bcc-farming:ReceiveMyPlants', function(plantsData)
    local currentCount = plantsData and #plantsData or 0
    
    -- [[ Logic เปิด/ปิด อัตโนมัติ ]]
    
    -- กรณีที่ 1: เริ่มปลูกต้นแรก (จำนวนเปลี่ยนจาก 0 -> มากกว่า 0)
    -- ระบบจะเปิด UI ให้อัตโนมัติ
    if lastPlantCount == 0 and currentCount > 0 then
        ToggleNuiState(true)
    end

    -- กรณีที่ 2: เก็บเกี่ยวหมดเกลี้ยง (จำนวนเปลี่ยนจาก มากกว่า 0 -> 0)
    -- ระบบจะปิด UI ให้อัตโนมัติ
    if lastPlantCount > 0 and currentCount == 0 then
        ToggleNuiState(false)
    end

    -- อัปเดตจำนวนพืชล่าสุดเก็บไว้เปรียบเทียบรอบหน้า
    lastPlantCount = currentCount

    -- ส่งข้อมูลไปอัปเดต UI (เฉพาะตอนที่เปิดอยู่)
    if isTrackerOpen then
        SendNUIMessage({
            action = "updateTracker",
            plants = plantsData
        })
    end
end)

-- Loop ทำงานตลอดเวลาเพื่อเช็คจำนวนพืช (ทุก 1 วินาที)
CreateThread(function()
    Wait(2000) -- รอโหลดสคริปต์เสร็จ
    
    while true do
        Wait(1000)
        -- ขอข้อมูลตลอดเวลาเพื่อให้ Client รู้สถานะปัจจุบัน (0 หรือ มีต้นไม้)
        -- เพื่อใช้ตัดสินใจในการ Auto Open/Close และอนุญาตให้ใช้คำสั่ง
        TriggerServerEvent('bcc-farming:RequestMyPlants')
    end
end)

CreateThread(function()
    while true do
        Wait(10) -- เช็คทุก 10ms (ไม่ต้องถี่มาก)
        
        -- ทำงานเฉพาะตอนที่ Tracker เปิดอยู่เท่านั้น
        if isTrackerOpen then
            -- เช็คว่ากดปุ่ม Left Alt (0x8AAA0AD4) อยู่หรือไม่
            -- ใช้ IsDisabledControlPressed เพื่อให้เช็คได้แม้ตอน NUI Focus ทำงานอยู่
            if IsDisabledControlPressed(0, 0x8AAA0AD4) then
                if not isCursorActive then
                    SetNuiFocus(true, true) -- เปิดเมาส์ + คีย์บอร์ด NUI
                    SetNuiFocusKeepInput(true) -- อนุญาตให้กดเดิน/ขยับกล้องได้ (ถ้าต้องการ)
                    isCursorActive = true
                end
            else
                -- ถ้าปล่อยปุ่ม Alt แล้วเมาส์ยังค้างอยู่ ให้ปิด
                if isCursorActive then
                    SetNuiFocus(false, false) -- ปิดเมาส์
                    SetNuiFocusKeepInput(false)
                    isCursorActive = false
                end
            end
        else
            -- ถ้า Tracker ปิดอยู่ แต่เมาส์ค้าง (เผื่อกรณีบั๊ก) ให้ปิดทิ้ง
            if isCursorActive then
                SetNuiFocus(false, false)
                isCursorActive = false
            end
        end
    end
end)