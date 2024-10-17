function getComplain(complainId)
{
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            let complainObj = JSON.parse(htp.responseText);
            openComplainReply(complainObj)
            console.log(complainObj);
        }
    };
    htp.open("GET", `http://localhost:8088/admin/getComplainInfoForAdmin/${complainId}`, true);
    htp.send();
}

function openComplainReply(complainObj)
{
    document.getElementById("complain-reply-id").value=complainObj.id;
    document.getElementById("complain-reply-subject").value=complainObj.subject;
    document.getElementById("complain-reply-description").value=complainObj.description;
}

function emptyComplainForm(){

    document.getElementById("complain-reply-id").value="";
    document.getElementById("complain-reply-subject").value="";
    document.getElementById("complain-reply-description").value="";
    let reply=document.getElementById("complain-reply-reply");
    reply.classList.remove("is-invalid","is-valid")
    reply.value="";
    reply.setAttribute("onkeyup", "");
    document.querySelector("#reply1-warning").style.display = "none";
    document.querySelector("#reply2-warning").style.display = "none";
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
    htp.open("GET", `http://localhost:8088/admin/getComplainInfoForAdmin/${complainId}`, true);
    htp.send();
}

function openComplainInfo(complainObj)
{
    document.getElementById("complain-info-subject").innerHTML=complainObj.subject;
    document.getElementById("complain-info-description").innerHTML=complainObj.description;
    document.getElementById("complain-info-complain-date").innerHTML=complainObj.complainDateAndTime;
    document.getElementById("complain-info-complain-owner-block-name").innerHTML=complainObj.ownerVo.blockVo.blockName;
    document.getElementById("complain-info-complain-owner-email").innerHTML=complainObj.ownerVo.ownerEmail;
    document.getElementById("complain-info-complain-owner-house-number").innerHTML=complainObj.ownerVo.houseNo;
    document.getElementById("complain-info-complain-owner-name").innerHTML=complainObj.ownerVo.ownerName;
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
}

    function validateReplyComplain()
{
    let reply=document.getElementById("complain-reply-reply");
    let validForm=true;
    if (reply.value === "") {
        document.querySelector("#reply1-warning").style.display = "";
        document.querySelector("#reply2-warning").style.display = "none";
        reply.classList.add("is-invalid");
        reply.setAttribute("onkeyup", "validateReplyComplain()");
        validForm = false;
    } else if (reply.value.length < 20) {
        document.querySelector("#reply1-warning").style.display = "none";
        document.querySelector("#reply2-warning").style.display = "";
        reply.classList.add("is-invalid");
        reply.setAttribute("onkeyup", "validateReplyComplain()");
        validForm = false;
    } else {
        document.querySelector("#reply1-warning").style.display = "none";
        document.querySelector("#reply2-warning").style.display = "none";
        if (reply.classList.contains("is-invalid")) {
            reply.classList.remove("is-invalid")
            reply.classList.add("is-valid")
        }
    }
    return validForm;
}