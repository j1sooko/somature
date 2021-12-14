<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*, model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	@SuppressWarnings("unchecked") 
	List<MessageRoom> roomList = (List<MessageRoom>)request.getAttribute("roomList");

%>
<!DOCTYPE html>
<html>
<head>
<title>Acts On</title>

</head>

<body>
	<%@include file="/WEB-INF/navbar.jsp" %>
	<div>
		<!-- Message Room List  -->
		<table>
		<c:forEach var="room" items="${roomList}">
			<tr>
				<td width="200" align="right" bgcolor="ffffff" height="20">
					${roomList.receiverId}
				</td>
			</tr>
			<tr>
				<td width="400" align="left" bgcolor="ffffff" height="20">
					최근 메세지 들어가야 함
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>