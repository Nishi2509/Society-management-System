function bringUserDasDetails() {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {
            let userDasDetails = JSON.parse(htp.responseText);
          displayUserDashBoardDetails(userDasDetails);
        }
    };
    htp.open("GET", "http://localhost:8088/userDasDetails", true);
    htp.send();
}

function displayUserDashBoardDetails(userDasDetails)
{
    document.getElementById("societyname").innerHTML=userDasDetails.societyDetails.societyName;
    document.getElementById("societyAddress").innerHTML=userDasDetails.societyDetails.socityAddress;
    document.getElementById("societyEmail").innerHTML=userDasDetails.societyDetails.emailAddress;
    document.getElementById("societyPhone").innerHTML=userDasDetails.societyDetails.contactNumber;
    document.getElementById("feedbacks-display").innerHTML=userDasDetails.totalFeedbacks;
    document.getElementById("complains-display").innerHTML=userDasDetails.totalComplains;
    document.getElementById("fourWheeler-display").innerHTML=userDasDetails.totalFourWheelers;
    document.getElementById("twoWheeler-display").innerHTML=userDasDetails.totalTwoWheelers;
    console.log(userDasDetails)
}

window.addEventListener("load",function ()
{
    bringUserDasDetails();
})