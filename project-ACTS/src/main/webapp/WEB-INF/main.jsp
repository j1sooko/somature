<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			a{
				text-decoration:none; 
				color : black;
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
                
            <div >
                <a href = "./search.jsp"><img src="./image/돋보기.GIF"></a> 
                <img src="./image/즐겨찾기.GIF"> 
                <a href = "./myPage.jsp"><img src="./image/마이프로필.GIF"></a>
                <!-- 로그인 되어있다면 MyPage로 안되어 있는 경우 NotLogin페이지로 가서 Login Page로 유도(이거도 foward 필요) -->
            </div>

        </div>


        <div id="all">
        <div id="mainContents">
            <div id="title" align="left">
                Acts on <img id="big" src="./img/큰새싹.GIF">
            </div>

            <div id="text" align="left" >
                속에서 불러 내는 것이 따뜻한 봄바람이다. 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다.
                <br>청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고
                <br><br>
            </div>

            <div class="row">
                <div class="col-sm-6" style="padding-right: 20px;">
                    <h1 style="color: rgb(193,172,149); font-weight: bold;">Actor</h1>
                    <br>
                    <div id="Actor">
                    <a href = "./sellPage.jsp">
                    <!--  게시글 정보 넘겨야되서 foward 쓰긴 해야되는데 아직 정보 x주석처리만 해놓음 -->
                        <h4><img src="./image/프로필.GIF"> A1 / Field </h4>
                        <div style="background-color: #e0e0e0; height: 150px; width: 350px; padding-left: 20px; padding-right: 20px; padding-top: 10px;"/>

                        <h4><img src="./image/프로필.GIF"> A2 / Field </h4>
                        <div style="background-color: #e0e0e0; height: 150px; width: 350px; padding-left: 20px; padding-right: 20px; padding-top: 10px;"></div>

                        <h4><img src="./image/프로필.GIF"> A3 / Field </h4>
                        <div style="background-color: #e0e0e0; height: 150px; width: 350px; padding-left: 20px; padding-right: 20px; padding-top: 10px;"></div>
                       </a>
                    </div>
                </div>


                <div class="col-sm-6" style="padding-right: 20px;">
                    <h1 style="color: rgb(193,172,149); font-weight: bold;">Requestor</h1>
                    <br>
                    <div id="Requestor">
                        <h4><img src="./image/프로필.GIF"> R1 / Field </h4>
                        <div style="background-color: #e0e0e0; height: 150px; width: 350px; padding-left: 20px; padding-right: 20px; padding-top: 10px;"></div>

                        <h4><img src="./image/프로필.GIF"> R2 / Field </h4>
                        <div style="background-color: #e0e0e0; height: 150px; width: 350px; padding-left: 20px; padding-right: 20px; padding-top: 10px;"></div>

                        <h4><img src="./image/프로필.GIF"> R3 / Field </h4>
                        <div style="background-color: #e0e0e0; height: 150px; width: 350px; padding-left: 20px; padding-right: 20px; padding-top: 10px;"></div>
                    </div>
                </div>
            </div>
        </div>


        <div id="subContents" style="margin-top: 20px;">
                <h3 style="font-weight: bold;"> <img src="./img/하트.GIF"> 실시간 인기 Actor</h3>
                <div>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                    <h4><img src="./img/프로필.GIF"> R3 / Field </h4>
                </div>
        </div>


        </div>
    </body>
</html>
