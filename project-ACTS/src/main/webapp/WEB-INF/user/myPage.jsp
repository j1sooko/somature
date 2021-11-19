<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<h1>내정보</h1>
	<a href="<c:url value='/user/myInfo' />">내 정보 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<a href="<c:url value='/user/update/form' />">회원 정보 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<a href="<c:url value='/user/myPost' />">내가 쓴 글 관리</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<a href="<c:url value='/user/participatingTransaction' />">현재거래내역</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<a href="<c:url value='/user/followingList' />">내가 팔로잉하는 계정</a>

</body>
</html>