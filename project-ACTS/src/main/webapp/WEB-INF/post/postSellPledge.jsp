<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 무조건 첫 게시글 작성 눌렀을 때 나오는 서약서 거쳐서 넘어감 -->
<!-- 게시글리스트에 있는 작성자 아이디 == 현재 user아이디 면 postForm으로넘어가고, 없으면  pledge로 넘어옴 -->
<title>작성 서약서</title>
<style>
form{
	border-color: light-grey;
}
</style>
</head>
<body>
<div id="headLine" align="center">
		<div id="headLineText" align="left">
			<img src="<c:url value='/images/Logo.png' />" border="0" width="45" height="30"/>
			
		</div>
	</div>
<form border = "1">
<h6>서약서</h6>
<p></p>
</form>
</body>
</html>