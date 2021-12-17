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
#left{
	backgroud-color: light-grey;
}
</style>
</head>
<body id="left">
<a href="<c:url value='/user/myInfo' />">내 정보</a>
<br>
<a href="<c:url value='/user/update'><c:param name='accountId' value='<%=user.getAccountId()%>'/></c:url>">회원 정보 수정</a>
<br>
<a href="<c:url value='/user/myPost'>
	<c:param name='userId' value='${user.userId}'/></c:url>">내가 쓴 글 보기</a>
<br>
<a href="<c:url value='/user/participatingTransaction' />">현재 거래 내역</a>
<br>
<a href ="<c:url value='/user/followingList' />">내가 팔로잉하는 계정</a>
</body>
</html>