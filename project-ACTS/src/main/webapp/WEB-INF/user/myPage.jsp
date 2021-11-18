<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<style type="text/css">
#title{
	background-color: #C9E4C5;
	color: white;
}
h2{
	font-weight:bold;
}
#detail{
		width:600px;
		height:200px;
}
#list{
	width:50%;
	height:100%;
}
#page{
	width:50%;
	height:100%;
}
.container{
	width:100%;
	height:100%;
}

</style>
</head>
<body>
<h1 id ="title">ACTS
<a href="url"><img src="./image/sprout2.png" border="0" width = "45" height = "30"></a>

</h1>
<br>
<center>
<table>
<tr>
<td>
<a href="url"><img src="./image/프로필.GIF" border="0" width = "100" height = "70"></a>
</td>
<td>
<h2>김동덕</h2>
<p>dongduk1234@dongduk.ac.kr</p>
</td>
</tr>
</table>
<div class="container">
<table id = "detail">
<tr>
<td id = "list">
<%@ include file = "myPageList.jsp" %>
</td>
<td id = "page">
<%@ include file = "myPageTable.jsp" %>
</td>
</tr>
</table>
</div>
</center>
</body>
</html>