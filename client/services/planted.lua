local WaterPrompt = 0
local DestroyPromptWG = 0
local WaterGroup = GetRandomIntInRange(0, 0xffffff)

local HarvestPrompt = 0
local DestroyPromptHG = 0
local HarvestGroup = GetRandomIntInRange(0, 0xffffff)

local PromptsStarted = false
local Crops = {}

-- [[ 1. เพิ่มฟังก์ชันหาพืชที่ใกล้ที่สุด (ป้องกันการกดทีเดียวเก็บทุกต้น) ]]
local function GetClosestCropId(playerCoords)
    local closestId = nil
    local closestDist = 9999.0

    for id, crop in pairs(Crops) do
        if crop and not crop.removePlant and crop.coords then
            local dist = #(playerCoords - vector3(crop.coords.x, crop.coords.y, crop.coords.z))
            if dist < closestDist then
                closestDist = dist
                closestId = id
            end
        end
    end
    return closestId
end

local function StartPrompts()
    -- [[ 2. สั่งปิดการสร้าง Prompt ตรงนี้ ]]
    return true 

    -- โค้ดเดิมข้างล่างนี้จะไม่ทำงาน
    -- DBG:Info('Starting water and harvest prompts...')
    -- if PromptsStarted then
    --     DBG:Success('Prompts are already started')
    --     return true
    -- end
    -- ...
end

local function LoadModel(model, modelName)
    DBG:Info('Loading model: ' .. modelName)
    if not model or not modelName then
        DBG:Error('Invalid model or modelName for LoadModel: ' .. tostring(model) .. ', ' .. tostring(modelName))
        return false
    end

    if HasModelLoaded(model) then
        DBG:Success('Model already loaded: ' .. modelName)
        return true
    end

    if not IsModelValid(model) then
        DBG:Error('Invalid model:' .. modelName)
        return false
    end

    RequestModel(model, false)
    DBG:Info('Requesting model: ' .. modelName)

    local timeout = 10000
    local startTime = GetGameTimer()

    while not HasModelLoaded(model) do
        if GetGameTimer() - startTime > timeout then
            DBG:Error('Timeout while loading model: ' .. modelName)
            return false
        end
        Wait(10)
    end

    DBG:Success('Model loaded successfully: ' .. modelName)
    return true
end

local function ScenarioInPlace(hash, time)
    if not hash or not time then
        DBG:Error('Invalid hash or time parameter for ScenarioInPlace: ' .. tostring(hash) .. ', ' .. tostring(time))
        return
    end

    local playerPed = PlayerPedId()
    if not DoesEntityExist(playerPed) or playerPed == 0 then
        DBG:Error('Player ped does not exist')
        return
    end

    FreezeEntityPosition(playerPed, true)

    local scenarioHash = type(hash) == 'string' and joaat(hash) or hash
    TaskStartScenarioInPlaceHash(playerPed, scenarioHash, time, true, 0, GetEntityHeading(playerPed), false)

    Wait(time)

    ClearPedTasks(playerPed)
    Wait(4000)
    HidePedWeapons(playerPed, 2, true)
    Wait(500)
    FreezeEntityPosition(playerPed, false)
end

RegisterNetEvent('bcc-farming:PlantPlanted', function(plantId, plantData, plantCoords, timeLeft, watered, source)
    DBG:Info('Starting PlantPlanted event...')
    if not plantId or not plantData or not plantCoords or timeLeft == nil or watered == nil then
        DBG:Error('Invalid parameters received for plant: ' .. tostring(plantId))
        return
    end

    local plantProp = plantData.plantProp
    local hash = joaat(plantProp)

    if not LoadModel(hash, plantProp) then
        DBG:Error('Failed to load model: ' .. plantProp)
        ClearPedTasks(PlayerPedId())
        return
    end

    local plantObj = CreateObject(hash, plantCoords.x, plantCoords.y, plantCoords.z - plantData.plantOffset, false, false, false, false, false)
    if not DoesEntityExist(plantObj) then
        local timeout = 10000
        local startTime = GetGameTimer()
        while not DoesEntityExist(plantObj) do
            if GetGameTimer() - startTime > timeout then
                DBG:Error('Failed to create plant object: ' .. plantProp)
                return
            end
            Wait(10)
        end
    end

    SetEntityCollision(plantObj, false, false)
    SetEntityCoords(plantObj, plantCoords.x, plantCoords.y, plantCoords.z - plantData.plantOffset, false, false, false, false)
    SetEntityHeading(plantObj, GetEntityHeading(PlayerPedId()))
    FreezeEntityPosition(plantObj, true)
    SetEntityCollision(plantObj, true, true)

    Crops[plantId] = {
        plantId = plantId,
        removePlant = false,
        watered = tostring(watered),
        object = plantObj,
        coords = plantCoords
    }

    local blip = nil
    if plantData.blips and plantData.blips.enabled and GetPlayerServerId(PlayerId()) == source then
        blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, plantCoords.x, plantCoords.y, plantCoords.z)
        if blip and blip ~= 0 then
            SetBlipSprite(blip, joaat(plantData.blips.sprite), true)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, plantData.blips.name)
            Citizen.InvokeNative(0x662D364ABF16DE2F, blip, joaat(Config.BlipColors[plantData.blips.color]))
            Crops[plantId].blip = blip
        end
    end

    if not PromptsStarted and not StartPrompts() then
        DBG:Error('Failed to start prompts')
    end

    CreateThread(function()
        while tonumber(timeLeft) > 0 and Crops[plantId] and not Crops[plantId].removePlant do
            if Crops[plantId].watered == 'true' then
                Wait(1000)
                timeLeft = timeLeft - 1
                if Crops[plantId] then
                    Crops[plantId].timeLeft = timeLeft
                end
            else
                Wait(200)
            end
        end
    end)

    -- Main plant interaction loop
    while Crops[plantId] and not Crops[plantId].removePlant do
        local sleep = 1000
        local playerCoords = GetEntityCoords(PlayerPedId())
        local dist = #(playerCoords - vector3(plantCoords.x, plantCoords.y, plantCoords.z))

        if dist <= 1.5 then
            -- [[ 3. แก้ไข Logic: เช็คว่าเป็นต้นที่ใกล้ที่สุดหรือไม่ก่อนทำงาน ]]
            if GetClosestCropId(playerCoords) == plantId then
                sleep = 0

                -- Handle watered plants
                if tostring(Crops[plantId].watered) ~= 'false' then
                    if tonumber(timeLeft) > 0 then
                        -- ช่วงรอโต (ปิด Prompt ทิ้ง)
                        -- UiPromptSetEnabled(HarvestPrompt, false)
                        -- UiPromptSetActiveGroupThisFrame(HarvestGroup, ...)

                    -- Handle harvest
                    elseif tonumber(timeLeft) <= 0 then
                        -- ช่วงเก็บเกี่ยว (ปิด Prompt ทิ้ง และใช้ IsControlJustPressed แทน)
                        
                        -- [[ ใช้ปุ่มกด Harvest (กดทีเดียว) ]]
                        if IsControlJustPressed(0, Config.keys.harvest) then
                            DBG:Info('Harvest key pressed...')
                            PlayAnim('mech_pickup@plant@berries', 'base', 2500, false, true)
                            Core.Callback.TriggerAwait('bcc-farming:HarvestCheck', plantId, plantData, false)
                        end
                    end

                    -- [[ ใช้ปุ่มกด Destroy (สำหรับต้นที่รดน้ำแล้ว) ]]
                    if IsControlJustPressed(0, Config.keys.destroy) then
                        DBG:Info('Destroy key pressed...')
                        local canDestroy = Core.Callback.TriggerAwait('bcc-farming:HarvestCheck', plantId, plantData, true)
                        if canDestroy then
                            PlayAnim('amb_camp@world_camp_fire@stomp@male_a@wip_base', 'wip_base', 8000, false, true)
                        end
                    end
                end

                -- Handle unwatered plants
                if tostring(Crops[plantId].watered) == 'false' then
                    local isRaining = GetRainLevel()
                    if isRaining > 0 then
                        TriggerServerEvent('bcc-farming:UpdatePlantWateredStatus', plantId)
                    else
                        -- ปิด Prompt ทิ้ง
                        -- UiPromptSetActiveGroupThisFrame(WaterGroup, ...)

                        -- [[ ใช้ปุ่มกด Water (รดน้ำ) ]]
                        if IsControlJustPressed(0, Config.keys.water) then
                            DBG:Info('Water key pressed...')
                            local canWater = Core.Callback.TriggerAwait('bcc-farming:ManagePlantWateredStatus', plantId)
                            if canWater then
                                ScenarioInPlace('WORLD_HUMAN_BUCKET_POUR_LOW', 5000)
                            else
                                Core.NotifyRightTip(_U('noWaterBucket'), 4000)
                            end
                        end

                        -- [[ ใช้ปุ่มกด Destroy (สำหรับต้นยังไม่รดน้ำ) ]]
                        if IsControlJustPressed(0, Config.keys.destroy) then
                            DBG:Info('Destroy key pressed...')
                            local canDestroy = Core.Callback.TriggerAwait('bcc-farming:HarvestCheck', plantId, plantData, true)
                            if canDestroy then
                                PlayAnim('amb_camp@world_camp_fire@stomp@male_a@wip_base', 'wip_base', 8000, false, true)
                            end
                        end
                    end
                end
            else
                -- ถ้าไม่ใช่ต้นที่ใกล้ที่สุด ให้รอเล็กน้อย
                sleep = 100
            end -- จบเงื่อนไข GetClosestCropId
        end
        Wait(sleep)
    end

    if Crops[plantId] then
        if Crops[plantId].blip then
            RemoveBlip(Crops[plantId].blip)
        end
        if Crops[plantId].object and DoesEntityExist(Crops[plantId].object) then
            DeleteObject(Crops[plantId].object)
        end
        Crops[plantId] = nil
    end
end)

RegisterNetEvent('bcc-farming:RemovePlantClient', function(plantId)
    if not plantId then
        DBG:Error('Invalid plantId received for RemovePlantClient')
        return
    end

    if Crops[plantId] then
        DBG:Info('Removing plant with ID: ' .. tostring(plantId))
        Crops[plantId].removePlant = true
    else
        DBG:Warning('Attempted to remove non-existent plant with ID: ' .. tostring(plantId))
    end
end)

RegisterNetEvent('bcc-farming:UpdateClientPlantWateredStatus', function (plantId)
    if not plantId then
        DBG:Error('Invalid plantId received for UpdateClientPlantWateredStatus')
        return
    end

    if Crops[plantId] then
        DBG:Info('Updating watered status for plant with ID: ' .. tostring(plantId))
        Crops[plantId].watered = 'true'
    else
        DBG:Warning('Attempted to update watered status for non-existent plant with ID: ' .. tostring(plantId))
    end
end)