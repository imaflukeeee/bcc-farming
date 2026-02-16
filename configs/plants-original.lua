Plants = {
    {
        plantingToolRequired = true,       -- ถ้าเป็น true ผู้เล่นจะต้องใช้เครื่องมือเพื่อปลูกเมล็ด
        plantingTool = 'hoe',              -- ชื่อไอเทมสำหรับเครื่องมือปลูก (ความทนทานเริ่มต้นที่ 100)
        plantingToolUsage = 2,             -- ค่าความทนทานที่ลดลงจากเครื่องมือเมื่อปลูกเมล็ด
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Agarita',             -- ชื่อของต้นไม้
        seedName = 'Agarita_Seed',         -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'p_tree_orange_01',    -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 900,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = true,                   -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Agarita',              -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Agarita',
                itemLabel = 'Agarita',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Yarrow',              -- ชื่อของต้นไม้
        seedName = 'Yarrow_Seed',          -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'yarrow01_p',          -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 900,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = true,                   -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Yarrow',               -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Yarrow',
                itemLabel = 'Yarrow',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Hop',                 -- ชื่อของต้นไม้
        seedName = 'hop_seed',             -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'rdr2_bush_snakeweedflower', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 900,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = true,                   -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Hop',                  -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'hop',
                itemLabel = 'Hop',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Alaskan Ginseng',     -- ชื่อของต้นไม้
        seedName = 'Alaskan_Ginseng_Seed', -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'alaskanginseng_p',    -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Alaskan Ginseng',      -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Alaskan_Ginseng',
                itemLabel = 'Alaskan Ginseng',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'American Ginseng',    -- ชื่อของต้นไม้
        seedName = 'American_Ginseng_Seed', -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'ginseng_p',           -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'American Ginseng',     -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'American_Ginseng',
                itemLabel = 'American Ginseng',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Bay Bolete',          -- ชื่อของต้นไม้
        seedName = 'Bay_Bolete_Seed',      -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_milkweed01x',       -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 900,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = true,                   -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Bay Bolete',           -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Bay_Bolete',
                itemLabel = 'Bay Bolete',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Bitter Weed',         -- ชื่อของต้นไม้
        seedName = 'Bitter_Weed_Seed',     -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_milkweed01x',       -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 900,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = true,                   -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Bitter Weed',          -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Bitter_Weed',
                itemLabel = 'Bitter Weed',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Black Berry',         -- ชื่อของต้นไม้
        seedName = 'Black_Berry_Seed',     -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_blackberry01x', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Black Berry',          -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Black_Berry',
                itemLabel = 'Black Berry',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Black Currant',       -- ชื่อของต้นไม้
        seedName = 'Black_Currant_Seed',   -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_blackberry01x', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Black Currant',        -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Black_Currant',
                itemLabel = 'Black Currant',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Hop',                 -- ชื่อของต้นไม้
        seedName = 'hop_seed',             -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'rdr2_bush_snakeweedflower', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 900,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = true,                   -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Hop',                  -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'hop',
                itemLabel = 'Hop',
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
        plantName = 'Corn',                -- ชื่อของต้นไม้
        seedName = 'cornseed',             -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        fertilizer = false,
        allowedWater = {'wateringcan_dirtywater'},
        plantProp = 'crp_cornstalks_bb_sim', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 60,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
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
    },
    -----------------------------------------------------
    {
        plantingToolRequired = true,       -- ถ้าเป็น true ผู้เล่นจะต้องใช้เครื่องมือเพื่อปลูกเมล็ด
        plantingTool = 'hoe',              -- ชื่อไอเทมสำหรับเครื่องมือปลูก (ความทนทานเริ่มต้นที่ 100)
        plantingToolUsage = 2,             -- ค่าความทนทานที่ลดลงจากเครื่องมือเมื่อปลูกเมล็ด
        plantingDistance = 0.1,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Creekplum',           -- ชื่อของต้นไม้
        seedName = 'Creekplum_Seed',       -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_ginsengpicked01x',  -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 60,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = false,                 -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = false,                  -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Creekplum',            -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Creekplum',
                itemLabel = 'Creekplum',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Crows Garlic',        -- ชื่อของต้นไม้
        seedName = 'Crows_Garlic_Seed',    -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
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
            name = 'Crows Garlic',         -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Crows_Garlic',
                itemLabel = 'Crows Garlic',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Indian Tobbaco',       -- ชื่อของต้นไม้
        seedName = 'Indian_Tobbaco_Seed',  -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_indiantobacco01x',  -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
        soilRequired = false,              -- ถ้าเป็น true เมล็ดต้องใช้ดินในการปลูก
        soilAmount = 1,                    -- จำนวนดินที่ต้องใช้ในการปลูก
        soilName = 'soil',                 -- ชื่อไอเทมดินที่ต้องใช้
        timeToGrow = 900,                  -- เวลาเป็นวินาทีสำหรับการเติบโต
        plantOffset = 1,                   -- ถ้าต้นไม้ลอยหรือไม่ติดพื้นดีพอ สามารถใช้ค่านี้ปรับระดับความสูงได้
        jobLocked = true,                  -- ถ้าเป็น true เฉพาะผู้เล่นที่มีอาชีพที่กำหนดเท่านั้นที่เก็บเกี่ยวได้
        smelling = false,                  -- อาชีพตำรวจสามารถได้กลิ่นต้นไม้นี้
        blips = {
            enabled = true,                -- ตั้งเป็น true เพื่อเปิดใช้งาน Blips สำหรับต้นไม้ (แสดงเฉพาะผู้ปลูก)
            sprite = 'blip_mp_spawnpoint', -- ค่าเริ่มต้น: 'blip_mp_spawnpoint'
            name = 'Indian Tobbaco',       -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Indian_Tobbaco',
                itemLabel = 'Indian Tobbaco',
                amount = 1
            }
        },
        jobs = {
            'tabak',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Milk Weed',           -- ชื่อของต้นไม้
        seedName = 'Milk_Weed_Seed',       -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_milkweed01x',       -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Milk Weed',            -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Milk_Weed',
                itemLabel = 'Milk Weed',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Oleander Sage',       -- ชื่อของต้นไม้
        seedName = 'Oleander_Sage_Seed',   -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_oleander01x',       -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Oleander Sage',        -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Oleander_Sage',
                itemLabel = 'Oleander Sage',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Parasol Mushroom',    -- ชื่อของต้นไม้
        seedName = 'Parasol_Mushroom_Seed', -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_parasol01bx',   -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Parasol Mushroom',     -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Parasol_Mushroom',
                itemLabel = 'Parasol Mushroom',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Prairie Poppy',       -- ชื่อของต้นไม้
        seedName = 'Prairie_Poppy_Seed',   -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'prariepoppy_p',       -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Prairie Poppy',        -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Prairie_Poppy',
                itemLabel = 'Prairie Poppy',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Rams Head',           -- ชื่อของต้นไม้
        seedName = 'Rams_Head_Seed',       -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_ramshead01bx',  -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Rams Head',            -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Rams_Head',
                itemLabel = 'Rams Head',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Red Raspberry',       -- ชื่อของต้นไม้
        seedName = 'Red_Raspberry_Seed',   -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_raspberry01x',  -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Red Raspberry',        -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Red_Raspberry',
                itemLabel = 'Red Raspberry',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Red Sage',            -- ชื่อของต้นไม้
        seedName = 'Red_Sage_Seed',        -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'redsage_p',           -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Red Sage',             -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Red_Sage',
                itemLabel = 'Red Sage',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Saltbush',            -- ชื่อของต้นไม้
        seedName = 'Saltbush_Seed',        -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_saltbush01ex',  -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Saltbush',             -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Saltbush',
                itemLabel = 'Saltbush',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Sugar',               -- ชื่อของต้นไม้
        seedName = 'sugarcaneseed',        -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_bloodflower01x', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Sugar',                -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'sugar',
                itemLabel = 'Sugar',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Wild Carrot',         -- ชื่อของต้นไม้
        seedName = 'Wild_Carrot_Seed',     -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'wildcarrot_p',        -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Wild Carrot',          -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Wild_Carrot',
                itemLabel = 'Wild Carrot',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Wild Feverfew',       -- ชื่อของต้นไม้
        seedName = 'Wild_Feverfew_Seed',   -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_wildfeverfew01x',   -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Wild Feverfew',        -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Wild_Feverfew',
                itemLabel = 'Wild Feverfew',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Wild Mint',           -- ชื่อของต้นไม้
        seedName = 'Wild_Mint_Seed',       -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'wildmint_p',          -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Wild Mint',            -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Wild_Mint',
                itemLabel = 'Wild Mint',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Wild Rhubarb',        -- ชื่อของต้นไม้
        seedName = 'Wild_Rhubarb_Seed',    -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_rhubarb01x',    -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Wild Rhubarb',         -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Wild_Rhubarb',
                itemLabel = 'Wild Rhubarb',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Wintergreen Berry',   -- ชื่อของต้นไม้
        seedName = 'Wintergreen_Berry_Seed', -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_inv_wintergreen01x', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Wintergreen Berry',    -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Wintergreen_Berry',
                itemLabel = 'Wintergreen Berry',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Potato',              -- ชื่อของต้นไม้
        seedName = 'potatoseed',           -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 's_desertsagepicked01x', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Potato',               -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'potato',
                itemLabel = 'Potato',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Wheat',               -- ชื่อของต้นไม้
        seedName = 'wheatseed',            -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
        plantProp = 'crp_wheat_dry_aa_sim', -- โมเดล (Prop) ของต้นไม้ที่จะเสกออกมา
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
            name = 'Wheat',                -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'wheat',
                itemLabel = 'Wheat',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Apple',               -- ชื่อของต้นไม้
        seedName = 'Apple_Seed',           -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
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
            name = 'Apple',                -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'apple',
                itemLabel = 'Apple',
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
        plantingDistance = 1.5,            -- ระยะห่างระหว่างต้นไม้
        plantName = 'Hummingbird Sage',    -- ชื่อของต้นไม้
        seedName = 'Hummingbird_Sage_Seed', -- ชื่อไอเทมสำหรับเมล็ดพันธุ์
        seedAmount = 1,                    -- จำนวนเมล็ดที่ต้องใช้ในการปลูก
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
            name = 'Hummingbird Sage',     -- ชื่อของ Blip บนแผนที่
            color = 'WHITE'                -- สีของ Blip ดูได้ใน 'config.lua'
        },
        rewards = {
            {
                itemName = 'Hummingbird_Sage',
                itemLabel = 'Hummingbird Sage',
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
    }
}