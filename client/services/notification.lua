-- client/services/notification.lua

-- ฟังก์ชันแจ้งเตือนข้อความทั่วไป (ใช้ mtn_notify:send)
function Notify(message, typeOrDuration, maybeDuration)
    local notifyDuration = 4000

    -- ตรวจสอบตัวแปรเรื่องเวลา (Duration) เหมือนเดิม
    if type(typeOrDuration) == "string" then
        notifyDuration = tonumber(maybeDuration) or 4000
    elseif type(typeOrDuration) == "number" then
        notifyDuration = typeOrDuration
    end

    -- ส่งแจ้งเตือนแบบคลีนๆ (ไม่มี Title, ไม่มี Icon, ข้อความสีขาว)
    TriggerEvent("mtn_notify:send", {
        title = false,       -- ปิดการแสดง Title
        description = message, -- แสดงข้อความ
        icon = false,        -- ปิดการแสดง Icon
        placement = "middle-right",
        duration = notifyDuration,
        titleColor = "#FFFFFF" -- กำหนดสีขาว (เผื่อไว้)
    })
end

-- ฟังก์ชันแจ้งเตือนไอเทม (ใช้ mtn_notify:sendItem)
function NotifyItem(title, itemName, itemAmount, iconName, duration, color)
    TriggerEvent("mtn_notify:sendItem", {
        title = title or "Received",
        description = (itemAmount or 1) .. "x " .. (itemName or "Unknown"),
        icon = iconName, -- ชื่อไฟล์รูปในโฟลเดอร์ icons ของ mtn_notify
        placement = "bottom-right",
        duration = duration or 3000,
        titleColor = color or "#4CAF50" -- Default สีเขียว
    })
end

-- รับ Event แจ้งเตือนข้อความจาก Server
BccUtils.RPC:Register("bcc-farming:NotifyClient", function(data)
    Notify(data.message, data.type, data.duration)
end)

-- รับ Event แจ้งเตือนไอเทมจาก Server (เพิ่มใหม่)
BccUtils.RPC:Register("bcc-farming:NotifyItemClient", function(data)
    NotifyItem(data.title, data.itemName, data.itemAmount, data.icon, data.duration, data.color)
end)