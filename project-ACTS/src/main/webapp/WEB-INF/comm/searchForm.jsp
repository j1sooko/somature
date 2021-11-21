<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Acts On_Search</title>
</head>
<body>
<div id = "search">
            	<a href = "<c:url value=''>
		                <c:param name='searchForm' value='검색'/></c:url>"></a>
            	<i class="bi bi-search"></i>
            	<input type="text" class="" placeholder="검색어 입력" name="searchText" maxlength="200">
            </div>
</body>
</html>