<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 데이터베이스 프로그래밍 02분반 10팀 솜마추어 -->
<html>
<head>
<title>Acts On</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css"> -->
<!-- <link rel="stylesheet" href="./css/bootstrap.css"> -->
<script>
   function login() {
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
      form.submit();
   }
   
   function userCreate(targetUri) {
      form.action = targetUri;
      form.method="GET";      // register form 요청
      form.submit();
   }
   </script>
<style>
body {
	margin-left: 50px;
	margin-right: 50px;
}

#headLine {
	background-color: #b5cda3;
	display: grid;
	grid-template-columns: 8fr 1fr;
	margin: 100px, 30px, 500px, 30px;
	height: 50px;
	width: auto;
}

#small {
	height: 40px;
}

#headLineText {
	padding-left: 20px;
	padding-top: 5px;
	color: white;
	font-size: 30px;
	font-weight: bold;
}

#login {
	color: black;
	font-weight: bolder;
}

#loginForm {
	font-weight: bold;
}

#loginForm input {
	font-size: 20px;
}

a {
	text-decoration: none;
	color: black;
}

.d {
	text-align: center;
}
</style>
</head>
<body>
	<!--<script type="text/javascript" src="js/bootstrap.js"></script>  -->

	<div id="headLine" align="center">
		<div id="headLineText" align="left">
			Acts <img src="<c:url value='/images/sprout2.png' />" border="0" width="45" height="30"/>
		</div>
	</div>


	<div class="d">
		<!-- login form  -->
		<form name="form" method="POST" action="<c:url value='/user/login' />">
			<table style="width: 100%">
				<tr>
					<td width="20"></td>
					<td><br>
					<br>
						<table>
						</table> <!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 --> <c:if
							test="${loginFailed}">
							<br>
							<font color="red"><c:out value="${exception.getMessage()}" /></font>
							<br>
						</c:if> <br>
						<table>
							<tr height="40">
								<td width="150" align="center">사용자 ID</td>
								<td width="250" bgcolor="ffffff" style="padding-left: 10">
									<input type="text" style="width: 240" name="userId">
								</td>
							</tr>
							<tr height="40">
								<td width="150" align="center">비밀번호</td>
								<td width="250" bgcolor="ffffff" style="padding-left: 10">
									<input type="password" style="width: 240" name="password">
								</td>
							</tr>
						</table> <br>
						<table style="width: 100%">
							<tr>
								<td align=left><input type="button" value="로그인"
									onClick="login()"> &nbsp; <input type="button"
									value="회원가입"
									onClick="userCreate('<c:url value='/user/register/form'/>')">
								</td>
							</tr>
						</table></td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>