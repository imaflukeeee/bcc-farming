-- server/services/notifications.lua

function NotifyClient(src, message, notifyType, duration)
    BccUtils.RPC:Notify("bcc-farming:NotifyClient", {
        message = message,
        type = notifyType or "info",
        duration = duration or 4000
    }, src)
end

-- เพิ่มฟังก์ชันใหม่: ส่งแจ้งเตือนไอเทม (ได้รับ/เสีย) ไปยัง Client
function NotifyItemClient(src, title, itemName, itemAmount, iconName, duration, color)
    BccUtils.RPC:Notify("bcc-farming:NotifyItemClient", {
        title = title,
        itemName = itemName,
        itemAmount = itemAmount,
        icon = iconName, -- ใช้ spawn name เป็นชื่อรูป
        duration = duration or 4000,
        color = color -- ใส่รหัสสี Hex ได้เลย เช่น #FF0000
    }, src)
end