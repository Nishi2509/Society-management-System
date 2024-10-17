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
    <title>Admin | Feedbacks</title>
    <!-- base:css -->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/font-awesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/fontawesome-stars.css">

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/fontAwesome/font-awesome.min.css"/>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/star.css"/>
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
                <h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-star-circle icon-md mr-2 mt-1 " ></i>Feedbacks</h3>
                <nav aria-label="breadcrumb d-flex align-content-center"
                     class="bread">
                    <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                        <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Feedbacks
                        </li>
                    </ol>
                </nav>
                <div class="card border border-0">
                    <div class="card-body p-0">
                        <div class="row ">
                            <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                            <c:forEach items="${feedbackVoList}" var="i" varStatus="j">
                                <div class="col-md-6 "
                                     style="background: none;margin:10px 0px 10px 0px;">
                                    <div class="border border-1"
                                         style="text-align: center; border-radius: 10px !important; padding: 10px ;">
                                        <div class="row d-flex align-items-start">
                                            <div class="col-1 text-left mr-4"><img
                                                    src="/adminResources/image/avatar.png"
                                                    alt="profile"
                                                    style="height: 50px !important; width: 50px !important;">
                                            </div>
                                            <div class="col-6 text-left ml-2">
                                                <div><p style="font-size: 15px !important;">
                                                    <b>${i.ownerVo.ownerName}</b><br>
                                                </div>
                                                <div>
                                                    <div class="br-wrapper br-theme-fontawesome-stars"><select
                                                            autocomplete="off"
                                                            style="display: none;">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                        <div class="br-widget">
                                                            <c:forEach begin="1" end="5" varStatus="j">
                                                                <fmt:parseNumber var="intValue" value="${i.rating}"
                                                                                 integerOnly="true"/>
                                                                <c:if test="${intValue>=j.count}">
                                                                    <a data-rating-value="1"
                                                                       data-rating-text="1"
                                                                       class="br-selected"></a>
                                                                </c:if>
                                                                <c:if test="${intValue<j.count}">
                                                                    <a data-rating-value="1"
                                                                       data-rating-text="1"
                                                                       class=""></a>
                                                                </c:if>

                                                            </c:forEach></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4 text-right">
                                                <span><b>${i.date}</b></span>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-12 text-left"><p class="mb-0">Description : </p>
                                                <p>${i.description}</p>
                                            </div>
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
<script src="<%=request.getContextPath()%>/adminResources/js/jquery.barrating.min.js"></script>
<script>
    $('#example-fontawesome').barrating({
        theme: 'fontawesome-stars',
        showSelectedRating: false
    });
</script>
<!-- End custom js for this page-->
</body>
</html>
