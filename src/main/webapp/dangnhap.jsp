<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Creative Colorlib SignUp Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script
        type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="assets/css/dangnhap.css">
</head>

<body>
    <!-- main -->
    <div class="main-w3layouts wrapper">
        <h1>Đăng nhập</h1>
        <div class="main-agileinfo">
            <div class="agileits-top">
                <form action="doDangnhap" method="post">
                    <input class="text" type="text" name="username" placeholder="Username" required="">
                    <input style="margin-top: 30px; margin-bottom: 30px;" class="text" type="password" name="password" placeholder="Password" required="">
                    <%
	String error=request.getParameter("error");
	if (error!=null){
	%>
	                  <span style="font-size: 14px;
    color: #1000ae;"><%=URLDecoder.decode(error,"UTF-8")%></span>
	<%}%>
  
                    <input type="submit" value="Đăng nhập">
                </form>
                <p>You don't have an Account? <a href="doDangky">Sign up</a></p>
            </div>
        </div>
        <ul class="colorlib-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <!-- //main -->
</body>

</html>