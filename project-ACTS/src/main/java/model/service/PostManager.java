package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Post;
import model.dao.PostDAO;

/**
 * ����� ���� API�� ����ϴ� �����ڵ��� ���� �����ϰ� �Ǵ� Ŭ����.
 * UserDAO�� �̿��Ͽ� �����ͺ��̽��� ������ ���� �۾��� �����ϵ��� �ϸ�,
 * �����ͺ��̽��� �����͵��� �̿��Ͽ� �����Ͻ� ������ �����ϴ� ������ �Ѵ�.
 * �����Ͻ� ������ ������ ��쿡�� �����Ͻ� �������� �����ϴ� Ŭ������ 
 * ������ �� �� �ִ�.
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
			throw new PostNotFoundException(postId + "�� �������� �ʴ� ���̵��Դϴ�.");
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
}
