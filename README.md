# 🌱 ACTS


## 📂 프로젝트 소개

**ACTS**(Amature-Client Transaction Service)는 비전문가들과 가벼운 외주를 원하는 소비자들에게 플랫폼을 제공하는 **비전문가 외주 거래 서비스**이다. MVC, JDBC, MyBatis, JSP 등을 활용한 데이터베이스 응용 프로그램(서비스)을 개발하는 것이 목적이다.

## 📆 개발 기간
2021.9.13 Mon ~ 2021.12.20 Mon
![image](https://user-images.githubusercontent.com/70093771/213363377-c08e52fd-00cf-4ae9-8fa4-54061a887de8.png)


## ⚙️ 개발 환경 및 기술
#### 개발 환경
- Oracle SQL Developer, Eclipse, Tomcat, ERwin
- Github


#### 사용 기술
- Presentation Layer: JavaScript, CSS, JSP
- Business Layer: Java
- Persistence Layer: SQL, JDBC

## 👥 멤버 구성
- 오윤아(팀장, 백엔드): 팀장, DAO, 도메인, 댓글 기능, 메인 디자인, 카테고리
- 고지수(백엔드): 게시글 CRUD, 거래 CRUD, DB 관리, 게시글 이미지 리스트
- 김경원(백엔드): 게시글 리스트, 좋아요, 키워드 검색, 게시글 CRUD
- 이희원(프론트엔드): 마이페이지, 게시판 테이블, 마이페이지 테이블 디자인, 회원가입 창 (jsp 구현, 디자인 수정)


## 📌 주요 기능
1. 게시글 등록 기능
	- 게시글 CRUD
	- 게시글 좋아요 등록 기능(좋아요한 페이지만 마이페이지에서 모아볼수 있음)
	- 게시글에 댓글을 등록할수 있음
2. 사용자 회원 가입 / 로그인 기능
	- 사용자 CRUD 
	- 마이페이지에서 사용자 정보 관리 가능 
3. 거래 기능 
	- 게시글마다 주문글 작성 가능 
	- 마이페이지에서 거래 내역 확인 가능 
4. 검색 기능 
	- 카테고리 별 게시글 리스트 검색 가능 
	- 특정 검색어가 포함된 게시글 제목 리스트 검색 가능

## 시스템 구성도
![image](https://user-images.githubusercontent.com/70093771/213364332-02eac422-37e4-45b7-a721-b0a36d498fcd.png)

## DB 설계
![image](https://github.com/j1sooko/somature/assets/70093771/1f01df68-dcea-4dff-a6ba-6f03619b85a1)




## MVC 구조
![image](https://user-images.githubusercontent.com/70093771/213364912-b43d57f4-8905-4fcb-84e1-4b96d80ec66d.png)

<!--
## 구현 결과
- 로그인/로그아웃

![image](https://user-images.githubusercontent.com/70093771/213365254-695b6fab-5433-4ba5-80cc-8a52f3ca42b3.png)
---

- 회원가입, 마이페이지


![image](https://user-images.githubusercontent.com/70093771/213365403-a9e2d725-6617-40b5-9ab0-2d12e3155ece.png)
![image](https://user-images.githubusercontent.com/70093771/213365426-cea61695-2c03-4888-be39-dad72792aea8.png)
---

- 게시글 CRUD

![image](https://user-images.githubusercontent.com/70093771/213365548-89ce453e-8cf7-40d4-816c-be92445df5cc.png)
![image](https://user-images.githubusercontent.com/70093771/213365573-fbc21b1a-1a09-4045-b8df-0032580befed.png)
![image](https://user-images.githubusercontent.com/70093771/213365592-d867a99c-fcca-4869-be57-e4396ab2d76b.png)


---

- 검색
![image](https://user-images.githubusercontent.com/70093771/213365704-090480d1-2971-4c53-b9b3-57c2943c76c5.png)

-->

<!-- 
# somature
Database Programming Team 

2021.11.15~

< 해결법 Error: The import org.apache.commons cannot be resolved >
  - https://k-gline.tistory.com/3 참고

< 해결법 Error: java.lang.NullPointerException: null
	at controller.DispatcherServlet.service(DispatcherServlet.java:38)>
  <c:url ~> 사용했을 경우 상단에 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 작성했는지 확인
  
  [JSTL] session에 접근하는 다양한 방법
  https://mytory.net/archives/323

jsp에서 parameter가 안 넘어갈 때 볼 것
https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=kimsu0813&logNo=140201820687
 -->
