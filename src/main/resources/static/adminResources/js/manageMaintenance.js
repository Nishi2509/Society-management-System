var tableCount = 1;

function addMaintenance() {
    if (validateAddMaintenanceCharges()) {
        var type = document.getElementById("maintenance-type");
        var amount = document.getElementById("maintenance-amount");
        const table = document.querySelector("#maintenance-add-table");
        if (tableCount == 1) {
            table.innerHTML = "";
        }
        const newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `<p>${tableCount}</p>`;
        newTR.insertCell(1).innerHTML = `<input type="text" class="form-control"  name="maintenanceType" value="${type.value}"><span id="maintenanceType1-warning-${tableCount}" style="color: #dc3545;font-size:12px;display: none">Please Enter Maintenance Type !</span><span id="maintenanceType2-warning-${tableCount}" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Maintenance Type !</span>`;
        newTR.insertCell(2).innerHTML = `<input type="text" class="form-control" name="maintenanceAmount" value="${amount.value}"><span id="maintenanceAmount1-warning-${tableCount}" style="color: #dc3545;font-size:12px;display: none">Please Enter Amount !</span><span id="maintenanceAmount2-warning-${tableCount}" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Amount !</span>`;
        document.getElementById("total-amount").innerHTML = parseInt(document.getElementById("total-amount").innerHTML) + parseInt(amount.value);
        tableCount++;
        type.value = "";
        amount.value = "";
        document.getElementById("maintenance-submit-button").style.display = "";
        document.getElementById("maintenance-house-type").classList.remove("is-valid");
        document.getElementById("maintenance-house-type").style.border = "none"
        document.getElementById("maintenance-type").classList.remove("is-valid");
        document.getElementById("maintenance-amount").classList.remove("is-valid");
        document.getElementById("maintenance-amount").classList.add("border");
        document.getElementById("amount-box").style.border = "none";
    }
}

createYearSelectionTable()
getMaintenanceDetails()
getMaintenanceDetailsForYear()

function createYearSelectionTable() {
    let date = new Date();
    let tableYearSelect = document.getElementById("year-for-table");
    // let modelYearSelect = document.getElementById("maintenance-year");
    let selectLoopCount = (date.getFullYear() - 2023) + 5;
    tableYearSelect.innerHTML += `<option value="none" disabled>Select Maintenance Year</option>`
    // modelYearSelect.innerHTML += `<!--<option value="none" disabled>Select Maintenance Year</option>-->`

    for (let i = 0; i <= selectLoopCount; i++) {
        tableYearSelect.innerHTML += `<option value="${2023 + i}">${2023 + i}</option>`
        // modelYearSelect.innerHTML += `<!--<option value="${2023 + i}">${2023 + i}</option>-->`
    }

    tableYearSelect.value = date.getFullYear();
    // modelYearSelect.value = date.getFullYear();
}

function getMaintenanceDetails() {
    var year = document.getElementById("year-for-table").value;
    var houseType = document.getElementById("house-type-for-table").value;
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var maintenanceObjs = JSON.parse(htp.responseText);
            displayDetails(maintenanceObjs);
        }
    };
    htp.open("GET", `http://localhost:8088/getMaintenanceDetails/${year}/${houseType}`, true);
    htp.send();
}

function displayDetails(maintenanceObjs) {
    var table = document.querySelector("#maintenance-table-view");
    table.innerHTML = "";
    if (maintenanceObjs.length === 0) {
        table.innerHTML = `<tr>
<td colspan="4" class="text-center">
<div class="d-flex justify-content-center align-items-center flex-column" style="padding: 100px"><p  >No Maintenance Details Found For selected Year And House Type.</p></div>
</td>
</tr>`;
    }

    for (var index = 0; index < maintenanceObjs.length; index++) {
        var newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `<p>${1 + index}</p>`;
        newTR.insertCell(1).innerHTML = `<a href="#" data-toggle="modal" data-target="#exampleModal-2" onclick="getCurrentMonthMaintenanceDetails(${maintenanceObjs[index].id},'${maintenanceObjs[index].month}','${maintenanceObjs[index].year}')">${maintenanceObjs[index].month}</a>`;
        // style="border-radius: 0px; height: 100px; width:100px"
        newTR.insertCell(2).innerHTML = `${maintenanceObjs[index].year}`;
        newTR.insertCell(3).innerHTML = `<button class="btn btn-outline-info" style="padding: 0.1rem 0.6rem" data-toggle="modal" data-target="#exampleModal-3" onclick="document.getElementById('maintenance-id-edit').value=${maintenanceObjs[index].id}">Edit</button>`;
    }
}

function getMaintenanceDetailsForYear() {
    let tableYearSelect = document.getElementById("year-for-table");
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {
            let availableHouseTypes = JSON.parse(htp.responseText);
            createHouseTypeSelectForModel(availableHouseTypes, tableYearSelect);
        }
    };
    htp.open("GET", `http://localhost:8088/getMaintenanceDetailsForYear/${tableYearSelect.value}`, true);
    htp.send();
}

function createHouseTypeSelectForModel(availableHouseTypes, tableYearSelect) {
    let houseSelect = document.getElementById("maintenance-house-type");
    houseSelect.innerHTML = `<option value="none" selected disabled>Select Type Of House (BHK)</option>`;
    if (availableHouseTypes.length === 0) {
        document.getElementById("maintenance-add-button").style.display = "none"
    } else {
        document.getElementById("maintenance-add-button").style.display = ""
    }
    document.getElementById("maintenance-year").innerHTML = "";
    document.getElementById("maintenance-year").innerHTML = `<option value="${tableYearSelect.value}" selected >${tableYearSelect.value}</option>`;
    for (let i = 0; i < availableHouseTypes.length; i++) {
        let option = document.createElement("option");
        option.innerHTML = `${availableHouseTypes[i]} BHK`
        option.value = `${availableHouseTypes[i]}`
        houseSelect.add(option);
    }
}

function getCurrentMonthMaintenanceDetails(maintenanceId, month, year) {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {
            var maintenanceObjs = JSON.parse(htp.responseText);
            viewChargesForMonths(maintenanceObjs, month, year);
        }
    };
    htp.open("GET", `http://localhost:8088/getMaintenanceDetailsForMonth/${maintenanceId}`, true);
    htp.send();
}

function viewChargesForMonths(maintenanceObjs, month, year) {
    var table = document.querySelector("#maintenance-view-charges");
    let totalCharges = 0
    table.innerHTML = "";
    if (maintenanceObjs.length === 0) {
        table.innerHTML = `<tr>
<td colspan="4" class="text-center">
<div class="d-flex justify-content-center align-items-center flex-column"><p  >No Maintenance Details Found For selected Year.</p></div>
</td>
</tr>`;
    }

    for (var index = 0; index < maintenanceObjs.length; index++) {
        var newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `<p>${1 + index}</p>`;
        newTR.insertCell(1).innerHTML = `${maintenanceObjs[index].maintenanceType}`;
        newTR.insertCell(2).innerHTML = `${maintenanceObjs[index].amount}`;
        totalCharges += parseInt(maintenanceObjs[index].amount);
    }
    document.getElementById("model-view-maintenance-label").innerHTML = `${month} ${year}`
    document.getElementById("total-amount-view-charges").innerHTML = totalCharges;
}

function editMaintenanceCharges() {
    if (validateEditMaintenanceCharges()) {
        let id = document.getElementById("maintenance-id-edit").value;
        let amount = document.getElementById("maintenance-amount-edit").value;
        let type = document.getElementById("maintenance-type-edit").value;
        let htp = new XMLHttpRequest();
        htp.onreadystatechange = function () {
            if (htp.readyState === 4) {
                console.log(htp.responseText);
                emptyEditMaintenanceCharges();
            }
        };
        htp.open("GET", `http://localhost:8088/addMaintenanceCharges/${id}/${type}/${amount}`, true);
        htp.send();
    }
}

function validateAddMaintenanceCharges() {

    let maintenanceHouseType = document.getElementById("maintenance-house-type");
    let maintenanceType = document.getElementById("maintenance-type");
    let maintenanceAmount = document.getElementById("maintenance-amount");
    let validForm = true;
    if (maintenanceHouseType.value === "none") {
        document.querySelector("#maintenanceHouseType1-warning").style.display = "";
        maintenanceHouseType.classList.add("is-invalid");
        maintenanceHouseType.style.backgroundPosition = "center right calc(1.375em + 0.1875rem)";
        maintenanceHouseType.style.border = "1px solid #dc3545";
        maintenanceHouseType.setAttribute("onchange", "validateAddMaintenanceCharges()");
        validForm = false;
    } else {
        document.querySelector("#maintenanceHouseType1-warning").style.display = "none";
        if (maintenanceHouseType.classList.contains("is-invalid")) {
            maintenanceHouseType.classList.remove("is-invalid")
            maintenanceHouseType.classList.add("is-valid")
            maintenanceHouseType.style.backgroundPosition = "center right calc(1.375em + 0.1875rem)";
            maintenanceHouseType.style.border = "1px solid #28a745";
        }
    }

    let amountFormat = /^[0-9]{3,5}$/;

    if (maintenanceAmount.value === "") {
        document.querySelector("#maintenanceAmount1-warning").style.display = "";
        document.querySelector("#maintenanceAmount2-warning").style.display = "none";
        maintenanceAmount.classList.add("is-invalid");
        maintenanceAmount.setAttribute("onkeyup", "validateAddMaintenanceCharges()");
        document.getElementById("amount-box").style.border = "1px solid #dc3545";
        maintenanceAmount.style.border = "none"
        document.getElementById("add-maintenance-charges-button").style.marginTop = "7px";
        validForm = false;
    } else if (!maintenanceAmount.value.match(amountFormat) || parseInt(maintenanceAmount.value) === 0) {
        document.querySelector("#maintenanceAmount1-warning").style.display = "none";
        document.querySelector("#maintenanceAmount2-warning").style.display = "";
        maintenanceAmount.classList.add("is-invalid");
        document.getElementById("amount-box").style.border = "1px solid #dc3545";
        maintenanceAmount.style.border = "none"
        maintenanceAmount.setAttribute("onkeyup", "validateAddMaintenanceCharges()");
        document.getElementById("add-maintenance-charges-button").style.marginTop = "7px";
        validForm = false;
    } else {
        document.querySelector("#maintenanceAmount1-warning").style.display = "none";
        document.querySelector("#maintenanceAmount2-warning").style.display = "none";
        if (maintenanceAmount.classList.contains("is-invalid")) {
            document.getElementById("add-maintenance-charges-button").style.marginTop = "26px";
            maintenanceAmount.style.border = "none"
            maintenanceAmount.classList.remove("is-invalid")
            maintenanceAmount.classList.add("is-valid")
            document.getElementById("amount-box").style.border = "1px solid #28a745";
        }
    }

    if (maintenanceType.value === "") {
        document.querySelector("#maintenanceType1-warning").style.display = "";
        document.querySelector("#maintenanceType2-warning").style.display = "none";
        maintenanceType.classList.add("is-invalid");
        maintenanceType.setAttribute("onkeyup", "validateAddMaintenanceCharges()");
        validForm = false;
    } else if (maintenanceType.value.length < 8) {
        document.querySelector("#maintenanceType1-warning").style.display = "none";
        document.querySelector("#maintenanceType2-warning").style.display = "";
        maintenanceType.classList.add("is-invalid");
        maintenanceType.setAttribute("onkeyup", "validateAddMaintenanceCharges()");
        validForm = false;
    } else {
        document.querySelector("#maintenanceType1-warning").style.display = "none";
        document.querySelector("#maintenanceType2-warning").style.display = "none";
        if (maintenanceType.classList.contains("is-invalid")) {
            maintenanceType.classList.remove("is-invalid")
            maintenanceType.classList.add("is-valid")
        }
    }
    return validForm;
}

function validateAddMaintenanceForm() {
    let maintenanceTypeList = document.getElementsByName("maintenanceType");
    let maintenanceAmountList = document.getElementsByName("maintenanceAmount");
    let validForm = true;

    for (let i = 0; i < maintenanceTypeList.length; i++) {
        if (maintenanceTypeList[i].value === "") {
            document.querySelector(`#maintenanceType1-warning-${i + 1}`).style.display = "";
            document.querySelector(`#maintenanceType2-warning-${i + 1}`).style.display = "none";
            maintenanceTypeList[i].classList.add("is-invalid");
            maintenanceTypeList[i].setAttribute("onkeyup", "validateAddMaintenanceForm()");
            validForm = false;
            break;
        } else if (maintenanceTypeList[i].value.length < 8) {
            document.querySelector(`#maintenanceType1-warning-${i + 1}`).style.display = "none";
            document.querySelector(`#maintenanceType2-warning-${i + 1}`).style.display = "";
            maintenanceTypeList[i].classList.add("is-invalid");
            maintenanceTypeList[i].setAttribute("onkeyup", "validateAddMaintenanceForm()");
            validForm = false;
            break;
        } else {
            document.querySelector(`#maintenanceType1-warning-${i + 1}`).style.display = "none";
            document.querySelector(`#maintenanceType2-warning-${i + 1}`).style.display = "none";
            if (maintenanceTypeList[i].classList.contains("is-invalid")) {
                maintenanceTypeList[i].classList.remove("is-invalid")
                maintenanceTypeList[i].classList.add("is-valid")
            }
        }
    }

    let amountFormat = /^[0-9]{3,5}$/;
    document.getElementById("total-amount").innerHTML = "0"
    for (let i = 0; i < maintenanceAmountList.length && validForm; i++) {
        if (maintenanceAmountList[i].value === "") {
            document.querySelector(`#maintenanceAmount1-warning-${i + 1}`).style.display = "";
            document.querySelector(`#maintenanceAmount2-warning-${i + 1}`).style.display = "none";
            maintenanceAmountList[i].classList.add("is-invalid");
            maintenanceAmountList[i].setAttribute("onkeyup", "validateAddMaintenanceForm()");
            validForm = false;
            break;
        } else if (!maintenanceAmountList[i].value.match(amountFormat) || parseInt(maintenanceAmountList[i].value) === 0) {
            document.querySelector(`#maintenanceAmount1-warning-${i + 1}`).style.display = "none";
            document.querySelector(`#maintenanceAmount2-warning-${i + 1}`).style.display = "";
            maintenanceAmountList[i].classList.add("is-invalid");
            maintenanceAmountList[i].setAttribute("onkeyup", "validateAddMaintenanceForm()");
            document.getElementById("add-maintenance-charges-button").style.marginTop = "7px";
            validForm = false;
            break;
        } else {
            document.querySelector(`#maintenanceAmount1-warning-${i + 1}`).style.display = "none";
            document.querySelector(`#maintenanceAmount2-warning-${i + 1}`).style.display = "none";
            if (maintenanceAmountList[i].classList.contains("is-invalid")) {
                document.getElementById("add-maintenance-charges-button").style.marginTop = "26px";
                maintenanceAmountList[i].classList.remove("is-invalid")
                maintenanceAmountList[i].classList.add("is-valid");
            }
            document.getElementById("total-amount").innerHTML = parseInt(document.getElementById("total-amount").innerHTML) + parseInt(maintenanceAmountList[i].value);
        }
    }
    return validForm;
}

function addMaintenanceDetails() {
    return validateAddMaintenanceForm();
}

function emptyAddMaintenanceForm() {
    document.getElementById("maintenance-add-table").innerHTML = ` <tr>
                                                <td colspan="3" style="text-align: center;padding: 60px 0px 50px 0px">
                                                    No maintenance Added Yet
                                                </td>
                                            </tr>`;
    document.getElementById("maintenance-type").value = "";
    document.getElementById("maintenance-amount").valu = "";
    document.getElementById("maintenance-house-type").value = "none";
    document.getElementById("maintenance-house-type").style.border = "none";
    document.getElementById("maintenance-house-type").classList.remove("is-valid", "is-invalid");
    document.getElementById("maintenanceHouseType1-warning").style.display = "none";
    document.getElementById("maintenanceType1-warning").style.display = "none"
    document.getElementById("maintenanceType2-warning").style.display = "none"
    document.getElementById("maintenanceAmount1-warning").style.display = "none"
    document.getElementById("maintenanceAmount2-warning").style.display = "none"
    document.getElementById("maintenance-type").classList.remove("is-valid", "is-invalid");
    document.getElementById("maintenance-amount").classList.remove("is-valid", "is-invalid");
    document.getElementById("amount-box").classList.add("border");
    document.getElementById("total-amount").innerHTML = "0";
}

function validateEditMaintenanceCharges() {
    let maintenanceEditAmount = document.getElementById("maintenance-amount-edit");
    let maintenanceEditType = document.getElementById("maintenance-type-edit");
    let validForm = true;

    if (maintenanceEditType.value === "") {
        document.querySelector("#maintenanceType1-edit-warning").style.display = "";
        document.querySelector("#maintenanceType2-edit-warning").style.display = "none";
        maintenanceEditType.classList.add("is-invalid");
        maintenanceEditType.setAttribute("onkeyup", "validateEditMaintenanceCharges()");
        validForm = false;
    } else if (maintenanceEditType.value.length < 8) {
        document.querySelector("#maintenanceType1-edit-warning").style.display = "none";
        document.querySelector("#maintenanceType2-edit-warning").style.display = "";
        maintenanceEditType.classList.add("is-invalid");
        maintenanceEditType.setAttribute("onkeyup", "validateEditMaintenanceCharges()");
        validForm = false;
    } else {
        document.querySelector("#maintenanceType1-edit-warning").style.display = "none";
        document.querySelector("#maintenanceType2-edit-warning").style.display = "none";
        if (maintenanceEditType.classList.contains("is-invalid")) {
            maintenanceEditType.classList.remove("is-invalid")
            maintenanceEditType.classList.add("is-valid")
        }
    }
    let amountFormat = /^[0-9]{3,5}$/;
    if (maintenanceEditAmount.value === "") {
        document.querySelector("#maintenanceAmount1-edit-warning").style.display = "";
        document.querySelector("#maintenanceAmount2-edit-warning").style.display = "none";
        maintenanceEditAmount.classList.add("is-invalid");
        maintenanceEditAmount.setAttribute("onkeyup", "validateEditMaintenanceCharges()");
        document.getElementById("amount-box-edit").style.border = "1px solid #dc3545";
        maintenanceEditAmount.style.border = "none"
        validForm = false;
    } else if (!maintenanceEditAmount.value.match(amountFormat) || parseInt(maintenanceEditAmount.value) === 0) {
        document.querySelector("#maintenanceAmount1-edit-warning").style.display = "none";
        document.querySelector("#maintenanceAmount2-edit-warning").style.display = "";
        maintenanceEditAmount.classList.add("is-invalid");
        document.getElementById("amount-box-edit").style.border = "1px solid #dc3545";
        maintenanceEditAmount.style.border = "none"
        maintenanceEditAmount.setAttribute("onkeyup", "validateEditMaintenanceCharges()");
        validForm = false;
    } else {
        document.querySelector("#maintenanceAmount1-edit-warning").style.display = "none";
        document.querySelector("#maintenanceAmount2-edit-warning").style.display = "none";
        if (maintenanceEditAmount.classList.contains("is-invalid")) {
            maintenanceEditAmount.style.border = "none"
            maintenanceEditAmount.classList.remove("is-invalid")
            maintenanceEditAmount.classList.add("is-valid")
            document.getElementById("amount-box-edit").style.border = "1px solid #28a745";
        }
    }
    return validForm;
}

function emptyEditMaintenanceCharges() {
    document.getElementById("edit-maintenance-modal").click();
    document.getElementById("maintenance-amount-edit").value = "";
    document.getElementById("maintenance-type-edit").value = "";
    document.getElementById("maintenance-id-edit").value = "";
    document.getElementById("maintenance-type-edit").classList.remove("is-invalid", "is-valid");
    document.getElementById("maintenance-amount-edit").classList.remove("is-invalid", "is-valid");
    document.getElementById("maintenance-amount-edit").classList.add("border");
    document.getElementById("amount-box-edit").style.border = "none";
    document.querySelector("#maintenanceType1-edit-warning").style.display = "none";
    document.querySelector("#maintenanceType2-edit-warning").style.display = "none";
    document.querySelector("#maintenanceAmount1-edit-warning").style.display = "none";
    document.querySelector("#maintenanceAmount2-edit-warning").style.display = "none";
}