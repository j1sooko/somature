package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import java.sql.Date;

/**
 * �궗�슜�옄 愿�由щ�� �쐞�빐 �뜲�씠�꽣踰좎씠�뒪 �옉�뾽�쓣 �쟾�떞�븯�뒗 DAO �겢�옒�뒪
 * ACCOUNT �뀒�씠釉붿뿉 �궗�슜�옄 �젙蹂대�� 異붽�, �닔�젙, �궘�젣, 寃��깋 �닔�뻾 
 */
public class UserDAO {
	private JDBCUtil jdbcUtil = null;
	
	public UserDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 媛앹껜 �깮�꽦
	}
		
	/**
	 * �궗�슜�옄 愿�由� �뀒�씠釉붿뿉 �깉濡쒖슫 �궗�슜�옄 �깮�꽦.
	 */
	public int create(User user) throws SQLException {
		String sql = "INSERT INTO ACCOUNT VALUES (id_seq.nextval, ?, ?, ?, ?, ?, DEFAULT, ?, 5, ?)";		
		Object[] param = new Object[] { user.getPhone(), user.getEmail(), user.getName(), 
						user.getRegNum(), user.getPassword(), user.getAccountId(), user.getNickName()};		
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil �뿉 insert臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙	
		try {
			int result = jdbcUtil.executeUpdate();	// insert 臾� �떎�뻾
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {	 
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 諛섑솚
		}
		return 0;			
	}

	/**
	 * 湲곗〈�쓽 �궗�슜�옄 �젙蹂대�� �닔�젙.
	 */
	public int update(User user) throws SQLException {
		String sql = "UPDATE ACCOUNT "

					+ "SET phoneNumber=?, emailAddress=?, userName=?, "
					+ "password=?, nickName=? "
					+ "WHERE accountId=?";
		Object[] param = new Object[]  { user.getPhone(), user.getEmail(), user.getName(), 
				user.getPassword(), user.getNickName(), user.getAccountId()};			
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil�뿉 update臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙
		System.out.println("update query: " + sql);
		System.out.println("param: " + param);
		for (Object p : param) {
			System.out.println("p: " + p);
		}
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update 臾� �떎�뻾
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 諛섑솚
		}		
		return 0;
	}

	/**
	 * �궗�슜�옄 ID�뿉 �빐�떦�븯�뒗 �궗�슜�옄瑜� �궘�젣.
	 */
	public int remove(String userId) throws SQLException {
		String sql = "DELETE FROM ACCOUNT WHERE userid=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil�뿉 delete臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 臾� �떎�뻾
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 諛섑솚
		}		
		return 0;
	}

	/**
	 * 二쇱뼱吏� �궗�슜�옄 ID�뿉 �빐�떦�븯�뒗 �궗�슜�옄 �젙蹂대�� �뜲�씠�꽣踰좎씠�뒪�뿉�꽌 李얠븘 User �룄硫붿씤 �겢�옒�뒪�뿉 
	 * ���옣�븯�뿬 諛섑솚.
	 */
	public User findUser(String accountId) throws SQLException {
        String sql = "SELECT userId, phoneNumber, emailAddress, userName, registrationNumber,  password, accountId, joinDate, rating, nickName "
        			+ "FROM ACCOUNT "
        			+ "WHERE accountId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {accountId});	// JDBCUtil�뿉 query臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query �떎�뻾
			if (rs.next()) {						// �븰�깮 �젙蹂� 諛쒓껄
				User user = new User(		// User 媛앹껜瑜� �깮�꽦�븯�뿬 �븰�깮 �젙蹂대�� ���옣
					rs.getInt("userId"),
						accountId,
					rs.getString("password"),
					rs.getString("userName"),
					rs.getString("emailAddress"),
					rs.getString("phoneNumber"),
					rs.getString("registrationNumber"),
					rs.getDate("joinDate"),
					rs.getInt("rating"),
					rs.getString("nickName"));
				return user;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 諛섑솚
		}
		return null;
	}

	/**
	 * �쟾泥� �궗�슜�옄 �젙蹂대�� 寃��깋�븯�뿬 List�뿉 ���옣 諛� 諛섑솚
	 */
	public List<User> findUserList() throws SQLException {
        String sql = "SELECT phoneNumber, emailAddress, userName, registrationNumber, joinDate, accountId, rating, nickName " 
        		   + "FROM ACCOUNT "
        		   + "ORDER BY userId";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil�뿉 query臾� �꽕�젙
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query �떎�뻾			
			List<User> userList = new ArrayList<User>();	// User�뱾�쓽 由ъ뒪�듃 �깮�꽦
			while (rs.next()) {
				User user = new User(			// User 媛앹껜瑜� �깮�꽦�븯�뿬 �쁽�옱 �뻾�쓽 �젙蹂대�� ���옣
						rs.getString("accountId"),
						null,
						rs.getString("userName"),
						rs.getString("emailAddress"),
						rs.getString("phoneNumber"),
						rs.getString("registrationNumber"),
						valueOf(rs.getDate("joinDate")),
						rs.getInt("rating"),
						rs.getString("nickName"));
				userList.add(user);				// List�뿉 User 媛앹껜 ���옣
			}		
			return userList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 諛섑솚
		}
		return null;
	}
	
	/**
	 * �쟾泥� �궗�슜�옄 �젙蹂대�� 寃��깋�븳 �썑 �쁽�옱 �럹�씠吏��� �럹�씠吏��떦 異쒕젰�븷 �궗�슜�옄 �닔瑜� �씠�슜�븯�뿬
	 * �빐�떦�븯�뒗 �궗�슜�옄 �젙蹂대쭔�쓣 List�뿉 ���옣�븯�뿬 諛섑솚.
	 */
//	public List<User> findUserList(int currentPage, int countPerPage) throws SQLException {
//		String sql = "SELECT userId, name, email, NVL(commId, 0), cName " 
//					+ "FROM USERINFO u LEFT OUTER JOIN Community c ON u.commId = c.cId "
//					+ "ORDER BY userId";
//		jdbcUtil.setSqlAndParameters(sql, null,					// JDBCUtil�뿉 query臾� �꽕�젙
//				ResultSet.TYPE_SCROLL_INSENSITIVE,				// cursor scroll 媛��뒫
//				ResultSet.CONCUR_READ_ONLY);						
//		
//		try {
//			ResultSet rs = jdbcUtil.executeQuery();				// query �떎�뻾			
//			int start = ((currentPage-1) * countPerPage) + 1;	// 異쒕젰�쓣 �떆�옉�븷 �뻾 踰덊샇 怨꾩궛
//			if ((start >= 0) && rs.absolute(start)) {			// 而ㅼ꽌瑜� �떆�옉 �뻾�쑝濡� �씠�룞
//				List<User> userList = new ArrayList<User>();	// User�뱾�쓽 由ъ뒪�듃 �깮�꽦
//				do {
//					User user = new User(			// User 媛앹껜瑜� �깮�꽦�븯�뿬 �쁽�옱 �뻾�쓽 �젙蹂대�� ���옣
//						rs.getString("userId"),
//						null,
//						rs.getString("name"),
//						rs.getString("email"),
//						null);
//					userList.add(user);							// 由ъ뒪�듃�뿉 User 媛앹껜 ���옣
//				} while ((rs.next()) && (--countPerPage > 0));		
//				return userList;							
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			jdbcUtil.close();		// resource 諛섑솚
//		}
//		return null;
//	}

	
	private java.util.Date valueOf(Date date) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 二쇱뼱吏� �궗�슜�옄 ID�뿉 �빐�떦�븯�뒗 �궗�슜�옄媛� 議댁옱�븯�뒗吏� 寃��궗 
	 */
	public boolean existingUser(String accountId) throws SQLException {
		String sql = "SELECT count(*) FROM ACCOUNT WHERE accountId=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {accountId});	// JDBCUtil�뿉 query臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query �떎�뻾
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 諛섑솚
		}
		return false;
	}

}
