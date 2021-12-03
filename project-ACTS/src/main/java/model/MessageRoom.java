package model;

public class MessageRoom {
	private int roomId;
	private int senderId;
	private int receiverId;
	
	public MessageRoom() { }
	
	public MessageRoom(int roomId, int senderId, int receiverId) {
		super();
		this.roomId = roomId;
		this.senderId = senderId;
		this.receiverId = receiverId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getSenderId() {
		return senderId;
	}

	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}
	
	
	
	
	
}
