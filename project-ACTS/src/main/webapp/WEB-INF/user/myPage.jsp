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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>

.tab {
  width: 100%;
  height: 50px;
}

.tablinks {
  float: left;
  width: 100%;
  height: 100%;
  border: none;
  outline: none;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #a6a6a6;
}

.tablinks.active {
  color: #000;
  background-color: #fff;
}
</style>
<script>
function confirm() {
	confirm('정말 계정을 삭제하시겠습니까?');
}


function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
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
    <div  class="list-group" id="myList" role="tablist">
    	<button class="tablinks active" onclick="openTab(event, 'list-myInfo')">내 정보 보기</button>
    	<button class="tablinks" onclick="openTab(event, 'list-updateInfo')">내 정보 수정</button>
    	<button class="tablinks" onclick="openTab(event, 'list-postList')">내 게시글 보기</button>
    	<button class="tablinks" onclick="openTab(event, 'list-myBuyerTransaction')">내 거래내역</button>
    	<button class="tablinks" onclick="openTab(event, 'list-favoriteList')">팔로잉리스트</button>

    </div>
  	</div>
  	<div class="col-8">
    <div class="tab-content">
      <div class="tabcontent" id="list-myInfo" role="tabpanel" style="display: block;"><jsp:include page="myInfo.jsp" ></jsp:include></div>
      <div class="tabcontent" id="list-updateInfo" role="tabpanel" style="display: none;"><jsp:include page="updateForm.jsp" ></jsp:include></div>
      <div class="tabcontent" id="list-postList" role="tabpanel"  style="display: none;"><jsp:include page="myPost.jsp"  ></jsp:include></div>
      <div class="tabcontent" id="list-myBuyerTransaction" role="tabpanel"  style="display: none;"><jsp:include page="myBuyerTransaction.jsp" ></jsp:include></div>
      <div class="tabcontent" id="list-favoriteList" role="tabpanel"  style="display: none;"><jsp:include page="favoriteList.jsp"></jsp:include></div>
    </div>
    </div>
  
</div>

</body>
</html>