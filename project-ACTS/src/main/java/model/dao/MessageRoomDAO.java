package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.MessageRoom;
import model.User;

public class MessageRoomDAO {
	
	private static final Logger log = LoggerFactory.getLogger(MessageDAO.class);
	private JDBCUtil jdbcUtil = null;
	
	public MessageRoomDAO() {			
		jdbcUtil = new JDBCUtil();
	}
	
	// 메세지 룸 만들어짐
	public int create(MessageRoom messageRoom) throws SQLException {

		String sql = "INSERT INTO MESSAGE VALUES (id_seq.nextva, ?, ?)";
		Object[] param = new Object[] { messageRoom.getSenderId(),messageRoom.getReceiverId()};		
		
		System.out.println("sql: " + sql);
		System.out.println("param: " + param);
		
		for (Object p : param) {
			System.out.println(p);
		}

		jdbcUtil.setSqlAndParameters(sql, param);	
		try {
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {	 
			jdbcUtil.commit();
			jdbcUtil.close();
		}
		return 0;			
	}
	
	// 메세지 룸 리스트 반환
	public List<MessageRoom> findRoomList(User user) throws SQLException {
        String sql = "SELECT roomId, senderId, receiverId " 
        		   + "FROM MessageRoom "
        		   + "WHERE receiverId=?";
		jdbcUtil.setSqlAndParameters(sql, null);
		
		Object[] param = new Object[] { user.getUserId() };
		jdbcUtil.setSqlAndParameters(sql, param);
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();					
			List<MessageRoom> roomList = new ArrayList<MessageRoom>();	
			while (rs.next()) {
				MessageRoom messageRoom = new MessageRoom(
						rs.getInt("roomId"),
						rs.getInt("senderId"),
						rs.getInt("receiverId"));
//					System.out.println("cTime: " + message.getcTime());
				roomList.add(messageRoom);	
			}
			return roomList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();	
		}
		return null;
	}

}
