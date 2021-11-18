<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
#title{
	background-color: #C9E4C5;
	color: white;
}
h3, h4{
	font-weight:bold;
}
#b{
	background-color: #C9E4C5;
	border:0;
	outline:0;
}
</style>
</head>
<body>
<h1 id ="title">ACTS
<a href="url"><img src="./image/sprout2.png" border="0" width = "45" height = "30"></a>
</h1>
<center>
<form>
<h3>회원가입</h3>
<h4>아이디</h4>
<input type='text'/>
<h4>비밀번호</h4>
<input type='password' />
<h4>비밀번호 확인</h4>
<input type='password' />
<h4>이메일</h4>
<input type='text'/>
<h4>닉네임</h4>
<input type='text'/><br><br>
<button id = "b">회원 가입</button>
<input type = "reset" value = "다시입력" id = "b"/>
</form>
</center>
</body>
</html>