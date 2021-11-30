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
<script>
function checked() {
    if (form.check1.value == "") {
       alert("서약서에 동의해주세요.");
       form.check1.focus();
       return false;
    } 
    if (form.check2.value == "") {
    	alert("서약서에 동의해주세요.");
        form.check2.focus();
       return false;
    }      
    form.submit();
   
 }
function postCreate(targetUri) {
    form.action = targetUri;
    form.method="GET";      // post form 요청
    form.submit();
 }
</script>
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
<p style='color: #a9d18e'>*게시글 등록 전 확인하세요*</p>
<p></p>
<p>ActsOn은 만 14세 이상의 회원들이 이용하는 서비스로 노골적인 성적 표현, <br>잔인한 이미지, 기괴한 공포물, 심한 욕설, 마약 사용 조장, 비윤리적, 비도덕적,<br>
 지나치게 선정적, 다수에게 불쾌감을 주는 이미지는 등록할 수 없습니다.</p><br>
</form>
<input type="checkbox" name="check1" value="상기 내용에 동의하며, ActsOn의  규정에 따를 것을 동의합니다.">
<input type="checkbox" name="check2" value="본인은 만 14세 이상이며, 해당 내용을 위반 시 이에 대한 책임을 질 것을 확인합니다.">
<img src="<c:url value='/images/pledgeButton.PNG' />" border="0" width="100" height="50" onClick = "checked();postCreate('<c:url value='/post/postForm'/>')" />
</body>
</html>