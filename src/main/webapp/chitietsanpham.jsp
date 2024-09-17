<%@page import="com.google.gson.Gson"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thế giới điện thoại</title>
<link rel="shortcut icon" href="assets/image/favicon.ico" />
<script src="https://kit.fontawesome.com/e3729928c9.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet" href="assets/css/index.css">
<link rel="stylesheet" href="assets/css/chitietsanpham.css">

</head>

<body>
	<header>
			<section class="header1">
				<div class="social-top-nav">
					<a class="fa fa-facebook" style="color: gray;"></a> <a
						class="fa fa-twitter" style="color: gray;"></a> <a
						class="fa fa-google" style="color: gray;"></a> <a
						class="fa fa-youtube" style="color: gray;"></a>
				</div>
				<ul class="top-nav-quicklink flexContain">
					<li><a href="index.jsp"><i class="fa fa-home"></i> Trang
							chủ</a></li>
					<li><a href="uploadsanpham"><i class="fa-solid fa-circle-plus"></i>
							Thêm sản phẩm</a></li>
					<li><a href="tuyendung.html"><i class="fa fa-handshake-o"></i>
							Tuyển dụng</a></li>
					<li><a href="gioithieu.html"><i class="fa fa-info-circle"></i>
							Giới thiệu</a></li>
					<li><a href="trungtambaohanh.html"><i class="fa fa-wrench"></i>
							Bảo hành</a></li>
					<li><a href="lienhe.html"><i class="fa fa-phone"></i> Liên
							hệ</a></li>
				</ul>
			</section>

			<section class="header2">
				<div class="logo" style="margin-left: 20px;">
					<a href="index.jsp"> <img src="assets/image/logo.jpg"
						style="width: 250px; height: 60px;"
						alt="Trang chủ Smartphone Store"
						title="Trang chủ Smartphone Store">
					</a>
				</div>

				<div class="search-header">
					<form class="input-search" method="get" action="index.jsp">
						<div class="autocomplete">
							<input id="search-box" name="tensp" autocomplete="off"
								type="text" placeholder="Nhập từ khóa tìm kiếm...">
							<button type="submit">
								<i class="fa fa-search"></i> Tìm kiếm
							</button>
						</div>
					</form>
				</div>
				<div class="tools-member">
					<%
					Cookie[] cookies1 = request.getCookies();
					Boolean test = false;
					for (Cookie cookie : cookies1) {
						if (cookie.getName().equals("user")) {
							test = true;
					%>
					<div class="member">
						<a href="dangnhap.jsp"> <i class="fa fa-user"></i> <%=cookie.getValue()%>
						</a>
					</div>
					<%
					}
					}
					if (test == false) {
					%>
					<tr>
						<div class="member">
							<a href="dangnhap.jsp"> <i class="fa fa-user"></i> Tài khoản
							</a>
						</div>
					</tr>
					<%
					}
					%>


					<%@include file="CART.jsp"%>
					<%
					Cookie[] cookies3 = request.getCookies();
					CART cart = null;
					if (cookies3!=null)
					for (Cookie cookie : cookies3) {
						if (cookie.getName().equals("cart")) {
							String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
							Gson gson = new Gson();
							cart = gson.fromJson(value, CART.class);
						}
					}
					%>


					<div class="cart">
						<a href="Giohang.jsp"> <i class="fa fa-shopping-cart"
							style="padding: 10px 10.5px;"></i> <span>Giỏ hàng</span> <%
 if (cart != null) {
 %> <span
							style="position: relative; top: 19px; left: -86px; background: green; color: white; padding: 2px 9px; border-radius: 50%;"
							class="cart-number"><%=cart.tongsp()%></span> <%
 } else
 %> <span class="cart-number"></span>
						</a>
					</div>
				</div>
			</section>
		</header>

	<hr
		style="color: #ddd; background-color: #ddd; border-top: 1px solid #ddd; width: 1173px; margin: 56px auto 0;">
	<div class="content" style="margin-top: 32px;">



		<!--     --- -->
		<%@include file="SQLSEVERDataAccess.jsp"%>
		<%!SQLSEVERDataAccess conn = new SQLSEVERDataAccess();%>
		<%
		try {
			String MaSanPham = request.getParameter("masp");
			ResultSet rs = conn.getResultSet("select * , FORMAT(GIATIENKM,'#,###'),FORMAT(GIATIENGOC- GIATIENKM,'#,###') from tbSANPHAM where MASP=" + MaSanPham);
			rs.next();
		%>
		<div class="chitietSanpham" style="margin-bottom: 100px">
			<h1><%=rs.getString(2)%></h1>
			<div class="rating">
				<i class="fa fa-star"></i><i class="fa fa-star"></i><i
					class="fa fa-star"></i><i class="fa fa-star"></i><i
					class="fa fa-star"></i><span> 9999 đánh giá</span>
			</div>
			<div class="rowdetail group">
				<div class="picture">
					<img src="assets/image/<%=rs.getString(3)%>" alt="">
				</div>
				<div class="price_sale">
					<div class="area_price">
						<strong><%=rs.getString(17)%>₫</strong> <label class="giamgia" style="padding-bottom: 22px;">
							<i class="fa fa-bolt"></i> Giảm <%=rs.getString(18)%>₫
						</label>
					</div>
					<div class="ship" style="display: none;">
						<img src="assets/image/clock-152067_960_720.png" alt="">
						<div>NHẬN HÀNG TRONG 1 GIỜ</div>
					</div>
					<div class="area_promo">
						<strong>khuyến mãi</strong>
						<div class="promo">
							<img src="assets/image/icon-tick.png" alt="">
							<div id="detailPromo"><%=rs.getString(6)%></div>
						</div>
					</div>
					<div class="policy">
						<div>
							<img src="assets/image/box.png" alt="">
							<p>Trong hộp có: Sạc, Tai nghe, Sách hướng dẫn, Cây lấy sim,
								Ốp lưng</p>
						</div>
						<div>
							<img src="assets/image/icon-baohanh.png" alt="">
							<p>Bảo hành chính hãng 12 tháng.</p>
						</div>
						<div class="last">
							<img src="assets/image/1-1.jpg" alt="">
							<p>1 đổi 1 trong 1 tháng nếu lỗi, đổi sản phẩm tại nhà trong
								1 ngày.</p>
						</div>
					</div>
					<div class="area_order">
						<!-- nameProduct là biến toàn cục được khởi tạo giá trị trong phanTich_URL_chiTietSanPham -->
						<a class="buy_now"
							href="doGiohang?themid=<%=rs.getInt(1)%>"> <b><i
								class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</b>
							<p>Giao trong 1 giờ hoặc nhận tại cửa hàng</p>
						</a>
					</div>
				</div>
				<div class="info_product">
					<h2>Thông số kỹ thuật</h2>
					<ul class="info">
						<li>
							<p>Màn hình</p>
							<div><%=rs.getString(7)%></div>
						</li>
						<li>
							<p>Hệ điều hành</p>
							<div><%=rs.getString(8)%></div>
						</li>
						<li>
							<p>Camara sau</p>
							<div><%=rs.getString(9)%></div>
						</li>
						<li>
							<p>Camara trước</p>
							<div><%=rs.getString(10)%></div>
						</li>
						<li>
							<p>CPU</p>
							<div><%=rs.getString(11)%></div>
						</li>
						<li>
							<p>RAM</p>
							<div><%=rs.getInt(12)%>
								GB
							</div>
						</li>
						<li>
							<p>Bộ nhớ trong</p>
							<div><%=rs.getInt(13)%>
								GB
							</div>
						</li>
						<li>
							<p>Thẻ nhớ</p>
							<div><%=rs.getString(14)%></div>
						</li>
						<li>
							<p>Dung lượng pin</p>
							<div><%=rs.getInt(15)%>
								mAh
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div id="overlaycertainimg" class="overlaycertainimg">
				<div class="close" onclick="closecertain()">×</div>
				<div class="overlaycertainimg-content">
					<img id="bigimg" class="bigimg"
						src="https://cdn.tgdd.vn/Products/Images/42/22701/dien-thoai-di-dong-Nokia-1280-dienmay.com-l.jpg">
					<div class="owl-stage-outer">
						<div class="owl-stage"
							style="transition: all 0s ease 0s; width: 2135px; transform: translate3d(610px, 0px, 0px);">
							<div class="owl-item active center" style="width: 304.96px;">
								<div class="item">
									<a> <img
										src="img/products/huawei-mate-20-pro-green-600x600.jpg" alt="">
									</a>
								</div>
							</div>
							<div class="owl-item active" style="width: 304.96px;">
								<div class="item">
									<a> <img src="assets/image/oppo-f9-mau-do-1-org.jpg" alt="">
									</a>
								</div>
							</div>
							<div class="owl-item active" style="width: 304.96px;">
								<div class="item">
									<a> <img src="assets/image/oppo-f9-mau-do-2-org.jpg" alt="">
									</a>
								</div>
							</div>
							<div class="owl-item" style="width: 304.96px;">
								<div class="item">
									<a> <img src="assets/image/oppo-f9-mau-do-3-org.jpg" alt="">
									</a>
								</div>
							</div>
							<div class="owl-item" style="width: 304.96px;">
								<div class="item">
									<a> <img
										src="img/products/huawei-mate-20-pro-green-600x600.jpg" alt="">
									</a>
								</div>
							</div>
							<div class="owl-item" style="width: 304.96px;">
								<div class="item">
									<a> <img src="assets/image/oppo-f9-mau-do-3-org.jpg" alt="">
									</a>
								</div>
							</div>
							<div class="owl-item" style="width: 304.96px;">
								<div class="item">
									<a> <img
										src="img/products/huawei-mate-20-pro-green-600x600.jpg" alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="owl-nav disabled">
						<button type="button" role="presentation" class="owl-prev">
							<span aria-label="Previous">‹</span>
						</button>
						<button type="button" role="presentation" class="owl-next">
							<span aria-label="Next">›</span>
						</button>
					</div>
					<div class="owl-dots">
						<button role="button" class="owl-dot active">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
						<button role="button" class="owl-dot">
							<span></span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<%
		} catch (Exception e) {
		}
		%>
		<!-- ---  -->



		<div class="content contain-khungSanPham"
			style="margin: 550px auto 0;">
			<div class="content_1 khungSanPham" style="border-color: #434aa8;">
				<h3 class="tenKhung"
					style="background-image: linear-gradient(120deg, #434aa8 0%, #ec1f1f 50%, #434aa8 100%)">*
					CÁC SẢN PHẨM KHÁC *</h3>
				<div class="listSpTrongKhung flexContain">


					<%
					try {
						String MaSanPham = request.getParameter("masp");
						ResultSet rs = conn.getResultSet("select * , FORMAT(GIATIENKM,'#,###'),FORMAT(GIATIENGOC- GIATIENKM,'#,###') from tbSANPHAM");
						while (rs.next()){
					%>


					<!--                 -- -->
					<li class="sanPham" style="width: 233px;"><a
						href="chitietsanpham.jsp?masp=<%=rs.getInt(1)%>"> <img
							src="assets/image/<%=rs.getString(3)%>" alt="">
							<h3><%=rs.getString(2)%></h3>
							<div class="price">
								<strong><%=rs.getString(17)%>₫</strong>
							</div>
							<div class="ratingresult">
								<i class="fa fa-star"></i><i class="fa fa-star"></i><i
									class="fa fa-star"></i><i class="fa fa-star"></i><i
									class="fa fa-star"></i><span>9999 đánh giá</span>
							</div> <label class="giamgia"> <i class="fa fa-bolt"></i> Giảm
								<%=rs.getString(18)%>₫
						</label>
					</a>
					 <a href="doGiohang?themid=<%=rs.getInt(1)%>"><i
								class="fa-solid fa-cart-plus cart1"></i></a>
					</li>

					<%
						}
					} catch (Exception e) {
					}
					%>
					<!--                    --- -->
				</div>
			</div>

		</div>
	</div>

	<footer>
		<div class="footer_2">
			<p>LDD Phone Store - All rights reserved © 2021 - Designed by
				group 15th</p>
		</div>
	</footer>
</body>

</html>