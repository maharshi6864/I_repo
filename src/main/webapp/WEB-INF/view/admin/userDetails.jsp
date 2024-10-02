<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>I-Repo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="Premium Multipurpose Admin & Dashboard Template"
	name="description" />
<meta content="Themesbrand" name="author" />
<!-- App favicon -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/adminResource/images/favicon.ico" />

<!-- DataTables -->
<link
	href="<%=request.getContextPath()%>/adminResource/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />

<!-- Responsive datatable examples -->
<link
	href="<%=request.getContextPath()%>/adminResource/css/responsive.bootstrap4.min.css"
	rel="stylesheet" type="text/css" />

<!-- Bootstrap Css -->
<link
	href="<%=request.getContextPath()%>/adminResource/css/bootstrap.min.css"
	id="bootstrap-style" rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link
	href="<%=request.getContextPath()%>/adminResource/css/icons.min.css"
	rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="<%=request.getContextPath()%>/adminResource/css/app.min.css"
	id="app-style" rel="stylesheet" type="text/css" />
<!-- App js -->
<script src="<%=request.getContextPath()%>/adminResource/js/plugin.js"></script>
</head>

<body data-sidebar="dark">

	<!-- Begin page -->
	<div id="layout-wrapper">

		<jsp:include page="header.jsp"></jsp:include>


		<jsp:include page="menu.jsp"></jsp:include>

		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">
					<!-- start page title -->
					<div class="row">
						<div class="col-12">
							<div
								class="page-title-box d-flex align-items-center justify-content-between">
								<h4 class="mb-0 font-size-18">User Details</h4>

								<div class="page-title-right">
									<ol class="breadcrumb m-0">
										<li class="breadcrumb-item"><a
											href="javascript: void(0);">User Details</a></li>
										<li class="breadcrumb-item active">User Details</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
					<!-- end page title -->

					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div class="row mb-2">
										<div class="col-sm">
											<div class="search-box me-2 d-inline-block">
												<div class="position-relative">
													<input type="text" class="form-control" autocomplete="off"
														id="searchTableList" placeholder="Search..."> <i
														class="bx bx-search-alt search-icon"></i>
												</div>
											</div>
										</div>
										<!-- end col -->
										<div class="col-sm-auto">
											<div class="text-sm-end">
												<a href="projects-create.html"
													class="btn btn-success btn-rounded" id="addProject-btn"><i
													class="mdi mdi-plus me-1"></i> Add New User</a>
											</div>
										</div>
										<!-- end col -->
									</div>
									<!-- end row -->
									<div class="">
										<div class="table-responsive">
											<table
												class="table project-list-table align-middle table-nowrap dt-responsive nowrap w-100 table-borderless"
												id="projectList-table">
												<thead class="table-light">
													<tr>
														<th scope="col" style="width: 60px">#</th>
														<th scope="col">Name</th>
														<th scope="col">Email Address</th>
														<th scope="col">Status</th>
														<th scope="col">Space Allocated (GB)</th>
														<th scope="col">Action</th>
													</tr>
												</thead>
												<tbody>
													<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
													<c:forEach items="${userList}" var="i" varStatus="j">
														<tr class="odd">
															<td class="dtr-control sorting_1" tabindex="0">${j.count}</td>
															<td><div>
																	<h5 class="text-truncate font-size-14">${i.name}</h5>
																</div></td>
															<td>${i.loginVo.username}</td>
															<td><c:if test="${i.loginVo.enabled eq '0' }">
																	<span class="badge bg-danger">Blocked</span>
																</c:if> <c:if test="${i.loginVo.enabled eq '1' }">
																	<span class="badge bg-success">Active</span>
																</c:if></td>
															<td><div class="input-group" style="width: 130px">
																	<input class="form-control p-2 fs-5" type="text"
																		id="inp-size-${i.id}"
																		onkeyup="sizeChanged('${i.id}','${i.sizeAllocated}')"
																		value="${i.sizeAllocated}" placeholder="Enter Number"
																		style="width: 65%">
																	<button class="btn btn-primary" type="button"
																		id="but-size-${i.id}" disabled style="width: 35%"
																		onclick="setSize('${i.id}')">
																		<i class="mdi mdi-check-bold fs-5"></i>
																	</button>
																</div></td>
															<td><div class="dropdown">
																	<a href="#" class="dropdown-toggle card-drop"
																		data-bs-toggle="dropdown" aria-expanded="false"> <i
																		class="mdi mdi-dots-horizontal font-size-18"></i>
																	</a>
																	<ul class="dropdown-menu dropdown-menu-end">
																		<li><a href="projects-create.html"
																			class="dropdown-item edit-list" data-edit-id="7"><i
																				class="mdi mdi-pencil font-size-16 text-success me-1"></i>
																				Edit</a></li>
																		<li><a href="#removeItemModal"
																			data-bs-toggle="modal"
																			class="dropdown-item remove-list" data-remove-id="7"><i
																				class="mdi mdi-trash-can font-size-16 text-danger me-1"></i>
																				Remove</a></li>
																	</ul>
																</div></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- end card -->
						</div>
					</div>
					<!-- end row -->

				</div>
				<!-- container-fluid -->
			</div>
			<!-- End Page-content -->

			<!-- Modal -->
			<div class="modal fade" id="removeItemModal" tabindex="-1"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-sm">
					<div class="modal-content">
						<div class="modal-body px-4 py-5 text-center">
							<button type="button"
								class="btn-close position-absolute end-0 top-0 m-3"
								data-bs-dismiss="modal" aria-label="Close"></button>
							<div class="avatar-sm mb-4 mx-auto">
								<div
									class="avatar-title bg-primary text-primary bg-opacity-10 font-size-20 rounded-3">
									<i class="mdi mdi-trash-can-outline"></i>
								</div>
							</div>
							<p class="text-muted font-size-16 mb-4">Are you Sure You want
								to Remove this Order ?</p>

							<div class="hstack gap-2 justify-content-center mb-0">
								<button type="button" class="btn btn-danger" id="remove-item">Remove
									Now</button>
								<button type="button" class="btn btn-secondary"
									id="close-removeProjectModal" data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end removeItemModal -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		<!-- end main content-->
	</div>
	<!-- END layout-wrapper -->

	<!-- Right Sidebar -->

	<!-- /Right-bar -->

	<!-- Right bar overlay-->

	<!-- JAVASCRIPT -->
	<script
		src="<%=request.getContextPath()%>/adminResource/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/adminResource/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/adminResource/js/metisMenu.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/adminResource/js/simplebar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/adminResource/js/waves.min.js"></script>

	<!-- apexcharts -->
	<script
		src="<%=request.getContextPath()%>/adminResource/js/apexcharts.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/adminResource/js/dashboard.init.js"></script>

	<!-- file-manager js -->
	<script
		src="<%=request.getContextPath()%>/adminResource/js/file-manager.init.js"></script>

	<script src="<%=request.getContextPath()%>/adminResource/js/app.js"></script>
	<!-- Required datatable js -->
	<script
		src="<%=request.getContextPath()%>/adminResource/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/adminResource/js/dataTables.bootstrap4.min.js"></script>

	<!-- Responsive examples -->
	<script
		src="<%=request.getContextPath()%>/adminResource/js/dataTables.responsive.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/adminResource/js/responsive.bootstrap4.min.js"></script>
	<!-- custom admin dashboard js -->
	<script
		src="<%=request.getContextPath()%>/adminResource/js/custom/admin/userDetails.js"></script>

</body>

</html>