var date = new Date();

function printInvoice() {
    console.log("hello")

    console.log();
    var restore = document.body.innerHTML;
    document.getElementById("bordered-div").style.border = "0.25px solid #cdd4e0 ";
    document.getElementById("bordered-div").style.margin = "0px 20px 100px 0px";
    document.getElementById("bordered-div").style.padding = "20px 20px 20px 20px";
    document.getElementById("paid-div").style.top = "540px";
    document.getElementById("paid-div").style.right = "25px";
    document.getElementById("pending-div").style.top = "540px";
    document.getElementById("pending-div").style.right = "25px";
    var printable = document.getElementById("container_content").innerHTML;
    var date = new Date();
    document.getElementsByTagName("title")[0].innerHTML = `Maintenance ${date.getFullYear()}`
    document.body.innerHTML = printable
    window.print();
    document.getElementsByTagName("title")[0].innerHTML = `User | Maintenance`;
    document.body.innerHTML = restore;

}


function getMaintenance() {
    let month = document.getElementById("month").value;
    document.getElementById("invoice-heading").innerHTML = `${month} ${date.getFullYear()}`
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var maintenanceChargesObjs = JSON.parse(htp.responseText);
            printMaintenanceTable(maintenanceChargesObjs);
        }
    };
    htp.open("GET", `http://localhost:8088/user/getMaintenance/${month}`, true);
    htp.send();
}

function printMaintenanceTable(maintenanceList) {
    maintenanceChargesObjs = maintenanceList[1];
    var table = document.querySelector("#maintenance-table-view");
    table.innerHTML = "";
    if (maintenanceChargesObjs.length === 0) {
        table.innerHTML = `<tr>
<td colspan="4" class="text-center">
<div class="d-flex justify-content-center align-items-center flex-column" style="padding: 100px"><p  >No Maintenance Details Found For selected Year And House Type.</p></div>
</td>
</tr>`;
    }
    document.getElementById("amount-total").innerHTML = '0';
    for (var index = 0; index < maintenanceChargesObjs.length; index++) {
        var newTR = table.insertRow(-1);
        newTR.classList.add("text-right")
        newTR.style.height = "0px"
        let cell1 = newTR.insertCell(0);
        cell1.classList.add("text-left");
        cell1.style.height = "0px"
        cell1.innerHTML = `${1 + index}`;
        let cell2 = newTR.insertCell(1);
        cell2.classList.add("text-left");
        cell2.style.height = "0px"
        cell2.innerHTML = `${maintenanceChargesObjs[index].maintenanceType}`
        let cell3 = newTR.insertCell(2);
        cell3.innerHTML = `&#8377;${maintenanceChargesObjs[index].amount}`;
        cell3.style.height = "0px"
        document.getElementById("amount-total").innerHTML = parseInt(document.getElementById("amount-total").innerHTML) + parseInt(maintenanceChargesObjs[index].amount)
    }
    console.log(maintenanceList[2])

    if (maintenanceList[2].maintenanceStatus===true) {
        document.getElementById("paid-div").style.display = "";
        document.getElementById("pending-div").style.display = "none";
    }else{
        document.getElementById("paid-div").style.display = "none";
        document.getElementById("pending-div").style.display = "";
    }
}

function getDetails() {
    let date = new Date();
    document.getElementById("month").innerHTML = ` <option value="January">January ${date.getFullYear()}</option>
                                    <option value="February">February ${date.getFullYear()}</option>
                                    <option value="March">March ${date.getFullYear()}</option>
                                    <option value="April">April ${date.getFullYear()}</option>
                                    <option value="May">May ${date.getFullYear()}</option>
                                    <option value="June">June ${date.getFullYear()}</option>
                                    <option value="July">July ${date.getFullYear()}</option>
                                    <option value="August">August ${date.getFullYear()}</option>
                                    <option value="September">September ${date.getFullYear()}</option>
                                    <option value="October">October ${date.getFullYear()}</option>
                                    <option value="November">November ${date.getFullYear()}</option>
                                    <option value="December">December ${date.getFullYear()}</option>`
    var htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState == 4) {
            var ownerObj = JSON.parse(htp.responseText);
            printDetails(ownerObj)
        }
    };
    htp.open("GET", "http://localhost:8088/user/getCurrentOwner", true);
    htp.send();
}

function printDetails(ownerObj) {
    console.log(ownerObj);
    let owner = ownerObj[0];
    let society = ownerObj[1];
    document.getElementById("socityAddress").innerHTML = `<b>${society.societyName}</b>
<br>${society.socityAddress}`
    document.getElementById("owner-name").innerHTML = `${owner.ownerName}`
    document.getElementById("house-number").innerHTML = `/${owner.houseNo}`
    document.getElementById("block-name").innerHTML = `${owner.blockVo.blockName}`
    document.getElementById("owner-address").innerHTML = `${society.societyName}<br>${society.socityAddress}`
    document.getElementById("invoice-heading").innerHTML = `${owner.blockVo.blockName}/${owner.houseNo}`;
    var date = new Date();
    document.getElementById("invoice-date").innerHTML = `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`
    document.getElementById("invoice-title").innerHTML = `${society.societyName}`
    var monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    document.getElementById("month").value = monthList[date.getMonth()];
    getMaintenance();
}

window.addEventListener("load", getDetails);