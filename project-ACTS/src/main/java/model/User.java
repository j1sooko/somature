package model;

/**
 * 사용자 관리를 위해 필요한 도메인 클래스. USERINFO 테이블과 대응됨
 */
public class User {
	private String accountId;
	private String password;
	private String userName;
	private String phone;
	private String email;
	private String registrationNumber;
	private String nickname;


	public User() { }		// 기본 생성자
	
	public User(String accountId, String password, String userName, String phone, String email, String registrationNumber, String nickname) {
		this.accountId = accountId;
		this.password = password;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.registrationNumber = registrationNumber;
		this.nickname = nickname;
	}

	public User(String accountId, String userName, String email, String phone) {
		this.accountId = accountId;
		this.userName = userName;
		this.email = email;
		this.phone = phone;		
	}
	
	/*public void update(User updateUser) {
        this.password = updateUser.password;
        this.name = updateUser.name;
        this.email = updateUser.email;
        this.phone = updateUser.phone;
    }*/
	

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegistrationNumber() {
		return registrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}	
	

	@Override
	public String toString() {
		return "User [accountId=" + accountId + ", password=" + password + ", userName=" + userName + ", phone=" + phone + ", email="
				+ email + ", registrationNumber=" + registrationNumber + ", nickname=" + nickname +"]";
	}
}
