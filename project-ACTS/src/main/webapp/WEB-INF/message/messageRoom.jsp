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
	<div class="row">
		<!-- Message Room List  -->
		<div class="left">
		<table>
		<c:forEach var="room" items="${roomList}">
			<tr>
				<td width="200" align="right" bgcolor="ffffff" height="20">
					${roomList.receiverId}
				</td>
			</tr>>
		</c:forEach>
		</table>
		</div>
		
		<div class="right">
			<%@include file="/WEB-INF/message/messageForm.jsp" %>
		</div>
	</div>
</body>
</html>