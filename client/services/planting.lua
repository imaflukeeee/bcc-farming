local ProgressBar = exports.vorp_progressbar:initiate()

RegisterNetEvent('bcc-farming:PlantingCrop', function(plantData, bestFertilizer, houseLocks)
    local playerPed = PlayerPedId()
    local pc = GetEntityCoords(playerPed)
    
    -- [[ 1. ตรวจสอบเงื่อนไขต่างๆ (Lock / House / Proximity) ]] --
    local placementHeading
    local withinLock = false
    local lockRequired = plantData.lockCoords and type(plantData.coordsLocks) == 'table' and next(plantData.coordsLocks)
    local withinHouseRadius = false

    -- Check House Ownership
    if Config.plantSetup.requireHouseOwnership and type(houseLocks) == 'table' then
        for _, house in ipairs(houseLocks) do
            if house.x and house.y and house.z and house.radius then
                local dist = #(pc - vector3(house.x, house.y, house.z))
                if dist <= (house.radius or 0.0) then
                    withinHouseRadius = true
                    break
                end
            end
        end
    end

    -- Check Locked Coords
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
                local distance = #(lockVector - pc)
                local allowedRadius = (lradius or baseRadius) + radiusPadding
                if distance <= allowedRadius then
                    withinLock = true
                    placementHeading = lheading or lh
                    break
                end
            end
        end
    end

    -- Validation Alerts
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

    -- Check nearby plants
    for _, plantCfg in pairs(Plants) do
        local entity = GetClosestObjectOfType(pc.x, pc.y, pc.z, plantData.plantingDistance, joaat(plantCfg.plantProp), false, false, false)
        if entity ~= 0 then
            Notify(_U('tooCloseToAnotherPlant'), "error", 4000)
            TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
            return
        end
    end

    -- [[ 2. เริ่มกระบวนการปลูก (One-Time Progress Bar with Animation Switching) ]] --
    
    local forward = GetEntityForwardVector(playerPed)
    local x, y, z = table.unpack(pc + forward * 0.8)
    
    local groundZ
    local foundGround, zPos = GetGroundZFor_3dCoord(x, y, z, false)
    if foundGround then
        groundZ = zPos
    else
        groundZ = z - 0.98
    end

    local finalCoords = vector3(x, y, groundZ)
    local heading = GetEntityHeading(playerPed)
    
    if placementHeading then
        heading = placementHeading
    end

    local progressTime = 12000 -- รวม 12 วินาที
    local switchTime = 6000   -- เปลี่ยนท่าตอนวินาทีที่ 6
    local isPlantingActive = true -- ตัวแปรเช็คสถานะ

    -- Thread สำหรับจัดการ Animation (ทำงานแยกกับ ProgressBar)
    Citizen.CreateThread(function()
        -- Phase 1: พรวนดิน (Rake)
        TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_FARMER_RAKE'), -1, true, false, false, false)
        
        -- รอ 6 วินาที
        Citizen.Wait(switchTime)

        -- ถ้ายังปลูกอยู่และไม่ตาย ให้เปลี่ยนเป็นท่ารดน้ำ
        if isPlantingActive and not IsEntityDead(playerPed) then
            -- Phase 2: รดน้ำ (Water)
            ClearPedTasksImmediately(playerPed) -- ล้างท่าถือจอบออกก่อน
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_BUCKET_POUR_LOW'), -1, true, false, false, false)
        end
    end)

    -- เริ่มหลอดโหลดเดียว ยาว 12 วินาที
    ProgressBar.start("กำลังปลูกพืช...", progressTime, function()
        isPlantingActive = false -- หยุด logic ใน Thread (ถ้ามี)
        
        ClearPedTasksImmediately(playerPed)

        if IsEntityDead(playerPed) then
            Notify(_U('failed'), "error", 4000)
            TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
            return
        end

        -- หักเครื่องมือ (ถ้ามี)
        if plantData.plantingToolRequired then
            TriggerServerEvent('bcc-farming:PlantToolUsage', plantData)
        end

        -- ใส่ปุ๋ยออโต้
        if plantData.fertilizer ~= false and bestFertilizer then
            plantData.timeToGrow = math.floor(plantData.timeToGrow - (bestFertilizer.fertTimeReduction * plantData.timeToGrow))
            TriggerServerEvent('bcc-farming:RemoveFertilizer', bestFertilizer.fertName)
        end

        -- ส่งข้อมูลไป Server
        local coordsToSend = { x = finalCoords.x, y = finalCoords.y, z = finalCoords.z, w = heading }
        TriggerServerEvent('bcc-farming:AddPlant', plantData, coordsToSend)
        Notify("คุณปลูกพืชสำเร็จ", "success", 4000)
    end, 'linear')
end)