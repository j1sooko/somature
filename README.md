# somature
Database Programming Team 

2021.11.15~

< 해결법 Error: The import org.apache.commons cannot be resolved >
  - https://k-gline.tistory.com/3 참고

< 해결법 Error: java.lang.NullPointerException: null
	at controller.DispatcherServlet.service(DispatcherServlet.java:38)>
  <c:url ~> 사용했을 경우 상단에 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 작성했는지 확인
