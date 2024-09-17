<%@page import="java.text.NumberFormat"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>
<link rel="stylesheet" href="assets/css/Giohang.css">
<link rel="stylesheet" href="assets/css/index.css">
<script src="https://kit.fontawesome.com/e3729928c9.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%
	Cookie[] cookies = request.getCookies();
	Gson gson = new Gson();
	%>

	<%
/* 	if (session.getAttribute("previousPage") == null) {
		String url = request.getRequestURL().toString();
		session.setAttribute("previousPage", url);
	} */

	Boolean test1 = false;
	for (Cookie cookie : cookies)
		if (cookie.getName().equals("user"))
			test1 = true;
	if (test1 == false)
		response.sendRedirect("/doDangnhap");
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
					<li><a href="uploadsanpham"><i
							class="fa-solid fa-circle-plus"></i> Thêm sản phẩm</a></li>
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
					Boolean test2 = false;
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("user")) {
							test2 = true;
					%>
					<div class="member">
						<a href="doDangnhap"> <i class="fa fa-user"></i> <%=cookie.getValue()%>
						</a>
					</div>
					<%
					}
					}
					if (test2 == false) {
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
					CART cart1 = null;
					if (cookies != null)
						for (Cookie cookie : cookies) {
							if (cookie.getName().equals("cart")) {
								String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
								cart1 = gson.fromJson(value, CART.class);
							}
						}
					%>


					<div class="cart">
						<a href="doGiohang"> <i class="fa fa-shopping-cart"
							style="padding: 10px 10.5px;"></i> <span>Giỏ hàng</span> <%
 if (cart1 != null) {
 %> <span
							style="position: relative; top: 19px; left: -86px; background: green; color: white; padding: 2px 9px; border-radius: 50%;"
							class="cart-number"><%=cart1.tongsp()%></span> <%
 } else
 %> <span class="cart-number"></span>
						</a>
					</div>
				</div>
			</section>
		</header>

		<hr>

		<div class="content" style="margin-top: 0 !important;">
			<table class="listSanPham">
				<tbody>
					<tr>
						<th>Mã sản phẩm</th>
						<th>Tên Sản phẩm</th>
						<th>Giá</th>
						<th>Số lượng</th>
						<th>Thành tiền</th>
						<th>Thời gian</th>
						<th>Xóa</th>
					</tr>


					<%
					Locale localeEN = new Locale("en", "EN");
					NumberFormat en1 = NumberFormat.getInstance(localeEN);

					CART cart = null;
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("cart")) {
							String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
							cart = gson.fromJson(value, CART.class);
							Set<Integer> keySet = cart.Carts.keySet();
							for (Integer key : keySet) {
					%>


					<tr>
						<td><%=cart.Carts.get(key).getMasp()%></td>
						<td class="noPadding imgHide"><a target="_blank"
							href="assets/image/<%=cart.Carts.get(key).getHinhanh()%>"
							title="Xem chi tiết"> <%=cart.Carts.get(key).getTensp()%><img
								src="assets/image/<%=cart.Carts.get(key).getHinhanh()%>">
						</a></td>

						<td class="alignRight"><%=en1.format(cart.Carts.get(key).getGia())%>
							₫</td>
						<td class="soluong"
							style="display: flex; align-items: center; justify-content: space-around; height: 50px; padding: 0 5px;">
							<button>
								<%-- 								<a href="giamsl1.jsp?masp=<%=cart.Carts.get(key).getMasp()%>"><i
									class="fa fa-minus"></i></a> --%>
								<a
									href="doGiohang?giamid=<%=cart.Carts.get(key).getMasp()%>"><i
									class="fa fa-minus"></i></a>
							</button>
							<p><%=cart.Carts.get(key).getSl()%></p>
							<button>

								<a
									href="doGiohang?themid=<%=cart.Carts.get(key).getMasp()%>"><i
									class="fa fa-plus"></i></a>
							</button>
						</td>
						<td class="alignRight"><%=en1.format(cart.Carts.get(key).getTongtien())%>
							₫</td>
						<td style="text-align: center"><%=cart.Carts.get(key).getThoigian()%></td>
						<td class="">
						 <a
							href="doGiohang?xoaid=<%=cart.Carts.get(key).getMasp()%>"><i
								class="fa fa-trash"></i></a>
						</td>
					</tr>

					<%
					}
					}
					}
					if (cart != null && cart.CARTS().size() != 0) {
					%>
					<tr style="font-weight: bold; text-align: center">
						<td colspan="4">TỔNG TIỀN:</td>
						<td class="alignRight"><%=en1.format(cart.TotalBill())%> ₫</td>
<!-- 						<td class="thanhtoan">Thanh Toán</td> -->
						<td ><a href="thanhtoan" class="thanhtoan">Thanh Toán</a></td>
						<td class="xoaHet">
						 <a
							style="text-decoration: none;" href="doGiohang?xoahet=true">Xóa
								hết</a>
						</td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<td colspan="7">
							<h2
								style="color: red; background-color: white; font-weight: bold; text-align: center; padding: 15px 0;">
								Giỏ hàng trống !!</h2>
						</td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>


		</div>
	</div>
	<i class="fa-solid fa-arrow-up move_icon"></i>
</body>

</html>