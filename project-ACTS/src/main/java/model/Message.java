package model;

import java.util.Date;

public class Message {
	private int messageId;
	private String content;
	private Date cTime;
	private int roomId;
	
	public Message() {}
	
	public Message(int messageId, String content, Date cTime, int roomId) {
		this.messageId = messageId;
		this.content = content;
		this.cTime = cTime;
		this.roomId = roomId;
	}
	
	public Message(String content) {
		this.content = content;
	}

	public int getMessageId() {
		return messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getcTime() {
		return cTime;
	}

	public void setcTime(Date cTime) {
		this.cTime = cTime;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", content=" + content + ", cTime=" + cTime + ", roomId=" + roomId
				+ "]";
	}
	
	
	
}
