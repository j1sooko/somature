package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Post;

/**
 * 게시글 관리를 위해 데이터베이스 작업을 전담하는 DAO 클래스
 * POST 테이블에 사용자 정보를 추가, 수정, 삭제, 검색 수행 
 */
public class PostDAO {
private JDBCUtil jdbcUtil = null;
	
	public PostDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
		
	/**
	 * 게시글 관리 테이블에 새로운 게시글 생성.
	 */
	public int create(Post post) throws SQLException {
		String sql = "INSERT INTO POST VALUES (id_seq.nextval, ?, ?, ?, DEFAULT, ?, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] { post.getTitle(), post.getDesc(), post.getImgUrl(), post.getCategoryId(), 
				post.getViews(), post.getStatus(), post.getPrice(), post.getpType(), post.getWriterId()};		
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정	
		try {
			int result = jdbcUtil.executeUpdate();	// insert 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {	 
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}
		return 0;			
	}

	/**
	 * 기존의 게시글 정보를 수정.
	 */
	public int update(Post post) throws SQLException {
		String sql = "UPDATE POST "
					+ "SET title=?, description=?, imageUrl=?, categoryId=?, views=?, status=?, price=? "
					+ "WHERE postId=?";
		Object[] param = new Object[]  { post.getTitle(), post.getDesc(), post.getImgUrl(), post.getCategoryId(), 
				post.getViews(), post.getStatus(), post.getPrice() };			
		jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil에 update문과 매개 변수 설정
			
		try {				
			int result = jdbcUtil.executeUpdate();	// update 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}

	/**
	 * 게시글 ID에 해당하는 게시글을 삭제.
	 */
	public int remove(String postId) throws SQLException {
		String sql = "DELETE FROM POST WHERE postId=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	// JDBCUtil에 delete문과 매개 변수 설정

		try {				
			int result = jdbcUtil.executeUpdate();	// delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();	// resource 반환
		}		
		return 0;
	}

	/**
	 * 주어진 게시글 ID에 해당하는 게시글 정보를 데이터베이스에서 찾아 Post 도메인 클래스에 
	 * 저장하여 반환.
	 */
	public Post findPost(int postId) throws SQLException {
        String sql = "SELECT title, description, imageUrl, createdTime, categoryId, "
        			+ "views, status, price, postType, writerId "
        			+ "FROM POST "
        			+ "WHERE postId=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {postId});	// JDBCUtil에 query문과 매개 변수 설정

		try {
			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
			if (rs.next()) {						// 학생 정보 발견
				Post post = new Post(		// User 객체를 생성하여 학생 정보를 저장
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
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}

	/**
	 * 전체 게시글 정보를 검색하여 List에 저장 및 반환
	 */
	public List<Post> findPostList() throws SQLException {
        String sql = "SELECT title, views, status, price, postType, writerId " 
        		   + "FROM POST "
        		   + "ORDER BY postId";
		jdbcUtil.setSqlAndParameters(sql, null);		// JDBCUtil에 query문 설정
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();			// query 실행			
			List<Post> postList = new ArrayList<Post>();	// User들의 리스트 생성
			while (rs.next()) {
				Post post = new Post(			// User 객체를 생성하여 현재 행의 정보를 저장
						rs.getInt("postId"),
						rs.getString("title"),
						rs.getInt("views"),
						rs.getString("status"),
						rs.getInt("price"),
						rs.getString("postType"),
						rs.getInt("writerId"));
				postList.add(post);				// List에 User 객체 저장
			}		
			return postList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		return null;
	}
	
//	/**
//	 * 주어진 사용자 ID에 해당하는 사용자가 존재하는지 검사 
//	 */
//	public boolean existingUser(String accountId) throws SQLException {
//		String sql = "SELECT count(*) FROM ACCOUNT WHERE accountId=?";      
//		jdbcUtil.setSqlAndParameters(sql, new Object[] {accountId});	// JDBCUtil에 query문과 매개 변수 설정
//
//		try {
//			ResultSet rs = jdbcUtil.executeQuery();		// query 실행
//			if (rs.next()) {
//				int count = rs.getInt(1);
//				return (count == 1 ? true : false);
//			}
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			jdbcUtil.close();		// resource 반환
//		}
//		return false;
//	}

}
