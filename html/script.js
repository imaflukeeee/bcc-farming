$(document).ready(function() {
    window.addEventListener('message', function(event) {
        let data = event.data;

        if (data.action === "toggleTracker") {
            if (data.show) {
                $("#farm-tracker").fadeIn(300);
            } else {
                $("#farm-tracker").fadeOut(300);
            }
        }

        if (data.action === "updateTracker") {
            updatePlantList(data.plants);
        }
    });

    // Close Button
    $("#close-btn").click(function() {
        $.post(`https://${GetParentResourceName()}/closeTracker`, JSON.stringify({}));
    });

    // Minimize Button (แก้ไขใหม่รองรับตัวอักษร)
    $("#minimize-btn").click(function() {
        $("#farm-tracker").toggleClass("minimized");
        
        // เช็คสถานะเพื่อเปลี่ยนไอคอน (ใช้ class แทน text)
        let iconClass = $("#farm-tracker").hasClass("minimized") ? "fa-plus" : "fa-minus";
        
        // ค้นหา tag <i> ข้างในปุ่ม แล้วเปลี่ยน class
        $(this).find("i").attr("class", `fa-solid ${iconClass}`);
    });

    // ==========================================
    //  DRAG & DROP SYSTEM
    // ==========================================
    let isDragging = false;
    let offset = { x: 0, y: 0 };

    $("#farm-tracker").mousedown(function(e) {
        if (e.button === 0) { 
            isDragging = true;
            offset.x = e.clientX - $(this).position().left;
            offset.y = e.clientY - $(this).position().top;
            
            $(this).css("cursor", "grabbing");
            e.preventDefault();
        }
    });

    $(document).mousemove(function(e) {
        if (isDragging) {
            let newX = e.clientX - offset.x;
            let newY = e.clientY - offset.y;

            $("#farm-tracker").css({
                top: newY,
                left: newX,
                right: 'auto',
                margin: 0
            });
        }
    });

    $(document).mouseup(function() {
        if (isDragging) {
            isDragging = false;
            $("#farm-tracker").css("cursor", "default");
        }
    });
});

function updatePlantList(plants) {
    let container = $("#plant-list");
    container.empty();

    if (!plants || plants.length === 0) {
        container.html('<div style="text-align:center; color:#aaa; font-size:12px; padding:15px;">ไม่มีพืชที่กำลังปลูก</div>');
        return;
    }

    // เรียงลำดับ: พืชที่โตแล้ว (rotTime น้อยกว่า) ขึ้นก่อน, หรือตาม timeLeft
    plants.sort((a, b) => a.timeLeft - b.timeLeft);

    plants.forEach(plant => {
        let isReady = plant.timeLeft <= 0;
        let statusDisplay = "";

        if (isReady) {
            // [[ แก้ไขตรงนี้: ถ้าโตแล้ว ให้โชว์เวลานับถอยหลังเน่าเสีย ]]
            if (plant.rotTime && plant.rotTime > 0) {
                statusDisplay = `<span class="status-rotting">${formatTime(plant.rotTime)}</span>`;
            } else {
                statusDisplay = `<span class="status-text">พร้อมเก็บเกี่ยว</span>`; // กรณีไม่ได้เปิด AutoDelete
            }
        } else {
            statusDisplay = `<span class="plant-timer">${formatTime(plant.timeLeft)}</span>`;
        }

        let html = `
            <div class="plant-card">
                <span class="plant-name">${plant.label}</span>
                ${statusDisplay}
            </div>
        `;
        container.append(html);
    });
}

function formatTime(seconds) {
    if (seconds < 0) seconds = 0;
    
    let h = Math.floor(seconds / 3600);
    let m = Math.floor((seconds % 3600) / 60);
    let s = seconds % 60;

    if (h > 0) {
        return `${h}:${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`;
    } else {
        return `${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`;
    }
}