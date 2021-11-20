<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%>
<% User user = (User)request.getAttribute("user"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 클래식 에디터 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>게시글 등록</title>

<!-- 넓이 높이 조절 -->
<style>
.ck.ck-editor {
	max-width: 500px;
}

.ck-editor__editable {
	min-height: 300px;
}
</style>
<script>
function postCreate() {
	if (form.title.value == "") {
		alert("제목을 입력하십시오.");
		form.title.focus();
		return false;
	} 
	if (form.price.value == "") {
		alert("내용을 입력하십시오.");
		form.price.focus();
		return false;
	}
	if (CKEDITOR.instances.editor1.getData() == "") {
		alert("내용을 입력하십시오.");
		form.description.focus();
		return false;
	}



	form.submit();
}

</script>
</head>
<body>

	<h1>작성하기</h1>

	<!-- title -->
	<form name="form" method="POST" action="<c:url value='/post/upload' />">
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Title</label>
			<br> <input name="title" class="form-control  input-sm"
				id="exampleFormControlInput1" placeholder="제목을 입력하세요."
				aria-label=".form-control-lg example">
		</div>

		<!-- seller or buyer -->
		<label for="exampleFormControlInput1" class="form-label">acts 타입</label>
		<div class="form-check">
			<input class="form-check-input" type="radio" name="pType"
				id="flexRadioDefault1" checked> <label class="form-check-label"
				for="flexRadioDefault1"> seller </label>
		</div>
		<div class="form-check">
			<input class="form-check-input" type="radio" name="pType"
				id="flexRadioDefault2"> <label
				class="form-check-label" for="flexRadioDefault2"> buyer </label>
		</div>
		
		<!-- 게시글 status -->
		<label for="exampleFormControlInput1" class="form-label">상태</label>
		<br>
		<select name="status" style="width: 240">
					<option value="available">거래 가능</option>
					<option value="ongoing">거래 중</option>
					<option value="completed">거래 완료</option>
		</select>
		
		<!-- 가격 -->
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">가격</label>
			<br> <input name="price" class="form-control  input-sm"
				id="exampleFormControlInput1"
				aria-label=".form-control-lg example">원
		</div>	
		
	
		<!-- 게시글 내용 -->
		<div>
			<div>
				<textarea name="description" id="content_textarea"></textarea>
			</div>
		</div>
		
		<div class="mb-3">	
			<label for="formFile" class="form-label"></label> <input
				class="form-control" type="file" id="formFile">
		</div>

		<input type="button" value="등록" onClick="postCreate()"
			class="btn btn-primary">
	</form>

	<script>

	ClassicEditor
    .create( document.querySelector( '#content_textarea' ) )
    .then( editor => {
        console.log( editor );
    } )
    .catch( error => {
        console.error( error );
    } );
	    
	</script>
	<!-- 
		<h1>작성하기</h1>
		<form name="form" method="POST"
			action="<c:url value='/post/upload' />">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="#C9E4C5" width="70">제목</td>
					<td align="left"><input name="title" type="text" /></td>
				</tr>
				<tr>
					<td bgcolor="#C9E4C5">작성자</td>
					<td align="left">${user.accountId} <!-- <input name="writer" size="10" /> -->
						<!-- 요건 그냥 id 자동 입력되도 ㄱㅊ을듯 -->
						<!--   
					</td>
				</tr>
				<tr>
					<td bgcolor="#C9E4C5">내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10"
							id="content_textarea"></textarea></td>
				</tr>
				<tr>
					<td bgcolor="#C9E4C5" colspan="2" align="center"><input
						type="file" name="SelectFile" /></td>
				</tr>
			</table>
			<p>
				<input type="submit" value="새 글 등록" >
		</form>
		 -->
		<!-- <a href="getBoardList.jsp">글 목록 가기</a> -->

</body>
</html>