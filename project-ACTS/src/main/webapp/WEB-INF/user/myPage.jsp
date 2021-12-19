<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style>
body {
    text-align: center;margin: 0 auto;width: 100%;
    background-color : white;
}
nav > a {
    float: right;
    margin: auto;
    text-decoration: none;
}
nav div{
    text-align:right;
}
nav div > a{
    text-decoration: none;
    color:black;
}
nav div > a:last-child{
    padding-left:10px;
}
aside >  a{
    text-decoration: none; color:black;
}
#wrap > section > ul > li{
    list-style-type:none;
}
aside {
    width: 30%; float: left;
} 
section {
    float: left;width: 70%
}
#wrap{
    border:1px solid gray; height:50%;
}
.div {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
function confirm() {
	confirm('정말 계정을 삭제하시겠습니까?');
}
</script>
</head>
<%@include file="/WEB-INF/navbar.jsp" %>
<%
    String pagefile=request.getParameter("page");
    //처음 보여주는 페이지는 내가 쓴글리스트
    if(pagefile==null){
            pagefile="myInfo";
        }
%>
<body>
<div class="row">
  <div class="col-4">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action" id="list-myInfo-list" data-toggle="list" href="#list-myInfo" role="tab" aria-controls="myInfo">내 정보 보기</a>
      <a class="list-group-item list-group-item-action" id="list-updateInfo-list" data-toggle="list" href="#list-updateInfo" role="tab" aria-controls="updateInfo">회원 정보 수정</a>
      <a class="list-group-item list-group-item-action" id="list-postList-list" data-toggle="list" href="#list-postList" role="tab" aria-controls="postList">내가 쓴 글 보기</a>
      <a class="list-group-item list-group-item-action" id="list-participatingTransaction-list" data-toggle="list" href="#list-participatingTransaction" role="tab" aria-controls="participatingTransaction">현재 거래 내역</a>
      <a class="list-group-item list-group-item-action" id="list-followingList-list" data-toggle="list" href="#list-followingList" role="tab" aria-controls="followingList">팔로잉 리스트</a>
    </div>
  </div>
  <div class="col-8">
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="list-myInfo" role="tabpanel" aria-labelledby="list-myInfo-list"><jsp:include page="myInfo.jsp"></jsp:include></div>
      <div class="tab-pane fade" id="list-updateInfo" role="tabpanel" aria-labelledby="list-updateInfo-list"><jsp:include page="updateForm.jsp"></jsp:include></div>
      <div class="tab-pane fade" id="list-postList" role="tabpanel" aria-labelledby="list-postList-list"><jsp:include page="myPost.jsp"></jsp:include></div>
      <div class="tab-pane fade" id="list-participatingTransaction" role="tabpanel" aria-labelledby="list-participatingTransaction-list"><jsp:include page="participatingTransaction.jsp"></jsp:include></div>
      <div class="tab-pane fade" id="list-followingList" role="tabpanel" aria-labelledby="list-followingList-list"><jsp:include page="followingList.jsp"></jsp:include></div>
    </div>
  </div>
</div>
</body>
</html>