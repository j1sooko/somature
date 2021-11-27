<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*, model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	@SuppressWarnings("unchecked") 
	List<Message> messageList = (List<Message>)request.getAttribute("messageList");

%>
<!DOCTYPE html>
<html>
<head>
<title>Acts On</title>
</head>

<body>
	<div>
		<!-- Message List  -->
		<form name="form" method="POST" action="<c:url value='/message/send' />">
			<c:forEach var="message" items="${messageList}">
			<tr>
				<td width="200" align="right" bgcolor="ffffff" height="20">
					${message.cTime}
				</td>
			</tr>
			<tr>
				<td width="200" align="left" bgcolor="ffffff" height="20">
					${message.senderId}
				</td>
				
				<td width="200" align="left" bgcolor="ffffff" height="20">
					${message.content}
				</td>
			</tr>
			</c:forEach>
		
		<!-- Message Form  -->
			<table>
				<tr>
					<td>
						<input name="content" placeholder="메세지를 입력하세요.">
					</td>
					<td align=right><input type="button" value="전송"
						onClick="messageCreate('<c:url value='/message/create'/>')">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>