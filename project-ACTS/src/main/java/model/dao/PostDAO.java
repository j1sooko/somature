package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Post;

/**
 * 寃뚯떆湲� 愿�由щ�� �쐞�빐 �뜲�씠�꽣踰좎씠�뒪 �옉�뾽�쓣 �쟾�떞�븯�뒗 DAO �겢�옒�뒪
 * POST �뀒�씠釉붿뿉 �궗�슜�옄 �젙蹂대�� 異붽�, �닔�젙, �궘�젣, 寃��깋 �닔�뻾 
 */
public class PostDAO {
private JDBCUtil jdbcUtil = null;
	
	public PostDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 媛앹껜 �깮�꽦
	}
		
	/**
	 * 寃뚯떆湲� 愿�由� �뀒�씠釉붿뿉 �깉濡쒖슫 寃뚯떆湲� �깮�꽦.
	 */
	public int create(Post post) throws SQLException {
		String sql = "INSERT INTO POST VALUES (id_seq.nextval, ?, ?, ?, DEFAULT, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] { post.getTitle(), post.getDesc(), null, null, 
				0, post.getStatus(), post.getPrice(), post.getpType(), post.getWriterId()};		
//		Object[] param = new Object[] { post.getTitle(), post.getDesc(), post.getImgUrl(), post.getCategoryId(), 
//				post.getViews(), post.getStatus(), post.getPrice(), post.getpType(), post.getWriterId()};		
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
	 * 湲곗〈�쓽 寃뚯떆湲� �젙蹂대�� �닔�젙.
	 */
	public int update(Post post) throws SQLException {
		String sql = "UPDATE POST "
					+ "SET title=?, description=?, imageUrl=?, categoryId=?, views=?, status=?, price=? "
					+ "WHERE postId=?";
		Object[] param = new Object[]  { post.getTitle(), post.getDesc(), post.getImgUrl(), post.getCategoryId(), 
				post.getViews(), post.getStatus(), post.getPrice() };			
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil�뿉 update臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙
			
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
	 * 寃뚯떆湲� ID�뿉 �빐�떦�븯�뒗 寃뚯떆湲��쓣 �궘�젣.
	 */
	public int remove(String postId) throws SQLException {
		String sql = "DELETE FROM POST WHERE postId=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	// JDBCUtil�뿉 delete臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙

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
	 * 二쇱뼱吏� 寃뚯떆湲� ID�뿉 �빐�떦�븯�뒗 寃뚯떆湲� �젙蹂대�� �뜲�씠�꽣踰좎씠�뒪�뿉�꽌 李얠븘 Post �룄硫붿씤 �겢�옒�뒪�뿉 
	 * ���옣�븯�뿬 諛섑솚.
	 */
	public Post findPost(int postId) throws SQLException {
        String sql = "SELECT title, description, imageUrl, createdTime, categoryId, "
        			+ "views, status, price, postType, writerId "
        			+ "FROM POST "
        			+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	// JDBCUtil�뿉 query臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query �떎�뻾
			if (rs.next()) {						// �븰�깮 �젙蹂� 諛쒓껄
				Post post = new Post(		// User 媛앹껜瑜� �깮�꽦�븯�뿬 �븰�깮 �젙蹂대�� ���옣
					postId,
					rs.getString("title"),
					rs.getString("description"),
					rs.getString("imageUrl"),
					rs.getDate("createdTime"),
					rs.getInt("categoryId"),
					rs.getInt("views"),
					rs.getString("status"),
					rs.getInt("price"),
					rs.getString("postType"),
					rs.getInt("writerId"));
				return post;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 諛섑솚
		}
		return null;
	}

	/**
	 * �쟾泥� 寃뚯떆湲� �젙蹂대�� 寃��깋�븯�뿬 List�뿉 ���옣 諛� 諛섑솚
	 */
	public List<Post> findPostList() throws SQLException {
        String sql = "SELECT title, views, status, price, postType, writerId " 
        		   + "FROM POST "
        		   + "ORDER BY postId";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil�뿉 query臾� �꽕�젙
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query �떎�뻾			
			List<Post> postList = new ArrayList<Post>();	// User�뱾�쓽 由ъ뒪�듃 �깮�꽦
			while (rs.next()) {
				Post post = new Post(			// User 媛앹껜瑜� �깮�꽦�븯�뿬 �쁽�옱 �뻾�쓽 �젙蹂대�� ���옣
						rs.getInt("postId"),
						rs.getString("title"),
						rs.getInt("views"),
						rs.getString("status"),
						rs.getInt("price"),
						rs.getString("postType"),
						rs.getInt("writerId"));
				postList.add(post);				// List�뿉 User 媛앹껜 ���옣
			}		
			return postList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 諛섑솚
		}
		return null;
	}
	
//	/**
//	 * 二쇱뼱吏� �궗�슜�옄 ID�뿉 �빐�떦�븯�뒗 �궗�슜�옄媛� 議댁옱�븯�뒗吏� 寃��궗 
//	 */
//	public boolean existingUser(String accountId) throws SQLException {
//		String sql = "SELECT count(*) FROM ACCOUNT WHERE accountId=?";      
//		jdbcUtil.setSqlAndParameters(sql, new Object[] {accountId});	// JDBCUtil�뿉 query臾멸낵 留ㅺ컻 蹂��닔 �꽕�젙
//
//		try {
//			ResultSet rs = jdbcUtil.executeQuery();		// query �떎�뻾
//			if (rs.next()) {
//				int count = rs.getInt(1);
//				return (count == 1 ? true : false);
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			jdbcUtil.close();		// resource 諛섑솚
//		}
//		return false;
//	}

}
