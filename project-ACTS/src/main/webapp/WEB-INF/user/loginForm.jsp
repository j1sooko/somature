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

            #login {
                color: black;
                font-weight:bolder;
            }

            #loginForm {
                font-weight: bold;
            }

            #loginForm input {
                font-size: 20px;
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
            <div/>
        </div>

        <div id="login" align="center">
            <br>
            <h1>로그인</h1>
            <br>
            <div id="loginForm">
                <form>
                    <h4 style="padding-right: 230px;">아이디</h4>
                    <input type="text" name="id" placeholder="아이디를 입력해주세요">
                    <br>
                    <br>
                    <h4 style="padding-right: 210px;">비밀번호</h4>
                    <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요">
    					
                    <h5 style="padding-right: 130px; text-decoration: underline;">비밀번호를 잊으셨나요?</h5>
                    <!-- 비밀번호 찾기 혹은 바꾸기 페이지 아직 없음 -->
                    <br>
                </form>

            </div>

            <a href = "./register.jsp"><h3>계정이 없으신가요?</h3></a>
        </div>
    </body>
</html>
