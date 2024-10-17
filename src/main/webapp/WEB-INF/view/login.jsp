<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login | SocietEase</title>
    <!-- base:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/adminResources/image/favicon.png"/>
</head>

<body>
<div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth px-0 p-0"
        >
            <div class="row w-100 mx-0 h-100">

                <div class="col-md-5 d-flex justify-content-center align-items-center" style="background-color: white">
                    <div class=" d-flex justify-content-center" style="width: 90% !important;">
                        <div class="auth-form-light text-left py-5 px-4 px-sm-5 border w-75" style="opacity: 0.90;">
                            <div class="brand-logo text-center m-0 mb-3">
                                <h1 class="primary text-primary" style="font-size: 2.30rem">SocietEase</h1>
                            </div>
                            <form class="pt-1" action="/j_spring_security_check" onsubmit="return validateLoginForm();"
                                  method="post">
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-lg" name="username"
                                           id="username" placeholder="Username" >
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control form-control-lg"
                                           id="password" placeholder="Password" >

                                </div>
                                <div class="mt-3">
                                    <input type="submit" value="SIGN IN" onclick=""
                                           class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">
                                    <div class="mt-1 d-flex justify-content-end align-items-center">
                                        <a href="#" class="auth-link text-black">Forgot password?</a>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-7"
                     style="background-image: url('<%=request.getContextPath()%>/adminResources/image/background_image1.jpg');background-repeat: no-repeat;background-size: cover;background-position: center">
                    <div class="d-flex justify-content-center align-items-center">

                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- base:js -->
    <script
            src="<%=request.getContextPath()%>/adminResources/js/login.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/template.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/settings.js"></script>
    <script src="<%=request.getContextPath()%>/adminResources/js/todolist.js"></script>
    <!-- endinject -->
</body>

</html>
