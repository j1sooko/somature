<%@page contentType="text/html; charset=utf-8"%>
<%@page import="model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Transaction transaction = (Transaction)request.getAttribute("transaction");
	List<TransComment> commentList = (List<TransComment>)request.getAttribute("commentList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문 조회하기</title>
</head>
<body>
<%@include file="/WEB-INF/navbar.jsp" %>
<div class="container">
  <!-- Content here -->
<div class="container my-1">
	<div class="row">
	<form method="POST" action="<c:url value='/user/transactionDelete' />">
		<table class="table">
			<thead>
				<tr class="table-active">
					<th scope="col" style="width: 60%">주문 내용<br>${transaction.transTitle}
						</th>
				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><pre>
						<div class="card text-center">
						 
						  <div class="card-body">
						    <p class="card-text">${transaction.transContents}</p>
						  </div>
						</div>
					</pre></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="transId" value="${transaction.transId}" />
		
		<div class="form-row float-right">
			<input type="submit" value="주문 취소" class="btn btn-secondary" id="advance-set-submit" />
		</div>
		
		</form>
	</div>
</div>
</body>
</html>