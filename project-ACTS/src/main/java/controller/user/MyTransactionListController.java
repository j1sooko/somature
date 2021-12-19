package controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Post;
import model.Transaction;
import model.dao.UserDAO;
import model.service.TransactionManager;

public class MyTransactionListController implements Controller{
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
		int userId = Integer.parseInt(request.getParameter("userId"));
		System.out.println("userID" + userId);
		TransactionManager transactionMan =  TransactionManager.getInstance();
		List<Transaction> transactionList;
	
		transactionList = transactionMan.findMyTransactionList(userId);
		
    	
    	request.setAttribute("transactionList", transactionList);			
		return "/user/myTransactionList.jsp";
    }
}
