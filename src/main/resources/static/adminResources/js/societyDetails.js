function enableInputs() {
    document.getElementById("submit").style.display = "";
    document.getElementById("edit").style.display = "none";
    var inputs = document.getElementsByTagName("input");
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].disabled = "";

    }
}

function disabledInputs() {
    document.getElementById("submit").style.display = "";
    document.getElementById("edit").style.display = "none";
    var inputs = document.getElementsByTagName("input");
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].disabled = "true";

    }
}

function checkId() {
    var sId = document.getElementById("s-id").value;
    if (sId == "0") {
        enableInputs();
        document.getElementById("submit").value = "Submit";
    }
}

function validateSocietyForm() {
    let societyName = document.getElementById("societyName");
    let societyAddress = document.getElementById("societyAddress");
    let societyConstruct = document.getElementById("societyConstruct");
    let societyRera = document.getElementById("societyRera");
    let societyContact = document.getElementById("societyContact");
    let societyEmail = document.getElementById("societyEmail");
    let validForm = true;

    if (societyName.value === "") {
        document.querySelector("#name1-warning").style.display = "";
        document.querySelector("#name2-warning").style.display = "none";
        societyName.classList.add("is-invalid");
        societyName.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else if (societyName.value.length < 4) {
        document.querySelector("#name1-warning").style.display = "none";
        document.querySelector("#name2-warning").style.display = "";
        societyName.classList.add("is-invalid");
        societyName.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else {
        document.querySelector("#name1-warning").style.display = "none";
        document.querySelector("#name2-warning").style.display = "none";
        if (societyName.classList.contains("is-invalid")) {
            societyName.classList.remove("is-invalid")
            societyName.classList.add("is-valid")
        }

    }

    if (societyAddress.value === "") {
        document.querySelector("#address1-warning").style.display = "";
        document.querySelector("#address2-warning").style.display = "none";
        societyAddress.classList.add("is-invalid");
        societyAddress.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else if (societyAddress.value.length < 4) {
        document.querySelector("#address1-warning").style.display = "none";
        document.querySelector("#address2-warning").style.display = "";
        societyAddress.classList.add("is-invalid");
        societyAddress.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else {
        document.querySelector("#address1-warning").style.display = "none";
        document.querySelector("#address2-warning").style.display = "none";
        if (societyAddress.classList.contains("is-invalid")) {
            societyAddress.classList.remove("is-invalid")
            societyAddress.classList.add("is-valid")
        }

    }

    if (societyConstruct.value === "") {
        document.querySelector("#construct1-warning").style.display = "";
        document.querySelector("#construct2-warning").style.display = "none";
        societyConstruct.classList.add("is-invalid");
        societyConstruct.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else if (societyConstruct.value.length < 4) {
        document.querySelector("#construct1-warning").style.display = "none";
        document.querySelector("#construct2-warning").style.display = "";
        societyConstruct.classList.add("is-invalid");
        societyConstruct.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else {
        document.querySelector("#construct1-warning").style.display = "none";
        document.querySelector("#construct2-warning").style.display = "none";
        if (societyConstruct.classList.contains("is-invalid")) {
            societyConstruct.classList.remove("is-invalid")
            societyConstruct.classList.add("is-valid")
        }

    }

    if (societyRera.value === "") {
        document.querySelector("#rera1-warning").style.display = "";
        document.querySelector("#rera2-warning").style.display = "none";
        societyRera.classList.add("is-invalid");
        societyRera.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else if (societyRera.value.length < 4) {
        document.querySelector("#rera1-warning").style.display = "none";
        document.querySelector("#rera2-warning").style.display = "";
        societyRera.classList.add("is-invalid");
        societyRera.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else {
        document.querySelector("#rera1-warning").style.display = "none";
        document.querySelector("#rera2-warning").style.display = "none";
        if (societyRera.classList.contains("is-invalid")) {
            societyRera.classList.remove("is-invalid")
            societyRera.classList.add("is-valid")
        }

    }

    let phoneFormat = /^[0-9]{9,10}$/;

    if (societyContact.value === "") {
        document.querySelector("#contact1-warning").style.display = "";
        document.querySelector("#contact2-warning").style.display = "none";
        societyContact.classList.add("is-invalid");
        societyContact.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else if (!societyContact.value.match(phoneFormat)) {
        document.querySelector("#contact1-warning").style.display = "none";
        document.querySelector("#contact1-warning").style.display = "";
        societyContact.classList.add("is-invalid");
        societyContact.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else {
        document.querySelector("#contact1-warning").style.display = "none";
        document.querySelector("#contact2-warning").style.display = "none";
        if (societyContact.classList.contains("is-invalid")) {
            societyContact.classList.remove("is-invalid")
            societyContact.classList.add("is-valid")
        }

    }

    let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    if (societyEmail.value === "") {
        document.querySelector("#email1-warning").style.display = "";
        document.querySelector("#email2-warning").style.display = "none";
        societyEmail.classList.add("is-invalid");
        societyEmail.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else if (!societyEmail.value.match(emailFormat)) {
        document.querySelector("#email1-warning").style.display = "none";
        document.querySelector("#email2-warning").style.display = "";
        societyEmail.classList.add("is-invalid");
        societyEmail.setAttribute("onkeyup", "validateSocietyForm()");
        validForm = false;
    } else {
        document.querySelector("#email1-warning").style.display = "none";
        document.querySelector("#email2-warning").style.display = "none";
        if (societyEmail.classList.contains("is-invalid")) {
            societyEmail.classList.remove("is-invalid")
            societyEmail.classList.add("is-valid")
        }

    }
    return validForm;
}
