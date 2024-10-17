<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Admin | Society Details</title>
    <!-- base:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css"/>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/fontAwesome/font-awesome.min.css"/>
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/dataTables.bootstrap4.css"/>
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/validate.css"/>
    <!-- endinject -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/image/favicon.png"/>
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
                <h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-file-document-box-outline icon-md mr-2 mt-1 " ></i>Society Details</h3>
                <div class="d-flex justify-content-between align-content-center"
                     style="margin-bottom: 20px">
                    <nav aria-label="breadcrumb d-flex align-content-center"
                         class="bread">
                        <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                            <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Society Details
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="card">
                    <div class="card-body">
                        <f:form action="insertSociety" method="post" onsubmit="return validateSocietyForm();"
                                modelAttribute="societyVo" >
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Society Name</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input path="id" type="hidden" id="society-id"/>
                                    <f:input class="form-control"  id="societyName"
                                             type="text" placeholder="Type Name.."
                                             path="societyName" disabled="true"/>
                                    <span id="name1-warning" style="color: #dc3545;font-size:12px;display: none" >Please Enter Society Name !</span>
                                    <span id="name2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Society Name !</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Society Address</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" id="societyAddress" type="text"
                                             placeholder="Type Address.." path="socityAddress"
                                             disabled="true"/>
                                    <span id="address1-warning" style="color: #dc3545;font-size:12px;display: none" >Please Enter Society Address !</span>
                                    <span id="address2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Society Address !</span>

                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Constructed By</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="35"
                                              id="societyConstruct" type="text"
                                             placeholder="Type Construction Company.." path="constructedBy"
                                             disabled="true"/>
                                    <span id="construct1-warning" style="color: #dc3545;font-size:12px;display: none" >Please Enter Construction Company Name !</span>
                                    <span id="construct2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Construction Company Name !</span>

                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">RERA Number</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="15"
                                              id="societyRera" type="text"
                                             placeholder="Type RERA Number.." path="RERANumber"
                                             disabled="true"/>
                                    <span id="rera1-warning" style="color: #dc3545;font-size:12px;display: none" >Please Enter RERA Number !</span>
                                    <span id="rera2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid RERA Number !</span>

                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Contact Number</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="10"
                                              id="societyContact" type="text"
                                             placeholder="Type Contact Number.." path="contactNumber"
                                             disabled="true"/>
                                    <span id="contact1-warning" style="color: #dc3545;font-size:12px;display: none" >Please Enter Contact Number !</span>
                                    <span id="contact2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Contact Number !</span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <label class="col-form-label">Email Address</label>
                                </div>
                                <div class="col-lg-8">
                                    <f:input class="form-control" maxlength="30"
                                              id="societyEmail" type="text"
                                             placeholder="Type Email Address.." path="emailAddress"
                                             disabled="true"/>
                                    <span id="email1-warning" style="color: #dc3545;font-size:12px;display: none" >Please Enter Email Address !</span>
                                    <span id="email2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Email Address !</span>

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
    <!-- content-wrapper ends -->
    <!-- partial:../../partials/_footer.html -->

</div>
<!-- partial -->
<!-- container-scroller -->
<!-- base:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/form_validation_lib/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/form_validation_lib/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/societyDetails.js"></script>
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
