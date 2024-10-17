//Ajax function after change in block value.
function blockChange(x) {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var blockObj = JSON.parse(htp.responseText);
            changeValues(blockObj)
        }
    };
    htp.open("GET", "http://localhost:8088/searchForFloor/" + x.value, true);
    htp.send();
    document.getElementById("ModalLabel").innerHTML = "Add Owners";
    document.getElementById("submit-model").innerHTML = "Submit";
}

// Floor dropdown after ajax function blockChange(x) for form.
function changeValues(obj) {
    document.getElementById("house-numbers-label").innerHTML = ""
    document.getElementById("house-numbers-ownwers").innerHTML = ""
    document.getElementById("number-of-house").value = obj.houseOnEachFloor;
    var numberOfHouse = document.getElementById("number-of-floors");
    numberOfHouse.innerHTML = "<option selected disabled value='none'>Select Floor Number</option>"
    for (let i = 0; i < obj.noOfFloors; i++) {
        var option = document.createElement("option");
        option.value = i + 1
        option.text = i + 1;
        numberOfHouse.add(option);
    }
    console.log(numberOfHouse.value)
    numberOfHouse.value === "none" ? document.getElementById("submit-model").style.display = "none" : "";
}


// Ajax function after floor value changes for form.
function bringOwnersToform(numberOfHouse, floor, blockNumber) {
    var blockName = document.getElementById("blockSearch").value;
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var ownerList = JSON.parse(htp.responseText);
            createOwnerForm(ownerList, numberOfHouse, floor);
        }
    };
    htp.open("GET", `http://localhost:8088/searchOwners/${floor}/${blockNumber}`, true);
    htp.send();
}

// Creating label for form after ajax function bringOwnersToform(numberOfHouse,
// floor, blockNumber) for form.
function floorChange(floor) {
    var numberOfHouse = document.getElementById("number-of-house").value;
    document.getElementById("house-numbers-label").innerHTML = `<div class="col-lg-2">
  <label for="type-of-house" class="col-form-label"
  >Houses No:
  </label>
  </div><div class="col-lg-5">
  <label for="type-of-house" class="col-form-label"
  >Owner Name:
  </label>
  </div><div class="col-lg-5">
  <label for="type-of-house" class="col-form-label"
  >Owner Email Address:
  </label>
  </div>`
    var blockNumber = document.getElementById("block-name-form").value;
    bringOwnersToform(numberOfHouse, floor.value, blockNumber);
    document.getElementById("ModalLabel").innerHTML = "Add Owners";
    document.getElementById("submit-model").innerHTML = "Submit";
    floor.value !== "none" ? document.getElementById("submit-model").style.display = "" : "";
    setTimeout(createListOfOwnersThere, 500);
}

// Creates Owner form after ajax function bringOwnersToform(numberOfHouse,
// floor, blockNumber) for form.
function createOwnerForm(ownerList, numberOfHouse, floor) {

    if (ownerList.length !== 0) {
        document.getElementById("ModalLabel").innerHTML = "Edit Owners";
        document.getElementById("submit-model").innerHTML = "Update";
    }
    document.getElementById("house-numbers-ownwers").innerHTML = ""
    for (let i = 0; i < numberOfHouse; i++) {
        var prevoiusHouse = document.getElementById("house-numbers-ownwers").innerHTML;
        document.getElementById("house-numbers-ownwers").innerHTML = prevoiusHouse + `<div class="row mb-2" ><div class="col-lg-2">
<input
          type="hidden"
          class="form-control mb-1"
          id="type-of-house"
          value="${ownerList.length === 0 ? 0 : ownerList[i].id}"
          name="ownerId"
          />
          <input
          type="text"
          class="form-control mb-1"
          id="houseNumber-${i}"
          value="${ownerList.length === 0 ? (parseInt(floor) * 100 + i + 1) : ownerList[i].houseNo}"
          name="ownerHouse"
          />
          <span name="ownerHouse1-warning" class="all-warnings" style="color: #dc3545;font-size:12px;display: none" >Please Enter House No !</span>
          <span name="ownerHouse2-warning" class="all-warnings" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid House No !</span>
                            
      </div>
    <div class="col-lg-5">
    <input
          type="text"
          placeholder="Type Owner Name"
          class="form-control mb-1"
          id="name-${i}"
          value="${ownerList.length === 0 ? '' : ownerList[i].ownerName}"
          name="ownerName"
    />
    <span name="ownerName1-warning" class="all-warnings" style="color: #dc3545;font-size:12px;display: none" >Please Enter Owner Name !</span>
    <span name="ownerName2-warning" class="all-warnings" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Owner Full Name !</span>
                            
    </div>
 <div class="col-lg-5">
    <input
          type="text"
          placeholder="Type Owner Email Address"
          class="form-control"
          id="email-${i}"
          value="${ownerList.length === 0 ? '' : ownerList[i].ownerEmail}"
          name="ownerEmail"
    />
    <span name="ownerEmail1-warning" class="all-warnings" style="color: #dc3545;font-size:12px;display: none" >Please Enter Email Address !</span>
    <span name="ownerEmail2-warning" class="all-warnings" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Email Address !</span>
    <span name="ownerEmail3-warning" class="all-warnings" style="color: #dc3545;font-size:12px;display: none" >Entered Email Already Being Used !</span>
    </div>`
    }
}

// Ajax function after block changes for table.
function blockChangeForTable(x) {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var blockObj = JSON.parse(htp.responseText);
            changeFloorsForTable(blockObj)
        }
    };
    htp.open("GET", "http://localhost:8088/searchForFloor/" + x.value, true);
    htp.send();
}

// Floor dropdown after ajax function blockChangeForTable(x) for table.
function changeFloorsForTable(obj) {
    document.getElementById("house-numbers-label").innerHTML = ""
    document.getElementById("house-numbers-ownwers").innerHTML = ""
    var numberOfHouse = document.getElementById("number-of-floors-search");
    numberOfHouse.innerHTML = "<option selected disabled value='none'>Select Floor Number</option>"
    for (let i = 0; i < obj.noOfFloors; i++) {
        var option = document.createElement("option");
        option.value = i + 1
        option.text = i + 1;
        numberOfHouse.add(option);
    }
}

// Ajax function after floor values changes for table.
function bringOwnersToTable(floor) {
    var table = document.querySelector("#owner-table");
    table.innerHTML = ` <tr>
                                            <td colspan="6" style="text-align: center;">
                                                <div class="col-md-12 col-sm-12 border border-0">
                                                    <div class="loader-demo-box border border-0">
                                                        <div class="circle-loader" style="color: #7571f9 !important;">
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>`;
    var blockName = document.getElementById("blockSearch").value;
    var floorNumber = floor.value;
    setTimeout(function () {
        var htp = new XMLHttpRequest();
        htp.onreadystatechange = function () {
            if (htp.readyState == 4) {
                table.innerHTML = "";
                var ownerObj = JSON.parse(htp.responseText);
                createTable(ownerObj);
            }
        };
        htp.open("GET", `http://localhost:8088/searchOwners/${floorNumber}/${blockName}`, true);
        htp.send();
    }, 100)
}

// Creating owner table after ajax function bringOwnersToTable(floor) for table.
function createTable(listOfOwners) {
    var table = document.querySelector("#owner-table");
    table.innerHTML = ``;
    if (listOfOwners.length === 0) {
        table.innerHTML = `<tr><td colspan="8" class="text-center"><div class="d-flex justify-content-center align-items-center flex-column" style="height: 210px !important;"><i class="mdi mdi-account-multiple" style="color: #7571f9 !important; margin: 0px !important; font-size: 130px !important;"></i><p  >No Owner Found For Selected Block and Floor.</p></div></td></tr>`
    }
    for (var index = 0; index < listOfOwners.length; index++) {
        var newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `<p>${1 + index
        }</p>`;
        newTR.insertCell(1).innerHTML = `${listOfOwners[index].houseNo}`;
        newTR.insertCell(2).innerHTML = `${listOfOwners[index].ownerName}`;
        newTR.insertCell(3).innerHTML = `${listOfOwners[index].ownerEmail}`;
        newTR.insertCell(4).innerHTML = ` <a class="ml-3" style="font-size: 14px" href="#" onclick="getMemberInfo(${listOfOwners[index].id})"   data-toggle="modal"
                            data-target="#exampleModal-member-info">
        <i class="mdi mdi-information-outline menu-icon"></i>
      </a>`;
        newTR.insertCell(5).innerHTML = ` <a class="ml-3" style="font-size: 14px" href="#" onclick="getOwnerVehicleInfo(${listOfOwners[index].id},${listOfOwners[index].blockVo.id})"   data-toggle="modal"
                            data-target="#exampleModal-owner-parking">
        <i class="mdi mdi-parking menu-icon"></i>
      </a>`;
        newTR.insertCell(6).innerHTML = ` <a class="ml-3" style="font-size: 14px" href="#" onclick="getOwnerMaintenanceInfo(${listOfOwners[index].id},${listOfOwners[index].blockVo.id})"   data-toggle="modal"
                            data-target="#exampleModal-owner-maintenance">
        <i class="mdi mdi-cash-multiple menu-icon"></i>
      </a>`;
        newTR.insertCell(7).innerHTML = `<button onclick="editOwner(${listOfOwners[index].id})" class="btn btn-outline-info" style="padding: 1.6px 9.6px;font-size: 14px" data-toggle="modal"
                        data-target="#exampleModal-3">Edit</button>`;
    }
}

// Ajax for editing Owner Name
function editOwner(ownerId) {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var ownerObj = JSON.parse(htp.responseText);
            createEditOwnerForm(ownerObj)
        }
    };
    htp.open("GET", `http://localhost:8088/findOwner/${ownerId}`, true);
    htp.send();
}

var editOwnerObj;

// Create Model For Owner Edit.
function createEditOwnerForm(ownerObj) {
    editOwnerObj = ownerObj;
    document.getElementById("owner-edit-id").value = ownerObj.id;
    document.getElementById("owner-edit-name").value = ownerObj.ownerName;
    document.getElementById("owner-edit-email").value = ownerObj.ownerEmail;
    document.getElementById("block").value = ownerObj.blockVo.id;
    document.getElementById("floor").value = ownerObj.floorNo;
    document.getElementById("block").innerHTML = ownerObj.blockVo.blockName;
    document.getElementById("floor").innerHTML = ownerObj.floorNo;
    document.getElementById("owner-edit-house-no").value = ownerObj.houseNo;
}


function updateOwnerObj() {
    editOwnerObj.ownerName = document.getElementById("owner-edit-name").value;
    editOwnerObj.ownerEmail = document.getElementById("owner-edit-email").value;
    editOwnerObj.houseNo = document.getElementById("owner-edit-house-no").value;
    updateOwner(editOwnerObj);
}

function updateOwner(ownerObj) {
    var htp = new XMLHttpRequest();
    htp.open("PUT", "http://localhost:8088/updateOwner", true);
    htp.setRequestHeader("Content-Type", "application/json");
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            bringOwnersToTable(document.getElementById("number-of-floors-search"));
        }
    };
    htp.send(JSON.stringify(ownerObj));
}

// Emptying form after close button.
function emptyAddOwnerForm() {
    const inputs = document.querySelectorAll('.model-form input selector')
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = "";
    }
    document.getElementById("house-numbers-ownwers").innerHTML = ""
    document.getElementById("submit-model").innerHTML = "Submit";
    document.getElementById("ModalLabel").innerHTML = "Add Owners"
    document.getElementById("house-numbers-label").innerHTML = "";
    document.getElementById("number-of-house").value = "- -"
    document.getElementById("number-of-floors").innerHTML = " <option value=''>- -</option>";
    document.getElementById("block-name-form").value = "null";
}

function displayOwnerForFirst() {
    var blockId = localStorage.getItem("blockId");
    // console.log(blockName);
    var selectTagsBlock = document.getElementById("blockSearch");
    if (blockId != null) {
        selectTagsBlock.value = blockId;
        localStorage.removeItem("blockId");
    } else {
        var selectTagValue = document.getElementById("blockSearch").childNodes;
        if (selectTagValue[3] == undefined) {
            document.getElementById("owner-table").innerHTML = `<tr><td colspan="6" class="text-center "><div class="d-flex justify-content-center align-items-center flex-column"><i class="mdi mdi-account-multiple" style="
 
 
 margin: 0px !important; font-size: 170px"></i><p  >No Owner Found For Selected Block and Floor.</p></div></td></tr>`
        }
        selectTagValue[3].selected = true;
    }
    blockChangeForTable(document.getElementById("blockSearch"));
    setTimeout(function () {
        var selectTagsFloor = document.getElementById("number-of-floors-search").childNodes;
        selectTagsFloor[1].selected = true;
        bringOwnersToTable(document.getElementById("number-of-floors-search"))
    }, 200)


}

function getMemberInfo(ownerId) {
    console.log(ownerId);
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var memberObj = JSON.parse(htp.responseText);
            openMemberInfo(memberObj);
        }
    };
    htp.open("GET", `http://localhost:8088/getMemberDetails/${ownerId}`, true);
    htp.send();
}

function openMemberInfo(memberObj) {
    var table = document.querySelector("#member-info-table");
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
        newTR.insertCell(0).innerHTML = `<p>${1 + index
        }</p>`;
        newTR.insertCell(1).classList.add("py-1");
        newTR.insertCell(1).innerHTML = `<img class="rounded " src="/documents/memberPhotos/${memberObj[index].fileName}" alt="image">`;
        newTR.insertCell(2).innerHTML = `${memberObj[index].memberEmail}`;
        newTR.insertCell(3).innerHTML = `${memberObj[index].memberPhoneNo}`;
    }
}

function getOwnerVehicleInfo(ownerId, blockId) {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var vehicleObjs = JSON.parse(htp.responseText);
            getParkingList(vehicleObjs, blockId)

        }
    };
    htp.open("GET", `http://localhost:8088/admin/getVehicleDetails/${ownerId}`, true);
    htp.send();
}

function getParkingList(vehicleObjs, blockId) {
    let allotedParkingStrings = [];
    console.log(vehicleObjs);
    for (let index = 0; index < vehicleObjs.length; index++) {
        allotedParkingStrings.push(vehicleObjs[index].allocatedParkingSpace);
    }
    console.log(allotedParkingStrings);
    var htp = new XMLHttpRequest();
    htp.open("POST", `http://localhost:8088/admin/getParkingSpaces/${blockId}`, true);
    htp.setRequestHeader("Content-Type", "application/json");
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var parkingAllotmentList = JSON.parse(htp.responseText);
            createVehicleInfoTable(vehicleObjs, parkingAllotmentList)
        }
    };
    htp.send(JSON.stringify(allotedParkingStrings));
}

function createVehicleInfoTable(vehicleObjs, parkingAllotmentList) {
    console.log(vehicleObjs);
    console.log(parkingAllotmentList)
    let table = document.getElementById("vehicle-info");
    if (vehicleObjs.length === 0) {
        table.innerHTML = `<tr><td colspan="5" class="text-center pt-5">
        <i class=" mdi mdi-car" style="font-size: 60px !important;color: #7571f9 !important;"></i>
        <p>No Vehicle For this Owner.</p>

</td></tr>`
    }
    for (var index = 0; index < vehicleObjs.length; index++) {
        var newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `<input type="hidden" id="vehicle-id-${index}" value="${vehicleObjs[index].id}"><p>${1 + index
        }</p>`;
        newTR.insertCell(1).innerHTML = `<h6>${vehicleObjs[index].vehicleNumberPlate}</h6>`;
        newTR.insertCell(2).innerHTML = `${vehicleObjs[index].vehicleRCNumber}`;
        if (vehicleObjs[index].vehicleType === "Two Wheeler") {
            newTR.insertCell(3).innerHTML = ` <i class=" mdi mdi-motorbike ml-2" style="font-size: 20px !important;color: #7571f9 !important;"></i>`
            newTR.insertCell(4).innerHTML = `<select onchange="twoWheelerOptionChanged(this)" class="form-control" id="vehicle-allotment-${index}" name="two-wheeler-parking-names">
                                                    <option value="Parking Not Alloted" >Allocate Parking For Two Wheeler</option>
                                               </select>`
        } else {
            newTR.insertCell(3).innerHTML = ` <i class=" mdi mdi-car ml-2" style="font-size: 20px !important;color: #7571f9 !important;"></i>`;
            newTR.insertCell(4).innerHTML = `<select onchange="fourWheelerOptionChanged(this)" class="form-control" id="vehicle-allotment-${index}" name="four-wheeler-parking-names">
                                                    <option value="Parking Not Alloted">Allocate Parking For Four Wheeler</option>
                                               </select>`;
        }
        newTR.insertCell(5).innerHTML = `<button class="btn btn-outline-danger" onclick="deallocateParking('vehicle-allotment-${index}')" style="padding: 0.1rem 0.6rem !important;">Deallocate</button>`;
    }
    addParkingOptions(parkingAllotmentList, vehicleObjs);
}

function addParkingOptions(parkingAllotmentList, vehicleObjs) {
    var fourWheelerSelects = document.getElementsByName("four-wheeler-parking-names");
    for (let i = 0; i < fourWheelerSelects.length; i++) {
        for (let j = 0; j < parkingAllotmentList[1].length; j++) {
            var option = document.createElement("option");
            option.value = parkingAllotmentList[1][j];
            option.innerHTML = parkingAllotmentList[1][j];
            fourWheelerSelects[i].add(option);
        }

    }

    var twoWheelerSelects = document.getElementsByName("two-wheeler-parking-names");
    for (let i = 0; i < twoWheelerSelects.length; i++) {
        for (let j = 0; j < parkingAllotmentList[0].length; j++) {
            var option = document.createElement("option");
            option.value = parkingAllotmentList[0][j];
            option.innerHTML = parkingAllotmentList[0][j];
            twoWheelerSelects[i].add(option);
        }

    }

    for (let i = 0; i < vehicleObjs.length; i++) {
        console.log(vehicleObjs[i].allocatedParkingSpace);
        let select = document.getElementById(`vehicle-allotment-${i}`);
        if (!vehicleObjs[i].allocatedParkingSpace === "Parking Not Alloted") {
            select.value = vehicleObjs[i].allocatedParkingSpace;
        } else {
            select.value = vehicleObjs[i].allocatedParkingSpace;
        }
    }
}

function allocateVehicle() {
    let arr = [];
    let table = document.getElementById("vehicle-info");
    for (let i = 0; i < table.rows.length; i++) {
        let vehicleVo = {id: 0, allocatedParkingSpace: ""};
        vehicleVo.id = parseInt(document.getElementById(`vehicle-id-${i}`).value);
        vehicleVo.allocatedParkingSpace = document.getElementById(`vehicle-allotment-${i}`).value;
        arr.push(vehicleVo);
    }
    console.log(arr);
    allocateParking(arr);
    table.innerHTML = "";
}

function empptytable() {
    let table = document.getElementById("vehicle-info");
    table.innerHTML = "";
}

function allocateParking(arr) {
    var htp = new XMLHttpRequest();
    htp.open("POST", "http://localhost:8088/admin/allocateParking", true);
    htp.setRequestHeader("Content-Type", "application/json");
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            console.log("Success");
        }
    };
    htp.send(JSON.stringify(arr));
}

function fourWheelerOptionChanged(fourWheelerSelect) {
    let fourWheelerParkingSelects = document.getElementsByName("four-wheeler-parking-names");
    if (takenParkingList[fourWheelerSelect.id] === undefined) {
        takenParkingList[fourWheelerSelect.id] = fourWheelerSelect.value;
    } else {
        takenParkingList[fourWheelerSelect.id] = fourWheelerSelect.value
    }
    let keysList = Object.keys(takenParkingList);
    for (let i = 0; i < fourWheelerParkingSelects.length; i++) {
        if (fourWheelerSelect.id !== fourWheelerParkingSelects[i].id) {
            let options = fourWheelerParkingSelects[i].options;
            for (let j = 0; j < options.length; j++) {
                options[j].style.display = "";
            }
            for (let j = 0; j < options.length; j++) {
                for (let k = 0; k < keysList.length; k++) {
                    if (takenParkingList[keysList[k]] === options[j].value) {
                        options[j].style.display = "none";
                    }
                }
            }
            if (fourWheelerParkingSelects[i].value === fourWheelerSelect.value) {
                fourWheelerParkingSelects[i].value = "Parking Not Alloted";
            }
        }
    }
}

var takenParkingList = {}

function twoWheelerOptionChanged(twoWheelerSelect) {
    if (takenParkingList[twoWheelerSelect.id] === undefined) {
        takenParkingList[twoWheelerSelect.id] = twoWheelerSelect.value;
    } else {
        takenParkingList[twoWheelerSelect.id] = twoWheelerSelect.value
    }
    let keysList = Object.keys(takenParkingList);
    let twoWheelerParkingSelects = document.getElementsByName("two-wheeler-parking-names");
    for (let i = 0; i < twoWheelerParkingSelects.length; i++) {
        if (twoWheelerSelect.id !== twoWheelerParkingSelects[i].id) {
            let options = twoWheelerParkingSelects[i].options;
            for (let j = 0; j < options.length; j++) {
                options[j].style.display = "";
            }
            for (let j = 0; j < options.length; j++) {
                for (let k = 0; k < keysList.length; k++) {
                    if (takenParkingList[keysList[k]] === options[j].value) {
                        options[j].style.display = "none";
                    }
                }
            }
            if (twoWheelerParkingSelects[i].value === twoWheelerSelect.value) {
                twoWheelerParkingSelects[i].value = "Parking Not Alloted";
            }
        }
    }
}

function deallocateParking(selectId) {
    document.getElementById(selectId).value = "Parking Not Alloted";
}

let dataBaseOwnerEmailList = []

function createListOfOwnersThere() {
    dataBaseOwnerEmailList = [];
    let ownerEmail = document.getElementsByName("ownerEmail");
    let ownerId = document.getElementsByName("ownerId");
    let emailList = []
    for (let i = 0; i < ownerEmail.length; i++) {
        console.log(ownerId[i].value);
        if (ownerId[i].value !== '0') {
            emailList.push(ownerEmail[i].value)
        }
    }
    console.log(emailList);
    validateAddOwnerForm(emailList);

}

function validateAddOwnerForm(emailList) {
    var htp = new XMLHttpRequest();
    htp.open("POST", "http://localhost:8088/getOwnerEmailList", true);
    htp.setRequestHeader("Content-Type", "application/json");
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            dataBaseOwnerEmailList = JSON.parse(htp.responseText);
            console.log(dataBaseOwnerEmailList);
        }
    };
    htp.send(JSON.stringify(emailList));

}

function validateOwnerAddForm() {

    let ownerHouseNumbers = document.getElementsByName("ownerHouse")
    let ownerNames = document.getElementsByName("ownerName");
    let ownerEmail = document.getElementsByName("ownerEmail");
    let ownerHouse1Warning = document.getElementsByName("ownerHouse1-warning");
    let ownerHouse2Warning = document.getElementsByName("ownerHouse2-warning");
    let ownerName1Warning = document.getElementsByName("ownerName1-warning");
    let ownerName2Warning = document.getElementsByName("ownerName2-warning")
    let ownerEmail1Warning = document.getElementsByName("ownerEmail1-warning")
    let ownerEmail2Warning = document.getElementsByName("ownerEmail2-warning");
    let ownerEmail3Warning = document.getElementsByName("ownerEmail3-warning");
    let validForm = true;

    for (let i = 0; i < ownerHouseNumbers.length; i++) {
        if (ownerHouseNumbers[i].value === "") {
            ownerHouse1Warning[i].style.display = "";
            ownerHouse2Warning[i].style.display = "none";
            ownerHouseNumbers[i].classList.add("is-invalid");
            ownerHouseNumbers[i].setAttribute("onkeyup", "validateOwnerAddForm()");
            validForm = false;
        } else if (ownerHouseNumbers[i].value.length < 2) {
            ownerHouse2Warning[i].style.display = "";
            ownerHouse1Warning[i].style.display = "none";
            ownerHouseNumbers[i].classList.add("is-invalid");
            ownerHouseNumbers[i].setAttribute("onkeyup", "validateOwnerAddForm()");
            validForm = false;
        } else {
            ownerHouse1Warning[i].style.display = "none";
            ownerHouse2Warning[i].style.display = "none";
            if (ownerHouseNumbers[i].classList.contains("is-invalid")) {
                ownerHouseNumbers[i].classList.add("is-valid");
                ownerHouseNumbers[i].classList.remove("is-invalid");
            }
        }
    }

    for (let i = 0; i < ownerNames.length; i++) {
        if (ownerNames[i].value === "") {
            ownerName1Warning[i].style.display = "";
            ownerName2Warning[i].style.display = "none";
            ownerNames[i].classList.add("is-invalid");
            ownerNames[i].setAttribute("onkeyup", "validateOwnerAddForm()");
            validForm = false;
        } else if (ownerNames[i].value.length < 8) {
            ownerName2Warning[i].style.display = "";
            ownerName1Warning[i].style.display = "none";
            ownerNames[i].classList.add("is-invalid");
            ownerNames[i].setAttribute("onkeyup", "validateOwnerAddForm()");
            validForm = false;
        } else {
            ownerName1Warning[i].style.display = "none";
            ownerName2Warning[i].style.display = "none";
            if (ownerNames[i].classList.contains("is-invalid")) {
                ownerNames[i].classList.add("is-valid");
                ownerNames[i].classList.remove("is-invalid");
            }
        }
    }

    let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    let emailAreadyUse = false;
    for (let i = 0; i < ownerEmail.length; i++) {

        for (let j = i + 1; j < ownerEmail.length; j++) {
            if (ownerEmail[i].value === ownerEmail[j].value) {
                console.log(ownerEmail[i].value + "===" + ownerEmail[j].value);
                emailAreadyUse = true;
                break;
            }
        }
        console.log(dataBaseOwnerEmailList.length);
        for (let j = 0; j < dataBaseOwnerEmailList.length; j++) {
            if (dataBaseOwnerEmailList[j] === ownerEmail[i].value) {
                emailAreadyUse = true;
                break;
            }
        }
        console.log(dataBaseOwnerEmailList);
        if (ownerEmail[i].value === "") {
            ownerEmail1Warning[i].style.display = "";
            ownerEmail2Warning[i].style.display = "none";
            ownerEmail3Warning[i].style.display = "none";
            ownerEmail[i].classList.add("is-invalid");
            ownerEmail[i].setAttribute("onkeyup", "validateOwnerAddForm()");
            validForm = false;
        } else if (!ownerEmail[i].value.match(emailFormat)) {
            ownerEmail1Warning[i].style.display = "none";
            ownerEmail2Warning[i].style.display = "";
            ownerEmail3Warning[i].style.display = "none";
            ownerEmail[i].classList.add("is-invalid");
            ownerEmail[i].setAttribute("onkeyup", "validateOwnerAddForm()");
            validForm = false;
        } else if (emailAreadyUse) {
            ownerEmail1Warning[i].style.display = "none";
            ownerEmail2Warning[i].style.display = "none";
            ownerEmail3Warning[i].style.display = "";
            ownerEmail[i].classList.add("is-invalid");
            ownerEmail[i].setAttribute("onkeyup", "validateOwnerAddForm()");
            validForm = false;
            break;
        } else {
            ownerEmail1Warning[i].style.display = "none";
            ownerEmail2Warning[i].style.display = "none";
            ownerEmail3Warning[i].style.display = "none";
            if (ownerEmail[i].classList.contains("is-invalid")) {
                ownerEmail[i].classList.add("is-valid");
                ownerEmail[i].classList.remove("is-invalid");
            }
        }
    }
    return validForm;
}

function validateOwnerEditForm() {
    let ownerName = document.getElementById("owner-edit-name");
    let ownerEmail = document.getElementById("owner-edit-email");
    let validForm = true;
    if (ownerName.value === "") {
        document.getElementById("nameEdit1-warning").style.display = "";
        document.getElementById("nameEdit2-warning").style.display = "none";
        ownerName.classList.add("is-invalid");
        ownerName.setAttribute("onkeyup", "validateOwnerEditForm()");
        validForm = false;
    } else if (ownerName.value.length < 6) {
        document.getElementById("nameEdit1-warning").style.display = "none";
        document.getElementById("nameEdit2-warning").style.display = "";
        ownerName.classList.add("is-invalid");
        ownerName.setAttribute("onkeyup", "validateOwnerEditForm()");
        validForm = false;
    } else {
        document.getElementById("nameEdit1-warning").style.display = "none";
        document.getElementById("nameEdit2-warning").style.display = "none";
        if (ownerName.classList.contains("is-invalid")) {
            ownerName.classList.add("is-valid");
            ownerName.classList.remove("is-invalid");
        }
    }

    let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    if (ownerEmail.value === "") {
        document.getElementById("emailEdit1-warning").style.display = "";
        document.getElementById("emailEdit2-warning").style.display = "none";
        ownerEmail.classList.add("is-invalid");
        ownerEmail.setAttribute("onkeyup", "validateOwnerEditForm()");
        validForm = false;
    } else if (!ownerEmail.value.match(emailFormat)) {
        document.getElementById("emailEdit1-warning").style.display = "none";
        document.getElementById("emailEdit2-warning").style.display = "";
        ownerEmail.classList.add("is-invalid");
        ownerEmail.setAttribute("onkeyup", "validateOwnerEditForm()");
        validForm = false;
    } else {
        document.getElementById("emailEdit1-warning").style.display = "none";
        document.getElementById("emailEdit2-warning").style.display = "none";
        if (ownerEmail.classList.contains("is-invalid")) {
            ownerEmail.classList.add("is-valid");
            ownerEmail.classList.remove("is-invalid");
        }
    }
    console.log(validForm);
    return validForm;
}

function updateWhenValidate() {
    if (validateOwnerEditForm()) {
        updateOwnerObj();
        let updateButton = document.getElementById("edit-updateButton");
        updateButton.setAttribute("data-dismiss", "modal");
        updateButton.setAttribute("aria-label", "Close");
        updateButton.setAttribute("onclick", "");
        updateButton.click();
        updateButton.setAttribute("data-dismiss", "");
        updateButton.setAttribute("aria-label", "");
        updateButton.setAttribute("onclick", "updateWhenValidate()");
        document.getElementById("nameEdit1-warning").style.display = "none";
        document.getElementById("nameEdit2-warning").style.display = "none";
        document.getElementById("emailEdit1-warning").style.display = "none";
        document.getElementById("emailEdit2-warning").style.display = "none";
        document.getElementById("owner-edit-name").classList.remove("is-valid");
        document.getElementById("owner-edit-name").classList.remove("is-invalid");
        document.getElementById("owner-edit-email").classList.remove("is-valid");
        document.getElementById("owner-edit-email").classList.remove("is-invalid");
        document.getElementById("owner-edit-email").setAttribute("onkeyup", "");
        document.getElementById("owner-edit-name").setAttribute("onkeyup", "");

    }
}

function emptyEditOwnerForm() {
    document.getElementById("nameEdit1-warning").style.display = "none";
    document.getElementById("nameEdit2-warning").style.display = "none";
    document.getElementById("emailEdit1-warning").style.display = "none";
    document.getElementById("emailEdit2-warning").style.display = "none";
    document.getElementById("owner-edit-name").classList.remove("is-valid");
    document.getElementById("owner-edit-name").classList.remove("is-invalid");
    document.getElementById("owner-edit-email").classList.remove("is-valid");
    document.getElementById("owner-edit-email").classList.remove("is-invalid");
    document.getElementById("owner-edit-email").setAttribute("onkeyup", "");
    document.getElementById("owner-edit-name").setAttribute("onkeyup", "");
}

function getOwnerMaintenanceInfo(ownerId) {
    if (ownerId === undefined) {
        ownerId = localStorage.getItem("ownerIdForMain")
    } else {
        localStorage.setItem("ownerIdForMain", ownerId)
    }
    let maintenanceYear = document.getElementById("maintenance-year").value;
    console.log(maintenanceYear)
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var maintenancePaidDetailList = JSON.parse(htp.responseText);
            createMaintenanceDetailTable(maintenancePaidDetailList)
        }
    };
    htp.open("GET", `http://localhost:8088/getMaintenancePaidDetailsForOwner/${ownerId}/${maintenanceYear}`, true);
    htp.send();
}

function createMaintenanceDetailTable(maintenancePaidDetailList) {
    let monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    let table = document.getElementById("maintenance-info");
    table.innerHTML="";
    let listOFMaintenancePaidMonths = [];
    for (let i = 0; i < maintenancePaidDetailList.length; i++) {
        if (maintenancePaidDetailList[i].maintenanceStatus === true) {
            console.log(maintenancePaidDetailList[i].month)
            listOFMaintenancePaidMonths.push(maintenancePaidDetailList[i].month);
        }
    }
    for (let index = 0; index < monthList.length; index++) {
        let newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `${index+1}`;
        newTR.insertCell(1).innerHTML = `${monthList[index]}`;
        if (listOFMaintenancePaidMonths.includes(monthList[index])) {
            newTR.insertCell(2).innerHTML = ` <div class="badge badge-success">Paid</div>`
            newTR.insertCell(3).innerHTML = `<button class="btn btn-outline-danger" style="padding: 0.1rem 0.6rem" onclick="maintenanceUnpaid(localStorage.getItem('ownerIdForMain'),'${monthList[index]}',document.getElementById('maintenance-year').value)">Unpaid</button>`
        } else {
            newTR.insertCell(2).innerHTML = ` <div class="badge badge-danger"  >Unpaid</div>`
            newTR.insertCell(3).innerHTML = `<button class="btn btn-outline-success" style="padding: 0.1rem 0.6rem" onclick="maintenancePaid(localStorage.getItem('ownerIdForMain'),'${monthList[index]}',document.getElementById('maintenance-year').value)">Paid</button>`
        }
    }
}

function emptyOwnerMaintenanceTable() {
    document.getElementById("maintenance-info").innerHTML = "";
}

function maintenancePaid(ownerId,month,year)
{
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            // var maintenancePaidDetailList = JSON.parse(htp.responseText);
            getOwnerMaintenanceInfo(ownerId)
        }
    };
    htp.open("GET", `http://localhost:8088/maintenancePaid/${ownerId}/${year}/${month}`, true);
    htp.send();
}

function maintenanceUnpaid(ownerId,month,year)
{
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            // var maintenancePaidDetailList = JSON.parse(htp.responseText);
            getOwnerMaintenanceInfo(ownerId)
        }
    };
    htp.open("GET", `http://localhost:8088/maintenanceUnpaid/${ownerId}/${year}/${month}`, true);
    htp.send();
}