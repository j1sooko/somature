<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    text-align: center;margin: 0 auto;width: 100%;
}
nav > a {
    float: right;
    margin: auto;
    text-decoration: none;
}
nav div{
    background: lightgray;
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
<script>
function confirm() {
	confirm('정말 계정을 삭제하시겠습니까?');
}
</script>
</head>
<%
    String pagefile=request.getParameter("page");
    //처음 보여주는 페이지는 내가 쓴글리스트
    if(pagefile==null){
            pagefile="myInfo";
        }
%>
<body>
<div id="wrap">
        <aside>
            <!-- 채워주세요 -->
           <jsp:include page = "left.jsp" /> 
 
        </aside>
        <section>
            <!-- 채워주세요 -->
            <jsp:include page = '<%=pagefile+".jsp" %>'/>
        </section>
     </div>
</body>
</html>