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
		padding-top:20px;
		padding-bottom:20px;
	}
</style>
</head>
<body>

<h1>내정보</h1>

	<div style="background-color: pink;">

		<span>
			<a href="<c:url value='/user/myInfo' />" target="a">내 정보 보기</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		<span> 
			<a href="<c:url value='/user/update/form' />" target="a">회원 정보 수정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span> 
		<span>
			<a href="<c:url value='/user/myPost' />" target="a">내가 쓴 글 관리</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		<span>
			<a href="<c:url value='/user/participatingTransaction' />" target="a">현재 거래내역</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		<span>
			<a href="<c:url value='/user/followingList' />" target="a">내가 팔로잉하는 계정</a>
		</span>
	</div>

	<p></p>
	<iframe width="1000" height="1500" name="a"></iframe>
</body>
</html>