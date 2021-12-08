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
<title>myPage</title>
<style>
.div {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
</head>
<body>
<!-- 마이페이지 include 태그 이용해서 쓰긴 했는데  로그인이 안되서 볼 수가 없었다..-->
	<h1>내정보</h1>
	<a href="<c:url value='/user/myInfo' />">내 정보 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<jsp:include page = "list.jsp"/>
	<a
		href="<c:url value='/user/update'><c:param name='accountId' value='<%=user.getAccountId()%>'/></c:url>">회원
		정보 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<jsp:include page = "updateForm.jsp"/> 
	<a href="<c:url value='/user/myPost' />">내가 쓴 글 관리</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<jsp:include page = "myPost.jsp">
	<a href="<c:url value='/user/participatingTransaction' />">현재거래내역</a>
	<jsp:include page = "participatingTransaction.jsp"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<a href="<c:url value='/user/followingList' />">내가 팔로잉하는 계정</a>


</body>
</html>