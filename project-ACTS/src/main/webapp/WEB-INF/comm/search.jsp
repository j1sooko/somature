<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 데이터베이스 프로그래밍 02분반 10팀 솜마추어 -->
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="/resource/js/bootstrap.js"></script>
        <meta charset="utf-8">
        <title>
            Acts On
        </title>
        <link rel="stylesheet" href="./css/bootstrap.css">
        <script src="jquery-3.6.0.js"></script>
        
        
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

            #img img {
                padding-right: 50px;
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
        <script type="text/javascript" src="js/bootstrap.js">
        </script>

        <div id="headLine" align="center" >
            <div id="headLineText" align="left">
                Acts <img id="small" src="./image/작은새싹.GIF">
            </div>
                
            <div>
                <img src="./image/돋보기.GIF"> <img src="./image/즐겨찾기.GIF"><img src="./image/마이프로필.GIF">
            </div>

        </div>


        <div id="all">
        <div id="mainContents" class="row">
                
            <div style="width: 800px; padding-left: 80px;">
                <h4 style="font-weight: bold;">카테고리</h4>
                <br>
                <div id="img" style="padding-left: 30px;">
                    <img src="./image/레슨.GIF"><img src="./image/디자인.GIF"><img src="image/it.GIF"><img src="./image/문서.GIF"> <br>
                    <img src="./image/번역.GIF"><img src="./image/영상.GIF"><img src="image/미용.GIF"><img src="./image/기타.GIF">
                </div>
            </div>

            <br><br><br><br>

            <div style="width: 800px; padding-left: 80px;">
                <h4 style="font-weight: bold;">인기검색어</h4>
                <br>
                <div id="text" style="padding-left: 30px; margin-left: 30px;">
                    <h5>일러스트</h5> <h5>영상편집</h5> <h5>피아노</h5> <h5>프로그래밍</h5> <br><br>
                    <h5>레포트작성</h5> <h5>ppt</h5> <h5>DIY 공예</h5> <h5>오일파스텔</h5>
                </div>
            </div>
            
        </div>


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


        </div>
    </body>
</html>