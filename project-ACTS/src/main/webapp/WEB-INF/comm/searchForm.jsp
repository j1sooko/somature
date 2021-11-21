<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title> Acts On_Search</title>
</head>
<body>
<div id = "search">
            	<a href = "<c:url value='/comm/search/list'>
		         <c:param name='searchResult' value='검색'/></c:url>">
		        <input type="text" class="" placeholder="검색어 입력" name="searchText" maxlength="200"> 
            	<i class="bi bi-search"></i>
            	</a>
            	
            </div>
</body>
</html>