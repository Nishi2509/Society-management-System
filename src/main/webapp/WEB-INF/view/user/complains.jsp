<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>User | Complains</title>
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
        .a {
            white-space: nowrap;!important;
            width: 100px;!important;
            overflow: hidden;!important;
            text-overflow: ellipsis;!important;
        }

        .a:hover {
            overflow: visible;!important;
        }
    </style>
</head>

<body>

<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <%--Cmplain Info Model Start--%>

    <div class="modal fade" id="exampleModal-comaplainInfo" tabindex="-1"
         role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class=" row">
                        <div class="col-lg-11 pl-0 mb-2">
                            <h3 id="complain-info-subject">Subject</h3>
                        </div>
                        <div class="col-lg-1 text-center">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-4 border">
                            <label class="col-form-label ">Description : </label>
                        </div>
                        <div class="col-lg-8 border">
                            <p id="complain-info-description" class="" style=" overflow:hidden !important;word-break: break-all;">
                                - -
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 border">
                            <label class="col-form-label ">Complain Date : </label>
                        </div>
                        <div class="col-lg-8 border">
                            <label id="complain-info-complain-date" class="col-form-label">
                                lorem
                            </label>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-lg-4 border m-0 align-content-center">
                            <label class="col-form-label">Status : </label>
                        </div>
                        <div class="col-lg-8 border">
                            <label id="complain-info-complain-status" class="col-form-label">
                                lorem
                            </label>
                        </div>
                    </div>
                    <div class="row  ">
                        <div class="col-lg-4 border">
                            <label class="col-form-label">Reply : </label>
                        </div>
                        <div class="col-lg-8 border">
                            <label id="complain-info-complain-reply" class="col-form-label">
                                lorem
                            </label>
                        </div>
                    </div>
                    <div class="row  ">
                        <div class="col-lg-4 border">
                            <label class="col-form-label">Reply Date : </label>
                        </div>
                        <div class="col-lg-8 border">
                            <label id="complain-info-complain-reply-date" class="col-form-label">
                                lorem
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Cmplain Info Model End--%>

    <jsp:include page="../user/header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="../user/menu.jsp"/>


        <%--        Member Add Complain Model Start--%>

        <div class="modal fade" id="exampleModal-addComplain" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabelEdit">Complain</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyComplainForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="saveComplain" method="post" enctype="multipart/form-data">
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="complain-subject" class="col-form-label mb-1">Subject : </label>
                                    <input
                                            type="text"
                                            class="form-control"
                                            id="complain-subject"
                                            placeholder="Type Complain Subject"
                                            name="complainSubject"/>
                                </div>
                            </div>
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="complain-description"
                                           class="col-form-label mb-1">Description: </label>
                                    <textarea type="text" class="form-control"
                                              placeholder="Type Complain Description"
                                              rows="7"
                                              id="complain-description" name="complainDescription"></textarea>
                                </div>
                            </div>
                            <div class=" row mb-2">
                                <div class="col-lg-12">
                                    <label for="complain-subject" class="col-form-label mb-1">Complain Attachments : </label>
                                    <input
                                            type="file"
                                            class="form-control"
                                            id="complain-file"
                                            placeholder="Type Complain Subject"
                                            name="complainAttachments"/>
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

        <%--        Complain Model End--%>

        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
               <div class="row"><div class="col-6"> <h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-message-reply-text icon-md mr-2 mt-2 " ></i>Complains</h3>
                   <nav aria-label="breadcrumb d-flex align-content-center"
                        class="bread">
                       <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                           <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                           <li class="breadcrumb-item active" aria-current="page">
                               Complains
                           </li>
                       </ol>
                   </nav></div>
                   <div class="col-6 d-flex justify-content-end">
                       <button type="button" class="btn btn-primary btn-sm" style="padding: 0.282rem 1rem !important; height: 2.55rem"
                               data-toggle="modal" data-target="#exampleModal-addComplain">Add Complain
                       </button>
                   </div></div>
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table id="order-listing" class="table">
                                        <thead>
                                        <tr>
                                            <th>Sr.No</th>
                                            <th>Subject</th>
                                            <th>Description</th>
                                            <th>Complain Status</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>

                                        <tbody id="member-table-view">
                                        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                                        <c:forEach items="${complainList}" var="i" varStatus="j">

                                            <c:if test="${i.status}">
                                                <tr>
                                                    <td>${j.count}</td>
                                                    <td><a data-toggle="modal"
                                                           href="#"
                                                           data-target="#exampleModal-comaplainInfo"
                                                           onclick="popInfo(${i.id})">${i.subject}</a></td>
                                                    <td><p class="a">${i.description}</p></td>
                                                    <td><c:if test='${i.complainStatus.equals("pending")}'>
                                                        <label class="badge badge-warning">Pending</label>
                                                    </c:if>
                                                        <c:if test="${i.complainStatus eq 'fullfill'}">
                                                            <label class="badge badge-success">Fullfilled</label>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <a
                                                                href="deleteComplain/${i.id}">
                                                            <button class="btn btn-outline-danger"
                                                                    data-toggle="modal"
                                                                    data-target="#exampleModal-3">
                                                                Delete
                                                            </button>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                        </tbody>
                                    </table>
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
    <script src="<%=request.getContextPath()%>/adminResources/js/manageComplainUser.js"></script>

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
