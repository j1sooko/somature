<%@page contentType="text/html; charset=utf-8"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Post post = (Post)request.getAttribute("post");	
	String nickName = (String)request.getAttribute("nickname");
%>
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">

</head>
<body>
	<br>
	<table style="width: 100%">

		<tr>

			<td width="20"></td>

			<td>

				<table>

					<tr>
						<td class="title">&nbsp;&nbsp;<b>게시물 - 상세 게시물 보기 </b>&nbsp;&nbsp;
						</td>
					</tr>

				</table> <br>

				<table style="background-color: YellowGreen">

					<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">제목</td>
						<td width="470" bgcolor="ffffff" style="padding-left: 10">
							${post.title}</td>
					</tr>

					<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">게시물
							작성자 이름</td>
						<td width="470" bgcolor="ffffff" style="padding-left: 10">
							<%=nickName%></td>
					</tr>

					<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">게시글</td>
						<td width="470" bgcolor="ffffff" style="padding-left: 10">
							${post.desc}</td>
					</tr>

					<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">게시글
							종류</td>
						<td width="470" bgcolor="ffffff" style="padding-left: 10">
							${post.pType}</td>
					</tr>

					<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">조회수</td>
						<td width="470" bgcolor="ffffff" style="padding-left: 10">
							${post.views}</td>
					</tr>

				</table> <br> 
			</td>
		</tr>
	</table>
</body>
</html>