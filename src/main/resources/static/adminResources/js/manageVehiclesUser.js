function getOwnerVehicles() {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var vehicleObjs = JSON.parse(htp.responseText);
            createVehicleTable(vehicleObjs)
        }
    };
    htp.open("GET", "http://localhost:8088/user/getCurrentOwnerVehicles", true);
    htp.send();
}

var twoWheelerCounter = 0
var fourWheelCounter = 0


function createVehicleTable(vehicleObj) {
    var table1 = document.querySelector("#two-wheeler-v");
    table1.innerHTML = "";
    var table2 = document.querySelector("#four-wheeler-v");
    table2.innerHTML = "";

    for (var index = 0; index < vehicleObj.length; index++) {
        if (vehicleObj[index].vehicleType === "Two Wheeler") {
            if (vehicleObj[index].allocatedParkingSpace === "Parking Not Alloted") {
                table1.innerHTML = table1.innerHTML + `
                                               <div class="col-md-6 mb-3 p-2">
                                                  <div class="p-4 border" style="border-radius: 10px">
                                                  <div class="row mb-3">
                                                    <div class="col-10">
                                                        <img src="/documents/vehicleImageFile/${vehicleObj[index].vehicleImageFileName}"
                                                         class="rounded" style="height: 150px!important;width: 150px!important;" alt="profile image">
                                                        
                                                    </div>
                                                    <div class="col-2 d-flex justify-content-end">
                                                        <div> 
                                                        <label class="badge badge-warning" style="font-size: 15px!important;color:#fff !important;">Parking Not Alloted Yet</label>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="row">
                                                <div class="col-12">
                                                            <h5 class="mb-1">${vehicleObj[index].vehicleNumberPlate}</h5>
                                                            <p class="text-muted mb-3">RC Number : ${vehicleObj[index].vehicleRCNumber} </p>
                                                            <div > 
                                                                <button class="btn btn-outline-info" style="padding: 0.1rem 0.6rem" data-toggle="modal" data-target="#exampleModal-add-vehicles" onclick="editVehicle(${vehicleObj[index].id})">Edit</button>
                                                                <a href="deleteVehicleByUser/${vehicleObj[index].id}"><button class="btn btn-outline-danger"  style="padding: 0.1rem 0.6rem" onclick="editVehicle(${vehicleObj[index].id})">Delete</button></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                </div>
                                               </div>
                                               `
            } else {
                table1.innerHTML = table1.innerHTML + `
                                              <div class="col-md-6 p-2">
                                                  <div class="p-4 border" style="border-radius: 10px">
                                                  <div class="row mb-3">
                                                    <div class="col-10">
                                                        <img src="/documents/vehicleImageFile/${vehicleObj[index].vehicleImageFileName}"
                                                         class="rounded" style="height: 150px!important;width: 150px!important;" alt="profile image">
                                                        
                                                    </div>
                                                    <div class="col-2 d-flex justify-content-end">
                                                        <div> 
                                                       <label class="badge badge-info d-flex align-items-center  flex-column" style="height:80px;width:80px;border-radius:0px !important;font-size: 10px!important;"><p class="m-0">Parking</p><h4 class="m-0 mb-1" style="margin-top:15px !important">${vehicleObj[index].allocatedParkingSpace}</h4></label>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="row">
                                                <div class="col-12">
                                                            <h5 class="mb-1">${vehicleObj[index].vehicleNumberPlate}</h5>
                                                            <p class="text-muted mb-3">RC Number : ${vehicleObj[index].vehicleRCNumber} </p>
                                                            <div > 
                                                                <button class="btn btn-outline-info" style="padding: 0.1rem 0.6rem" data-toggle="modal" data-target="#exampleModal-add-vehicles" onclick="editVehicle(${vehicleObj[index].id})">Edit</button>
                                                                <a href="deleteVehicleByUser/${vehicleObj[index].id}"><button class="btn btn-outline-danger"  style="padding: 0.1rem 0.6rem" onclick="editVehicle(${vehicleObj[index].id})">Delete</button></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                </div>
                                               </div>
                                              `
            }
            twoWheelerCounter++
        }

        if (vehicleObj[index].vehicleType === "Four Wheeler") {
            if (vehicleObj[index].allocatedParkingSpace === "Parking Not Alloted") {
                table2.innerHTML = table2.innerHTML + `
                                               <div class="col-md-6 mb-3 p-2">
                                                  <div class="p-4 border" style="border-radius: 10px">
                                                  <div class="row mb-3">
                                                    <div class="col-10">
                                                        <img src="/documents/vehicleImageFile/${vehicleObj[index].vehicleImageFileName}"
                                                         class="rounded" style="height: 150px!important;width: 150px!important;" alt="profile image">
                                                        
                                                    </div>
                                                    <div class="col-2 d-flex justify-content-end">
                                                        <div> 
                                                        <label class="badge badge-warning" style="font-size: 15px!important;color:#fff !important;">Parking Not Alloted Yet</label>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="row">
                                                <div class="col-12">
                                                            <h5 class="mb-1">${vehicleObj[index].vehicleNumberPlate}</h5>
                                                            <p class="text-muted mb-3">RC Number : ${vehicleObj[index].vehicleRCNumber} </p>
                                                            <div > 
                                                                <button class="btn btn-outline-info" style="padding: 0.1rem 0.6rem" data-toggle="modal" data-target="#exampleModal-add-vehicles" onclick="editVehicle(${vehicleObj[index].id})">Edit</button>
                                                                <a href="deleteVehicleByUser/${vehicleObj[index].id}"><button class="btn btn-outline-danger"  style="padding: 0.1rem 0.6rem" onclick="editVehicle(${vehicleObj[index].id})">Delete</button></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                </div>
                                               </div>
                                               `
            } else {
                table2.innerHTML = table2.innerHTML + `
                                              <div class="col-md-6 p-2">
                                                  <div class="p-4 border" style="border-radius: 10px">
                                                  <div class="row mb-3">
                                                    <div class="col-10">
                                                        <img src="/documents/vehicleImageFile/${vehicleObj[index].vehicleImageFileName}"
                                                         class="rounded" style="height: 150px!important;width: 150px!important;" alt="profile image">
                                                        
                                                    </div>
                                                    <div class="col-2 d-flex justify-content-end">
                                                        <div> 
                                                       <label class="badge badge-info d-flex align-items-center  flex-column" style="height:80px;width:80px;border-radius:0px !important;font-size: 10px!important;"><p class="m-0">Parking</p><h4 class="m-0 mb-1" style="margin-top:15px !important">${vehicleObj[index].allocatedParkingSpace}</h4></label>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="row">
                                                <div class="col-12">
                                                            <h5 class="mb-1">${vehicleObj[index].vehicleNumberPlate}</h5>
                                                            <p class="text-muted mb-3">RC Number : ${vehicleObj[index].vehicleRCNumber} </p>
                                                            <div > 
                                                                <button class="btn btn-outline-info" style="padding: 0.1rem 0.6rem" data-toggle="modal" data-target="#exampleModal-add-vehicles" onclick="editVehicle(${vehicleObj[index].id})">Edit</button>
                                                                <a href="deleteVehicleByUser/${vehicleObj[index].id}"><button class="btn btn-outline-danger"  style="padding: 0.1rem 0.6rem" onclick="editVehicle(${vehicleObj[index].id})">Delete</button></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                </div>
                                               </div>
                                              `
            }
            fourWheelCounter++
        }
    }
    console.log(vehicleObj);
    editVehicleAddButton(vehicleObj);
}

function editVehicleAddButton(vehicleObjs) {
    if ((twoWheelerCounter + fourWheelCounter) == (vehicleObjs[0].ownerVo.blockVo.typeOfHouse) * 2) {
        document.getElementById("vehicle-add-button").style.display = "none";
    }

    if (twoWheelerCounter === 0) {
        document.getElementById("two-wheeler-v").classList.add("justify-content-center")
        document.getElementById("two-wheeler-v").innerHTML = `<p class="m-4 ">No Two Wheelers Added</p>`
    }
    if (fourWheelCounter === 0) {
        document.getElementById("four-wheeler-v").classList.add("justify-content-center")
        document.getElementById("four-wheeler-v").innerHTML = `<p class="m-4 ">No Four Wheelers Added</p>`
    }
    console.log(vehicleObjs[0].ownerVo.blockVo.typeOfHouse);

    if (twoWheelerCounter == vehicleObjs[0].ownerVo.blockVo.typeOfHouse) {
        document.getElementById("vehicle-type-warning").style.display = "";
        document.getElementById("vehicle-type-warning").innerHTML = `Only Four Wheelers will be allowed to add`;
        document.getElementById("vehicle-type").innerHTML = `<option value="" selected disabled>Select Vehicle Type</option> 
            <option value="Four Wheeler">Four Wheeler</option>`;

    }

    if (fourWheelCounter == vehicleObjs[0].ownerVo.blockVo.typeOfHouse) {
        document.getElementById("vehicle-type-warning").style.display = "";
        document.getElementById("vehicle-type-warning").innerHTML = `Only Two Wheelers will be allowed to add`;
        document.getElementById("vehicle-type").innerHTML = `<option value="" selected disabled>Select Vehicle Type</option>
            <option value="Two Wheeler">Two Wheeler</option>`;

    }
}

function editVehicle(vehicleId) {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var vehicleObjs = JSON.parse(htp.responseText);
            changeFormValue(vehicleObjs);
        }
    };
    htp.open("GET", "http://localhost:8088/user/getVehicle/" + vehicleId, true);
    htp.send();
}

function changeFormValue(vehicleObj) {
    let presentOptionsinSelect = document.getElementById("vehicle-type").childNodes
    let vehicleTypePresence = false;
    for (let i = 0; i < presentOptionsinSelect.length; i++) {
        if (presentOptionsinSelect[i].value !== vehicleObj.vehicleType) {
            vehicleTypePresence = true;
        }
    }
    if (vehicleTypePresence) {
        let select = document.getElementById("vehicle-type")
        var opt = document.createElement('option');
        opt.value = `${vehicleObj.vehicleType}`;
        opt.innerHTML = `${vehicleObj.vehicleType}`;
        select.appendChild(opt);
    }
    document.getElementById("vehicle-id").value = vehicleObj.id;
    document.getElementById("vehicle-type").value = vehicleObj.vehicleType;
    document.getElementById("vehicle-number-plate").value = vehicleObj.vehicleNumberPlate;
    document.getElementById("vehicle-rc-number").value = vehicleObj.vehicleRCNumber;
    document.getElementById("vehicle-type-warning").innerHTML = ``;
}

function emptyVehicleForm() {
    document.getElementById("vehicle-id").value = "";
    document.getElementById("vehicle-type").value = "null";
    document.getElementById("vehicle-type").innerHTML = `<option value="-" selected disabled>Select Vehicle Type</option>
                    <option value="Two Wheeler">Two Wheeler</option>
                    <option value="Four Wheeler">Four Wheeler</option>`
    document.getElementById("vehicle-number-plate").value = "";
    document.getElementById("vehicle-rc-number").value = "";
    editVehicleAddButton();
}