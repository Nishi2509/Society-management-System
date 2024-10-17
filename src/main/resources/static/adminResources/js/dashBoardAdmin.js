function createYearSelection() {
    let date = new Date();
    let tableYearSelect = document.getElementById("das-year");
    let selectLoopCount = (date.getFullYear() - 2023) + 5;
    tableYearSelect.innerHTML = `<option value="none" disabled>Select Maintenance Year</option>`

    for (let i = 0; i <= selectLoopCount; i++) {
        tableYearSelect.innerHTML += `<option value="${2023 + i}">${2023 + i}</option>`
    }
    tableYearSelect.value = date.getFullYear();
}

function createBlockSelect() {
    let block = document.getElementById("das-block");
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {
            let blockList = JSON.parse(htp.responseText);
            console.log(blockList);
            for (let i = 0; i < blockList.length; i++) {
                let option = document.createElement("option");
                option.value = `${blockList[i].id}`
                option.innerHTML = `${blockList[i].blockName}`
                block.add(option);
            }
            getCurrentBlockDetails(block.value)
        }
    };
    htp.open("GET", `http://localhost:8088/getBlockDetails`, true);
    htp.send();
}


function getOwnerPaidAndUnpaid() {
    let year = document.getElementById("das-year").value;
    let month = document.getElementById("das-month").value;
    let block = document.getElementById("das-block").value;

    let container = document.getElementById("container");
    getCurrentBlockDetails(block)
    console.log(block)
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {

            let paidAndUnpaidOwner = JSON.parse(htp.responseText);

            const paid = paidAndUnpaidOwner.paidOwner.length;
            const unpaid = paidAndUnpaidOwner.unpaidOwner.length;


            let data = `<input type="hidden" name="xvalue" value="Paid" />`;
            data = data + `<input type="hidden" name="xvalue" value="Unpaid" />`;
            data = data + `<input type="hidden" name="yvalue" value="${paid}" /> `;
            data = data + `<input type="hidden" name="yvalue" value="${unpaid}" /> `;

            container.innerHTML = data;

            graph();

        }
    };
    htp.open("GET", `http://localhost:8088/getPaidAndUnpaidOwners/${year}/${month}/${block}`, true);
    htp.send();
}

window.addEventListener("load", function () {
    createYearSelection()
    createBlockSelect()
    setTimeout(getOwnerPaidAndUnpaid, 100);
    getDasDetails();
})

function graph() {
    var xvalue = document.getElementsByName("xvalue");
    var xdata = [];
    var yvalue = document.getElementsByName("yvalue");
    var ydata = [];
    for (var i = 0; i < xvalue.length; i++) {
        xdata.push(xvalue[i].value);
        ydata.push(parseFloat(yvalue[i].value));
    }
    Highcharts.chart({
        chart: {
            renderTo: "container",
            type: 'column'
        },
        title: {
            text: 'Owner count based on maintenance status'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: xdata,
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Owner Count'
            }
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Maintenance Status',
            data: ydata,
            color: '#7571f9'
        }]
    });
}

function getCurrentBlockDetails(blockId) {
    console.log(blockId);
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {
            let blockObj = JSON.parse(htp.responseText);
            displayDetails(blockObj);
        }
    };
    htp.open("GET", `http://localhost:8088/getDasBlockDetails/${blockId}`, true);
    htp.send();
}

function displayDetails(blockobj)
{
    console.log(blockobj);
    document.getElementById("total-owners").innerHTML=blockobj.owners;
    document.getElementById("unsold-house").innerHTML=blockobj.unsoldHouses;
    document.getElementById("total-houses").innerHTML=blockobj.houses;
    document.getElementById("two-wheelers").innerHTML=blockobj.twoWheelers;
    document.getElementById("four-wheelers").innerHTML=blockobj.fourWheelers;
}

function getDasDetails()
{
    let htp = new XMLHttpRequest();
    htp.onreadystatechange = function () {
        if (htp.readyState === 4) {
            let dasDetails = JSON.parse(htp.responseText);
            displayDasDetails(dasDetails);
        }
    };
    htp.open("GET", `http://localhost:8088/getDasDetails`, true);
    htp.send();
}
function displayDasDetails(dasDetails){
    console.log(dasDetails);
    document.getElementById("circulars-display").innerHTML=dasDetails.totalCirculars;
    document.getElementById("complains-display").innerHTML=dasDetails.totalComplains;
    document.getElementById("feedbacks-display").innerHTML=dasDetails.totalFeedbacks;
    document.getElementById("twoWheeler-display").innerHTML=dasDetails.totalTwoWheelers;
    document.getElementById("fourWheeler-display").innerHTML=dasDetails.totalFourWheelers;
    document.getElementById("totalVehicles-display").innerHTML=dasDetails.totalVehicles;
}