<%@page contentType="text/html; charset=utf-8"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Transaction transaction = (Transaction)request.getAttribute("transaction");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
	<br>
	<table style="background-color: YellowGreen">

					<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">제목</td>
						<td width="470" bgcolor="ffffff" style="padding-left: 10">
							${transaction.transTitle}</td>
					</tr>

					<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">내용</td>
						<td width="470" bgcolor="ffffff" style="padding-left: 10">
							${transaction.transContents}</td>
					</tr>
	</table>
</body>
</html>