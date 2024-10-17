<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Admin | Circulars</title>
    <!-- base:css -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css"/>

    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/fontAwesome/font-awesome.min.css"/>
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
            white-space: nowrap;
            width: 100px;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .a:hover {
            overflow: visible;
        }
    </style>
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


        <%--Add Circular Model Starts--%>

        <div class="modal fade" id="exampleModal-add-circular" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabelEdit">Add Circular</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyCircularForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <f:form action="saveCircular" method="post" id="circular-form"
                                modelAttribute="circularVo" enctype="multipart/form-data" onsubmit="return validateAddCircularForm();">
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">Category</label>
                            </div>
                            <div class="col-lg-9">
                                <f:input path="id" type="hidden" id="circular-id"/>
                                <f:select class="form-control" name="defaultconfig"
                                          id="circular-category" type="text" path="category">
                                    <f:option value="none" disabled="true"
                                              selected="selected">Select Category</f:option>
                                    <f:option value="General Notice">General Notice</f:option>
                                    <f:option value="Events & Activities">Events & Activities</f:option>
                                    <f:option value="Security Alerts">Security Alerts</f:option>
                                    <f:option value="Maintenance Updates">Maintenance Updates</f:option>
                                    <f:option value="Community News">Community News</f:option>
                                    <f:option value="Policy Changes">Policy Changes</f:option>
                                    <f:option value="Financial Updates">Financial Updates</f:option>
                                    <f:option value="Emergency Notices">Emergency Notices</f:option>
                                    <f:option value="Health Related">Health Related</f:option>
                                    <f:option value="Legal Notices">Legal Notices</f:option>
                                </f:select>
                                <span id="circularCategory1-warning"
                                      style="color: #dc3545;font-size:12px;display: none">Please Select Circular Category !</span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">From : </label>
                            </div>
                            <div class="col-lg-4">
                                <f:input class="form-control" maxlength="40"
                                         name="defaultconfig-2" id="circular-from-date" type="date"
                                         placeholder="Type Something.." path="circularFromDate"/>
                                <span id="fromDate1-warning" style="color: #dc3545;font-size:12px;display: none">Please Select Circular Issue Date !</span>
                                <span id="fromDate2-warning" style="color: #dc3545;font-size:12px;display: none">Select Valid Issue Date !</span>
                            </div>
                            <div class="col-lg-1">
                                <label class="col-form-label">To:</label>
                            </div>
                            <div class="col-lg-4">
                                <f:input class="form-control" maxlength="40"
                                         name="defaultconfig-2" id="circular-to-date" type="date"
                                         placeholder="Type Something.." path="circularFromTo"/>
                                <span id="toDate1-warning" style="color: #dc3545;font-size:12px;display: none">Please Select Circular Expiry Date !</span>
                                <span id="toDate2-warning" style="color: #dc3545;font-size:12px;display: none">Select Valid Expiry Date !</span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">Description : </label>
                            </div>
                            <div class="col-lg-9">
                                <f:textarea class="form-control" id="circular-description"
                                            placeholder="Type Circular Description.."
                                            path="circularDescription" rows="7"/>
                                <span id="description1-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Circular Description !</span>
                                <span id="description2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Description !</span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-3">
                                <label class="col-form-label">Circular Attachments : </label>
                            </div>
                            <div class="col-lg-9">
                                <div class="form-group">
                                    <input type="file" name="circularAttachment" id="circularFileAttachments"
                                           class="file-upload-default">
                                    <div class="input-group col-xs-12">
                                        <input type="text" class="form-control file-upload-info" disabled=""
                                               id="circularFileAttachmentsLabelBox"
                                               placeholder="Upload Image">
                                        <span class="input-group-append">
                          <button class="file-upload-browse btn btn-sm btn-primary" type="button">Upload</button>
                        </span>
                                    </div>
                                    <span id="file1-warning" style="color: #dc3545;font-size:12px;display: none">Please Select File For Circular Attachments !</span>

                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-lg-7">
                                <div class="form-check form-check-flat form-check-primary">
                                    <label class="form-check-label"> <input
                                            type="checkbox" class="form-check-input" id="checkbox-label" name="notifyUser"> Notify
                                        User <i class="input-helper"></i></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit" id="submit" >
                            Submit
                        </button>
                        </f:form>
                        <button type="button" class="btn btn-light" data-dismiss="modal"
                                onclick="emptyCircularForm()">Close
                        </button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <%--Add Circular Model End--%>

        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-6"><h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-clipboard-text-outline icon-md mr-2 mt-1 " ></i>Circulars</h3>
                        <nav aria-label="breadcrumb d-flex align-content-center"
                             class="bread">
                            <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                                <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Circulars
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-6 d-flex justify-content-end"
                         style="margin-bottom: 20px">

                        <button type="button" class="btn btn-primary btn-sm"
                                data-toggle="modal" data-target="#exampleModal-add-circular" onclick="getDate()"
                                style="padding: 0.282rem 1rem !important; height: 2.55rem">
                            Add Circulars
                        </button>
                    </div>
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
                                            <th>Category</th>
                                            <th>Description</th>
                                            <th>From / To</th>
                                            <th>Validity</th>
                                            <th>Circular Attachments</th>
                                            <th>Action</th>

                                        </tr>
                                        </thead>
                                        <tbody id="member-table-view">
                                        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                                        <%@taglib prefix="j" uri="https://example.com/functions" %>
                                        <c:forEach items="${circularList}" var="i" varStatus="j">
                                            <tr>

                                                <td>${j.count}</td>
                                                <td>${i.category}</td>
                                                <td><p class="a">${i.circularDescription}</p></td>
                                                <td>${i.circularFromDate} / ${i.circularFromTo}</td>
                                                <td><c:if
                                                        test="${j:calculateAmount(i.circularFromDate,i.circularFromTo )}">
                                                    <label class="badge badge-success">Valid</label>
                                                </c:if> <c:if
                                                        test="${!j:calculateAmount(i.circularFromDate,i.circularFromTo )}">
                                                    <label class="badge badge-danger">Expired</label>
                                                </c:if></td>
                                                <td><a class="nav-link"
                                                       href="<%=request.getContextPath()%>/documents/circularAttachments/${i.circularAttactments}"
                                                       download><i class="mdi mdi-link-variant menu-icon"
                                                                   style="font-size: 15px"></i>
                                                </a></td>
                                                <td>
                                                    <button class="btn btn-outline-info" data-toggle="modal"
                                                            data-target="#exampleModal-add-circular"
                                                            onclick="getCircular(${i.id})">Edit
                                                    </button>
                                                    <a
                                                            href="deleteCircular/${i.id}">
                                                        <button class="btn btn-outline-danger"
                                                                data-toggle="modal" data-target="#exampleModal-3">
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
<script
        src="<%=request.getContextPath()%>/adminResources/js/manageCirculars.js"></script>
<script
        src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script
        src="<%=request.getContextPath()%>/adminResources/js/off-canvas.js"></script>
<script
        src="<%=request.getContextPath()%>/adminResources/js/hoverable-collapse.js"></script>

<script
        src="<%=request.getContextPath()%>/adminResources/js/adminOnLoadEvents.js"></script>
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
<script>
    (function ($) {
        'use strict';
        $(function () {
            $('.file-upload-browse').on('click', function () {
                var file = $(this).parent().parent().parent().find('.file-upload-default');
                file.trigger('click');
            });
            $('.file-upload-default').on('change', function () {
                $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
            });
        });
    })(jQuery);
</script>
<!-- End custom js for this page-->
</body>
</html>
