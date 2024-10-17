<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>User | Profile</title>
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
</head>

<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->

    <jsp:include page="header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <div class="modal fade" id="exampleModal-edit-owner" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabelEdit">Edit Profile</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyComplainForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/user/editOwnerProfile" method="post" enctype="multipart/form-data">
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="edit-owner-name" class="col-form-label mb-1">Name : </label>
                                    <input name="ownerId" id="owner-id" type="hidden" />
                                    <input type="text" name="ownerName" class="form-control" id="edit-owner-name">
                                </div>
                            </div>
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="edit-owner-phone"
                                           class="col-form-label mb-1">Phone No: </label>
                                    <input type="text" name="ownerPhone" class="form-control" id="edit-owner-phone">
                                </div>
                            </div>
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="profile-image" class="col-form-label mb-1">Profile Image: </label>
                                    <input
                                            type="file"
                                            class="form-control"
                                            id="profile-image"
                                            placeholder="Type Complain Subject"
                                            name="ownerImage"/>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <button type="button" class="btn btn-light" data-dismiss="modal"
                                onclick="emptyComplainForm()">Close
                        </button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="menu.jsp"/>


        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-account icon-md mr-2 mt-1 " ></i>Profile</h3>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body p-0">
                                <div class="row">
                                    <div class="col-lg-4 p-4">
                                        <div class="border-bottom text-center pb-4">
                                            <img
                                                    src=""
                                                    id="user-image"
                                                    alt="profile" class="img-lg rounded-circle mb-3"/>
                                            <div class="mb-3">
                                                <h3 id="owner-name"></h3>
                                            </div>
                                            <h4 class="w-75 mx-auto mb-3">
                                                <span id="owner-house"></span>/<span id="owner-block"></span>
                                            </h4>

                                        </div>
                                        <div class="py-4">
                                            <p class="clearfix">
                                                <span class="float-left"> Email </span> <span
                                                    class="float-right text-muted" id="owner-email">
														Active </span>
                                            </p>
                                            <p class="clearfix">
                                                <span class="float-left"> Phone </span> <span
                                                    class="float-right text-muted"> <span
                                                    id="owner-phone"></span>
													</span>
                                            </p>
                                            <p class="clearfix">
                                                <span class="float-left"> Address </span> <span
                                                    class="float-right text-muted"
                                                    style="text-align: right !important;"> <span
                                                    id="owner-address" style=""></span></span>
                                        </div>
                                        <button class="btn btn-primary btn-block mb-2" data-toggle="modal" data-target="#exampleModal-edit-owner" onclick="editOwnerDetails()"
                                                                                                style="padding: 0.282rem 1rem !important; height: 2.55rem">
                                            Edit Profile</button>
                                    </div>
                                    <div class="col-lg-8 border-left p-4">
                                        <div class="card  border border-0 h-100">
                                            <div class="card-body p-0">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" id="home-tab" data-toggle="tab"
                                                           href="#home-1" role="tab" aria-controls="home-1"
                                                           aria-selected="true" onclick=""><i
                                                                class="mdi  mdi-account-multiple-outline mr-1"></i>
                                                            Members
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="profile-tab" data-toggle="tab"
                                                           href="#profile-1" role="tab" aria-controls="profile-1"
                                                           aria-selected="false" onclick=""> <i
                                                                class="mdi mdi-motorbike mr-1"></i> Vehicles</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="contact-tab" data-toggle="tab"
                                                           href="#contact-1" role="tab" aria-controls="contact-1"
                                                           aria-selected="false" onclick=""> <i
                                                                class="mdi mdi-cash mr-1"></i> Maintenance
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content p-2" style="height: 400px">
                                                    <div class="tab-pane fade active show" id="home-1" role="tabpanel"
                                                         aria-labelledby="home-tab">
                                                        <div class="media">
                                                            <div class="w-100" id="menu1-display"></div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="profile-1" role="tabpanel"
                                                         aria-labelledby="profile-tab">
                                                        <div class="media">
                                                            <div class="w-100" id="menu2-display"></div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="contact-1" role="tabpanel"
                                                         aria-labelledby="contact-tab">
                                                        <div class="media">
                                                            <div class="w-100" id="menu3-display"></div>
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


                </div>
            </div>

            <jsp:include page="../user/footer.jsp"></jsp:include>

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
<script
        src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<script
        src="<%=request.getContextPath()%>/adminResources/js/userOnloadEvents.js"></script>
<script
        src="<%=request.getContextPath()%>/adminResources/js/userProfile.js"></script>
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
