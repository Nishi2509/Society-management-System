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
    <title>User | Index</title>
    <!-- base:css -->
    <link
            rel="stylesheet"
            href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css"
    />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css"/>
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
</head>

<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->

    <jsp:include page="header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="menu.jsp"/>


        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="card">
                    <div class="card-body p-0">
                        <div class="row p-0 pr-2 pl-2" style="">
                            <div class="col-md-7   pt-3 border-bottom"
                                 style="height: 410px;background-image: url('<%=request.getContextPath()%>/adminResources/image/background_image1.jpg');background-repeat: no-repeat;background-size: cover;background-position: center">
                            </div>
                            <div class="col-md-5 ">
                                <div class="row" style="height: 410px">
                                    <div
                                            class="col-md-12 d-flex align-items-center justify-content-center p-4">
                                        <h1 id="societyname" style="font-size: 40px !important;">Shantivan Society</h1>
                                    </div>
                                    <div class="col-md-12 border-bottom">
                                        <p class="clearfix m-3 mt-5 " style="font-size: 15px">
                                            <span class="float-left d-flex align-items-center" style="font-weight: 700"><i
                                                    class="mdi mdi-google-maps menu-item mr-2 "
                                                    style="font-size: 20px"></i>Address </span> <span
                                                class="float-right text-muted"
                                                style="text-align: right !important;"> <span id="societyAddress"
                                                                                             style="">Shantivan Co-Society,<br>Navarangpura Ahmedabad</span></span>
                                        </p>
                                        <p class="clearfix m-3 mt-5" style="font-size: 15px">
                                            <span class="float-left d-flex align-items-center" style="font-weight: 700"><i
                                                    class="mdi mdi-email menu-item mr-2" style="font-size: 20px"></i>Email </span>
                                            <span class="float-right text-muted"
                                                  id="societyEmail">email@email.com</span>
                                        </p>
                                        <p class="clearfix m-3 mt-5" style="font-size: 15px">
                                            <span class="float-left d-flex align-items-center" style="font-weight: 700"><i
                                                    class="mdi mdi-phone menu-item mr-2" style="font-size: 20px"></i>Phone </span>
                                            <span class="float-right text-muted"
                                                  id="societyPhone">email@email.com</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="">

                            <div
                                    class="col-md-4 d-flex justify-content-center align-items-center p-5 border-right">
                                <div
                                        class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0 mt-2 mt-md-0">
                                    <i class="mdi mdi-star-circle icon-md mr-3 "
                                       style="color: #ffd700"></i>
                                    <div>
                                        <p class="mb-1">Feedbacks</p>
                                        <div class="d-flex align-items-center">
                                            <h4 class="mb-0 mr-2 font-weight-bold"
                                                id="feedbacks-display">0000</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div
                                    class="col-md-4 d-flex justify-content-center align-items-center border-right p-5">
                                <div
                                        class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0 mt-2 mt-md-0">
                                    <i class="mdi mdi-message-reply-text icon-md mr-3"
                                       style="color: #dc3545"></i>
                                    <div>
                                        <p class="mb-1">Complains</p>
                                        <div class="d-flex align-items-center">
                                            <h4 class="mb-0 mr-2 font-weight-bold"
                                                id="complains-display">0000</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div
                                    class="col-md-4 d-flex justify-content-center align-items-center p-0">

                                <div class="row p-0">
                                    <div
                                            class="col-md-6 d-flex justify-content-center  align-items-center  p-5">
                                        <div
                                                class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0 mt-2 mt-md-0">
                                            <i class="mdi mdi-motorbike icon-md mr-3 text-primary"></i>
                                            <div>
                                                <p class="mb-1">Two Wheelers</p>
                                                <div class="d-flex align-items-center">
                                                    <h4 class="mb-0 mr-2 font-weight-bold"
                                                        id="twoWheeler-display">0000</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div
                                            class="col-md-6 d-flex justify-content-center align-items-center p-5">
                                        <div
                                                class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0 mt-2 mt-md-0">
                                            <i class="mdi mdi-car icon-md mr-3 text-primary"></i>
                                            <div>
                                                <p class="mb-1">Four Wheelers</p>
                                                <div class="d-flex align-items-center">
                                                    <h4 class="mb-0 mr-2 font-weight-bold"
                                                        id="fourWheeler-display">0000</h4>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">

                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <jsp:include page="../user/footer.jsp"></jsp:include>

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
<script
        src="<%=request.getContextPath()%>/adminResources/js/userOnloadEvents.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
<script src="<%=request.getContextPath()%>/adminResources/js/userDashboard.js"></script>
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
