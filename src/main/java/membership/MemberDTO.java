package membership;
/*
DTO(Data Transfer Object)
: JSP와 Java파일간에 데이터를 전달하기 위한 객체로 자바빈
규약에 의해 제작한다.
자바빈 규약은 교재 115페이지를 참조한다.
*/
public class MemberDTO {
	
	//멤버변수 : member테이블의 컬럼과 동일하게 설정한다.
	private String id;
	private String pass;
	private String userName;
	private String email;
	private String phone;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

}
