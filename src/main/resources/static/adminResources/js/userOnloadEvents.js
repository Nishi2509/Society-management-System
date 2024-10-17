function getNotifications() {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var notificationObj = JSON.parse(htp.responseText);
            displayNotifications(notificationObj);
        }
    };
    htp.open("GET", "http://localhost:8088/user/getNotifications", true);
    htp.send();
}

function displayNotifications(notificationObj) {
    let notificationCount = 0;
    let notificationTable = document.getElementById("user-notifications");
    notificationTable.innerHTML = "";
    if (notificationObj.length == 0) {
        notificationTable.innerHTML = `<div class="d-flex justify-content-center align-items-center"><p>No Notifications</p></div>`;
    }


    for (let i = 0; i < notificationObj.length; i++) {
        if (notificationObj[i].readStatus) {
            notificationTable.innerHTML = notificationTable.innerHTML + `<li class="m-1">
<a class="preview-item-content">
                                <div >
                                <div style="display: flex;justify-content: space-between; padding: 0px 10px 10px 0px; align-items: center">
                                    <h6 class="preview-subject font-weight-normal m-0" style="color: black !important; font-weight: 500 !important;">${notificationObj[i].subject}</h6><span class="" style="font-size: 12px;font-weight: 500">${notificationObj[i].dataAndTime}</span>
                                    </div>
                                   <div class="d-flex" style="text-align: start !important;"> <p class="font-weight-light small-text mb-0 text-muted" style="white-space: pre-wrap; width: 85% !important; ">${notificationObj[i].description}</p>
                                   <i class=" mdi mdi-email-open-outline"  style="font-size: 22px;color: #7571f9;margin-left: 10px !important; "></i>
                                   </div>
                                </div>
                            </a>
                            <hr>
</li>`
        } else {
            notificationTable.innerHTML = notificationTable.innerHTML + `<li class="m-1"><a class="preview-item-content">
                               <div >
                                <div style="display: flex;justify-content: space-between; padding: 0px 10px 10px 0px; align-items: center">
                                    <h6 class="preview-subject font-weight-normal m-0" style="color: black !important; font-weight: 500 !important;">${notificationObj[i].subject}</h6><span class="" style="font-size: 12px;font-weight: 500">${notificationObj[i].dataAndTime}</span>
                                    </div>
                                   <div class="d-flex" style="text-align: start !important;"> <p class="font-weight-light small-text mb-0 text-muted" style="white-space: pre-wrap; width: 85% !important; ">${notificationObj[i].description}</p>
                                   <i class=" mdi mdi-email-outline" onclick="readNotification(${notificationObj[i].id})" style="font-size: 22px;color: #7571f9;margin-left: 10px !important; "></i>
                                   </div>
                                </div>
                            </a>
                            <hr>
                            </li>`
        }
        if (!notificationObj[i].readStatus) {
            notificationCount++;
        }
    }
    if (notificationCount >= 1) {

        document.getElementById("count").classList.add("badge");
        document.getElementById("count").classList.add("badge-pill");
        document.getElementById("count").classList.add("badge-danger");
        document.getElementById("count").innerHTML = notificationCount;
    } else {
        document.getElementById("count").classList.remove("badge");
        document.getElementById("count").classList.remove("badge-pill");
        document.getElementById("count").classList.remove("badge-danger");
        document.getElementById("count").innerHTML = "";
    }

}

function readNotification(notificationId) {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var success = htp.responseText;
            if (success === "Success") {
                getNotifications();
            }
        }
    };
    htp.open("GET", `http://localhost:8088/user/readNotifications/${notificationId}`, true);
    htp.send();
}

function getOwnerDetails() {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {
            var ownerVo = JSON.parse(htp.responseText);
            console.log(ownerVo.fileName);
            (ownerVo.fileName !== "") ? document.getElementById("headerProfileImage").src = `/documents/ownerImages/${ownerVo.fileName}` : document.getElementById("headerProfileImage").src = `<%=request.getContextPath()%>/adminResources/image/avatar.png`;
        }
    };
    htp.open("GET", `http://localhost:8088/getOwnerDetailsForHeader`, true);
    htp.send();
}

setInterval(getNotifications, 50000)

window.addEventListener("load", function () {
    getNotifications();
    getOwnerDetails();
    console.log("loaded")
});