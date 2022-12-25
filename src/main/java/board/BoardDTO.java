package board;

public class BoardDTO {
	
	private int idx;
	private String b_flag;
	private String category;
	private String boardTitle;
	private String boardContent;
	private String ofile1;
	private String nfile1;
	private String ofile2;
	private String nfile2;
	private String userName;
	private int visitCount;
	private java.sql.Date regidate;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getB_flag() {
		return b_flag;
	}
	public void setB_flag(String b_flag) {
		this.b_flag = b_flag;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getOfile1() {
		return ofile1;
	}
	public void setOfile1(String ofile1) {
		this.ofile1 = ofile1;
	}
	public String getNfile1() {
		return nfile1;
	}
	public void setNfile1(String nfile1) {
		this.nfile1 = nfile1;
	}
	public String getOfile2() {
		return ofile2;
	}
	public void setOfile2(String ofile2) {
		this.ofile2 = ofile2;
	}
	public String getNfile2() {
		return nfile2;
	}
	public void setNfile2(String nfile2) {
		this.nfile2 = nfile2;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	
}
