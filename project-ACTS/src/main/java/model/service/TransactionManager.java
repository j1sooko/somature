package model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Transaction;
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

			int postId = transactionListById.get(i).getPostId();
			Transaction transaction = new Transaction(
					transactionListById.get(i).getTransId(),
					transactionListById.get(i).getTransDate(),
					userDAO.findUserByPrimaryKey(postDAO.findPost(postId).getWriterId()),
					postDAO.findPost(postId)
					);

			transactionList.add(transaction);
		}
		
		return transactionList;
	}
	
	public List<Transaction> findMySellerTransactionList(int userId) throws SQLException {
		List<Transaction> transactionListById = transactionDAO.findMySellerTransactionList(userId);
		List<Transaction> transactionList = new ArrayList<Transaction>();
		for (int i = 0; i < transactionListById.size(); i++) {
			
			Transaction transaction = new Transaction(
					transactionListById.get(i).getTransId(),
					transactionListById.get(i).getTransDate(),
					userDAO.findUserByPrimaryKey(transactionListById.get(i).getUserId()),
					postDAO.findPost(transactionListById.get(i).getPostId())
					);
			
			transactionList.add(transaction);
		}
		
		return transactionList;
	}

}
