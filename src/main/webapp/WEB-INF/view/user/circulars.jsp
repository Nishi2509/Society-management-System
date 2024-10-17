<%@ page contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>User | Criculars</title>
<!-- base:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css" />
<!-- endinject -->
<!-- plugin css for this page -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/adminResources/css/dataTables.bootstrap4.css" />
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/adminResources/css/style.css" />
<!-- endinject -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/adminResources/image/favicon.png" />
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

<body >
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->


		<jsp:include page="header.jsp" />

		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->

			<jsp:include page="menu.jsp" />

			<%-- <%@taglib prefix="f" uri="http://www.springframework.org/tags/form"
        %>--%>


			<%--        Owner Edit Model Starts--%>

			<!-- partial -->

			<div class="main-panel">
				<div class="content-wrapper">
					<h3 class="main-title d-flex align-items-center"> <i class="mdi mdi-clipboard-text-outline icon-md mr-2 mt-1 " ></i>Circulars</h3>
					<div class="d-flex justify-content-between align-content-center"
						style="margin-bottom: 20px">
						<nav aria-label="breadcrumb d-flex align-content-center"
							class="bread">
							<ol class="breadcrumb border-0 p-0 d-flex align-content-center">
								<li class="breadcrumb-item"><a href="index">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">
									Circulars</li>
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
													<th>Category</th>
													<th>description</th>
													<th>From / To</th>
													<th>Circular Attachments</th>
												</tr>
											</thead>
											<tbody id="member-table-view">
												<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
												<c:forEach items="${circularList}" var="i" varStatus="j">
													<tr>

														<td>${j.count}</td>
														<td>${i.category}</td>
														<td><p class="a">${i.circularDescription}</p></td>
														<td>${i.circularFromDate} / ${i.circularFromTo}</td>
														<td><a class="nav-link" href="<%=request.getContextPath()%>/documents/circularAttachments/${i.circularAttactments}" download><i
																class="mdi mdi-link-variant menu-icon"></i>
														</a></td>
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
		src="<%=request.getContextPath()%>/adminResources/js/manageCircularsUser.js"></script>
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
