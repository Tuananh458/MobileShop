<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%
response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm sản phẩm</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/uploadsanpham.css">
<script src="assets/js/uploadsanpham.js"></script>
</head>
<body>
	<div id="form_nhap" style="opacity: 0.9">
		<h1 style="margin: 0 0 50px;" align="center">Thêm sản phẩm mới</h1>
		<form action="uploadsanpham" method="POST"
			enctype="multipart/form-data" charset="UTF-8" accept-charset="utf-8">
			<c:if test="${sanpham!=null}">
			<div class="inputbox textbox">
				<input value="${sanpham.masp}" type="text" name="masp" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Mã sản phẩm</span>
			</div>
			</c:if>
			
			<div class="inputbox textbox">
				<input value="${sanpham.tensp}" type="text" name="tensp" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Tên sản phẩm</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.khuyenmai}" type="text" name="khuyenmai" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Chi tiết khuyến mại</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.giatiengoc}" type="number" name="giatiengoc" min="0" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Giá gốc</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.giatienkm}" type="number" name="giatienkm" min="0" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Giá khuyến mại</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.manhinh}" type="text" name="manhinh" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Màn hình</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.hedieuhanh}" type="text" name="hedieuhanh" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Hệ điều hành</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.camera_sau}" type="text" name="camera_sau" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Camera sau</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.camera_truoc}" type="text" name="camera_truoc" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Camera trước</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.cpu}" type="text" name="cpu" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">CPU</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.ram}" type="text" name="ram" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">RAM</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.bonhotrong}" type="text" name="bonhotrong" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Bộ nhớ trong</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.thenho}" type="text" name="thenho" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Thẻ nhớ</span>
			</div>
			<div class="inputbox textbox">
				<input value="${sanpham.dungluongpin}" type="number" name="dungluongpin" min="0" autocomplete="on"
					onblur="floattingLabelCombobox(this)"> <span
					class="floatting-label">Dung lượng pin</span>
			</div>
			<%@include file="SQLSEVERDataAccess.jsp"%>
			<div class="inputbox combobox">
				<select id="mahang" name="mahang"
					onchange="floattingLabelCombobox(this)">
					<option selected hidden disabled></option>
					<%
					SQLSEVERDataAccess conn = new SQLSEVERDataAccess();
					ResultSet rs = conn.getResultSet_StoredProcedures("PROC_SelectHangDT", null);
					while (rs.next()) {
					%>
					<option value="<%=rs.getInt("MAHANG")%>"><%=rs.getString("TENHANG")%></option>
					<%
					}
					%>
				</select> <span class="floatting-label">Thương hiệu</span>
			</div>
			<div id="preview-image-box">
				<img style="margin: auto; display: block; width: 50%" src="">
				<span class="floatting-label">Hình ảnh</span>
			</div>
			<div class="button-group">
				<input class="img_upload" name="hinhanh" type="file"
					accept="image/*" hidden required onchange="loadPreviewImage(event)">
				<input type="button" style="height: 43px; padding: 0 35px;"
					value="Tải hình ảnh lên" onclick='uploadFile(this)'> 
				<input type="submit" style="height: 43px; padding: 0 35px;" value="Thêm">
			</div>
		</form>
	</div>
	<br>
	<script>
		floattingLabelHide();
	</script>
</body>
</html>
<%
rs.close();
%>