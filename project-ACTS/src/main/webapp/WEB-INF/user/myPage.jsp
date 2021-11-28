<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.div {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
	<h1>내정보</h1>
	<a href="<c:url value='/user/myInfo' />">내 정보 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<a
		href="<c:url value='/user/update'><c:param name='accountId' value='<%=user.getAccountId()%>'/></c:url>">회원
		정보 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a
		href="<c:url value='/user/myPost'>
		<c:param name='userId' value='${user.userId}'/></c:url>">
		내가 쓴 글 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
	<a href="<c:url value='/user/participatingTransaction' />">현재거래내역</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<a href="<c:url value='/user/followingList' />">내가 팔로잉하는 계정</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<a
		href="<c:url value='/user/delete'>
		<c:param name='accountId' value='${user.accountId}'/></c:url>">
		회원탈퇴</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</body>
</html>