<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>User | Maintenance</title>
    <!-- base:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css"/>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css"/>
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/dataTables.bootstrap4.css"/>
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/style.css"/>
    <!-- endinject -->
    <link rel="shortcut icon"
          href="<%=request.getContextPath()%>/adminResources/image/favicon.png"/>
    <style>
        .circle-loader:before {
            border: 10px solid #4b4b4b !important;
            border-top-color: #7571f9 !important;
        }
    </style>
</head>

<body>

<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->

    <jsp:include page="../user/header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="../user/menu.jsp"/>


        <div class="main-panel">
            <div class="content-wrapper">

                <div class="row d-flex align-content-center mb-3"
                >
                    <div class="col-6">
                        <h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-cash-multiple icon-md mr-2 mt-0 " ></i>Maintenance</h3>
                        <nav aria-label="breadcrumb d-flex align-content-center"
                             class="bread">
                            <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                                <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Maintenance
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <div class="m-auto"></div>
                    <div class="col-3">
                        <div class="row ">
                            <div class="col-12 d-flex justify-content-end"><label class="col-form-label"></label></div>
                        </div>
                        <div class="row text-left">
                            <div class="col-12 d-flex justify-content-end">
                                <select id="month" class="form-control text-left" onchange="getMaintenance()">

                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body p-0 border border-0" id="container_content">
                                <div id="bordered-div">
                                    <div class="container-fluid d-flex justify-content-between p-4"
                                         style="background-color: black !important; color: white !important;">
                                        <h1 class="text-left" id="invoice-title"></h1>
                                        <h2 class="text-right "><span id="invoice-heading"></span></h2>
                                    </div>
                                    <div class="container-fluid d-flex justify-content-between">
                                        <div class="col-lg-3 pl-0">
                                            <p class="mt-5 mb-2"><b>Invoice From</b></p>
                                            <p id="socityAddress" style="width: 60%"></p>
                                        </div>
                                        <div class="col-lg-3 pr-0 d-flex flex-column align-items-end">
                                            <p class="mt-5 mb-2 text-right"><b>Invoice to</b></p>
                                            <p class="text-right" style="width: 70%"><span><b
                                                    id="owner-name"></b></span><br>Block-<span
                                                    id="block-name"></span><span id="house-number"></span><br><span
                                                    id="owner-address"></span></p>
                                        </div>
                                    </div>
                                    <div class="container-fluid d-flex justify-content-between">
                                        <div class="col-lg-3 pl-0">
                                            <p class="mb-0 mt-5">Invoice Date : <span id="invoice-date"></span></p>
                                        </div>
                                    </div>
                                    <div class="container-fluid mt-5 d-flex justify-content-center w-100">
                                        <div class="table-responsive w-100" style="height: 250px">

                                            <table class="table" style="">
                                                <thead>
                                                <tr class="bg-dark text-white"
                                                    style="background-color: #030303 !important;">
                                                    <th style="color: #ffffff !important;background-color: #030303 !important;">
                                                        No
                                                    </th>
                                                    <th style="color: #ffffff !important;background-color: #030303 !important;">
                                                        Maintenance Type
                                                    </th>
                                                    <th style="color: #ffffff !important;background-color: #030303 !important;"
                                                        class="text-right">Charges
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody id="maintenance-table-view">
                                                <tr>
                                                    <th style="text-align: center;padding: 100px" colspan="3">No
                                                        maintenance For This Month And Year.
                                                    </th>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="background-image: url('<%=request.getContextPath()%>/adminResources/image/paid_stamp.svg');background-size: contain; background-repeat: no-repeat;height: 150px; width: 150px;position:absolute;right: 20px;bottom: 140px;display: none;"
                                             id="paid-div"></div>
                                        <div style="background-image: url('<%=request.getContextPath()%>/adminResources/image/pending_stamp.svg');background-size: contain; background-repeat: no-repeat;height: 170px; width: 170px;position:absolute;right: 20px;bottom: 140px    ;display: none;    rotate: -31deg;"
                                             id="pending-div"></div>
                                    </div>
                                    <div class="container-fluid mt-5 w-100 "
                                         style="background-color: black !important;color: white;padding: 0.687rem 0.937rem;">
                                        <h4 class="text-right mb-0">Total : &#8377;<span id="amount-total">0</span></h4>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="container-fluid w-100">

                                    <button onclick="printInvoice()" class="btn btn-primary  float-right mt-4 ml-2"><i
                                            class="mdi mdi-printer mr-1"></i>Print
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>


            <!-- partial -->
            <!-- main-panel ends -->
            <!-- page-body-wrapper ends -->
            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </div>
    <!-- container-scroller -->
    <!-- base:js -->
    <script
            src="<%=request.getContextPath()%>/adminResources/js/maintenanceUser.js"></script>
    <script
            src="<%=request.getContextPath()%>/adminResources/js/userOnloadEvents.js"></script>
    <script
            src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script
            src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
    <script
            src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>
    <script
            src="<%=request.getContextPath()%>/adminResources/js/template.js"></script>
    <script
            src="<%=request.getContextPath()%>/adminResources/js/settings.js"></script>
    <script
            src="<%=request.getContextPath()%>/adminResources/js/todolist.js"></script>
    <!-- endinject -->
    <!-- plugin js for this page -->
    <script
            src="<%=request.getContextPath()%>/adminResources/js/jquery.dataTables.js"></script>
    <script
            src="<%=request.getContextPath()%>/adminResources/js/dataTables.bootstrap4.js"></script>
    <!-- End plugin js for this page -->
    <!-- Custom js for this page-->
    <script
            src="<%=request.getContextPath()%>/adminResources/js/data-table.js"></script>
    <!-- End custom js for this page-->
</body>
</html>
