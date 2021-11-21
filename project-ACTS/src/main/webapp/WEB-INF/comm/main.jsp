<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.*" %>

<%@ page import="java.util.*, model.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="/js/bootstrap.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>Acts On</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- <link rel="stylesheet" href="./css/bootstrap.css">
        <script src="js/jquery-3.6.0.js"></script> -->


<style>
body {
	margin-left: 50px;
	margin-right: 50px;
}

#headLine {
	background-color: #b5cda3;
	display: grid;
	grid-template-columns: 4fr 1fr;
	margin: 100px, 30px, 500px, 30px;
	height: 50px;
	width: auto;
}

#small {
	height: 40px;
}

#headLineText {
	padding-left: 20px;
	padding-top: 5px;
	color: white;
	font-size: 30px;
	font-weight: bold;
}

#big {
	height: 70px;
}

#all {
	display: grid;
	grid-template-columns: 3fr 1fr;
}

#title {
	padding-left: 50px;
	font-size: 70px;
	font-weight: bold;
	width: 600px;
}

#text {
	font-weight: bold;
	padding-left: 50px;
	width: 600px;
}

.row {
	padding-left: 50px;
	padding-right: 50px;
	padding-top: 30px;
}

a {
	text-decoration: none;
	color: black;
}

#i-color i {
	font-size: 3rem;
	color:  #b5cda3; 
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/navbar.jsp" %>
	
	<br>

	<jsp:include page="/WEB-INF/post/postList.jsp"></jsp:include>
	
	<div style="position: fixed; bottom: 5px; right: 5px;" id="i-color">
		<a href="<c:url value='/post/upload/form'></c:url>" class="btn btn-light" role="button" >
		<i class="bi bi-plus-circle-fill"></i></a>
	</div>

</body>
</html>
