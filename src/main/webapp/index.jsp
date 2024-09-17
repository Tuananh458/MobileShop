<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
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
</head>

<body>
<%
	Cookie[] cookies = request.getCookies();
%>
	<div>
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
					Boolean test = false;
					if (cookies != null)
						for (Cookie cookie : cookies) {
							if (cookie.getName().equals("user")) {
						test = true;
					%>
					<div class="member">
						<a href="doDangnhap"> <i class="fa fa-user"></i> <%=cookie.getValue()%>
						</a>
					</div>
					<%
					}
					}
					if (test == false) {
					%>
					<tr>
						<div class="member">
							<a href="doDangnhap"> <i class="fa fa-user"></i> Tài khoản
							</a>
						</div>
					</tr>
					<%
					}
					%>

					<%@include file="CART.jsp"%>
					<%
					CART cart = null;
					if (cookies!=null)
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("cart")) {
							String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
							Gson gson = new Gson();
							cart = gson.fromJson(value, CART.class);
						}
					}
					%>


					<div class="cart">
						<a href="doGiohang"> <i class="fa fa-shopping-cart"
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


			<div class="swiper mySwiper banner">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="assets/image/banner0.gif" alt="">
					</div>

					<div class="swiper-slide">
						<img src="assets/image/banner1.png" alt="">
					</div>

					<div class="swiper-slide">
						<img src="assets/image/banner2.png" alt="">
					</div>

					<div class="swiper-slide">
						<img src="assets/image/banner3.png" alt="">
					</div>

					<div class="swiper-slide">
						<img src="assets/image/banner4.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="assets/image/banner5.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="assets/image/banner6.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="assets/image/banner7.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="assets/image/banner8.png" alt="">
					</div>
					<div class="swiper-slide">
						<img src="assets/image/banner9.png" alt="">
					</div>


				</div>
				<div class="swiper-pagination"></div>
			</div>

			<img
				style="width: 1173px; height: 75px; margin: 5px auto; display: block;"
				src="assets/image/blackFriday.gif" alt="" style="width: 100%;">

			<div class="companyMenu group flexContain">
				<img src="assets/image/Apple.jpg" alt=""> <img
					src="assets/image/Samsung.jpg" alt=""> <img
					src="assets/image/Oppo.jpg" alt=""> <img
					src="assets/image/Nokia.jpg" alt=""><img
					src="assets/image/Huawei.jpg" alt=""><img
					src="assets/image/Xiaomi.png" alt=""><img
					src="assets/image/Realme.png" alt=""><img
					src="assets/image/Vivo.jpg" alt=""><img
					src="assets/image/Philips.jpg" alt=""><img
					src="assets/image/Mobell.jpg" alt=""><img
					src="assets/image/Mobiistar.jpg" alt=""><img
					src="assets/image/Itel.jpg" alt=""><img
					src="assets/image/Coolpad.png" alt="">
			</div>

		</header>
		<div class="content contain-khungSanPham">
			<div class="content_1 khungSanPham" style="border-color: #ff9c00;">
				<h3 class="tenKhung"
					style="background-image: linear-gradient(120deg, #ff9c00 0%, #ec1f1f 50%, #ff9c00 100%);">*
					TẤT CẢ SẢN PHẨM *</h3>
				<div class="listSpTrongKhung flexContain">
					<%@include file="SQLSEVERDataAccess.jsp"%>
					<%!SQLSEVERDataAccess conn = new SQLSEVERDataAccess();%>
					<%
					try {

						String masp = request.getParameter("tensp");
						int page1;
						int pageSize = 4; // số lượng bản ghi trên mỗi trang
						if (request.getParameter("page") == null)
							page1 = 1;
						else
							page1 = Integer.parseInt(request.getParameter("page")); // trang hiện tại


						int offset = (page1 - 1) * pageSize; // vị trí bắt đầu lấy dữ liệu
						SQLSEVERDataAccess conn = new SQLSEVERDataAccess();

						ResultSet count = conn.getResultSet("SELECT COUNT(*) FROM tbSANPHAM");
						// tính toán số trang
						count.next();
						int totalRecords = count.getInt(1);
						int totalPages = (int) Math.ceil(totalRecords / (double) pageSize);

						ResultSet rs;
						if (masp == null)
							rs = conn.getResultSet("select *, FORMAT(GIATIENKM,'#,###'),FORMAT(GIATIENGOC- GIATIENKM,'#,###') from tbSANPHAM ORDER BY MASP OFFSET " + offset
							+ " ROWS FETCH NEXT " + pageSize + " ROWS ONLY");
						else
							rs = conn.getResultSet("select *, FORMAT(GIATIENKM,'#,###'),FORMAT(GIATIENGOC- GIATIENKM,'#,###') from tbSANPHAM where tensp like '" + masp + "%'");
					
						Boolean kt=false;
						while (rs.next()) {
							kt=true;
					%>

					<li class="sanPham" style="margin: 0 10px;">
					<a
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
							</div> 
							<label class="giamgia"> <i class="fa fa-bolt"></i> Giảm
								<%=rs.getString(18)%>₫ 
						</label>
						</a>
								
								 <a href="doGiohang?themid=<%=rs.getInt(1)%>"><i
								class="fa-solid fa-cart-plus cart1"></i></a> 
								</li>
					<%
					}
						if (request.getParameter("tensp")==null){
					%>
					
					<div class="pagination1"
						style="width: 97%; margin:20px auto; text-align: center; font-size: 19px;">

						<%
						for (int i = 1; i <= totalPages; i++) {
							if (i == page1) {
						%>
						<span style="margin:0 6px;background: #ff8226;
    padding: 1px 10px;
    border-radius: 4px; color: white" class="current"><%=i%></span>
						<%
						} else {
						%>
						<a class="not_page" style="margin:0 6px;background: #ffd0ae;
    padding: 1px 10px;
    border-radius: 4px; color: white" href="?page=<%=i%>"><%=i%></a>
						<%
						}
						}
						%>
					</div>
					<%
					}
					if (kt==false){%>
						<h3 style="color: red;
    margin-bottom: 10px;">Không tồn tại sản phẩm này</h3>
						<%
					}}
				 catch (Exception ex) {
						System.out.print(ex.getMessage());
					}
					%>
				</div>
			</div>

			<hr>

			<div class="content_2 khungSanPham" style="border-color: #42bcf4;">
				<h3 class="tenKhung"
					style="background-image: linear-gradient(120deg, #42bcf4 0%, #004c70 50%, #42bcf4 100%);">*
					SẢN PHẨM MỚI *</h3>
				<div class="listSpTrongKhung flexContain">
					<div class="swiper mySwiper1">
						<div class="swiper-wrapper">
							<%
							try {
								ResultSet rs = conn.getResultSet("select *, FORMAT(GIATIENKM,'#,###') from tbSANPHAM");
								while (rs.next()) {
							%>

							<div class="swiper-slide">
								<li class="sanPham" style="margin-bottom: 20px;"><a
									href="chitietsanpham.jsp?masp=<%=rs.getString(1)%>"> <img
										src="assets/image/<%=rs.getString(3)%>" alt="">
										<h3><%=rs.getString(2)%></h3>
										<div class="price">
											<strong><%=rs.getString(17)%>₫</strong>
										</div>
										<div class="ratingresult">
											<i class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star"></i><span>302 đánh giá</span>
										</div> <label class="moiramat"> Mới ra mắt </label> 
								</a>
<a href="doGiohang?themid=<%=rs.getInt(1)%>"><i
								class="fa-solid fa-cart-plus cart1"></i></a> 
							</div>

							<%
							}
							} catch (Exception ex) {
							}
							%>

						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</div>

			<hr>

			<!-- content3 -->
			<div class="content_3 khungSanPham" style="border-color: #5de272; margin-bottom: 85px;">
				<h3 class="tenKhung"
					style="background-image: linear-gradient(120deg, #5de272 0%, #007012 50%, #5de272 100%);">*
					GIÁ SỐC ONLINE *</h3>
				<div class="listSpTrongKhung flexContain">
					<div class="swiper mySwiper1">
						<div class="swiper-wrapper">
							<%
							try {
								ResultSet rs = conn.getResultSet("select *, FORMAT(GIATIENKM,'#,###') from tbSANPHAM");
								while (rs.next()) {
							%>
							<!-- 	-- -->

							<div class="swiper-slide">
								<li class="sanPham" style="margin-bottom: 20px;"><a
									href="chitietsanpham.jsp?masp=<%=rs.getInt(1)%>"> <img
										src="assets/image/<%=rs.getString(3)%>" alt="">
										<h3><%=rs.getString(2)%></h3>
										<div class="price">
											<strong><%=rs.getString(17)%>₫</strong>
										</div>
										<div class="ratingresult">
											<i class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star"></i><i class="fa fa-star"></i><i
												class="fa fa-star-o"></i><span>372 đánh giá</span>
										</div> <label class="moiramat" style="background: #3dba51">Giá
											Quá rẻ </label>
								</a>
<%-- 								<a href="ThemGioHang.jsp?masp=<%=rs.getInt(1)%>"><i
								class="fa-solid fa-cart-plus cart1"></i></a> --%>
								<a href="doGiohang?themid=<%=rs.getInt(1)%>"><i
								class="fa-solid fa-cart-plus cart1"></i></a> 
								</li>

							</div>

							<%
							}
							} catch (Exception ex) {
							}
							%>


							<!-- -- -->
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</div>
		</div>

		<footer>
			<div class="footer_1">
				<div class="content_ft1">
					<p>Giao hàng hỏa tốc trong 1 giờ</p>
					<p>Thanh toán linh hoạt: tiền mặt, visa / master, trả góp</p>
					<p>Trải nghiệm sản phẩm tại nhà</p>
					<p>Lỗi đổi tại nhà trong 1 ngày</p>
					<p>Hỗ trợ suốt thời gian sử dụng. Hotline: 12345678</p>
				</div>
			</div>
			<div class="footer_2">
				<p>LDD Phone Store - All rights reserved © 2021 - Designed by
					group 15th</p>
			</div>
		</footer>
	</div>
	<i class="fa-solid fa-arrow-up move_icon"></i>
</body>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="assets/js/index.js"></script>
</html>