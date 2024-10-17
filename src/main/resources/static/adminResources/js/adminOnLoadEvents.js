function getComplainCount()
{
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
             var complainCount = htp.responseText;
            if (parseInt(complainCount)>0)
                document.getElementById("complain-menu-label").innerHTML=`Manage Complains <div class="badge badge-pill badge-primary ml-2">${complainCount}</div>`
        }
    };
    htp.open("GET", "http://localhost:8088/admin/getUnreadComplain", true);
    htp.send();

}

window.addEventListener("load",getComplainCount);
setInterval(getComplainCount,5000)

