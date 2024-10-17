<%@ page contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Admin | Index</title>
<!-- base:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/adminResources/css/materialdesignicons.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/adminResources/css/vendor.bundle.base.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/adminResources/css/fontAwesome/font-awesome.min.css" />
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
</head>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->

		<jsp:include page="header.jsp" />

		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->

			<jsp:include page="menu.jsp" />


			<!-- partial -->

			<div class="main-panel">
				<div class="content-wrapper">

					<div class="dashboard-header d-flex flex-column grid-margin">
						<div
							class="d-flex align-items-center justify-content-between flex-wrap">
							<div class="d-flex align-items-center">
								<h3 class="main-title d-flex align-items-center">
									<i class="mdi mdi-airplay icon-md mr-2 mt-1 "></i>Dashboard
								</h3>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-xl-12 grid-margin">
							<div class="card ">
								<div class="card-header pb-3 pt-3">
									<h6 class="card-title mb-3">Maintenance Report</h6>
									<div class="row">
										<div class="col-md-4">
											<select name="" id="das-year"
												onchange="getOwnerPaidAndUnpaid()" class="form-control">
											</select>
										</div>
										<div class="col-md-4">
											<select class="form-control text-left" id="das-month"
												onchange="getOwnerPaidAndUnpaid()">
												<option value="January">January</option>
												<option value="February">February</option>
												<option value="March">March</option>
												<option value="April">April</option>
												<option value="May">May</option>
												<option value="June">June</option>
												<option value="July">July</option>
												<option value="August">August</option>
												<option value="September">September</option>
												<option value="October">October</option>
												<option value="November">November</option>
												<option value="December">December</option>
											</select>
										</div>
										<div class="col-md-4">
											<select name="" id="das-block"
												onchange="getOwnerPaidAndUnpaid()" class="form-control">
												<option value="none" disabled>Select Block</option>
											</select>
										</div>
									</div>
								</div>


								<div class="card-body p-0">
									<div class="row p-0  pr-2 pl-2" style="">
										<div class="col-md-8  border-right pt-3 border-bottom"
											id="container">
											<input type="hidden" name="yvalue" /> <input type="hidden"
												name="xvalue" />
										</div>
										<div class="col-md-4 ">
											<div class="row" style="height: 400px">
												<div
													class="col-md-6 d-flex align-items-center border-bottom  justify-content-center p-0">
													<div
														class="d-flex align-items-center justify-content-md-center  mb-2 mb-md-0">
														<i class="mdi mdi-account icon-md mr-3 text-success "></i>
														<div>
															<p class="mb-1">House Owners</p>
															<div class="d-flex align-items-center">
																<h4 class="mb-0 mr-2 font-weight-bold" id="total-owners">
																	0000</h4>
															</div>
														</div>
													</div>
												</div>
												<div
													class="col-md-6 d-flex align-items-center border-bottom justify-content-center">
													<div
														class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0">
														<i class="fa fa-minus-circle icon-md mr-3 text-danger"></i>
														<div>
															<p class="mb-1">Unsold Houses</p>
															<div class="d-flex align-items-center">
																<h4 class="mb-0 mr-2 font-weight-bold" id="unsold-house">
																	0000</h4>
															</div>
														</div>
													</div>
												</div>
												<div
													class="col-md-6 d-flex align-items-center border-bottom justify-content-center">
													<div
														class="d-flex align-items-center justify-content-center mb-2 mb-md-0">
														<i class="mdi mdi-motorbike icon-md mr-3 text-primary"></i>
														<div>
															<p class="mb-1">Two Wheelers</p>
															<div class="d-flex align-items-center">
																<h4 class="mb-0 mr-2 font-weight-bold" id="two-wheelers">
																	0000</h4>
															</div>
														</div>
													</div>
												</div>
												<div
													class="col-md-6 d-flex align-items-center border-bottom justify-content-center">
													<div
														class="d-flex align-items-center justify-content-md-center mt-2 mt-md-0">
														<i class="mdi mdi-car icon-md mr-3 text-primary"></i>
														<div>
															<p class="mb-1">Four Wheelers</p>
															<div class="d-flex align-items-center">
																<h4 class="mb-0 mr-2 font-weight-bold"
																	id="four-wheelers">0000</h4>
															</div>
														</div>
													</div>
												</div>

												<div
													class="col-md-12 d-flex align-items-center border-bottom justify-content-center">
													<div
														class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0 mt-2 mt-md-0">
														<i class="fa fa-home icon-md mr-3 text-info"></i>
														<div>
															<p class="mb-1">Total Houses</p>
															<div class="d-flex align-items-center">
																<h4 class="mb-0 mr-2 font-weight-bold" id="total-houses">
																	0000</h4>
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


					<div class="row">
						<div class="col-xl-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-6 border-right">
											<div class="row" style="height: 300px;">
												<div
													class="col-md-12 d-flex justify-content-center align-items-center border-bottom">
													<div
														class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0 mt-2 mt-md-0">
														<i class="fa fa-star icon-md mr-3 " style="color: #ffd700"></i>
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
													class="col-md-12 d-flex justify-content-center align-items-center border-bottom">
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
													class="col-md-12 d-flex justify-content-center align-items-center border-bottom">
													<div
														class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0 mt-2 mt-md-0">
														<i class="mdi mdi-content-paste icon-md mr-3 "
															style="color: #008dd4"></i>
														<div>
															<p class="mb-1">Circulars</p>
															<div class="d-flex align-items-center">
																<h4 class="mb-0 mr-2 font-weight-bold"
																	id="circulars-display">0000</h4>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="row"
												style="height: 300px; display: flex; justify-content: space-around">
												<div
													class="col-md-6 d-flex justify-content-center border-bottom align-items-center">
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
													class="col-md-6 d-flex justify-content-center align-items-center border-bottom">
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
												<div class="row">
													<div
														class="col-md-12 d-flex justify-content-center align-items-center border-bottom">
														<div
															class="d-flex align-items-center justify-content-md-center mb-2 mb-md-0 mt-2 mt-md-0">
															<i class="mdi mdi-motorbike icon-md text-primary"></i> <i
																class="mdi mdi-car icon-md mr-3 text-primary "></i>
															<div>
																<p class="mb-1">Total Vehicles</p>
																<div class="d-flex align-items-center">
																	<h4 class="mb-0 mr-2 font-weight-bold"
																		id="totalVehicles-display">0000</h4>
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


				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->

				<!-- partial -->
				<jsp:include page="../user/footer.jsp"></jsp:include>
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

	<script
		src="<%=request.getContextPath()%>/adminResources/js/vendor.bundle.base.js"></script>


	<script
		src="<%=request.getContextPath()%>/adminResources/js/dashBoardAdmin.js"></script>
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
	<script
		src="<%=request.getContextPath()%>/adminResources/js/highcharts.js"></script>
	<script
		src="<%=request.getContextPath()%>/adminResources/js/exporting.js"></script>
</body>
</html>
