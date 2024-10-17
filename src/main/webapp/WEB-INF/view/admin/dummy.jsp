<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Admin | Block Details</title>
    <!-- base:css -->
    <link rel="stylesheet"
          href="adminResources/css/materialdesignicons.min.css"/>
    <link rel="stylesheet" href="adminResources/css/vendor.bundle.base.css"/>
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet"
          href="adminResources/css/dataTables.bootstrap4.css"/>
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="adminResources/css/style.css"/>
    <!-- endinject -->
    <link rel="shortcut icon" href="adminResources/image/favicon.png"/>
</head>

<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->

    <jsp:include page="header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="menu.jsp"/>
        <%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>


        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <h3 class="main-title">Block Details</h3>
                <div class="d-flex justify-content-between align-content-center"
                     style="margin-bottom: 20px">
                    <nav aria-label="breadcrumb d-flex align-content-center"
                         class="bread">
                        <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                            <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Manage Blocks
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="card">
                    <div class="card-body">
                        <f:form action="insertSociety" method="post"
                                modelAttribute="societyVo">
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Society Name</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input path="id" type="hidden" id="s-id"/>
                                    <f:input class="form-control" name="defaultconfig" id="s-name"
                                             type="text" maxlength="30" placeholder="Type Something.."
                                             path="societyName" disabled="true"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Society Address</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="40"
                                             name="defaultconfig-2" id="s-address" type="text"
                                             placeholder="Type Something.." path="socityAddress"
                                             disabled="true"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Constructed By</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="35"
                                             name="defaultconfig-3" id="s-construct" type="text"
                                             placeholder="Type Something.." path="constructedBy"
                                             disabled="true"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">RERA Number</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="15"
                                             name="defaultconfig-3" id="s-rera" type="text"
                                             placeholder="Type Something.." path="RERANumber"
                                             disabled="true"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Contact Number</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="10"
                                             name="defaultconfig-3" id="s-contact" type="text"
                                             placeholder="Type Something.." path="contactNumber"
                                             disabled="true"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Email Address</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="30"
                                             name="defaultconfig-3" id="s-email" type="text"
                                             placeholder="Type Something.." path="emailAddress"
                                             disabled="true"/>
                                </div>
                            </div>
                            <input class="btn btn-primary" type="submit" value="Update"
                                   id="submit" style="display: none;"/>
                            <input class="btn btn-primary" type="button"
                                   onclick="enableInputs()" value="Edit" id="edit">
                        </f:form>
                    </div>
                </div>
            </div>
            <jsp:include page="../user/footer.jsp"></jsp:include>

        </div>
    </div>
</div>
<!-- partial:../../partials/_footer.html -->


<!-- partial -->
<!-- content-wrapper ends -->
<!-- container-scroller -->
<!-- base:js -->
<script src="adminResources/js/societyDetails.js"></script>
<script src="adminResources/js/vendor.bundle.base.js"></script>
<script src="adminResources/js/manageBlock.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="adminResources/js/off-canvas.js"></script>
<script src="adminResources/js/hoverable-collapse.js"></script>
<script src="adminResources/js/template.js"></script>
<script src="adminResources/js/settings.js"></script>
<script src="adminResources/js/todolist.js"></script>
<!-- endinject -->
<!-- plugin js for this page -->
<script src="adminResources/js/jquery.dataTables.js"></script>
<script src="adminResources/js/dataTables.bootstrap4.js"></script>
<!-- End plugin js for this page -->
<!-- Custom js for this page-->
<script src="adminResources/js/data-table.js"></script>
<!-- End custom js for this page-->
</body>
</html>
