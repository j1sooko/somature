package model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Transaction;
import model.User;
import model.dao.PostDAO;
import model.dao.TransactionDAO;
import model.dao.UserDAO;

public class TransactionManager {
	private static TransactionManager transactionMan = new TransactionManager();
	private TransactionDAO transactionDAO;
	private UserDAO userDAO;
	private PostDAO postDAO;
	
	private TransactionManager() {
		try {
			transactionDAO = new TransactionDAO();
			userDAO = new UserDAO();
			postDAO = new PostDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static TransactionManager getInstance() {
		return transactionMan;
	}
	
	public int create(Transaction transaction) throws SQLException {
	
		return transactionDAO.create(transaction);
	}
	
	public List<Transaction> findMyTransactionList(int userId) throws SQLException {
		List<Transaction> transactionListById = transactionDAO.findMyTransactionList(userId);
		List<Transaction> transactionList = new ArrayList<Transaction>();
		for (int i = 0; i < transactionListById.size(); i++) {
			System.out.println(userDAO.findUserByPrimaryKey(userId));
			Transaction transaction = new Transaction(
					transactionListById.get(i).getTransId(),
					transactionListById.get(i).getTransDate(),
					userDAO.findUserByPrimaryKey(userId),
					postDAO.findPost(transactionListById.get(i).getPostId())
					);

			transactionList.add(transaction);
		}
		
		return transactionList;
	}

}
