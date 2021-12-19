<%@page contentType="text/html; charset=utf-8"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Post post = (Post)request.getAttribute("post");
	User user = (User)request.getAttribute("user");
	String nickName = (String)request.getAttribute("nickname");
	String writerId = (String)request.getParameter("writerId");
	String setting = (String)request.getAttribute("setting");
%>
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
	type="text/css">

</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
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
					<tr>
						<td width="120" align="center" bgcolor="E6ECDE" height="22">이미지</td>
						<img src="${pageContext.request.contextPath}/upload/${post.imgUrl}">
					</tr>
				</table> <br> 
				
				<a href="<c:url value='/post/update'>
				<c:param name='postId' value='${post.postId}'/>
				</c:url>">게시글 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a href="<c:url value='/post/delete'>
				<c:param name='postId' value='${post.postId}'/>
				<c:param name='writerId' value='${post.writerId}'/>
				</c:url>">게시글 삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<c:if test="${empty user.userId}">
					<form method="post" action="<c:url value='/user/login' />">
						<button type="submit">
						좋아요
						</button>	
					</form>
				</c:if>
				
				<c:if test="${fOrNot eq 0 and not empty user.userId}">
					<form method="POST" action="<c:url value='/post/postInfo' />">
					  	<input type="hidden" name="postId" value='${post.postId}'>
					  	<input type="hidden" name="userId" value='${user.userId}'>
					  	<input type="hidden" name="setting" value='1'>
					  	<input type="hidden" name="writerId" value='<%=writerId%>'>
						
						<button type="submit">
						좋아요
						</button>	
					</form>
				</c:if>
				
				<c:if test="${fOrNot eq 1}">
					<form method="POST" action="<c:url value='/post/postInfo' />">
					  	<input type="hidden" name="postId" value='${post.postId}'>
					  	<input type="hidden" name="userId" value='${user.userId}'>
					  	<input type="hidden" name="setting" value='0'>
					  	<input type="hidden" name="writerId" value='<%=writerId%>'>
					  	<input type="hidden" name="hey" value='hey'>
						
						<button type="submit">
						좋아요 해제
						</button>	
					</form>
				</c:if>
				
				
				<!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${postUpdateFailed || deleteFailed}">
	      <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>
				
			</td>
		</tr>
	</table>
</body>
</html>