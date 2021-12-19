package model;

import java.util.Date;

public class Transaction {
	private int transId;
	private Date transDate;
	private User user;
	private Post post;
	private int userId;
	private int postId;
	
	public Transaction(int transId, Date transDate, User user, Post post) {
		this.transId = transId;
		this.transDate = transDate;
		this.user = user;
		this.post = post;
	}

	public Transaction(User user, Post post) {
		this.user = user;
		this.post = post;
	}
	
	public Transaction(int transId, Date transDate, int userId, int postId) {
		this.transId = transId;
		this.transDate = transDate;
		this.userId = userId;
		this.postId = postId;
	}

	public int getTransId() {
		return transId;
	}

	public void setTransId(int transId) {
		this.transId = transId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Date getTransDate() {
		return transDate;
	}

	public void setTransDate(Date transDate) {
		this.transDate = transDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	@Override
	public String toString() {
		return "Transaction [transId=" + transId + ", transDate=" + transDate + ", user=" + user + ", post=" + post
				+ ", userId=" + userId + ", postId=" + postId + "]";
	}
	
	
	
}
