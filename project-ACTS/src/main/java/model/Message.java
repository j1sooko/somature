package model;

import java.util.Date;

public class Message {
	private Date cTime;
	private String content;
	private int messageId;
	private int receiverId;
	private int senderId;
	
	public Message() {}

	public Message(Date cTime, String content, int messageId, int receiverId, int senderId) {
		this.cTime = cTime;
		this.content = content;
		this.messageId = messageId;
		this.receiverId = receiverId;
		this.senderId = senderId;
	}
	
	public Message(String content, int receiverId, int senderId) {
		this.content = content;
		this.receiverId = receiverId;
		this.senderId = senderId;
	}
	
	public Message(int receiverId, int senderId) {
		this.receiverId = receiverId;
		this.senderId = senderId;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public Date getcTime() {
		return cTime;
	}

	public void setcTime(Date cTime) {
		this.cTime = cTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}

	public int getSenderId() {
		return senderId;
	}

	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	@Override
	public String toString() {
		return "Message [cTime=" + cTime + ", content=" + content + ", messageId=" + messageId + ", receiverId="
				+ receiverId + ", senderId=" + senderId + "]";
	}
	
	
	
	
}
