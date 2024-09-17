<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="description" content="POS - Bootstrap Admin Template">
<meta name="keywords"
	content="admin, estimates, bootstrap, business, corporate, creative, invoice, html5, responsive, Projects">
<meta name="author" content="Dreamguys - Bootstrap Admin Template">
<meta name="robots" content="noindex, nofollow">
<title>Danh sách sản phẩm</title>

<link rel="shortcut icon" type="image/x-icon"
	href="assets/form/asset/img/favicon.png">

<link rel="stylesheet" href="assets/form/asset/css/bootstrap.min.css">

<link rel="stylesheet"
	href="assets/form/asset/css/bootstrap-datetimepicker.min.css">

<link rel="stylesheet" href="assets/form/asset/css/animate.css">

<link rel="stylesheet"
	href="assets/form/asset/css/bootstrap-datetimepicker.min.css">

<link rel="stylesheet" href="assets/form/asset/plugins/select2/css/select2.min.css">

<link rel="stylesheet" href="assets/form/asset/css/dataTables.bootstrap4.min.css">

<link rel="stylesheet"
	href="assets/form/asset/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/form/asset/plugins/fontawesome/css/all.min.css">

<link rel="stylesheet" href="assets/form/asset/css/style.css">
</head>
<body>
	<div id="global-loader">
		<div class="whirly-loader"></div>
	</div>

		<div class="page-wrapper">
			<div class="content">
				<div class="page-header">
					<div class="page-title">
						<h4>Purchase order report</h4>
						<h6>Manage your Purchase order report</h6>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<div class="table-top">
							<div class="search-set">
								<div class="search-path">
									<a class="btn btn-filter" id="filter_search"> <img
										src="assets/form/asset/img/icons/filter.svg" alt="img"> <span><img
											src="assets/form/asset/img/icons/closes.svg" alt="img"></span>
									</a>
								</div>
								<div class="search-input">
									<a class="btn btn-searchset"><img
										src="assets/form/asset/img/icons/search-white.svg" alt="img"></a>
								</div>
							</div>
							<c:if test="${info!=null}"></c:if>
							<div>
								<h2>${info}</h2>
							</div>
							<div class="wordset">
								<ul>
									<li><a data-bs-toggle="tooltip" data-bs-placement="top" href="uploadsanpham">Thêm Sản Phẩm</a>
									</li>
									<li><a data-bs-toggle="tooltip" data-bs-placement="top" href="uploadsanpham">Cập Nhật Sản Phẩm</a></li>
									<li><a href="GetProducts?masp${p.masp}" data-bs-toggle="tooltip" data-bs-placement="top">Xóa Sản Phẩm</a></li>
								</ul>
							</div>
						</div>

						<div class="card" id="filter_inputs">
							<div class="card-body pb-0">
								<div class="row">
									<div class="col-lg-2 col-sm-6 col-12">
										<div class="form-group">
											<div class="input-groupicon">
												<input type="text" placeholder="From Date"
													class="datetimepicker">
												<div class="addonset">
													<img src="assets/form/asset/img/icons/calendars.svg" alt="img">
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-sm-6 col-12">
										<div class="form-group">
											<div class="input-groupicon">
												<input type="text" placeholder="To Date"
													class="datetimepicker">
												<div class="addonset">
													<img src="assets/form/asset/img/icons/calendars.svg" alt="img">
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-sm-6 col-12">
										<div class="form-group">
											<select class="select">
												<option>Choose Suppliers</option>
												<option>Suppliers</option>
											</select>
										</div>
									</div>
									<div class="col-lg-1 col-sm-6 col-12 ms-auto">
										<div class="form-group">
											<a class="btn btn-filters ms-auto"><img
												src="assets/form/asset/img/icons/search-whites.svg" alt="img"></a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="table-responsive">
							<table class="table datanew">
								<thead>
									<tr>
										<th><label class="checkboxs"> <input
												type="checkbox" id="select-all"> <span
												class="checkmarks"></span>
										</label></th>
										<th>Mã Sản Phẩm</th>
										<th>Tên Sản Phẩm</th>
										<th>Hình ảnh</th>
										<th>Giá Gốc</th>
										<th>Giá Tiền Khuyến Mãi</th>
										<th>Khuyến Mãi</th>
										<th>Màn Hình</th>
										<th>Hệ Điều Hành</th>
										<th>Camera sau</th>
										<th>Camera trước</th>
										<th>CPU</th>
										<th>Ram</th>
										<th>Bộ nhớ trong</th>
										<th>Thẻ nhớ</th>
										<th>Dung Lượng Pin</th>
										<th>Mã hàng</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${products}" var="p">
																	<tr>
										<td><label class="checkboxs"> <input
												type="checkbox"> <span class="checkmarks"></span>
										</label></td>
										<%-- <td class="productimgname"><a class="product-img"> <img
												value ="hinhanh" alt="product">
										</a> <a href="javascript:void(0);">${p.tensp}</a></td> --%>
										<td>${p.masp}</td>
										<td>${p.tensp}</td>
										<td>${p.hinhanh}</td>
										<td>${p.giatiengoc}</td>
										<td>${p.giatienkm}</td>
										<td>${p.khuyenmai}</td>
										<td>${p.manhinh}</td>
										<td>${p.hedieuhanh}</td>
										<td>${p.camera_sau}</td>
										<td>${p.camera_truoc}</td>
										<td>${p.cpu}</td>
										<td>${p.ram}</td>
										<td>${p.bonhotrong}</td>
										<td>${p.thenho}</td>
										<td>${p.dungluongpin}</td>
										<td>${p.mahang}</td>
									</tr> 
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="searchpart">
			<div class="searchcontent">
				<div class="searchhead">
					<h3>Search</h3>
					<a id="closesearch"><i class="fa fa-times-circle"
						aria-hidden="true"></i></a>
				</div>
				<div class="searchcontents">
					<div class="searchparts">
						<input type="text" placeholder="search here"> <a
							class="btn btn-searchs">Search</a>
					</div>
					<div class="recentsearch">
						<h2>Recent Search</h2>
						<ul>
							<li>
								<h6>
									<i class="fa fa-search me-2"></i> Settings
								</h6>
							</li>
							<li>
								<h6>
									<i class="fa fa-search me-2"></i> Report
								</h6>
							</li>
							<li>
								<h6>
									<i class="fa fa-search me-2"></i> Invoice
								</h6>
							</li>
							<li>
								<h6>
									<i class="fa fa-search me-2"></i> Sales
								</h6>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/form/asset/js/jquery-3.6.0.min.js"></script>

	<script src="assets/form/asset/js/feather.min.js"></script>

	<script src="assets/form/asset/js/jquery.slimscroll.min.js"></script>

	<script src="assets/form/asset/js/jquery.dataTables.min.js"></script>
	<script src="assets/form/asset/js/dataTables.bootstrap4.min.js"></script>


	<script src="assets/form/asset/js/bootstrap.bundle.min.js"></script>

	<script src="assets/form/asset/js/moment.min.js"></script>
	<script src="assets/form/asset/js/bootstrap-datetimepicker.min.js"></script>

	<script src="assets/form/asset/plugins/select2/js/select2.min.js"></script>

	<script src="assets/form/asset/js/moment.min.js"></script>
	<script src="assets/form/asset/js/bootstrap-datetimepicker.min.js"></script>

	<script src="assets/form/asset/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="assets/form/asset/plugins/sweetalert/sweetalerts.min.js"></script>

	<script src="assets/form/asset/js/script.js"></script>
</body>
</html>