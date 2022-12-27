package recipe;

public class RecipeDTO {
	
	private int idx;
	private String rName;
	private String rOfile;
	private String rNfile;
	private String rTitle;
	private String rContent;
	private String rContentOfile;
	private String rContentNfile;
	private String rMust;
	private String rSeason;
	private java.sql.Date regidate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrOfile() {
		return rOfile;
	}
	public void setrOfile(String rOfile) {
		this.rOfile = rOfile;
	}
	public String getrNfile() {
		return rNfile;
	}
	public void setrNfile(String rNfile) {
		this.rNfile = rNfile;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrContentOfile() {
		return rContentOfile;
	}
	public void setrContentOfile(String rContentOfile) {
		this.rContentOfile = rContentOfile;
	}
	public String getrContentNfile() {
		return rContentNfile;
	}
	public void setrContentNfile(String rContentNfile) {
		this.rContentNfile = rContentNfile;
	}
	public String getrMust() {
		return rMust;
	}
	public void setrMust(String rMust) {
		this.rMust = rMust;
	}
	public String getrSeason() {
		return rSeason;
	}
	public void setrSeason(String rSeason) {
		this.rSeason = rSeason;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	
}
