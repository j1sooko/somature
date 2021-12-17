<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% User user = (User)request.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<body>
	<table>
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
</body>
</html>