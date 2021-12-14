package model.service;

import java.sql.SQLException;
import java.util.List;

import model.MessageRoom;
import model.User;
import model.dao.MessageRoomDAO;

public class MessageRoomManager {
	private static MessageRoomManager messageRoom = new MessageRoomManager();
	private MessageRoomDAO messageRoomDAO;

	private MessageRoomManager() {
		try {
			messageRoomDAO = new MessageRoomDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static MessageRoomManager getInstance() {
		return messageRoom;
	}
	
	public int create(MessageRoom messageRoom) throws SQLException {
		return messageRoomDAO.create(messageRoom);
	}

	public List<MessageRoom> findMessageList(User user) throws SQLException {
			return messageRoomDAO.findRoomList(user);
	}

}
