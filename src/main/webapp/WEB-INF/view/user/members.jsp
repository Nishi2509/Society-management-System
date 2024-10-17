<%@ page contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>User | Members</title>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/adminResources/css/dropify.min.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/adminResources/css/custom/memberValidation.css"/>
          <style>input[type=file]::file-selector-button {
            margin-right: 20px;
            border: none;
            background: #7571f9;
            padding: 0.45rem 1.25rem;
            color: #fff;
            cursor: pointer;
            font-size: 0.875rem;
            font-weight: 500;
            transition: background .2s ease-in-out;
          }
          
          input[type=file]::file-selector-button:hover {
            background: #514cf7;
          }</style>
</head>

<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->

    <jsp:include page="../user/header.jsp"/>

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->

        <jsp:include page="../user/menu.jsp"/>

        <%-- <%@taglib prefix="f" uri="http://www.springframework.org/tags/form"
%>--%>
        <%--        Member Edit Model Start--%>

        <div class="modal fade" id="exampleModal-edit" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabelEdit">Edit Member</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyEditForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="updateMember" method="post" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <div class="col-lg-12">
                                    <label for="member-name" class="col-form-label">Member
                                        Name : </label> <input type="hidden" class="form-control"
                                                               id="member-id" name="memberId"/> <input type="text"
                                                                                                       class="form-control"
                                                                                                       id="member-name"
                                                                                                       name="memberName"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-lg-12">
                                    <label for="member-phone" class="col-form-label">Member
                                        Phone No: </label> <input type="text" class="form-control"
                                                                  id="member-phone" name="memberPhone"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-lg-12">
                                    <label for="member-email" class="col-form-label">Member
                                        Email Address: </label> <input type="text" class="form-control"
                                                                       id="member-email" name="memberEmail"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label class="m-0">File upload</label>
                                        <input type="file" name="memberFile" class="file-upload-default">
                                        <div class="input-group col-xs-12">
                                            <input type="text" class="form-control file-upload-info" disabled="" placeholder="Upload Image">
                                            <span class="input-group-append">
                          <button class="file-upload-browse btn btn-sm btn-primary" type="button">Upload</button>
                        </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit">Update</button>
                        <button type="button" class="btn btn-light" data-dismiss="modal"
                                onclick="emptyForm()">Close
                        </button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <%--        Member edit Model End--%>


        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

        <!-- Modal starts -->

        <div class="modal fade" id="exampleModal-3" tabindex="-1"
             role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">Add Members</h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="emptyAddMemberForm()">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body ">
                        <form method="post" action="saveMembers"
                              enctype="multipart/form-data"
                              onsubmit="return false;">
                            <div class="row mb-3">
                                <div class="col-lg-4">
                                    <label class="col-form-label" style="font-weight: 700" for="member-form-name">Member
                                        Name : </label>
                                        <input class="form-control"
                    
                                           placeholder="Type Member Name"
                                           id="member-form-name" />

                             <span id="memberName1-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Member Name !</span>
                             <span id="memberName2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Member Name!</span>
                             
                                </div>
                                <div class="col-lg-4">
                                    <label class="col-form-label" style="font-weight: 700" for="member-form-phone">Member
                                        PhoneNo: </label>
                                        
                                    <input class="form-control" placeholder="Type Member Phone"
                                    id="member-form-phone"/>
                                    
                                 <span id="memberPhone1-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Member Phone no !</span>
                                 <span id="memberPhone2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Member Phone no !</span>
                                </div>
                                <div class="col-lg-3 mb-1">
                                    <label class="col-form-label" style="font-weight: 700" for="member-form-email">Member
                                        Email Address: </label>
                                        <div class="inputcontainer">
                                            <input type="text" placeholder="Type Member Email Address" 
                                            id="member-form-email" class="form-control used-email" placeholder="type me"/>
                                            <div class="icon-container"  id="email-inp-loader">
                                              <i class="loader"></i>
                                            </div>
                                          </div>
                                        <span id="memberEmail1-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Member Email !</span>
                                        <span id="memberEmail2-warning" style="color: #dc3545;font-size:12px;display: none">Please Enter Valid Email Address !</span>
                                        <span id="memberEmail3-warning" style="color: #dc3545;font-size:12px;display: none">Email Entered is already in use !</span>
                                 
                                </div>
                                <div class="col-lg-1 " style="padding-top: 1.7rem;">
                                    <button class="btn btn-primary" type="button" style="padding: 0.45rem 1.25rem;"
                                            id="add-member-submit" onclick="addMemberToTable()">Add
                                    </button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12" style="height: 200px; max-height: 220px">
                                    <div class="table-responsive"
                                         style="max-height: 100% !important; scrollbar-width: thin">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th>Sr.No</th>
                                                <th>Member Name</th>
                                                <th>Member Phone No</th>
                                                <th>Member Email Address</th>
                                                <th>Member Photo Image File</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody id="member-table">
                                                    <tr><td colspan="6"  ><div style="display: flex; justify-content: center; align-items: center; padding: 5rem 0rem;"><p> Add Memebers</p></div></td></tr> 
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="house-numbers-label"></div>
                            <div class="row">
                                <div class="col-lg-12" id="house-numbers-ownwers"></div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit" onclick="checkMemberDetialsInTable()"
                                id="submit-model">Submit
                        </button>
                        <button type="button" class="btn btn-light" data-dismiss="modal"
                                onclick="emptyAddMemberForm()">Close
                        </button>
                    </div>
                </div>
                </form>
            </div>
        </div>

        <!-- Modal Ends -->

        <!-- partial -->

        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-6"><h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-account-multiple icon-md mr-2 mt-1 " ></i>Members</h3>
                        <nav aria-label="breadcrumb d-flex align-content-center"
                             class="bread">
                            <ol class="breadcrumb border-0 p-0 d-flex align-content-center">
                                <li class="breadcrumb-item"><a href="index">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Members
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-6 d-flex justify-content-end"
                         style="">

                        <button type="button" class="btn btn-primary btn-sm"
                                data-toggle="modal" data-target="#exampleModal-3"
                                style="padding: 0.282rem 1rem !important; height: 2.55rem">Add Members
                        </button>
                    </div>
                </div>


                <div class="accordion" id="accordion" role="tablist">


                    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
                    <c:forEach items="${memberList}" var="i" varStatus="j">

                        <div class="card">
                            <div class="card-header" role="tab" id="heading-3-${j.count}">
                                <h6 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse"
                                       href="#collapse-3-${j.count}" aria-expanded="false"
                                       aria-controls="collapse-3">${j.count}) ${i.memberName} </a>
                                </h6>
                            </div>
                            <div id="collapse-3-${j.count}" class="collapse" role="tabpanel"
                                 aria-labelledby="heading-3-${j.count}" data-parent="#accordion"
                                 style="">

                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img
                                                    src="<%=request.getContextPath()%>/documents/memberPhotos/${i.fileName}"
                                                    alt="${i.memberName}" style="height: 100px;width: 100px"
                                                    class="mw-100">
                                        </div>
                                        <div class="col-md-10">
                                            <div class="row mb-2">
                                                <div class="col-3" style="font-weight: 700">Phone Number :</div>
                                                <div class="col-8">${i.memberPhoneNo}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-3" style="font-weight: 700">Email Address :</div>
                                                <div class="col-8">${i.memberEmail}</div>
                                            </div>
                                            <div class="row mb-2 mt-3">
                                                <div class="col-md-3">
                                                    <button class="btn btn-sm btn-outline-info mr-1"
                                                            data-toggle="modal"
                                                            data-target="#exampleModal-edit"
                                                            onclick="editMember(${i.id})">Edit
                                                    </button>
                                                    <a
                                                            href="deleteMember/${i.id}">
                                                        <button class="btn btn-sm btn-outline-danger ml-1"
                                                                data-toggle="modal" data-target="#exampleModal-3">
                                                            Delete
                                                        </button>
                                                    </a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>


            </div>
        </div>
    </div>
    <!-- content-wrapper ends -->
    <!-- partial:../../partials/_footer.html -->

    <jsp:include page="footer.jsp"></jsp:include>

    <!-- partial -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- base:js -->
<script
        src="<%=request.getContextPath()%>/adminResources/js/manageMember.js"></script>
<script
        src="<%=request.getContextPath()%>/adminResources/js/userOnloadEvents.js"></script><script
        src="<%=request.getContextPath()%>/adminResources/js/jquery-3.7.0.min.js"></script>
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
    <script
            src="<%=request.getContextPath()%>/adminResources/js/dropify.js"></script>
<script>
    // (function ($) {
    //     'use strict';
    //     $(function () {
    //         $('.file-upload-browse').on('click', function () {
    //             var file = $(this).parent().parent().parent().find('.file-upload-default');
    //             file.trigger('click');
    //         });
    //         $('.file-upload-default').on('change', function () {
    //             $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
    //         });
    //     });
    // })(jQuery);
</script>
<!-- End custom js for this page-->
</body>
</html>
