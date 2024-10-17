window.addEventListener("load", function () {
    getOwnerDetails();
    getMaintenanceInfo()
    getVehicleInfo()
})

function getOwnerDetails() {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (
            htp.readyState === 4) {
            var owner = JSON.parse(htp.responseText);
            displayOwnerDetails(owner)
        }
    };
    htp.open("GET", "http://localhost:8088/getOwnerDetails", true);
    htp.send();
}

function displayOwnerDetails(owner) {
    console.log(owner);
    document.getElementById("owner-name").innerHTML = owner.ownerDetails.ownerName;
    document.getElementById("owner-id").innerHTML = owner.ownerDetails.id;
    document.getElementById("owner-email").innerHTML = owner.ownerDetails.ownerEmail;
    document.getElementById("owner-block").innerHTML = owner.ownerDetails.blockVo.blockName;
    document.getElementById("owner-house").innerHTML = owner.ownerDetails.houseNo;
    (owner.ownerDetails.phoneNo !== null) ? document.getElementById("owner-phone").innerHTML = owner.ownerDetails.phoneNo : document.getElementById("owner-phone").innerHTML = "- -";
    (owner.ownerDetails.fileName !== "") ? document.getElementById("user-image").src = `/documents/ownerImages/${owner.ownerDetails.fileName}` : document.getElementById("user-image").src = `<%=request.getContextPath()%>/adminResources/image/avatar.png`;
    (owner.ownerDetails.fileName!=="")?document.getElementById("headerProfileImage").src=`/documents/ownerImages/${owner.ownerDetails.fileName}`:document.getElementById("headerProfileImage").src=`<%=request.getContextPath()%>/adminResources/image/avatar.png`;
    document.getElementById("owner-address").innerHTML = `${owner.societyDetails.societyName},<br>${owner.societyDetails.socityAddress}`;
    displayMemberInfo(owner.memberDetails)
}

function getMemberInfo() {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (
            htp.readyState === 4) {
            var memberInfo = JSON.parse(htp.responseText);
            displayMemberInfo(memberInfo)
        }
    };
    htp.open("GET", "http://localhost:8088/getMemberInfo", true);
    htp.send();
}

function displayMemberInfo(memberObj) {
    document.getElementById("menu1-display").innerHTML = `<div class="table-responsive w-100" style="min-height: 250px">
                                                        <table class="table table-striped">
                                                            <thead>
                                                            <tr>
                                                                <th>
                                                                    Member
                                                                </th>
                                                                <th>
                                                                    Name
                                                                </th>
                                                                <th>
                                                                    Email
                                                                </th>
                                                                <th>
                                                                    Phone
                                                                </th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="member-info">
                                                            <tr>
                                                                <td class="py-1">

                                                                </td>
                                                                <td>
                                                                    Herman Beck
                                                                </td>
                                                                <td>
                                                                    <div class="progress">
                                                                        <div class="progress-bar bg-success"
                                                                             role="progressbar" style="width: 25%"
                                                                             aria-valuenow="25" aria-valuemin="0"
                                                                             aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    $ 77.99
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>`
    var table = document.querySelector("#member-info");
    table.innerHTML = "";
    if (memberObj.length === 0) {
        table.innerHTML = `<tr>
<td colspan="4" class="text-center">
<div class="d-flex justify-content-center align-items-center flex-column"><i class="mdi mdi-account-multiple" style="color: #7571f9 !important; margin: 0px !important; font-size: 170px"></i><p  >No Member Info For This Owner.</p></div>
</td>
</tr>`;
    }

    for (var index = 0; index < memberObj.length; index++) {
        var newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `<img src="/documents/memberPhotos/${memberObj[index].fileName}" alt="image">`;
        newTR.insertCell(1).innerHTML = `${memberObj[index].memberName}`;
        newTR.insertCell(2).innerHTML = `${memberObj[index].memberEmail}`;
        newTR.insertCell(3).innerHTML = `${memberObj[index].memberPhoneNo}`;
    }
}

function getVehicleInfo() {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (
            htp.readyState === 4) {
            var vehicleObj = JSON.parse(htp.responseText);
            displayVehicle(vehicleObj)
        }
    };
    htp.open("GET", "http://localhost:8088/getVehicleInfo", true);
    htp.send();
}

function displayVehicle(vehicleObj) {
    document.getElementById("menu2-display").innerHTML = `<div class="table-responsive w-100" style="min-height: 250px">
                                                        <table class="table table-striped">
                                                            <thead>
                                                            <tr>
                                                                <th>
                                                                    Number
                                                                </th>
                                                                <th>
                                                                    Vehicle Type
                                                                </th>
                                                                <th>
                                                                    RC Number
                                                                </th>
                                                                <th>
                                                                    Parking Allotment
                                                                </th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="vehicle-info">
                                                            <tr>
                                                                <td class="py-1">

                                                                </td>
                                                                <td>
                                                                    Herman Beck
                                                                </td>
                                                                <td>
                                                                    <div class="progress">
                                                                        <div class="progress-bar bg-success"
                                                                             role="progressbar" style="width: 25%"
                                                                             aria-valuenow="25" aria-valuemin="0"
                                                                             aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    $ 77.99
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>`
    var table = document.querySelector("#vehicle-info");
    table.innerHTML = "";
    if (vehicleObj.length === 0) {
        table.innerHTML = `<tr>
<td colspan="4" class="text-center">
<div class="d-flex justify-content-center align-items-center flex-column"><i class="mdi mdi-account-multiple" style="color: #7571f9 !important; margin: 0px !important; font-size: 170px"></i><p  >No Member Info For This Owner.</p></div>
</td>
</tr>`;
    }

    for (var index = 0; index < vehicleObj.length; index++) {
        var newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `${vehicleObj[index].vehicleNumberPlate}`;
        if (vehicleObj[index].vehicleType === "Two Wheeler") {
            newTR.insertCell(1).innerHTML = `<i class="mdi mdi-motorbike" style="color: #7571f9;font-size: 20px"></i>`;
        } else {
            newTR.insertCell(1).innerHTML = `<i class="mdi mdi-car"  style="color: #7571f9;font-size: 20px" ></i>`;
        }
        newTR.insertCell(2).innerHTML = `${vehicleObj[index].vehicleRCNumber}`;
        if (vehicleObj[index].allocatedParkingSpace === "Parking Not Alloted") {
            newTR.insertCell(3).innerHTML = `<div class="badge badge-warning">Yet No Allocated</div>`;
        } else {
            newTR.insertCell(3).innerHTML = `<div class="badge badge-info">${vehicleObj[index].allocatedParkingSpace}</div>`;
        }

    }
}

function getMaintenanceInfo() {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (
            htp.readyState === 4) {
            var maintenanceDetails = JSON.parse(htp.responseText);
            displayMaintenance(maintenanceDetails)

        }
    };
    htp.open("GET", "http://localhost:8088/getMaintenanceInfo", true);
    htp.send();
}

function displayMaintenance(maintenanceDetails) {
    document.getElementById("menu3-display").innerHTML = `<div class="table-responsive w-100" style="max-height: 390px; overflow: auto">
                                                        <table class="table table-striped">
                                                            <thead>
                                                            <tr>
                                                                <th>
                                                                    Year
                                                                </th>
                                                                <th>
                                                                    Month
                                                                </th>
                                                                <th>
                                                                    Paid/Unpaid
                                                                </th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="maintenance-info">
                                                            <tr>
                                                                <td class="py-1">

                                                                </td>
                                                                <td>
                                                                    Herman Beck
                                                                </td>
                                                                <td>
                                                                    <div class="progress">
                                                                        <div class="progress-bar bg-success"
                                                                             role="progressbar" style="width: 25%"
                                                                             aria-valuenow="25" aria-valuemin="0"
                                                                             aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    $ 77.99
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>`
    var table = document.querySelector("#maintenance-info");
    table.innerHTML = "";
    let paidMonthList = []
    for (let i = 0; i < maintenanceDetails.length; i++) {
        paidMonthList.push(maintenanceDetails[i].month);
    }

    let monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    let date = new Date()
    for (var index = 0; index < monthList.length; index++) {
        var newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `${date.getFullYear()}`;

        newTR.insertCell(1).innerHTML = `${monthList[index]}`;
        if (paidMonthList.includes(monthList[index])) {
            newTR.insertCell(2).innerHTML = `<div class="badge badge-success">Paid</div>`;
        } else {
            newTR.insertCell(2).innerHTML = `<div class="badge badge-danger">Unpaid</div>`;
        }

    }
}

function editOwnerDetails() {
    document.getElementById("edit-owner-name").value = document.getElementById("owner-name").innerHTML;
    document.getElementById("owner-phone").innerHTML === "- -" ? document.getElementById("edit-owner-phone").value = " " : document.getElementById("edit-owner-phone").value = document.getElementById("owner-phone").innerHTML;
}