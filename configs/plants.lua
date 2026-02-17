Plants = {
    {
        plantingToolRequired = true,       -- ถ้าเป็น true ผู้เล่นจะต้องใช้เครื่องมือเพื่อปลูกเมล็ด
        plantingTool = 'hoe',              -- ชื่อไอเทมสำหรับเครื่องมือปลูก (ความทนทานเริ่มต้นที่ 100)
        plantingToolUsage = 2,             -- ค่าความทนทานที่ลดลงจากเครื่องมือเมื่อปลูกเมล็ด
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Cocoa',               -- ชื่อของต้นไม้
        seedName = 'cocoaseeds',           -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        fertilizer = true,
        allowedWater = {'wateringcan'}, 
        -- หรือถ้าต้องการให้ใช้ได้ทั้งสองอย่าง ก็ใส่แบบนี้:
        -- allowedWater = {'wateringcan', 'wateringcan_dirtywater'},
        plantProp = 's_ginsengpicked01x',  -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 900,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = false,                  -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Cocoa',                -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'cocoa',
                itemLabel = 'Cocoa',
                amount = 1
            }
        },
        jobs = {
            'farmer',
            'doctor'
        },
        lockCoords = true, -- ตั้งเป็น false เพื่ออนุญาตให้ปลูกที่ไหนก็ได้
        coordsLockRange = 50,
        coordsLockTolerance = 0.75,
        coordsLocks = {
            vector3(1306.07, -1903.26, 52.26)
        }
    },
    -----------------------------------------------------
    {
        plantingToolRequired = true,       -- ถ้าเป็น true ผู้เล่นจะต้องใช้เครื่องมือเพื่อปลูกเมล็ด
        plantingTool = 'hoe',              -- ชื่อไอเทมสำหรับเครื่องมือปลูก (ความทนทานเริ่มต้นที่ 100)
        plantingToolUsage = 2,             -- ค่าความทนทานที่ลดลงจากเครื่องมือเมื่อปลูกเมล็ด
        plantingDistance = 0.1,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'ต้นข้าวโพด',                -- ชื่อของต้นไม้
        seedName = 'cornseed',             -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        fertilizer = false,
        allowedWater = {'wateringcan_dirtywater'},
        plantProp = 'crp_cornstalks_bb_sim', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 30,                   -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = false,                  -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Corn',                 -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'corn',
                itemLabel = 'Corn',
                amount = 1
            }
        },
        jobs = {},
        lockCoords = true, -- ตั้งเป็น false เพื่ออนุญาตให้ปลูกที่ไหนก็ได้
        coordsLockRange = 50,
        coordsLockTolerance = 0.75,
        coordsLocks = {
            vector3(1306.07, -1903.26, 52.26)
        }
    }
}