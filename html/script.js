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

    // 1. ถ้าไม่มีพืชเลยในระบบ ให้ซ่อนหน้าต่าง UI ทันที
    if (!plants || plants.length === 0) {
        $("#farm-tracker").fadeOut(300);
        return;
    }

    // เรียงลำดับ: พืชที่ใกล้จะเก็บได้ หรือโตแล้วขึ้นก่อน
    plants.sort((a, b) => a.timeLeft - b.timeLeft);

    let activePlantsCount = 0; // ตัวนับจำนวนพืชที่ยังไม่เน่าเสีย

    plants.forEach(plant => {
        let isReady = plant.timeLeft <= 0;
        let statusDisplay = "";

        if (isReady) {
            // เช็คเวลาเน่าเสีย
            if (plant.rotTime !== undefined && plant.rotTime !== 0) {
                if (plant.rotTime > 0) {
                    statusDisplay = `<span class="status-rotting">${formatTime(plant.rotTime)}</span>`;
                } else {
                    // ถ้าเน่าแล้ว ให้ข้ามการสร้าง UI ของต้นนี้ไปเลย (ลบออกจากจอ)
                    return; 
                }
            } else {
                statusDisplay = `<span class="status-text">พร้อมเก็บเกี่ยว</span>`; 
            }
        } else {
            statusDisplay = `<span class="plant-timer">${formatTime(plant.timeLeft)}</span>`;
        }

        activePlantsCount++;

        let html = `
            <div class="plant-card">
                <span class="plant-name">${plant.label}</span>
                ${statusDisplay}
            </div>
        `;
        container.append(html);
    });

    // 2. เช็คอีกรอบ: ถ้าพืชทุกต้นเน่าเสียหายไปหมดแล้ว ให้ปิดหน้าต่าง UI
    if (activePlantsCount === 0) {
        $("#farm-tracker").fadeOut(300);
    } else {
        // แต่ถ้ายังมีพืชอยู่ และหน้าต่าง UI ซ่อนอยู่ ให้แสดงมันขึ้นมาอัตโนมัติ
        if ($("#farm-tracker").is(":hidden")) {
            $("#farm-tracker").fadeIn(300);
        }
    }
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