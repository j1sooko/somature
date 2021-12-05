<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*, model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	@SuppressWarnings("unchecked") 
	List<Post> postList = (List<Post>)request.getAttribute("postList");

%>
<html>
<head>
<title>게시물 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />"
   type="text/css">
<style>
.listImg {
  width: 300px;
  height: 150px;
  object-fit: cover;
}
</style>
</head>
<body>


		<%
			if (postList != null) {	
	  			Iterator<Post> postIter = postList.iterator();
	
	 			//사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
	 			int i = 0;
		%>
		
		<c:forEach var="post" items="${postList}">
		<% if (i % 4 == 0) { %>
				<br> <% } i++; %>
		<a href="<c:url value='/post/postInfo'>
		
					   			<c:param name='postId' value='${post.postId}'/>
					   			<c:param name='writerId' value ='${post.writerId}' /></c:url>">
			  		<img src="${pageContext.request.contextPath}/upload/${post.getImgUrl()}" class="listImg"></a>
			
		</c:forEach>
		
		<%
			}
		%>

</body>