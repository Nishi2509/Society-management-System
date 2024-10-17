<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>User | Vehicles</title>
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

<body onload="getOwnerVehicles()">

<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->

    <jsp:include page="../user/header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="../user/menu.jsp"/>


        <%--        Member Add Vehicle Model Start--%>

        <div class="modal fade" id="exampleModal-add-vehicles" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabelEdit">Add Vehicle</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyVehicleForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="saveVehicle" method="post"
                              enctype="multipart/form-data">
                            <div class=" row mb-2">
                                <div class="col-lg-12 d-flex justify-content-between">
                                    <label for="vehicle-type" class="col-form-label mb-1">Vehicle
                                        Type : </label> <label for="vehicle-type" id="vehicle-type-warning"
                                                               class="col-form-label mb-1 text-right text-danger"
                                                               style="font-size: 10px; display: none;"></label>
                                </div>
                                <div class="col-lg-12">
                                    <input type="hidden" name="vehicleId" id="vehicle-id">
                                    <select type="text" class="form-control" id="vehicle-type"
                                            placeholder="Type Complain Subject" name="vehicleType">
                                        <option value="-" selected disabled>Select Vehicle
                                            Type
                                        </option>
                                        <option value="Two Wheeler">Two Wheeler</option>
                                        <option value="Four Wheeler">Four Wheeler</option>
                                    </select>

                                </div>
                            </div>
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="vehicle-number-plate" class="col-form-label mb-1">Number
                                        Plate: </label> <input type="text" class="form-control"
                                                               placeholder="Type Vehicle Number Plate"
                                                               id="vehicle-number-plate" name="vehicleNumberPlate"/>
                                </div>
                            </div>
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="vehicle-rc-number" class="col-form-label mb-1">RC
                                        Number: </label> <input type="text" class="form-control"
                                                                placeholder="Type Vehicle Rc Number"
                                                                id="vehicle-rc-number"
                                                                name="vehicleRcNumber"/>
                                </div>
                            </div>
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="vehicle-photo" class="col-form-label mb-1">Vehicle
                                        Photo: </label> <input type="file" class="form-control"
                                                               placeholder="Type Vehicle Rc Number" id="vehicle-photo"
                                                               name="vehicleImageFile"/>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <button type="button" class="btn btn-light" data-dismiss="modal"
                                onclick="emptyVehicleForm()">Close
                        </button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <%--     Add Vehicle Model End--%>

        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-6"><h3 class="main-title d-flex align-items-center"><i
                            class="mdi mdi-car icon-md mr-2 mt-0 "></i>Vehicles</h3>
                        <nav aria-label="breadcrumb d-flex align-content-center"
                             class="bread">
                            <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                                <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Vehicles
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-6 d-flex justify-content-end"
                         style="margin-bottom: 20px">

                        <button type="button" class="btn btn-primary btn-sm"
                                id="vehicle-add-button" data-toggle="modal"
                                data-target="#exampleModal-add-vehicles"
                                style="padding: 0.282rem 1rem !important; height: 2.55rem">Add Vehicle
                        </button>
                    </div>
                </div>
                <div class="card border border-0">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-12 ">
                                        <h4>Two Wheeler</h4>
                                    </div>
                                    <div class="col-12">
                                        <div class="row" id="two-wheeler-v"></div>
                                    </div>
<%--                                    <div class="col-12">--%>
<%--                                        <hr>--%>
<%--                                    </div>--%>
                                    <div class="col-12 mb-2 mt-2">
                                        <h4>Four Wheeler</h4>
                                    </div>
                                    <div class="col-12">
                                        <div class="row " id="four-wheeler-v">
                                            <div class="col-md-12 col-sm-12 border border-0">
                                                <div class="loader-demo-box border border-0">
                                                    <div class="circle-loader"
                                                         style="color: #7571f9 !important;">
                                                        <span></span> <span></span> <span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


                <!-- partial -->
            </div>
            <!-- main-panel ends -->
            <!-- page-body-wrapper ends -->
            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </div>
    <!-- container-scroller -->
    <!-- base:js -->
    <script
            src="<%=request.getContextPath()%>/adminResources/js/manageVehiclesUser.js"></script>
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
