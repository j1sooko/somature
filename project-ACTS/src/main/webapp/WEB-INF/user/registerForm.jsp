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
<!-- ACTS 누르면 메인으로 이동하는 기능 구현해야함 -->
	<h1 id="title">
		Acts <img src="<c:url value='/images/sprout2.png' />" border="0" width="45" height="30"/>
			
	</h1>
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