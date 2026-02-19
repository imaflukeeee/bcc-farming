local ProgressBar = exports.vorp_progressbar:initiate()
local PromptsStarted = false
local Crops = {}

RegisterNetEvent('bcc-farming:PlantingCrop', function(plantData, bestFertilizer, houseLocks)
    local playerPed = PlayerPedId()
    local pc = GetEntityCoords(playerPed)
    
    -- [[ 1. ตรวจสอบ Stamina ก่อนปลูก ]] --
    local staminaCost = tonumber(plantData.staminaCost) or 20 
    local currentStaminaCore = tonumber(GetAttributeCoreValue(playerPed, 1)) or 0
    
    if currentStaminaCore < staminaCost then
        Notify("คุณเหนื่อยเกินไป (Stamina Core ไม่พอ)", "error", 4000)
        TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
        return
    end
    -- ========================================== --

    -- [[ 2. ตรวจสอบเงื่อนไขการปลูก (Lock / House / ระยะห่าง) ]] --
    local placementHeading
    local withinLock = false
    local lockRequired = plantData.lockCoords and type(plantData.coordsLocks) == 'table' and next(plantData.coordsLocks)
    local withinHouseRadius = false

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

    for _, plantCfg in pairs(Plants) do
        local entity = GetClosestObjectOfType(pc.x, pc.y, pc.z, plantData.plantingDistance, joaat(plantCfg.plantProp), false, false, false)
        if entity ~= 0 then
            Notify(_U('tooCloseToAnotherPlant'), "error", 4000)
            TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
            return
        end
    end
    -- ========================================== --

    -- [[ 3. หัก Stamina Core ทันทีที่เริ่มปลูก (เอาส่วนหัก Ring ออกแล้ว) ]] --
    local newStaminaCore = currentStaminaCore - staminaCost
    if newStaminaCore < 0 then newStaminaCore = 0 end
    
    -- หักเฉพาะ Core (รูปสายฟ้าตรงกลาง) เท่านั้น
    SetAttributeCoreValue(playerPed, 1, newStaminaCore)
    -- ========================================== --

    -- [[ 4. เริ่มกระบวนการปลูก (ProgressBar + Animations) ]] --
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

    local progressTime = 12000
    local switchTime = 6000
    local isPlantingActive = true

    Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_FARMER_RAKE'), -1, true, false, false, false)
        Citizen.Wait(switchTime)
        if isPlantingActive and not IsEntityDead(playerPed) then
            ClearPedTasksImmediately(playerPed)
            TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_BUCKET_POUR_LOW'), -1, true, false, false, false)
        end
    end)

    ProgressBar.start("กำลังปลูกพืช...", progressTime, function()
        isPlantingActive = false
        ClearPedTasksImmediately(playerPed)

        if IsEntityDead(playerPed) then
            Notify(_U('failed'), "error", 4000)
            TriggerServerEvent('bcc-farming:ReturnItems', plantData.seedName, plantData.seedAmount, plantData.soilRequired, plantData.soilName, plantData.soilAmount)
            return
        end

        if plantData.plantingToolRequired then
            TriggerServerEvent('bcc-farming:PlantToolUsage', plantData)
        end

        if plantData.fertilizer ~= false and bestFertilizer then
            plantData.timeToGrow = math.floor(plantData.timeToGrow - (bestFertilizer.fertTimeReduction * plantData.timeToGrow))
            TriggerServerEvent('bcc-farming:RemoveFertilizer', bestFertilizer.fertName)
        end

        local coordsToSend = { x = finalCoords.x, y = finalCoords.y, z = finalCoords.z, w = heading }
        TriggerServerEvent('bcc-farming:AddPlant', plantData, coordsToSend)
        Notify("คุณปลูกพืชสำเร็จ", "success", 4000)
    end, 'linear')
end)