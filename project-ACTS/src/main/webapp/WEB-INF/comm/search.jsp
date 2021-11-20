<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 데이터베이스 프로그래밍 02분반 10팀 솜마추어 -->
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <meta charset="utf-8">
        <title>
            Acts On
        </title>
        
        <style>
            body {
                margin-left: 50px;
                margin-right: 50px;
            }

            #headLine {
                background-color: #b5cda3;
                display: grid;
                grid-template-columns: 8fr 1fr;
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

            #all {
                display: grid;
                grid-template-columns: 2fr 1fr;
            }

            .row {
                padding-left: 50px;
                padding-right: 50px;
                padding-top: 30px;
            }

            #icon i {
                font-size: 5rem;
                padding-right: 70px; 
            }


            #text h5 {
              
                display: inline;
                margin-right: 100px;
                font-weight: bold;
                background-color: #b5cda3;
                color: white;
            }
            

        </style>
    </head>

    <body>
        <div id="headLine" align="center" >
            <div id="headLineText" align="left">
                Acts <img src="<c:url value='/images/sprout2.png' />" border="0" width="45" height="30"/>
            </div>
                <!--  
            <div>
                <img src="./image/돋보기.GIF"><img src="./image/즐겨찾기.GIF"><img src="./image/마이프로필.GIF">
            </div>
            -->

        </div>


        <div id="all">
        <div id="mainContents" class="row">
                
            <div style="width: 800px; padding-left: 80px;">
                <h4 style="font-weight: bold;">카테고리</h4>
                <br>
                <div id="icon">
                	<!-- 1: art -->
	                <a href="<c:url value='/comm/search/list'>
		                <c:param name='categoryName' value='디자인'/></c:url>">
		                <i class="bi bi-easel2"></i></a>
		            
		            <!-- 2: IT -->
	                <a href="<c:url value='/comm/search/list'>
		                <c:param name='categoryName' value='IT'/></c:url>">
		                <i class="bi bi-laptop"></i></a>
		                
		            <!-- 3: Text -->
	                <a href="<c:url value='/comm/search/list'>
		                <c:param name='categoryName' value='문서'/></c:url>">
		                <i class="bi bi-file-text"></i></a>
		                
		            <!-- 4: ETC -->
	                <a href="<c:url value='/comm/search/list'>
		                <c:param name='categoryName' value='기타'/></c:url>">
		                <i class="bi bi-archive"></i></a>
		               
                	
                <!--  
                    <img src="./image/레슨.GIF"><img src="./image/디자인.GIF"><img src="image/it.GIF"><img src="./image/문서.GIF"> <br>
                    <img src="./image/번역.GIF"><img src="./image/영상.GIF"><img src="image/미용.GIF"><img src="./image/기타.GIF">
                    -->
                </div>
            </div>

			<!-- 
            <br><br><br><br>
            
            <div style="width: 800px; padding-left: 80px;">
                <h4 style="font-weight: bold;">인기검색어</h4>
                <br>
                <div id="text" style="padding-left: 30px; margin-left: 30px;">
                    <h5>일러스트</h5> <h5>영상편집</h5> <h5>피아노</h5> <h5>프로그래밍</h5> <br><br>
                    <h5>레포트작성</h5> <h5>ppt</h5> <h5>DIY 공예</h5> <h5>오일파스텔</h5>
                </div>
            </div>
            -->
            
        </div>

		<!-- 
        <div id="subContents" style="margin-top: 20px;">
                <h3 style="font-weight: bold;"> <img src="./image/하트.GIF"> 실시간 인기 Actor</h3>
                <div>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                </div>
        </div>
		 -->

        </div>
    </body>
</html>