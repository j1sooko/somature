package controller.transaction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Transaction;
import model.service.TransactionManager;

public class MySellerTransactionListController implements Controller{
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
		int userId = Integer.parseInt(request.getParameter("userId"));
		System.out.println("userID" + userId);
		TransactionManager transactionMan =  TransactionManager.getInstance();
		List<Transaction> transactionList;
	
		transactionList = transactionMan.findMySellerTransactionList(userId);
		
		request.setAttribute("userId", userId);
    	request.setAttribute("transactionList", transactionList);			
		return "/user/mySellerTransaction.jsp";
    }
}
