package model.service;

import java.sql.SQLException;
import java.util.List;

import model.Review;
import model.User;
import model.dao.*;

public class ReviewManager {
	
	private static ReviewManager reviewMan = new ReviewManager();
	private ReviewDAO reviewDAO;
	private PostDAO postDAO;

	private ReviewManager() {
		try {
			reviewDAO = new ReviewDAO();
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}
	
	public static ReviewManager getInstance() {
		return reviewMan;
	}
	
	public int create(Review review) throws SQLException {
		return reviewDAO.create(review);
	}

	public int update(Review review) throws SQLException {
		return reviewDAO.update(review);
	}	

	public int remove(int reviewId) throws SQLException {
		return reviewDAO.remove(reviewId);
	}
	
	public List<Review> findReviewList(int postId) throws SQLException {
		List<Review> reviewList = reviewDAO.findReviewList(postId);
		
		for (Review reviewer : reviewList) {
			postDAO.findUserNickNameByUserId(reviewer.getReviewerId());
			
			
			
		}
		
		return reviewList;
}

}
