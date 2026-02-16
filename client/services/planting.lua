local PlantingProcess = false

-- ไม่จำเป็นต้องใช้ StartPrompts หรือตัวแปร Prompt แล้ว เพราะเราทำเป็นอัตโนมัติ

RegisterNetEvent('bcc-farming:PlantingCrop', function(plantData, bestFertilizer, houseLocks)
    DBG:Info('PlantingCrop event triggered')
    
    -- ตรวจสอบข้อมูลเบื้องต้น
    if not plantData then
        DBG:Error('Invalid plantData received')
        return
    end

    local playerPed = PlayerPedId()
    if not DoesEntityExist(playerPed) or IsEntityDead(playerPed) then
        DBG:Error('Player ped is invalid or dead')
        return
    end

    local playerCoords = GetEntityCoords(playerPed)
    HidePedWeapons(playerPed, 2, true)

    local placementHeading
    local withinLock = false
    local lockRequired = plantData.lockCoords and type(plantData.coordsLocks) == 'table' and next(plantData.coordsLocks)
    local withinHouseRadius = false

    -- ตรวจสอบความเป็นเจ้าของบ้าน (House Ownership)
    if Config.plantSetup.requireHouseOwnership and type(houseLocks) == 'table' then
        for _, house in ipairs(houseLocks) do
            if house.x and house.y and house.z and house.radius then
                local dist = #(playerCoords - vector3(house.x, house.y, house.z))
                if dist <= (house.radius or 0.0) then
                    withinHouseRadius = true
                    break
                end
            end
        end
    end

    -- ตรวจสอบพิกัดที่ล็อคไว้ (Locked Coords)
    if lockRequired then
        local baseRadius = plantData.coordsLockRange or 2.5
        local radiusPadding = plantData.coordsLockTolerance or 0.0

        for _, lock in ipairs(plantData.coordsLocks) do
            local normalized = lock
            local lradius
            local lheading
            
            if type(lock) == 'table' then
                lradius = lock.radius or lock.range
                lheading = lock.heading
                if lock.coords then normalized = lock.coords end
            end

            local lx, ly, lz, lh
            if type(normalized) == 'vector3' or type(normalized) == 'vector4' then
                lx = normalized.x + 0.0
                ly = normalized.y + 0.0
                lz = normalized.z + 0.0
                if normalized.w or normalized.h then
                    lh = (normalized.w or normalized.h) + 0.0
                end
            elseif type(normalized) == 'table' then
                lx = normalized.x or normalized[1]
                ly = normalized.y or normalized[2]
                lz = normalized.z or normalized[3]
                lh = normalized.w or normalized.h or normalized.heading or normalized[4]
            end

            if lx and ly and lz then
                local lockVector = vector3(lx, ly, lz)
                local distance = #(lockVector - playerCoords)
                local allowedRadius = (lradius or baseRadius) + radiusPadding
                if distance <= allowedRadius then
                    withinLock = true
                    placementHeading = lheading or lh
                    break
                end
            end
        end
    end

    -- แจ้งเตือนหากไม่อยู่ในจุดที่กำหนด
    if lockRequired and not withinLock and not withinHouseRadius then
        Notify(_U('mustUseLockedSpot'), "error", 4000)
        TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
        return
    end

    if Config.plantSetup.requireHouseOwnership and not withinHouseRadius and not withinLock then
        Notify(_U('needHousePlot'), "error", 4000)
        TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
        return
    end

    -- ตรวจสอบต้นไม้อื่นๆ ใกล้เคียง
    for _, plantCfg in pairs(Plants) do
        local entity = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, plantData.plantingDistance, joaat(plantCfg.plantProp), false, false, false)
        if entity ~= 0 then
            Notify(_U('tooCloseToAnotherPlant'), "error", 4000)
            TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
            return
        end
    end

    -- ป้องกันการปลูกซ้ำซ้อน
    if PlantingProcess then
        Notify(_U('FinishPlantingProcessFirst'), "error", 4000)
        TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
        return
    end

    PlantingProcess = true
    DBG:Info('Planting process started')

    -- เริ่มอนิเมชั่นพรวนดิน
    Notify(_U('raking'), "info", 5000)
    PlayAnim('amb_work@world_human_farmer_rake@male_a@idle_a', 'idle_a', 5000, true, true)

    -- ตรวจสอบว่าผู้เล่นตายระหว่างอนิเมชั่นหรือไม่
    if IsEntityDead(playerPed) then
        Notify(_U('failed'), "error", 4000)
        PlantingProcess = false
        TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
        return
    end

    -- หักเครื่องมือปลูก (ถ้ามี)
    if plantData.plantingToolRequired then
        DBG:Info('Sending tool usage data')
        TriggerServerEvent('bcc-farming:PlantToolUsage', plantData)
    end

    -- [[ AUTO FERTILIZER LOGIC ]] 
    -- ใส่ปุ๋ยให้อัตโนมัติถ้ามี bestFertilizer ส่งมา (ไม่ต้องรอ Prompt)
    if plantData.fertilizer ~= false and bestFertilizer then
        plantData.timeToGrow = math.floor(plantData.timeToGrow - (bestFertilizer.fertTimeReduction * plantData.timeToGrow))
        TriggerServerEvent('bcc-farming:RemoveFertilizer', bestFertilizer.fertName)
        Notify(_U('fertilize') .. ": " .. bestFertilizer.fertName, "success", 3000)
    end
    
    Notify(_U('plantingDone'), "success", 4000)

    -- ส่งข้อมูลกลับไป Server เพื่อสร้างต้นไม้ (และ Server จะจัดการรดน้ำให้ต่อ)
    DBG:Info('Planting crop at final location')
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, 0.0))
    local plantCoords = {
        x = x,
        y = y,
        z = z
    }
    if placementHeading then
        plantCoords.w = placementHeading
    end
    TriggerServerEvent('bcc-farming:AddPlant', plantData, plantCoords)

    PlantingProcess = false
end)