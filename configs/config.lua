Config = {
    defaultlang = 'en_lang', -- ไฟล์ภาษาที่ต้องการใช้
    -----------------------------------------------------

    -- อย่าเปิดใช้งานบนเซิร์ฟเวอร์จริง (Live Server)
    DevMode = true, -- แสดงข้อความ Debug ในคอนโซลของ Client และ Server
    -----------------------------------------------------

    keys = {
        fertYes = 0x4CC0E2FE, -- ค่าเริ่มต้น: 0x4CC0E2FE / ปุ่ม B
        fertNo = 0x9959A6F0,  -- ค่าเริ่มต้น: 0x9959A6F0 / ปุ่ม C
        water = 0x4CC0E2FE,   -- ค่าเริ่มต้น: 0x4CC0E2FE / ปุ่ม B
        harvest = 0x4CC0E2FE, -- ค่าเริ่มต้น: 0x4CC0E2FE / ปุ่ม B
        destroy = 0x27D1C284, -- ค่าเริ่มต้น: 0x27D1C284 / ปุ่ม R
    },
    -----------------------------------------------------
    Notify = "feather-menu", ----หรือใช้ vorp-core
    
    -----------------------------------------------------

    -- ชื่อไอเทมจากฐานข้อมูล
    fullWaterBucket = {
        'wateringcan',                          -- ถังน้ำสะอาด
        'wateringcan_dirtywater',               -- ถังน้ำสกปรก
    },
    emptyWaterBucket = 'wateringcan_empty', -- ถังน้ำเปล่า
    waterBucketUses = 1, -- จำนวนต้นไม้ที่ถังน้ำเต็มสามารถรดได้ก่อนที่น้ำจะหมด
    -----------------------------------------------------

    -- สคริปต์จะเลือกใช้ปุ๋ยที่มีค่าลดเวลามากที่สุดที่มีในกระเป๋าผู้เล่น
    fertilizerSetup = {
        {
            fertName = 'fertilizer1', -- ชื่อไอเทมที่ใช้ในฐานข้อมูล
            fertTimeReduction = 0.25, -- ค่าเริ่มต้น: 0.25 / ลดเวลาลง 25%
        },
        {
            fertName = 'fertilizer2', -- ชื่อไอเทมที่ใช้ในฐานข้อมูล
            fertTimeReduction = 0.50, -- ค่าเริ่มต้น: 0.50 / ลดเวลาลง 50%
        },
        {
            fertName = 'fertilizer3', -- ชื่อไอเทมที่ใช้ในฐานข้อมูล
            fertTimeReduction = 0.75, -- ค่าเริ่มต้น: 0.75 / ลดเวลาลง 75%
        }
    },
    -----------------------------------------------------

    plantSetup = {
        lockedToPlanter = true, -- ถ้าเป็น true จะมีแค่ผู้เล่นที่ปลูกเมล็ดเท่านั้นที่เก็บเกี่ยวได้
        maxPlants = 10,          -- จำนวนต้นไม้สูงสุดที่ผู้เล่นสามารถมีได้
        requireHouseOwnership = false, -- ถ้าเป็น true การปลูกต้องทำภายในพื้นที่บ้านของผู้เล่น
        houseRadiusPadding = 10       -- ระยะเมตรเพิ่มเติมที่บวกเพิ่มจากรัศมีบ้านเมื่อตรวจสอบระยะการปลูก
    },
    -----------------------------------------------------

    -- เปิด/ปิด การได้กลิ่นสำหรับแต่ละต้นไม้ในส่วนตั้งค่า Plants
    smelling = {
        distance = 50,             -- ระยะทางที่ผู้เล่นสามารถได้กลิ่นต้นไม้
        blip = {
            enabled = true,        -- ถ้าเป็น true ต้นไม้จะถูกมาร์คบนแผนที่เมื่อได้กลิ่น
            sprite = 'blip_plant', -- ชื่อรูปไอคอน Blip
            color = 'RED',         -- สีของ Blip (ดูรายการสีด้านล่าง)
            duration = 5,          -- ระยะเวลา (วินาที) ที่ Blip จะแสดง
            frequency = 15,        -- เวลา (วินาที) ที่ต้องรอก่อนที่จะแสดง Blip อีกครั้ง
        },
        notifications = {
            enabled = true, -- ถ้าเป็น true จะมีการแจ้งเตือนแสดงขึ้นเมื่อได้กลิ่นต้นไม้
            cooldown = 30,  -- คูลดาวน์ (วินาที) ระหว่างการแจ้งเตือนกลิ่นแต่ละครั้ง
        },
        jobs = {            -- อาชีพที่สามารถได้กลิ่นต้นไม้
            'admin',
            'usms',
            'valaw',
            'sdlaw',
            'anlaw',
            'rhlaw',
            'sblaw',
            'bwlaw',
            'arlaw',
        }
    },
    -----------------------------------------------------

    townSetup = {
        canPlantInTowns = town, -- ถ้าเป็น true ผู้เล่นจะสามารถปลูกเมล็ดพันธุ์ในเมืองได้
        townLocations = {
            {
                coords = vector3(-297.48, 791.1, 118.33), -- เมือง Valentine
                townRange = 150                           -- ระยะที่ถือว่าเป็นเขตเมือง
            },
            {
                coords = vector3(2930.95, 1348.91, 44.1), -- เมือง Annesburg
                townRange = 150                           -- ระยะที่ถือว่าเป็นเขตเมือง
            },
            {
                coords = vector3(2632.52, -1312.31, 51.42), -- เมือง Saint Denis
                townRange = 150                             -- ระยะที่ถือว่าเป็นเขตเมือง
            },
            {
                coords = vector3(1346.14, -1312.5, 76.53), -- เมือง Rhodes
                townRange = 150                            -- ระยะที่ถือว่าเป็นเขตเมือง
            },
            {
                coords = vector3(-1801.09, -374.86, 161.15), -- เมือง Strawberry
                townRange = 150                              -- ระยะที่ถือว่าเป็นเขตเมือง
            },
            {
                coords = vector3(-801.77, -1336.43, 43.54), -- เมือง Blackwater
                townRange = 150                             -- ระยะที่ถือว่าเป็นเขตเมือง
            },
            {
                coords = vector3(-3659.38, -2608.91, -14.08), -- เมือง Armadillo
                townRange = 150                               -- ระยะที่ถือว่าเป็นเขตเมือง
            },
            {
                coords = vector3(-5498.97, -2950.61, -1.62), -- เมือง Tumbleweed
                townRange = 150                              -- ระยะที่ถือว่าเป็นเขตเมือง
            }
        }
    },

    BlipColors = {
        LIGHT_BLUE    = 'BLIP_MODIFIER_MP_COLOR_1',
        DARK_RED      = 'BLIP_MODIFIER_MP_COLOR_2',
        PURPLE        = 'BLIP_MODIFIER_MP_COLOR_3',
        ORANGE        = 'BLIP_MODIFIER_MP_COLOR_4',
        TEAL          = 'BLIP_MODIFIER_MP_COLOR_5',
        LIGHT_YELLOW  = 'BLIP_MODIFIER_MP_COLOR_6',
        PINK          = 'BLIP_MODIFIER_MP_COLOR_7',
        GREEN         = 'BLIP_MODIFIER_MP_COLOR_8',
        DARK_TEAL     = 'BLIP_MODIFIER_MP_COLOR_9',
        RED           = 'BLIP_MODIFIER_MP_COLOR_10',
        LIGHT_GREEN   = 'BLIP_MODIFIER_MP_COLOR_11',
        TEAL2         = 'BLIP_MODIFIER_MP_COLOR_12',
        BLUE          = 'BLIP_MODIFIER_MP_COLOR_13',
        DARK_PUPLE    = 'BLIP_MODIFIER_MP_COLOR_14',
        DARK_PINK     = 'BLIP_MODIFIER_MP_COLOR_15',
        DARK_DARK_RED = 'BLIP_MODIFIER_MP_COLOR_16',
        GRAY          = 'BLIP_MODIFIER_MP_COLOR_17',
        PINKISH       = 'BLIP_MODIFIER_MP_COLOR_18',
        YELLOW_GREEN  = 'BLIP_MODIFIER_MP_COLOR_19',
        DARK_GREEN    = 'BLIP_MODIFIER_MP_COLOR_20',
        BRIGHT_BLUE   = 'BLIP_MODIFIER_MP_COLOR_21',
        BRIGHT_PURPLE = 'BLIP_MODIFIER_MP_COLOR_22',
        YELLOW_ORANGE = 'BLIP_MODIFIER_MP_COLOR_23',
        BLUE2         = 'BLIP_MODIFIER_MP_COLOR_24',
        TEAL3         = 'BLIP_MODIFIER_MP_COLOR_25',
        TAN           = 'BLIP_MODIFIER_MP_COLOR_26',
        OFF_WHITE     = 'BLIP_MODIFIER_MP_COLOR_27',
        LIGHT_YELLOW2 = 'BLIP_MODIFIER_MP_COLOR_28',
        LIGHT_PINK    = 'BLIP_MODIFIER_MP_COLOR_29',
        LIGHT_RED     = 'BLIP_MODIFIER_MP_COLOR_30',
        LIGHT_YELLOW3 = 'BLIP_MODIFIER_MP_COLOR_31',
        WHITE         = 'BLIP_MODIFIER_MP_COLOR_32'
    },
}