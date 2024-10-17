function getDateForFrom() {
    let today = new Date();
    document.getElementById("circular-from-date").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
}

function getDateForTo() {
    let today = new Date();
    document.getElementById("circular-to-date").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
}

function getDate() {
    getDateForFrom()
    getDateForTo()
}

function getCircular(circularId) {
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

function openCircularEdit(complainObj) {
    document.getElementById("circular-id").value = complainObj.id;
    document.getElementById("circular-category").value = complainObj.category;
    document.getElementById("circular-description").value = complainObj.circularDescription;
    document.getElementById("circular-from-date").value = complainObj.circularFromDate;
    document.getElementById("circular-to-date").value = complainObj.circularFromTo;
    document.getElementById("ModalLabelEdit").innerHTML = "Edit Circular"
    document.getElementById("submit").innerHTML = "Update"
    document.getElementById("checkbox-label").innerHTML = "Notify Owner On Edited Circular"
    document.getElementById("circular-form").setAttribute("onsubmit", "return validateEditCircularForm();")
    console.log(complainObj);
}

function emptyCircularForm() {
    document.getElementById("circular-id").value = 0;
    document.getElementById("circular-category").value = "none"
    document.getElementById("circular-description").value = "";
    document.getElementById("circular-from-date").value = "";
    document.getElementById("circular-to-date").value = "";
    document.getElementById("ModalLabelEdit").innerHTML = "Add Circular"
    document.getElementById("submit").innerHTML = "Submit"
    document.getElementById("checkbox-label").innerHTML = "Notify Owner On Adding Of New Circular"
    document.getElementById("circular-form").setAttribute("onsubmit", "return validateAddCircularForm();")
}

function validateAddCircularForm() {
    let circularCategory = document.getElementById("circular-category");
    let circularDescription = document.getElementById("circular-description");
    let circularFrom = document.getElementById("circular-from-date");
    let circularTo = document.getElementById("circular-to-date");
    let circularFile = document.getElementById("circularFileAttachments");
    let circularLabelBox = document.getElementById("circularFileAttachmentsLabelBox");
    let validForm = true;

    if (circularCategory.value === "none") {
        document.querySelector("#circularCategory1-warning").style.display = "";
        circularCategory.classList.add("is-invalid");
        circularCategory.style.backgroundPosition = "center right calc(1.375em + 0.1875rem)";
        circularCategory.style.border = "1px solid #dc3545";
        circularCategory.setAttribute("onchange", "validateAddCircularForm()");
        validForm = false;
    } else {
        document.querySelector("#circularCategory1-warning").style.display = "none";
        if (circularCategory.classList.contains("is-invalid")) {
            circularCategory.classList.remove("is-invalid")
            circularCategory.classList.add("is-valid")
            circularCategory.style.backgroundPosition = "center right calc(1.375em + 0.1875rem)";
            circularCategory.style.border = "1px solid #28a745";
        }
    }

    let fromDate = new Date(circularFrom.value);
    let toDate = new Date(circularTo.value);
    let today = new Date();
    let currentDate = new Date(today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2))

    if (circularFrom.value === "") {
        document.querySelector("#fromDate1-warning").style.display = "";
        document.querySelector("#fromDate2-warning").style.display = "none";
        circularFrom.classList.add("is-invalid");
        circularFrom.style.backgroundPosition = "center right calc(0.375em + 0.1875rem)";
        circularFrom.style.border = "1px solid #dc3545";
        circularFrom.setAttribute("onChange", "validateAddCircularForm()");
        validForm = false;
    } else if (fromDate > toDate || fromDate < currentDate) {
        document.querySelector("#fromDate1-warning").style.display = "none";
        document.querySelector("#fromDate2-warning").style.display = "";
        circularFrom.classList.add("is-invalid");
        circularFrom.style.backgroundPosition = "center right calc(0.375em + 0.1875rem)";
        circularFrom.style.border = "1px solid #dc3545";
        circularFrom.setAttribute("onChange", "validateAddCircularForm()");
        validForm = false;
    } else {
        document.querySelector("#fromDate1-warning").style.display = "none";
        document.querySelector("#fromDate2-warning").style.display = "none";
        if (circularFrom.classList.contains("is-invalid")) {
            circularFrom.classList.remove("is-invalid")
            circularFrom.classList.add("is-valid");
            circularFrom.style.border = "1px solid #28a745";
        }
    }
    if (circularTo.value === "") {
        document.querySelector("#toDate1-warning").style.display = "";
        document.querySelector("#toDate2-warning").style.display = "none";
        circularTo.classList.add("is-invalid");
        circularTo.style.backgroundPosition = "center right calc(0.375em + 0.1875rem)";
        circularTo.style.border = "1px solid #dc3545";
        circularTo.setAttribute("onChange", "validateAddCircularForm()");
        validForm = false;
    } else if (fromDate > toDate || toDate < currentDate) {
        document.querySelector("#toDate1-warning").style.display = "none";
        document.querySelector("#toDate2-warning").style.display = "";
        circularTo.classList.add("is-invalid");
        circularTo.style.backgroundPosition = "center right calc(0.375em + 0.1875rem)";
        circularTo.style.border = "1px solid #dc3545";
        circularTo.setAttribute("onChange", "validateAddCircularForm()");
        validForm = false;
    } else {
        document.querySelector("#toDate1-warning").style.display = "none";
        document.querySelector("#toDate2-warning").style.display = "none";
        if (circularTo.classList.contains("is-invalid")) {
            circularTo.classList.remove("is-invalid")
            circularTo.classList.add("is-valid")
            circularTo.style.border = "1px solid #28a745";
        }
    }

    if (circularDescription.value === "") {
        document.querySelector("#description1-warning").style.display = "";
        document.querySelector("#description2-warning").style.display = "none";
        circularDescription.classList.add("is-invalid");
        circularDescription.setAttribute("onkeyup", "validateAddCircularForm()");
        validForm = false;
    } else if (circularDescription.value.length < 4) {
        document.querySelector("#description1-warning").style.display = "none";
        document.querySelector("#description2-warning").style.display = "";
        circularDescription.classList.add("is-invalid");
        circularDescription.setAttribute("onkeyup", "validateAddCircularForm()");
        validForm = false;
    } else {
        document.querySelector("#description1-warning").style.display = "none";
        document.querySelector("#description2-warning").style.display = "none";
        if (circularDescription.classList.contains("is-invalid")) {
            circularDescription.classList.remove("is-invalid")
            circularDescription.classList.add("is-valid")
        }

    }

    if (circularFile.value === "") {
        document.querySelector("#file1-warning").style.display = "";
        circularLabelBox.classList.add("is-invalid");
        validForm = false;
    } else {
        document.querySelector("#file1-warning").style.display = "none";
        if (circularLabelBox.classList.contains("is-invalid")) {
            circularLabelBox.classList.remove("is-invalid")
            circularLabelBox.classList.add("is-valid")
        }
    }
    return validForm;
}

function validateEditCircularForm() {
    let circularCategory = document.getElementById("circular-category");
    let circularDescription = document.getElementById("circular-description");
    let circularFrom = document.getElementById("circular-from-date");
    let circularTo = document.getElementById("circular-to-date");
    let validForm = true;

    if (circularCategory.value === "none") {
        document.querySelector("#circularCategory1-warning").style.display = "";
        circularCategory.classList.add("is-invalid");
        circularCategory.style.backgroundPosition = "center right calc(1.375em + 0.1875rem)";
        circularCategory.style.border = "1px solid #dc3545";
        circularCategory.setAttribute("onchange", "validateEditCircularForm()");
        validForm = false;
    } else {
        document.querySelector("#circularCategory1-warning").style.display = "none";
        if (circularCategory.classList.contains("is-invalid")) {
            circularCategory.classList.remove("is-invalid")
            circularCategory.classList.add("is-valid")
            circularCategory.style.backgroundPosition = "center right calc(1.375em + 0.1875rem)";
            circularCategory.style.border = "1px solid #28a745";
        }
    }

    let fromDate = new Date(circularFrom.value);
    let toDate = new Date(circularTo.value);
    let today = new Date();
    let currentDate = new Date(today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2))

    if (circularFrom.value === "") {
        document.querySelector("#fromDate1-warning").style.display = "";
        document.querySelector("#fromDate2-warning").style.display = "none";
        circularFrom.classList.add("is-invalid");
        circularFrom.style.backgroundPosition = "center right calc(0.375em + 0.1875rem)";
        circularFrom.style.border = "1px solid #dc3545";
        circularFrom.setAttribute("onChange", "validateEditCircularForm()");
        validForm = false;
    } else if (fromDate > toDate || fromDate < currentDate) {
        document.querySelector("#fromDate1-warning").style.display = "none";
        document.querySelector("#fromDate2-warning").style.display = "";
        circularFrom.classList.add("is-invalid");
        circularFrom.style.backgroundPosition = "center right calc(0.375em + 0.1875rem)";
        circularFrom.style.border = "1px solid #dc3545";
        circularFrom.setAttribute("onChange", "validateEditCircularForm()");
        validForm = false;
    } else {
        document.querySelector("#fromDate1-warning").style.display = "none";
        document.querySelector("#fromDate2-warning").style.display = "none";
        if (circularFrom.classList.contains("is-invalid")) {
            circularFrom.classList.remove("is-invalid")
            circularFrom.classList.add("is-valid");
            circularFrom.style.border = "1px solid #28a745";
        }
    }

    if (circularTo.value === "") {
        document.querySelector("#toDate1-warning").style.display = "";
        document.querySelector("#toDate2-warning").style.display = "none";
        circularTo.classList.add("is-invalid");
        circularTo.style.backgroundPosition = "center right calc(0.375em + 0.1875rem)";
        circularTo.style.border = "1px solid #dc3545";
        circularTo.setAttribute("onChange", "validateEditCircularForm()");
        validForm = false;
    } else if (fromDate > toDate) {
        document.querySelector("#toDate1-warning").style.display = "none";
        document.querySelector("#toDate2-warning").style.display = "";
        circularTo.classList.add("is-invalid");
        circularTo.style.backgroundPosition = "center right calc(0.375em + 0.1875rem)";
        circularTo.style.border = "1px solid #dc3545";
        circularTo.setAttribute("onChange", "validateEditCircularForm()");
        validForm = false;
    } else {
        document.querySelector("#toDate1-warning").style.display = "none";
        document.querySelector("#toDate2-warning").style.display = "none";
        if (circularTo.classList.contains("is-invalid")) {
            circularTo.classList.remove("is-invalid")
            circularTo.classList.add("is-valid")
            circularTo.style.border = "1px solid #28a745";
        }
    }

    if (circularDescription.value === "") {
        document.querySelector("#description1-warning").style.display = "";
        document.querySelector("#description2-warning").style.display = "none";
        circularDescription.classList.add("is-invalid");
        circularDescription.setAttribute("onkeyup", "validateEditCircularForm()");
        validForm = false;
    } else if (circularDescription.value.length < 4) {
        document.querySelector("#description1-warning").style.display = "none";
        document.querySelector("#description2-warning").style.display = "";
        circularDescription.classList.add("is-invalid");
        circularDescription.setAttribute("onkeyup", "validateEditCircularForm()");
        validForm = false;
    } else {
        document.querySelector("#description1-warning").style.display = "none";
        document.querySelector("#description2-warning").style.display = "none";
        if (circularDescription.classList.contains("is-invalid")) {
            circularDescription.classList.remove("is-invalid")
            circularDescription.classList.add("is-valid")
        }

    }
    return validForm;
}
