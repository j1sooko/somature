<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% User user = (User)request.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
   type="text/css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>내 정보</title>
<style>
body{
	font-family :"맑은 고딕";
}
table{
	weight:50%;
	
}
h3{
	color: #b5cda3;
}
</style>
</head>
<body>
<h3 align = "center">내 정보</h3>
	<table class = "table table-striped">
		<tr><td>아이디</td>
			<td><%= user.getAccountId() %></td></tr>
		<tr><td>이름</td>
			<td><%= user.getName() %></td></tr>
		<tr><td>닉네임</td>
			<td><%= user.getNickName() %></td></tr>
		<tr><td>전화번호</td>
			<td><%= user.getPhone() %></td></tr>
		<tr><td>이메일</td>
			<td><%= user.getEmail() %></td></tr>
		<tr><td>가입일</td>
			<td><%= user.getJoinDate() %></td></tr>

	</table>
	<!-- <input type="button" value="이전으로 돌아가기" onClick="history.go(-1)"> -->
</body>
</html>