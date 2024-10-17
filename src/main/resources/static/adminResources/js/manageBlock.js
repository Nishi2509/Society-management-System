function calHouse() {
    var numberOfFloors = document.getElementById("number-of-floors").value;
    var houseOnEachFloor = document.getElementById("house-on-each-floor").value;
    document.getElementById("number-of-house").innerHTML = numberOfFloors * houseOnEachFloor;
}

function emptyAddBlockForm() {
    const inputs = document.querySelectorAll('.model-form input')
    let warningLabels=document.getElementsByClassName("all-warnings");
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = "";
        inputs[i].classList.remove("is-invalid")
        inputs[i].classList.remove("is-valid")
    }
    for (let i = 0; i < warningLabels.length; i++) {
        warningLabels[i].style.display="none";
    }
    document.getElementById("type-of-house").value = "none";
    document.getElementById("type-of-house").classList.remove("is-invalid") ;
    document.getElementById("type-of-house").classList.remove("is-valid") ;
    document.getElementById("type-of-house").style.border="0px"
    document.getElementById("number-of-house").innerHTML = '0';
    document.getElementById("submit").innerHTML = "Submit";
    document.getElementById("ModalLabel").innerHTML = "Add Block"
}

function getBlock(blockId) {
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var blockDetails = JSON.parse(htp.responseText);
            editBlock(blockDetails)
        }
    };
    htp.open("GET", `http://localhost:8088/admin/getBlockDetails/${blockId}`, true);
    htp.send();
}

function editBlock(blockDetails) {

    // getting model inputs here
    document.getElementById("ModalLabel").innerHTML = "Edit Block"
    document.getElementById("submit").innerHTML = "Update";
    document.getElementById("block-id").value = blockDetails.id;
    document.getElementById("block-name").value = blockDetails.blockName;
    document.getElementById("number-of-floors").value = blockDetails.noOfFloors;
    document.getElementById("house-on-each-floor").value = blockDetails.houseOnEachFloor;
    document.getElementById("type-of-house").value = blockDetails.typeOfHouse;
    document.getElementById("number-of-house").innerHTML = blockDetails.noOfFloors * blockDetails.houseOnEachFloor;
    document.getElementById("four-wheeler-parking-space").value = blockDetails.fourWheelerParkingSpace;
    document.getElementById("two-wheeler-parking-space").value = blockDetails.twoWheelerParkingSpace;
}

function saveOwnerDisplayDetails(blockId) {
    localStorage.setItem("blockId", blockId);
}

function validateBlockAddForm() {
    let blockName = document.getElementById("block-name");
    let numberOfFloors = document.getElementById("number-of-floors");
    let houseOnEachFloor = document.getElementById("house-on-each-floor");
    let typeOfHouse = document.getElementById("type-of-house");
    let fourPark = document.getElementById("four-wheeler-parking-space");
    let twoPark = document.getElementById("two-wheeler-parking-space");
    let validForm = true;

    if (blockName.value === "") {
        document.querySelector("#name1-warning").style.display = "";
        blockName.classList.add("is-invalid");
        blockName.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else {
        document.querySelector("#name1-warning").style.display = "none";
        if (blockName.classList.contains("is-invalid")) {
            blockName.classList.remove("is-invalid")
            blockName.classList.add("is-valid")
        }
    }

    let floorFormat = /^[0-9]{1,2}$/;

    if (numberOfFloors.value === "") {
        document.querySelector("#floor1-warning").style.display = "";
        document.querySelector("#floor2-warning").style.display = "none";
        numberOfFloors.classList.add("is-invalid");
        numberOfFloors.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else if (!numberOfFloors.value.match(floorFormat)||numberOfFloors.value==='0') {
        document.querySelector("#floor1-warning").style.display = "none";
        document.querySelector("#floor2-warning").style.display = "";
        numberOfFloors.classList.add("is-invalid");
        numberOfFloors.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else {
        document.querySelector("#floor1-warning").style.display = "none";
        document.querySelector("#floor2-warning").style.display = "none";
        if (numberOfFloors.classList.contains("is-invalid")) {
            numberOfFloors.classList.remove("is-invalid")
            numberOfFloors.classList.add("is-valid")
        }
    }

    let houseFormat = /^[0-9]{1,1}$/;

    if (houseOnEachFloor.value === "") {
        document.querySelector("#house1-warning").style.display = "";
        document.querySelector("#house2-warning").style.display = "none";
        houseOnEachFloor.classList.add("is-invalid");
        houseOnEachFloor.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else if (!houseOnEachFloor.value.match(houseFormat)||houseOnEachFloor.value==='0') {
        document.querySelector("#house1-warning").style.display = "none";
        document.querySelector("#house2-warning").style.display = "";
        houseOnEachFloor.classList.add("is-invalid");
        houseOnEachFloor.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else {
        document.querySelector("#house1-warning").style.display = "none";
        document.querySelector("#house2-warning").style.display = "none";
        if (houseOnEachFloor.classList.contains("is-invalid")) {
            houseOnEachFloor.classList.remove("is-invalid")
            houseOnEachFloor.classList.add("is-valid")
        }
    }

    if (typeOfHouse.value === "none") {
        document.querySelector("#type-of-house1-warning").style.display = "";
        typeOfHouse.classList.add("is-invalid");
        typeOfHouse.style.backgroundPosition="center right calc(1.375em + 0.1875rem)";
        typeOfHouse.style.border="1px solid #dc3545";
        typeOfHouse.setAttribute("onchange", "validateBlockAddForm()");
        validForm = false;
    } else {
        document.querySelector("#type-of-house1-warning").style.display = "none";
        if (typeOfHouse.classList.contains("is-invalid")) {
            typeOfHouse.classList.remove("is-invalid")
            typeOfHouse.classList.add("is-valid")
            typeOfHouse.style.backgroundPosition="center right calc(1.375em + 0.1875rem)";
            typeOfHouse.style.border="1px solid #28a745";
        }
    }

    let parkFormat = /^[0-9]{1,3}$/;

    if (fourPark.value === "") {
        document.querySelector("#four-wheeler1-warning").style.display = "";
        document.querySelector("#four-wheeler2-warning").style.display = "none";
        fourPark.classList.add("is-invalid");
        fourPark.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else if (!fourPark.value.match(parkFormat)||fourPark.value==='0') {
        document.querySelector("#four-wheeler1-warning").style.display = "none";
        document.querySelector("#four-wheeler2-warning").style.display = "";
        fourPark.classList.add("is-invalid");
        fourPark.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else {
        document.querySelector("#four-wheeler1-warning").style.display = "none";
        document.querySelector("#four-wheeler2-warning").style.display = "none";
        if (fourPark.classList.contains("is-invalid")) {
            fourPark.classList.remove("is-invalid")
            fourPark.classList.add("is-valid")
        }
    }

    if (twoPark.value === "") {
        document.querySelector("#two-wheeler1-warning").style.display = "";
        document.querySelector("#two-wheeler2-warning").style.display = "none";
        twoPark.classList.add("is-invalid");
        twoPark.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else if (!twoPark.value.match(parkFormat)||twoPark.value==='0') {
        document.querySelector("#two-wheeler1-warning").style.display = "none";
        document.querySelector("#two-wheeler2-warning").style.display = "";
        twoPark.classList.add("is-invalid");
        twoPark.setAttribute("onkeyup", "validateBlockAddForm()");
        validForm = false;
    } else {
        document.querySelector("#two-wheeler1-warning").style.display = "none";
        document.querySelector("#two-wheeler2-warning").style.display = "none";
        if (twoPark.classList.contains("is-invalid")) {
            twoPark.classList.remove("is-invalid")
            twoPark.classList.add("is-valid")
        }
    }
    return validForm;
}