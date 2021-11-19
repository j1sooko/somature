<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<a href=".myInfo.jsp" target="a">내 정보 보기</a>
		</span>
		<span> 
			<a href="./updateForm.jsp" target="a">회원 정보 수정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span> 
		<span>
			<a href="./myPost.jsp" target="a">내가 쓴 글 관리</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		<span>
			<a href="./participatingTransaction.jsp" target="a">현재 거래내역</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		<span>
			<a href="./followingList.jsp" target="a">내가 팔로잉하는 계정</a>
		</span>
	</div>

	<p></p>
	<iframe width="1000" height="1500" name="a"></iframe>
</body>
</html>