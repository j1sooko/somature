<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 등록</title>
<script>
function postCreate() {
	if (form.userId.value == "") {
		alert("사용자 ID를 입력하십시오.");
		form.userId.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}
	if (form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.name.focus();
		return false;
	}
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
	var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(emailExp.test(form.email.value)==false) {
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return false;
	}
	var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(phoneExp.test(form.phone.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone.focus();
		return false;
	}
	form.submit();
}
function postList(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>
</head>
<body>
	<center>
		<h1>작성하기</h1>
		<form name="form" method="POST" action="<c:url value='/post/upload' />">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
					<td bgcolor="#C9E4C5" width="70">제목</td>
					<td align="left">
						<input name="title" type="text">
					</td>
				</tr>
				<tr>
					<td bgcolor="#C9E4C5">작성자</td>
					<td align="left">
						<!-- <input name="writer" size="10" /> -->
						<!-- 요건 그냥 id 자동 입력되도 ㄱㅊ을듯 -->
					</td>
				</tr>
				<tr>
					<td bgcolor="#C9E4C5">내용</td>
					<td align="left">
						<textarea name="content" cols="40" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="#C9E4C5" colspan="2" align="center">
						<input type="file" name="SelectFile" />
					
					</td>
				</tr>
		</table>
		<p>
			<input type="submit" value="새 글 등록" />
		</form>
		<!-- <a href="getBoardList.jsp">글 목록 가기</a> -->
	</center>
</body>
</html>