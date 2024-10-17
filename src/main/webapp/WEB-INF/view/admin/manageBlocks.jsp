<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Admin | Blocks</title>
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
        .atc-btn {
            padding: 0.1rem 0.6rem;
        }

        .owner-block-link:hover {
            color: #514cf7 !important;
            text-decoration: none !important;
        }
    </style>
</head>

<body class="modal-open">
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->

    <jsp:include page="header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="menu.jsp"/>
        <%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

        <!-- Modal starts -->

        <div
                class="modal fade show"
                id="exampleModal-3"
                tabindex="-1"
                role="dialog"
                aria-labelledby="ModalLabel"
                aria-hidden="true"
        >

            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">Add Block</h5>
                        <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                onclick="emptyAddBlockForm()"
                        >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <f:form action="blocks" method="post" onsubmit="return validateBlockAddForm();"
                                modelAttribute="blockVo" class="model-form">
                        <div class="row mb-2">
                            <div class="col-lg-12">
                                <label for="block-name" class="col-form-label"
                                >Block Name :
                                </label>

                                <f:input
                                        type="hidden"
                                        class="form-control"
                                        id="block-id"
                                        path="id"
                                />

                                <f:input
                                        type="text"
                                        class="form-control"
                                        id="block-name"
                                        path="blockName"
                                />
                                <span id="name1-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Block Name !</span>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-lg-12">
                                <label for="number-of-floors" class="col-form-label"
                                >No of Floor:
                                </label>
                                <f:input
                                        type="text"
                                        class="form-control"
                                        id="number-of-floors"
                                        path="noOfFloors"
                                        onkeyup="calHouse()"
                                />
                                <span id="floor1-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Number Of Floors !</span>
                                <span id="floor2-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Number Of Floors !</span>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-lg-12">
                                <label for="house-on-each-floor" class="col-form-label"
                                >Houses on each floor :
                                </label>
                                <f:input
                                        type="text"
                                        class="form-control"
                                        id="house-on-each-floor"
                                        path="houseOnEachFloor"
                                        onkeyup="calHouse()"
                                />
                                <span id="house1-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Number Of House !</span>
                                <span id="house2-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Number of House !</span>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-lg-12">
                                <label for="type-of-house" class="col-form-label"
                                >Type of houses(BHK):
                                </label>
                                <f:select id="type-of-house"
                                          path="typeOfHouse"
                                          class="form-control">
                                    <f:option value="none">Select House Type</f:option>
                                    <f:option value="2">2 BHK</f:option>
                                    <f:option value="3">3 BHK</f:option>
                                    <f:option value="4">4 BHK</f:option>
                                    <f:option value="5">5 BHK</f:option>
                                </f:select>
                                <span id="type-of-house1-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Select Type Of House !</span>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-lg-12">
                                <label for="type-of-house" class="col-form-label"
                                >Parking Space For Four Wheelers:
                                </label>
                                <f:input
                                        type="text"
                                        class="form-control"
                                        id="four-wheeler-parking-space"
                                        path="fourWheelerParkingSpace"/>
                                <span id="four-wheeler1-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Parking Space For Four Wheeler !</span>
                                <span id="four-wheeler2-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Parking Space for Four Wheeler !</span>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-lg-12">
                                <label for="type-of-house" class="col-form-label"
                                >Parking Space For Two Wheelers:
                                </label>
                                <f:input
                                        type="text"
                                        class="form-control"
                                        id="two-wheeler-parking-space"
                                        path="twoWheelerParkingSpace"
                                />
                                <span id="two-wheeler1-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Parking Space For Two Wheeler !</span>
                                <span id="two-wheeler2-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Parking Space for Two Wheeler !</span>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-6"><label for="number-of-house" class="col-form-label"
                                                      style="font-size: 17px;">Total Houses:
                            </label>
                                <label for="number-of-house" class="col-form-label"
                                       style="font-size: 17px; margin-left: 8px"
                                       id="number-of-house">
                                    0
                                </label></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary"
                                type="submit"
                                value="Submit"
                                id="submit">Submit
                        </button>
                        <button
                                type="button"
                                class="btn btn-light"
                                data-dismiss="modal"
                                onclick="emptyAddBlockForm()"
                        >
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
        </f:form>
        <!-- Modal Ends -->

        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-6"><h3 class="main-titled d-flex align-items-center"> <i class="fa fa-building-o icon-md mr-2 mt-1 " ></i>Blocks</h3>
                        <nav aria-label="breadcrumb d-flex align-content-center" class="bread">
                            <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                                <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Blocks
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <div
                            class="col-6 d-flex justify-content-end"
                            style="margin-bottom: 20px"
                    >

                        <button
                                type="button"
                                class="btn btn-primary btn-sm"
                                data-toggle="modal"
                                data-target="#exampleModal-3"
                                style="padding: 0.282rem 1rem !important; height: 2.55rem"
                        >
                            Add Block
                        </button>
                    </div>
                </div>
                <div class="card ">
                    <div class="card-body pt-2 pb-2 ">
                        <div class="row">
                            <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                            <c:forEach items="${list}" var="i" varStatus="j">
                                <div class="col-md-3 col-sm-6 border text-center border border-0 p-2  ">
                                    <div class="border border-3 rounded rounded-5">
                                        <div>
                                            <a href="owners" class="nav-links owner-block-link"
                                               onclick="saveOwnerDisplayDetails(${i.id})"><h1
                                                    style="font-size: 130px !important;">${i.blockName}</h1></a>
                                        </div>
                                        <div class="mb-3 d-flex justify-content-center">
                                            <table class="ml-3">
                                                <tr>
                                                    <td class="text-left" style="padding: 0rem 0.5rem !important;">
                                                        Floors
                                                    </td>
                                                    <td class="text-left" style="padding: 0rem 0.5rem !important;">:
                                                    </td>
                                                    <td class="text-left"
                                                        style="padding: 0rem 0.5rem !important;">${i.noOfFloors}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-left" style="padding: 0rem 0.5rem !important;">
                                                        Houses
                                                    </td>
                                                    <td class="text-left" style="padding: 0rem 0.5rem !important;">
                                                        :
                                                    </td>
                                                    <td class="text-left" style="padding: 0rem 0.5rem !important;">
                                                            ${i.houseOnEachFloor}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text-left" style="padding: 0rem 0.5rem !important;">
                                                        Type(BHK)
                                                    </td>
                                                    <td class="text-left" style="padding: 0rem 0.5rem !important;">
                                                        :
                                                    </td>
                                                    <td class="text-left" style="padding: 0rem 0.5rem !important;">
                                                            ${i.typeOfHouse}
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="mb-3">
                                            <button class="btn btn-outline-info atc-btn" data-toggle="modal"
                                                    data-target="#exampleModal-3" onclick=" getBlock(${i.id})">
                                                Edit
                                            </button>
                                            <a href="deleteBlocks/${i.id}">
                                                <button class="btn btn-outline-danger atc-btn" data-toggle="modal"
                                                        data-target="#exampleModal-3"
                                                        onclick="editBlock(this)">
                                                    Delete
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../user/footer.jsp"></jsp:include>
        </div>
    </div>
</div>

<!-- content-wrapper ends -->
<!-- partial:../../partials/_footer.html -->
<!-- partial -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- base:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/manageBlock.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/adminOnLoadEvents.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
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
