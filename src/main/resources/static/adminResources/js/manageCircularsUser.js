function getCircularAttachments(url) {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            let complainObj = JSON.parse(htp.responseText);
            openCircularEdit(complainObj);
            console.log(complainObj);
        }
    };
    htp.open("GET", `http://localhost:8088/admin/getCircular/${circularId}`, true);
    htp.send();
}