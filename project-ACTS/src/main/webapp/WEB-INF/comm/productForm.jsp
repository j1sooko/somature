<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 등록</title>
</head>
<body>
	<center>
		<h1>작성하기</h1>
		<form action="insertBoard_proc.jsp" method="post">
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