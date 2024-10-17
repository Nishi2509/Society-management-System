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
    <title>Admin | Complains</title>
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

    <div class="modal fade" id="exampleModal-complainInfo" tabindex="-1"
         role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class=" row">
                        <div class="col-lg-11 pl-0 mb-2">
                            <h3 id="complain-info-subject">- -</h3>
                        </div>
                        <div class="col-lg-1 text-center">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-5 border">
                            <label class="col-form-label ">Description : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <p id="complain-info-description" class="" style=" overflow:hidden !important;word-break: break-all;">
                                - -
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-5 border">
                            <label class="col-form-label ">Complain Date : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <label id="complain-info-complain-date" class="col-form-label">
                                - -
                            </label>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-lg-5 border m-0 align-content-center">
                            <label class="col-form-label ">Status : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <label id="complain-info-complain-status" class="col-form-label">
                                - -
                            </label>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-lg-5 border">
                            <label class="col-form-label ">Owner Name : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <label id="complain-info-complain-owner-name" class="col-form-label">
                                - -
                            </label>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-lg-5 border">
                            <label class="col-form-label ">Owner Email : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <label id="complain-info-complain-owner-email" class="col-form-label">
                                - -
                            </label>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-lg-5 border">
                            <label class="col-form-label ">Owner House Number : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <label id="complain-info-complain-owner-house-number" class="col-form-label">
                                - -
                            </label>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-lg-5 border">
                            <label class="col-form-label ">Owner Block Name : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <label id="complain-info-complain-owner-block-name" class="col-form-label">
                                - -
                            </label>
                        </div>
                    </div>
                    <div class="row  ">
                        <div class="col-lg-5 border">
                            <label class="col-form-label">Reply : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <label id="complain-info-complain-reply" class="col-form-label">
                                - -
                            </label>
                        </div>
                    </div>
                    <div class="row  ">
                        <div class="col-lg-5 border">
                            <label class="col-form-label">Reply Date : </label>
                        </div>
                        <div class="col-lg-7 border">
                            <label id="complain-info-complain-reply-date" class="col-form-label">
                                - -
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Cmplain Info Model End--%>

    <%--     Reply Complain Model Start--%>

    <div class="modal fade" id="exampleModal-reply-complain" tabindex="-1"
         role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabelEdit">Reply Complain</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close" onclick="emptyComplainForm()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="saveReply" method="post" onsubmit="return validateReplyComplain();">
                        <div class=" row mb-2">
                            <div class="col-lg-12">
                                <input type="hidden" name="complainId" id="complain-reply-id">
                                <label for="complain-reply-subject" class="col-form-label mb-1">Subject : </label>
                                <input
                                        type="text"
                                        class="form-control"
                                        id="complain-reply-subject"
                                        disabled="disabled"
                                        placeholder="Type Complain Subject"
                                        name="complainSubject"/>
                            </div>
                        </div>
                        <div class=" row">
                            <div class="col-lg-12">
                                <label for="complain-reply-description"
                                       class="col-form-label mb-1">Description: </label>
                                <textarea type="text" class="form-control"
                                          placeholder="Type Complain Description"
                                          rows="7"
                                          disabled="disabled"
                                          id="complain-reply-description" name="complainDescription"></textarea>
                            </div>
                        </div>
                        <div class=" row">
                            <div class="col-lg-12">
                                <label for="complain-reply-reply"
                                       class="col-form-label mb-1">Reply: </label>
                                <textarea type="text" class="form-control"
                                          placeholder="Type Your Reply"
                                          rows="7"
                                          id="complain-reply-reply" name="complainReply"></textarea>
                                <span id="reply1-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Reply !</span>
                                <span id="reply2-warning" class="all-warnings"
                                      style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Reply!</span>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit" onclick="validateReplyComplain()">Submit</button>
                    <button type="button" class="btn btn-light" data-dismiss="modal"
                            onclick="emptyComplainForm()">Close
                    </button>
                </div>
                </form>
            </div>
        </div>
    </div>

    <%--        Member Complain Model End--%>

    <jsp:include page="header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="menu.jsp"/>

        <%-- <%@taglib prefix="f" uri="http://www.springframework.org/tags/form"
        %>--%>
        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


        <%--        Owner Edit Model Starts--%>

        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-message-reply-text icon-md mr-2 mt-2 " ></i>Complains</h3>
                <div
                        class="d-flex justify-content-between align-content-center"
                        style="margin-bottom: 20px"
                >
                    <nav
                            aria-label="breadcrumb d-flex align-content-center"
                            class="bread"
                    >
                        <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                            <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Complains
                            </li>
                        </ol>
                    </nav>
                </div>
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
                                            <th>Complainer's Email</th>
                                            <th>Complain Attachments</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody id="member-table-view">
                                        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                                        <c:forEach items="${complainList}" var="i" varStatus="j">
                                            <tr>
                                                <td>${j.count}</td>
                                                <td>
                                                    <a data-toggle="modal" href="#"
                                                       onclick="popInfo(${i.id})"
                                                       data-target="#exampleModal-complainInfo" style="color: #7571f9">
                                                            ${i.subject}
                                                    </a>
                                                </td>
                                                <td><p class="a">${i.description}</p></td>
                                                <td><c:if test='${i.complainStatus.equals("pending")}'>
                                                    <label class="badge badge-warning">Pending</label>
                                                </c:if>
                                                    <c:if test="${i.complainStatus eq 'fullfill'}">
                                                        <label class="badge badge-success">Fullfilled</label>
                                                    </c:if>
                                                </td>
                                                <td>${i.ownerVo.ownerEmail}</td>
                                                <td class="">
                                                    <a
                                                       href="<%=request.getContextPath()%>/documents/complainAttachments/${i.complainAttachments}"
                                                       download="${i.complainAttachments}"
                                                       class="ml-5">
                                                        <i class="mdi mdi-link-variant menu-icon">
                                                        </i>
                                                    </a>

                                                </td>
                                                <td>
                                                    <c:if test='${i.complainStatus.equals("pending")}'>
                                                        <button class="btn btn-outline-info"
                                                                onclick="getComplain(${i.id})"
                                                                data-toggle="modal"
                                                                data-target="#exampleModal-reply-complain">
                                                            Reply
                                                        </button>
                                                    </c:if>
                                                    <a
                                                            href="deleteComplainByAdmin/${i.id}">
                                                        <button class="btn btn-outline-danger"
                                                                data-toggle="modal"
                                                                data-target="#exampleModal-3">
                                                            Delete
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
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
<script src="<%=request.getContextPath()%>/adminResources/js/manageComplainsAdmin.js"></script>
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
