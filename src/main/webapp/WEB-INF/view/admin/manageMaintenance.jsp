<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Admin | Maintenance</title>
    <!-- base:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css"/>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/fontAwesome/font-awesome.min.css"/>
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
</head>

<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->


    <jsp:include page="header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->


        <jsp:include page="menu.jsp"/>


        <%--Add Maintenance Model Starts--%>

        <div
                class="modal fade"
                id="exampleModal-1"
                tabindex="-1"
                role="dialog"
                aria-labelledby="ModalLabel"
                aria-hidden="true"
        >
            <div class="modal-dialog modal-xl" style="width: 60% !important;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">Add Maintenance</h5>
                        <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                onclick="emptyAddMaintenanceForm()"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="saveMaintenance" method="post" onsubmit="return addMaintenanceDetails();" class="model-form">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <label class="col-form-label"
                                    >Maintenance year :
                                    </label>
                                    <select
                                            class="form-control"
                                            name="maintenanceYear"
                                            id="maintenance-year"
                                            onchange=""
                                    >
                                    </select>
                                </div>
                                <div class="col-lg-6">
                                    <label for="maintenance-house-type" class="col-form-label"
                                    >BHK:
                                    </label>
                                    <select
                                            class="form-control"
                                            name="maintenanceHouseType"
                                            id="maintenance-house-type"
                                    >
                                        <option value="none" selected disabled>Select House Type (BHK)</option>
                                        <option value="2">2 BHK</option>
                                        <option value="3">3 BHK</option>
                                        <option value="4">4 BHK</option>
                                    </select>
                                    <span id="maintenanceHouseType1-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Select House Type !</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="maintenance-type" class="col-form-label"
                                    >Maintenance Type:
                                    </label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            id="maintenance-type"
                                    />
                                    <span id="maintenanceType1-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Enter Maintenance Type !</span>
                                    <span id="maintenanceType2-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Maintenance Type !</span>

                                </div>
                                <div class="col-lg-4">
                                    <label for="maintenance-amount" class="col-form-label"
                                    >Maintenance Amount:
                                    </label>
                                    <div class="input-group" id="amount-box">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-primary text-white">&#8377;</span>
                                        </div>
                                        <input type="text" class="form-control" id="maintenance-amount"
                                               aria-label="Amount (to the nearest dollar)">
                                        <div class="input-group-append">
                                            <span class="input-group-text">.00</span>
                                        </div>
                                    </div>
                                    <span id="maintenanceAmount1-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Enter Maintenance Amount !</span>
                                    <span id="maintenanceAmount2-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Amount !</span>
                                </div>
                                <div class="col-lg-2 d-flex align-items-center justify-content-center" id="add-maintenance-charges-button" style="margin-top: 26px !important;">
                                    <button class="btn btn-primary"
                                            type="button" onclick="addMaintenance()">Add
                                    </button>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-lg-12" id="house-numbers-ownwers">
                                    <div class="table-responsive"
                                         style="max-height: 300px !important;  scrollbar-width: none">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Sr.</th>
                                                <th>Maintenance Type</th>
                                                <th>Amount</th>
                                            </tr>
                                            </thead>
                                            <tbody id="maintenance-add-table"
                                            >
                                            <tr>
                                                <td colspan="3" style="text-align: center;padding: 60px 0px 50px 0px">
                                                    No maintenance Added Yet
                                                </td>
                                            </tr>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td colspan="2" style="text-align: end;font-weight: 500">Total Amount
                                                </td>
                                                <td class="border border-bottom-0 border-right-0">&#8377; <span
                                                        id="total-amount">0.00</span>
                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                    class="btn btn-primary"
                                    type="submit"
                                    value="Submit"
                                    id="maintenance-submit-button"
                                    style="display: none"
                            >
                                Submit
                            </button>
                            <button
                                    type="button"
                                    class="btn btn-light"
                                    data-dismiss="modal"
                                    id="add-maintenance-close-button"
                                    onclick="emptyAddMaintenanceForm()"
                            >
                                Close
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%--Add Maintenance Model End--%>

        <%--        View Maintenance Charges For Months Start--%>

        <div
                class="modal fade"
                id="exampleModal-2"
                tabindex="-1"
                role="dialog"
                aria-labelledby="ModalLabel"
                aria-hidden="true"
        >
            <div class="modal-dialog modal-xl" style="width: 60% !important;" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div><h5 class="modal-title">Maintenance <span id="model-view-maintenance-label" ></span></h5>
                        </div>
                        <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                onclick="emptyForm()"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                        <div class="modal-body p-2">

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive"
                                         style=" scrollbar-width: none">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Sr.</th>
                                                <th>Maintenance Type</th>
                                                <th>Amount</th>
                                            </tr>
                                            </thead>
                                            <tbody id="maintenance-view-charges"
                                            >
                                            <tr>
                                                <td colspan="3" style="text-align: center;padding: 60px 0px 0px 0px">
                                                    No maintenance Added Yet
                                                </td>
                                            </tr>

                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <td colspan="2" style="text-align: end;font-weight: 500">Total Amount
                                                </td>
                                                <td class="border border-bottom-0 border-right-0">&#8377; <span
                                                        id="total-amount-view-charges">0.00</span>
                                                </td>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>

        <%--        View Maintenance Charges For Months End--%>

        <%--        Edit Maintenance Charges Start --%>
        <div class="modal fade" id="exampleModal-3" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabelEdit">Add Maintenance Charges</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyEditMaintenanceCharges()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="saveComplain" method="post" onsubmit="return false;">
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label class="col-form-label mb-1">Maintenance Type : </label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            id="maintenance-type-edit"
                                            placeholder="Type Complain Subject"
                                            name="maintenance-type"/>
                                    <span id="maintenanceType1-edit-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Enter Maintenance Type !</span>
                                    <span id="maintenanceType2-edit-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Maintenance Type !</span>
                                    <input
                                            type="hidden"
                                            class="form-control"
                                            placeholder="Type Complain Subject"
                                            id="maintenance-id-edit"
                                    />
                                </div>
                            </div>
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label class="col-form-label mb-1">Maintenance Amount : </label>
                                    <div class="input-group" id="amount-box-edit">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-primary text-white">&#8377;</span>
                                        </div>
                                        <input type="text" class="form-control" id="maintenance-amount-edit"
                                               aria-label="Amount to the nearest dollar)">
                                        <div class="input-group-append">
                                            <span class="input-group-text">.00</span>
                                        </div>
                                    </div>
                                    <span id="maintenanceAmount1-edit-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Enter Maintenance Amount !</span>
                                    <span id="maintenanceAmount2-edit-warning" class="all-warnings"
                                          style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Amount !</span>
                                </div>
                            </div>

                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="button"

                                onclick="editMaintenanceCharges()">Submit
                        </button>
                        <button type="button" class="btn btn-light"
                                data-dismiss="modal" id="edit-maintenance-modal"
                                aria-label="Close"
                                onclick="emptyEditMaintenanceCharges()"
                        >Close
                        </button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <%--        Edit Maintenece Charges End--%>

        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-6"><h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-cash-multiple icon-md mr-2 mt-1 " ></i>Maintenance</h3>
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
                    <div class="col-6 d-flex justify-content-end"
                         style="margin-bottom: 20px">

                        <button type="button" class="btn btn-primary btn-sm"
                                data-toggle="modal" data-target="#exampleModal-1"
                                id="maintenance-add-button"
                                style="padding: 0.282rem 1rem !important; height: 2.55rem" onclick=""
                        >
                            Add Maintenance
                        </button>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header pt-3 pb-3">
                        <div class="row  mb-2">
                            <div class="col-lg-3">
                                <label for="blockSearch" class="col-form-label card-title mb-1 pt-0 mt-2"
                                >Year:
                                </label>
                                <select
                                        class="form-control"
                                        name="blockId"
                                        id="year-for-table"
                                        onchange="getMaintenanceDetailsForYear();getMaintenanceDetails()"
                                >

                                </select>
                            </div>
                            <div class="col-lg-3">
                                <label for="number-of-floors-search" class="col-form-label card-title mb-1 mt-2 pt-0"
                                >House Type:
                                </label>
                                <select
                                        class="form-control"
                                        id="house-type-for-table"
                                        name="floorNumberTable"
                                        onchange="getMaintenanceDetails()"
                                >
                                    <option>Select House Type</option>
                                    <option value="2" selected>2 BHK</option>
                                    <option value="3">3 BHK</option>
                                    <option value="4">4 BHK</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pt-2 pb-2">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table id="" class="table">
                                        <thead>
                                        <tr>
                                            <th>Sr.No</th>
                                            <th>Month</th>
                                            <th>Year</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody id="maintenance-table-view">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->

            <jsp:include page="../user/footer.jsp"></jsp:include>

            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- base:js -->

<script
        src="<%=request.getContextPath()%>/adminResources/js/manageMaintenance.js"></script>
<script
        src="<%=request.getContextPath()%>/adminResources/js/manageCirculars.js"></script>
<script
        src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script
        src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
<script
        src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>

<script src="<%=request.getContextPath()%>/adminResources/js/adminOnLoadEvents.js"></script>
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
