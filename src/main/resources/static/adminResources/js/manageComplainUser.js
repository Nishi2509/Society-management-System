function emptyComplainForm(){

    console.log("hello")
    document.getElementById("complain-subject").value="";
    document.getElementById("complain-description").value="";
}

function popInfo(complainId)
{
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            let complainObj = JSON.parse(htp.responseText);
            openComplainInfo(complainObj)
        }
    };
    htp.open("GET", `http://localhost:8088/user/getComplainInfo/${complainId}`, true);
    htp.send();
}

function openComplainInfo(complainObj)
{
    document.getElementById("complain-info-subject").innerHTML=complainObj.subject;
    document.getElementById("complain-info-description").innerHTML=complainObj.description;
    document.getElementById("complain-info-complain-date").innerHTML=complainObj.complainDateAndTime;
    if (complainObj.complainStatus==="pending") {
        document.getElementById("complain-info-complain-status").innerHTML=`<label class="badge badge-warning m-0">Pending</label>`;
    }
    if(complainObj.complainStatus==="fullfill") {
        document.getElementById("complain-info-complain-status").innerHTML=`<label class="badge badge-success m-0">Fullfilled</label>`;
    }
    console.log(complainObj.reply);
    if (complainObj.reply===null)
    {
        document.getElementById("complain-info-complain-reply").innerHTML="- -";
    }else{
        document.getElementById("complain-info-complain-reply").innerHTML=complainObj.reply;
    }

    if (complainObj.replyDateAndTime===null)
    {
        document.getElementById("complain-info-complain-reply-date").innerHTML="- -";
    }else{
        document.getElementById("complain-info-complain-reply-date").innerHTML=complainObj.replyDateAndTime;
    }



    console.log(complainObj);
}