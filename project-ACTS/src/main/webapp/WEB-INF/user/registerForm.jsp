<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
#title {
	background-color: #C9E4C5;
	color: white;
}

h3, h4 {
	font-weight: bold;
}

#b {
	background-color: #C9E4C5;
	border: 0;
	outline: 0;
}

.d {
	text-align: center;
}
table {
    margin-left:auto; 
    margin-right:auto;
}
</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>

<script>
	function userCreate() {
		if (form.accountId.value == "") {
			alert("사용자 ID를 입력하십시오.");
			form.accountId.focus();
			return false;
		}
		if (form.password.value == "") {
			alert("비밀번호를 입력하십시오.");
			form.password.focus();
			return false;
		}
		if (form.password.value != form.password2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			form.password2.focus();
			return false;
		}
		if (form.name.value == "") {
			alert("이름을 입력하십시오.");
			form.userName.focus();
			return false;
		}
		var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (emailExp.test(form.email.value) == false) {
			alert("이메일 형식이 올바르지 않습니다.");
			form.email.focus();
			return false;
		}
		var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if (phoneExp.test(form.phone.value) == false) {
			alert("전화번호 형식이 올바르지 않습니다.");
			form.phone.focus();
			return false;
		}
		if (form.regNum.value == "") {
			alert("주민등록번호를 입력하십시오.");
			form.regNum.focus();
			return false;
		}
		if (form.nickName.value == "") {
			alert("닉네임을 입력하십시오.");
			form.nickName.focus();
			return false;
		}
		form.submit();
	}

	function userList(targetUri) {
		form.action = targetUri;
		form.submit();
	}
</script>
</head>

<body>
<%@include file="/WEB-INF/navbar.jsp" %>
	<div class="d">
		<form name="form" method="POST"
			action="<c:url value='/user/register' />">
			<h3>회원가입</h3>
			<h4>아이디</h4>
			<input type='text' name="accountId" />
			<h4>비밀번호</h4>
			<input type='password' name="password" />
			<h4>비밀번호 확인</h4>
			<input type='password' name="password2" />
			<h4>이름</h4>
			<input type='text' name="name" />
			<h4>전화번호</h4>
			<input type='text' name="phone" />
			<h4>이메일</h4>
			<input type='text' name="email" />
			<h4>주민등록번호</h4>
			<input type='text' name="regNum" />
			<h4>닉네임</h4>
			<input type='text' name="nickName" /><br>
			<br> <input type="button" value="회원 가입" onClick="userCreate()"
				id="b"> <input type="reset" value="다시 입력" id="b" />
		</form>
	</div>
</body>
</html>