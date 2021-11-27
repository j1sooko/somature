package model.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Message;

public class MessageDAO {
	
	private static final Logger log = LoggerFactory.getLogger(PostDAO.class);
	private JDBCUtil jdbcUtil = null;
		
		public MessageDAO() {			
			jdbcUtil = new JDBCUtil();
		}
		
		// 메세지 전송 시
		public int create(Message message) throws SQLException {

			String sql = "INSERT INTO MESSAGE VALUES (DEFAULT, ?, id_seq.nextval, ?, ?)";
			Object[] param = new Object[] { message.getContent(), message.getReceiverId(), message.getSenderId()};		
			
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
		
		// 메세지 리스트 반환
		public List<Message> findMessageList() throws SQLException {
	        String sql = "SELECT createdtime, content, messengerId, receiverId, senderId " 
	        		   + "FROM MESSAGE "
	        		   + "ORDER BY createdtime";
			jdbcUtil.setSqlAndParameters(sql, null);	
						
			try {
				ResultSet rs = jdbcUtil.executeQuery();					
				List<Message> messageList = new ArrayList<Message>();	
				while (rs.next()) {
					Message message = new Message(
							valueOf(rs.getDate("joinDate")),
							rs.getString("content"),
							rs.getInt("messengerId"),
							rs.getInt("receiverId"),
							rs.getInt("senderId"));
					messageList.add(message);	
				}		
				return messageList;					
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();	
			}
			return null;
		}
		
		private java.util.Date valueOf(Date date) {
			// TODO Auto-generated method stub
			return null;
		}

}
