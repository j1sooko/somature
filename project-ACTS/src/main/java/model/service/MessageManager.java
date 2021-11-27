package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Message;
import model.dao.MessageDAO;


public class MessageManager {
	private static MessageManager message = new MessageManager();
	private MessageDAO messageDAO;

	private MessageManager() {
		try {
			messageDAO = new MessageDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static MessageManager getInstance() {
		return message;
	}
	
	public int create(Message message) throws SQLException {
		return messageDAO.create(message);
	}

	public List<Message> findMessageList() throws SQLException {
			return messageDAO.findMessageList();
	}
	
}
