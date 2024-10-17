let tableIndex = 0;

async function addMemberToTable() {
    let validationForAddingMembers = await validatOnAddMemberToTable()
    if (validationForAddingMembers) {
        const memberName = document.getElementById("member-form-name").value;
        const memberPhone = document.getElementById("member-form-phone").value;
        const memberEmail = document.getElementById("member-form-email").value;
        const table = document.querySelector("#member-table");
        if (tableIndex === 0) table.innerHTML = "";
        const newTR = table.insertRow(-1);
        newTR.insertCell(0).innerHTML = `<p>${tableIndex + 1}</p>`;
        newTR.insertCell(1).innerHTML = `<input class="form-control edit${tableIndex}" name="memberName" value="${memberName}">
                                             <span id="member-name-table-waring-1-${tableIndex}" style="color: #dc3545;font-size:12px;display: none">Please Enter Member Name !</span>
                             <span id="member-name-table-waring-2-${tableIndex}" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Member Name!</span>
                            `;
        newTR.insertCell(2).innerHTML = `<input class="form-control edit${tableIndex}" name="memberPhone" value="${memberPhone}">
                                            <span id="member-phone-table-waring-1-${tableIndex}" style="color: #dc3545;font-size:12px;display: none">Please Enter Member Phone no !</span>
                                 <span id="member-phone-table-waring-2-${tableIndex}" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Member Phone no !</span>
                              `;
        newTR.insertCell(3).innerHTML = `<input class="form-control edit${tableIndex} used-email" name="memberEmail" value="${memberEmail}">
                                         <span id="member-email-table-waring-1-${tableIndex}" style="color: #dc3545;font-size:12px;display: none">Please Enter Member Email !</span>
                                        <span id="member-email-table-waring-2-${tableIndex}" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Email Address !</span>
                                        <span id="member-email-table-waring-3-${tableIndex}" style="color: #dc3545;font-size:12px;display: none">Email Entered is already in use !</span>
                                 `;
        newTR.insertCell(4).innerHTML = `<input  name="memberFile" type="file" style="font-size:15px"><br>
                                         <span id="member-file-table-waring-1-${tableIndex}" style="color: #dc3545;font-size:12px;display:none">Please Select A File For Profile Image !</span>`;
        newTR.insertCell(5).innerHTML = `<button type="button" class="btn btn-outline-danger" id="edit-button${tableIndex}" onclick="deleteMember(this)" style="padding:0.1rem 0.6rem;">Delete</button>`;
        tableIndex++;
        emptyAddForm()
    }
}

function deleteMember(x) {
    const table = document.querySelector("#member-table");
    let row = x.parentNode.parentNode;
    let emailCol = row.childNodes;
    table.deleteRow(row.rowIndex - 1);
    updateRowCount(table);
    tableIndex--;
    if (tableIndex === 0) {
        document.querySelector("#member-table").innerHTML = `<tr><td colspan="6"><div style="display: flex;justify-content:center; align-items: center; padding: 5rem 0rem;"><p> Add Memebers</p></div></td></tr>`;
    }
}

function updateRowCount(table) {
    var rowcountAfterDelete = table.rows.length;
    for (var i = 0; i < rowcountAfterDelete; i++) {
        table.rows[i].childNodes[0].childNodes[0].innerHTML = i + 1;
    }
}

function editMember(memberId) {
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            let membersObj = JSON.parse(htp.responseText);
            changeEditMemberForm(membersObj);
        }
    };
    htp.open("GET", `http://localhost:8088/user/getMembersById/${memberId}`, true);
    htp.send();
}

function changeEditMemberForm(memberObj) {
    document.getElementById("member-id").value = memberObj.id;
    document.getElementById("member-name").value = memberObj.memberName;
    document.getElementById("member-phone").value = memberObj.memberPhoneNo;
    document.getElementById("member-email").value = memberObj.memberEmail;

}

async function validatOnAddMemberToTable() {
    const memberName = document.getElementById("member-form-name");
    const memberPhone = document.getElementById("member-form-phone");
    const memberEmail = document.getElementById("member-form-email");
    let memberName1Warning = document.getElementById("memberName1-warning");
    let memberName2Warning = document.getElementById("memberName2-warning");
    let memberPhone1Warning = document.getElementById("memberPhone1-warning");
    let memberPhone2Warning = document.getElementById("memberPhone2-warning")
    let memberEmail1Warning = document.getElementById("memberEmail1-warning")
    let memberEmail2Warning = document.getElementById("memberEmail2-warning");
    let memberEmail3Warning = document.getElementById("memberEmail3-warning");
    let validForm = true;

    if (memberName.value === "") {
        memberName1Warning.style.display = "";
        memberName2Warning.style.display = "none";
        memberName.classList.add("is-invalid");
        memberName.setAttribute("onkeyup", "validatOnAddMemberToTable()");
        validForm = false;
    } else if (memberName.value.length < 3) {
        memberName1Warning.style.display = "none";
        memberName2Warning.style.display = "";
        memberName.classList.add("is-invalid");
        memberName.setAttribute("onkeyup", "validatOnAddMemberToTable()");
        validForm = false;
    } else {
        memberName1Warning.style.display = "none";
        memberName2Warning.style.display = "none";
        if (memberName.classList.contains("is-invalid")) {
            memberName.classList.add("is-valid");
            memberName.classList.remove("is-invalid");
        }
    }

    const phoneFormat = /^[0-9]{10}$/;

    if (memberPhone.value === "") {
        memberPhone1Warning.style.display = "";
        memberPhone2Warning.style.display = "none";
        memberPhone.classList.add("is-invalid");
        memberPhone.setAttribute("onkeyup", "validatOnAddMemberToTable()");
        validForm = false;
    } else if (!memberPhone.value.match(phoneFormat)) {
        memberPhone1Warning.style.display = "none";
        memberPhone2Warning.style.display = "";
        memberPhone.classList.add("is-invalid");
        memberPhone.setAttribute("onkeyup", "validatOnAddMemberToTable()");
        validForm = false;
    } else {
        memberPhone1Warning.style.display = "none";
        memberPhone2Warning.style.display = "none";
        if (memberPhone.classList.contains("is-invalid")) {
            memberPhone.classList.add("is-valid");
            memberPhone.classList.remove("is-invalid");
        }
    }

    let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    if (memberEmail.value === "") {
        memberEmail1Warning.style.display = "";
        memberEmail2Warning.style.display = "none";
        memberEmail3Warning.style.display = "none";
        memberEmail.classList.add("is-invalid");
        memberEmail.setAttribute("onkeyup", "validatOnAddMemberToTable()");
        validForm = false;
    } else if (!memberEmail.value.match(emailFormat)) {
        memberEmail1Warning.style.display = "none";
        memberEmail2Warning.style.display = "";
        memberEmail3Warning.style.display = "none";
        memberEmail.classList.add("is-invalid");
        memberEmail.setAttribute("onkeyup", "validatOnAddMemberToTable()");
        validForm = false;
    } else {
        let response = await checkForDuplicateEmail(memberEmail.value);
        if (response.availablity && await checkForRepeatEmail(response.email)) {
            memberEmail2Warning.style.display = "none";
            memberEmail3Warning.style.display = "none";
            if (memberEmail.classList.contains("is-invalid")) {
                memberEmail1Warning.style.display = "none";
                memberEmail.classList.add("is-valid");
                memberEmail.classList.remove("is-invalid");
            }
        } else {
            memberEmail1Warning.style.display = "none";
            memberEmail2Warning.style.display = "none";
            memberEmail3Warning.style.display = "";
            memberEmail.classList.add("is-invalid");
            memberEmail.setAttribute("onkeyup", "validatOnAddMemberToTable()");
            validForm = false;
        }
    }
    return validForm;
}

async function checkForDuplicateEmail(email) {
    let response = await fetch("checkForDuplicateMail?email=" + email);
    let jsonResponse = await response.json();
    return jsonResponse;
}

async function checkForRepeatEmail(email) {
    let emailInputList = document.getElementsByClassName("used-email");
    let count = 0;
    for (let index = 0; index < emailInputList.length; index++) {
        if (emailInputList[index].value === email) {
            count++;
        }
        if (count == 2) {
            return false;
        }
    }
    return true;
}

async function confirmEmail(email) {
    let response = await checkForDuplicateEmail(email);
    return response;
}



function emptyAddMemberForm() {
    document.querySelector("#member-table").innerHTML = `<tr><td colspan="6"><div style="display: flex;justify-content:center; align-items: center; padding: 5rem 0rem;"><p> Add Memebers</p></div></td></tr>`;
    emptyAddForm();
    tableIndex = 0;
}

function emptyAddForm() {
    const memberPhone = document.getElementById("member-form-phone");
    const memberEmail = document.getElementById("member-form-email");
    const memberName = document.getElementById("member-form-name");
    memberName.value = "";
    memberPhone.value = "";
    memberEmail.value = "";
    memberName.classList.remove("is-invalid");
    memberName.classList.remove("is-valid");
    memberEmail.classList.remove("is-invalid");
    memberEmail.classList.remove("is-valid");
    memberPhone.classList.remove("is-invalid");
    memberPhone.classList.remove("is-valid");
    memberName.setAttribute("onkeyup", "");
    memberEmail.setAttribute("onkeyup", "");
    memberPhone.setAttribute("onkeyup", "");
    document.getElementById("memberName1-warning").style.display = "none";
    document.getElementById("memberName2-warning").style.display = "none";
    document.getElementById("memberPhone1-warning").style.display = "none";
    document.getElementById("memberPhone2-warning").style.display = "none"
    document.getElementById("memberEmail1-warning").style.display = "none"
    document.getElementById("memberEmail2-warning").style.display = "none";
    document.getElementById("memberEmail3-warning").style.display = "none";
}

async function checkMemberDetialsInTable() {
    let validForm = true;

    let numberOfRows = document.querySelector("#member-table").childNodes;
    for (let index = 0; index < numberOfRows.length; index++) {
        let memberName = numberOfRows[index].childNodes[1].childNodes[0];
        let memberPhone = numberOfRows[index].childNodes[2].childNodes[0];
        let memberEmail = numberOfRows[index].childNodes[3].childNodes[0];
        let memberFile = numberOfRows[index].childNodes[4].childNodes[0];

        if (memberName.value === "") {
            document.getElementById(`member-name-table-waring-1-${index}`).style.display = "";
            document.getElementById(`member-name-table-waring-2-${index}`).style.display = "none";
            memberName.classList.add("is-invalid");
            memberName.setAttribute("onkeyup", "checkMemberDetialsInTable()");
            validForm = false;
        } else if (memberName.value.length < 3) {
            document.getElementById(`member-name-table-waring-1-${index}`).style.display = "none";
            document.getElementById(`member-name-table-waring-2-${index}`).style.display = "";
            memberName.classList.add("is-invalid");
            memberName.setAttribute("onkeyup", "checkMemberDetialsInTable()");
            validForm = false;
        } else {
            document.getElementById(`member-name-table-waring-1-${index}`).style.display = "none";
            document.getElementById(`member-name-table-waring-2-${index}`).style.display = "none";
            if (memberName.classList.contains("is-invalid")) {
                memberName.classList.add("is-valid");
                memberName.classList.remove("is-invalid");
            }
        }

        const phoneFormat = /^[0-9]{10}$/;

        if (memberPhone.value === "") {
            document.getElementById(`member-phone-table-waring-1-${index}`).style.display = "";
            document.getElementById(`member-phone-table-waring-2-${index}`).style.display = "none";
            memberPhone.classList.add("is-invalid");
            memberPhone.setAttribute("onkeyup", "checkMemberDetialsInTable()");
            validForm = false;
        } else if (!memberPhone.value.match(phoneFormat)) {
            document.getElementById(`member-phone-table-waring-1-${index}`).style.display = "none";
            document.getElementById(`member-phone-table-waring-2-${index}`).style.display = "";
            memberPhone.classList.add("is-invalid");
            memberPhone.setAttribute("onkeyup", "checkMemberDetialsInTable()");
            validForm = false;
        } else {
            document.getElementById(`member-phone-table-waring-1-${index}`).style.display = "none";
            document.getElementById(`member-phone-table-waring-2-${index}`).style.display = "none";
            if (memberPhone.classList.contains("is-invalid")) {
                memberPhone.classList.add("is-valid");
                memberPhone.classList.remove("is-invalid");
            }
        }

        let emailFormat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        if (memberEmail.value === "") {
            document.getElementById(`member-email-table-waring-1-${index}`).style.display = "";
            document.getElementById(`member-email-table-waring-2-${index}`).style.display = "none";
            document.getElementById(`member-email-table-waring-3-${index}`).style.display = "none";
            memberEmail.classList.add("is-invalid");
            memberEmail.setAttribute("onkeyup", "checkMemberDetialsInTable()");
            validForm = false;
        } else if (!memberEmail.value.match(emailFormat)) {
            document.getElementById(`member-email-table-waring-1-${index}`).style.display = "none";
            document.getElementById(`member-email-table-waring-2-${index}`).style.display = "";
            document.getElementById(`member-email-table-waring-3-${index}`).style.display = "none";
            memberEmail.classList.add("is-invalid");
            memberEmail.setAttribute("onkeyup", "checkMemberDetialsInTable()");
            validForm = false;
        } else {
            let response = await confirmEmail(memberEmail.value);
            if (response.availablity && await checkForRepeatEmail(response.email)) {
                document.getElementById(`member-email-table-waring-1-${index}`).style.display = "none";
                document.getElementById(`member-email-table-waring-2-${index}`).style.display = "none";
                document.getElementById(`member-email-table-waring-3-${index}`).style.display = "none";
                if (memberEmail.classList.contains("is-invalid")) {
                    memberEmail.classList.add("is-valid");
                    memberEmail.classList.remove("is-invalid");
                }
            } else {
                document.getElementById(`member-email-table-waring-1-${index}`).style.display = "none";
                document.getElementById(`member-email-table-waring-2-${index}`).style.display = "none";
                document.getElementById(`member-email-table-waring-3-${index}`).style.display = "";
                memberEmail.classList.add("is-invalid");
                memberEmail.setAttribute("onkeyup", "checkMemberDetialsInTable()");
                validForm = false;
            }
        }


        if (memberFile.value === "") {
            document.getElementById(`member-file-table-waring-1-${index}`).style.display = "";
            memberFile.style.padding = "1px";
            memberFile.style.border = "1px solid red";
            memberFile.setAttribute("onchange", "checkMemberDetialsInTable()");
            validForm = false;
        } else {
            document.getElementById(`member-file-table-waring-1-${index}`).style.display = "none";
            memberFile.style.padding = "0px";
            memberFile.style.border = "none";
        }
    }
    console.log(validForm);
}