<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Admin | Owners</title>
    <!-- base:css -->
    <link
            rel="stylesheet"
            href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css"
    />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css"/>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/fontAwesome/font-awesome.min.css"/>
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link
            rel="stylesheet"
            href="<%=request.getContextPath()%>/adminResources/css/dataTables.bootstrap4.css"
    />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/style.css"/>
    <!-- endinject -->
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/image/favicon.png"/>
    <style>
        .circle-loader:before {
            border: 10px solid #4b4b4b !important;
            border-top-color: #7571f9 !important;
        }
    </style>
</head>
<body onload="displayOwnerForFirst()">
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <jsp:include page="header.jsp"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <jsp:include page="menu.jsp"/>
        <%-- <%@taglib prefix="f" uri="http://www.springframework.org/tags/form"
        %>--%>
        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

        <%--        Owner Maintenance Start--%>


        <div class="modal fade" id="exampleModal-owner-maintenance" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title">Manage Maintenance</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body p-3 pt-2 pb-2">
                        <div class="row">
                            <div class="col-12 mb-2">
                                <label for="" class="col-form-label mb-1" style="font-weight: 700">Maintenance Year</label>
                                <select name="" id="maintenance-year" onchange="getOwnerMaintenanceInfo()" class="form-control" style="width: 20%">
                                    <option value="2024">2024</option>
                                    <option value="2025">2025</option>
                                    <option value="2026">2026</option>
                                    <option value="2027">2027</option>
                                    <option value="2028">2028</option>
                                    <option value="2029">2029</option>
                                    <option value="2030">2030</option>
                                    <option value="2031">2031</option>

                                </select>
                            </div>
                            <div class="col-12" style="height: 270px; max-height: 500px">
                                <div class="table-responsive"
                                     style="max-height: 100% !important; scrollbar-width: none">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th>Sr.No</th>
                                            <th>Month</th>
                                            <th>Maintenance Status</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody id="maintenance-info">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">

                        <button
                                type="button"
                                class="btn btn-light"
                                data-dismiss="modal"
                                onclick="emptyOwnerMaintenanceTable()"
                        >
                            Close
                        </button>
                    </div>
                </div>
                </form>
            </div>
        </div>


        <%--        Owner Maintenance End--%>

        <%--        Parking Allotment Form Start --%>
        <div class="modal fade" id="exampleModal-owner-parking" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title">Parking Allotment</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body p-1 pt-2">
                        <div class="row">
                            <div class="col-12" style="height: 270px; max-height: 500px">
                                <div class="table-responsive"
                                     style="max-height: 100% !important; scrollbar-width: none">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th>Sr.No</th>
                                            <th>Vehicle Number</th>
                                            <th>Vehicle Rc Number</th>
                                            <th>Vehicle Type</th>
                                            <th>Available Parking Slots</th>
                                            <th>Deallocate Parking Slot</th>
                                        </tr>
                                        </thead>
                                        <tbody id="vehicle-info">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary"
                                type="submit"
                                value="Submit"
                                data-dismiss="modal"
                                aria-label="Close"
                                onclick="allocateVehicle()">Allocate
                        </button>
                        <button
                                type="button"
                                class="btn btn-light"
                                data-dismiss="modal"
                                onclick="empptytable()"
                        >
                            Close
                        </button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%--       Parking Allotment Form End  --%>
        <%--        Start Member Info--%>
        <div class="modal fade" id="exampleModal-member-info" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">Members Info</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body p-1 pt-2">
                        <div class="row">
                            <div class="col-12" style="height: 250px; max-height: 500px">
                                <div class="table-responsive"
                                     style="max-height: 100% !important; scrollbar-width: none">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th>Sr.No</th>
                                            <th>Member Image</th>
                                            <th>Member Email Address</th>
                                            <th>Member Phone Number</th>
                                        </tr>
                                        </thead>
                                        <tbody id="member-info-table">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                </form>
            </div>
        </div>
        <%--        End Member Info--%>
        <%--        Owner Edit Model Starts--%>
        <div
                class="modal fade"
                id="exampleModal-3"
                tabindex="-1"
                role="dialog"
                aria-labelledby="ModalLabel"
                aria-hidden="true"
        >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabelEditOwner">Edit Owner</h5>
                        <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                onclick="emptyAddOwnerForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class=" row">
                            <input
                                    type="hidden"
                                    class="form-control"
                                    id="owner-edit-id"
                            />
                            <div class="col-lg-6">
                                <label for="owner-edit-block-no" class="col-form-label"
                                >Block Name :
                                </label>

                                <select class="form-control" id="owner-edit-block-no">
                                    <option id="block" disabled selected>- -</option>
                                </select>
                            </div>
                            <div class="col-lg-6">
                                <label for="owner-edit-floor-no" class="col-form-label"
                                >Floor No :
                                </label>

                                <select class="form-control" id="owner-edit-floor-no">
                                    <option id="floor" disabled selected>- -</option>
                                </select>
                            </div>
                        </div>
                        <div class=" row">
                            <div class="col-lg-12">
                                <label for="owner-edit-house-no" class="col-form-label"
                                >Owner House No :
                                </label>
                                <input
                                        type="text"
                                        class="form-control"
                                        id="owner-edit-house-no"
                                        disabled="disabled"
                                />
                            </div>
                        </div>
                        <div class=" row">
                            <div class="col-lg-12">
                                <label for="owner-edit-name" class="col-form-label"
                                >Owner Name :
                                </label>

                                <input
                                        type="text"
                                        class="form-control"
                                        id="owner-edit-name"
                                />
                                <span id="nameEdit1-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Owner Name !</span>
                                <span id="nameEdit2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Owner Full Name!</span>
                            </div>
                        </div>
                        <div class=" row">
                            <div class="col-lg-12">
                                <label for="owner-edit-email" class="col-form-label"
                                >Owner Email Address :
                                </label>

                                <input
                                        type="text"
                                        class="form-control"
                                        id="owner-edit-email"
                                />
                                <span id="emailEdit1-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Owner Email Address!</span>
                                <span id="emailEdit2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Owner Email Address !</span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary"
                                onclick="updateWhenValidate()"
                                id="edit-updateButton">Update
                        </button>
                        <button
                                type="button"
                                class="btn btn-light"
                                data-dismiss="modal"
                                onclick="emptyEditOwnerForm()"
                        >
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <%--        Owner Edit Model Ends--%>

        <!--Owner Add Modal starts -->

        <div
                class="modal fade"
                id="exampleModal-1"
                tabindex="-1"
                role="dialog"
                aria-labelledby="ModalLabel"
                aria-hidden="true"
        >
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">Add Owners</h5>
                        <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                onclick="emptyAddOwnerForm()"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="ownerName" method="post" onsubmit="return validateOwnerAddForm();" class="model-form" >
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <label class="col-form-label"
                                    >Block Name :
                                    </label>
                                    <select
                                            class="form-control"
                                            name="blockId"
                                            id="block-name-form"
                                            onchange="blockChange(this)"
                                    >
                                        <option value="none" disabled selected>
                                            Select Block Name
                                        </option>
                                        <c:forEach items="${blockList}" var="i">
                                            <c:if test="${i.status}">
                                                <option value="${i.id}">${i.blockName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <label for="number-of-floors" class="col-form-label"
                                    >Floor:
                                    </label>
                                    <select
                                            class="form-control"
                                            id="number-of-floors"
                                            name="floorNumber"
                                            onchange="floorChange(this)"
                                    >
                                        <option value="">- -</option>
                                    </select>
                                </div>
                                <div class="col-lg-4">
                                    <label for="number-of-floors" class="col-form-label"
                                    >Number Of House:
                                    </label>
                                    <input
                                            type="text"
                                            name=""
                                            value="- -"
                                            class="form-control"
                                            id="number-of-house"
                                            disabled
                                    />
                                </div>
                            </div>
                            <div class="row mt-3" id="house-numbers-label"></div>
                            <div class="row ">
                                <div class="col-lg-12" id="house-numbers-ownwers"></div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                    class="btn btn-primary"
                                    type="submit"
                                    value="Submit"
                                    id="submit-model"
                                    style="display: none !important;"
                            >
                                Submit
                            </button>
                            <button
                                    type="button"
                                    class="btn btn-light"
                                    data-dismiss="modal"
                                    onclick="emptyAddOwnerForm()"
                            >
                                Close
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal Ends -->

        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-6">
                        <h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-human-child icon-md mr-1 mt-1 " ></i>Owners</h3>
                        <nav
                                aria-label="breadcrumb d-flex align-content-center"
                                class="bread"
                        >
                            <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                                <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Owners
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <div
                            class="col-6 d-flex justify-content-end"
                            style=""
                    >
                        <button
                                type="button"
                                class="btn btn-primary btn-sm"
                                data-toggle="modal"
                                data-target="#exampleModal-1"
                                style="padding: 0.282rem 1rem !important; height: 2.55rem"
                        >
                            Add Owners
                        </button>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header pb-3 pt-3">
                        <div class="row mb-2">
                            <div class="col-lg-3">
                                <label for="blockSearch" class="col-form-label card-title pt-0 mb-1 mt-2"
                                >Block Name:
                                </label>
                                <select
                                        class="form-control"
                                        name="blockId"
                                        id="blockSearch"
                                        onchange="blockChangeForTable(this)"
                                >
                                    <option value="" disabled selected>Select Block</option>
                                    <c:forEach items="${blockList}" var="i" varStatus="">
                                        <c:if test="${i.status}">
                                            <option value="${i.id}">${i.blockName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-lg-3">
                                <label for="number-of-floors-search" class="col-form-label card-title pt-0 mb-1 mt-2 text-"
                                >Floor No:
                                </label>
                                <select
                                        class="form-control"
                                        id="number-of-floors-search"
                                        name="floorNumberTable"
                                        onchange="bringOwnersToTable(this)"
                                >
                                    <option value="">- -</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pt-2 pb-2">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th>Sr.No</th>
                                            <th>House Number</th>
                                            <th>Owner Name</th>
                                            <th>Owner Email Address</th>
                                            <th>Member Info</th>
                                            <th>Parking Allotment</th>
                                            <th>Manage Maintenance</th>
                                            <th>Edit</th>
                                        </tr>
                                        </thead>
                                        <tbody id="owner-table">
                                        <tr>
                                            <td colspan="6" style="text-align: center;">
                                                <div class="col-md-12 col-sm-12 border border-0">
                                                    <div class="loader-demo-box border border-0">
                                                        <div class="circle-loader" style="">

                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
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
<script src="<%=request.getContextPath()%>/adminResources/js/manageOwner.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/adminOnLoadEvents.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/template.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/settings.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/todolist.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/dataTables.bootstrap4.js"></script>
<!-- End plugin js for this page -->
<!-- Custom js for this page-->
<script src="<%=request.getContextPath()%>/adminResources/js/data-table.js"></script>
<!-- End custom js for this page-->
</body>
</html>
