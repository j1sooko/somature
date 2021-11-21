package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Post;
import model.dao.PostDAO;
/**
 * 占쏙옙占쏙옙占� 占쏙옙占쏙옙 API占쏙옙 占쏙옙占쏙옙求占� 占쏙옙占쏙옙占쌘듸옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹곤옙 占실댐옙 클占쏙옙占쏙옙.
 * UserDAO占쏙옙 占싱울옙占싹울옙 占쏙옙占쏙옙占싶븝옙占싱쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쌜억옙占쏙옙 占쏙옙占쏙옙占싹듸옙占쏙옙 占싹몌옙,
 * 占쏙옙占쏙옙占싶븝옙占싱쏙옙占쏙옙 占쏙옙占쏙옙占싶듸옙占쏙옙 占싱울옙占싹울옙 占쏙옙占쏙옙占싹쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占쏙옙占쏙옙 占싼댐옙.
 * 占쏙옙占쏙옙占싹쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙荑∽옙占� 占쏙옙占쏙옙占싹쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 클占쏙옙占쏙옙占쏙옙 
 * 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙 占쌍댐옙.
 */
public class PostManager {
	private static PostManager post = new PostManager();
	private PostDAO postDAO;

	private PostManager() {
		try {
			postDAO = new PostDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static PostManager getInstance() {
		return post;
	}
	
	public int create(Post post) throws SQLException {
		return postDAO.create(post);
	}

	public int update(Post post) throws SQLException, PostNotFoundException {
		return postDAO.update(post);
	}	

	public int remove(int postId) throws SQLException, PostNotFoundException {
		return postDAO.remove(postId);
	}

	public Post findPost(int postId)
		throws SQLException, PostNotFoundException {
		Post post = postDAO.findPost(postId);
		
		if (post == null) {
			throw new PostNotFoundException(postId + "占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占십댐옙 占쏙옙占싱듸옙占쌉니댐옙.");
		}		
		return post;
	}

	public List<Post> findPostList() throws SQLException {
			return postDAO.findPostList();
	}
	
	public List<Post> findPostListUseCategory(String cName) throws SQLException {
		return postDAO.findPostListUseCategory(cName);
}
	
	public PostDAO getPostDAO() {
		return this.postDAO;
	}
	
	public void increasePostView(Post post) throws SQLException {
		postDAO.increasePostView(post);
	}
	
	public String getPostUserNickName (int userId) throws SQLException {
		
		return postDAO.findUserNickNameByUserId(userId);
	}
}
