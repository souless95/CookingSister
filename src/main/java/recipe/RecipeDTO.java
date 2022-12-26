package recipe;

public class RecipeDTO {
	
	private int idx;
	private String recipeName;
	private String recipeImg;
	private String recipeTitle;
	private String recipeContent;
	private String recipeContentImg;
	private String recipeMust;
	private String recipeSeason;
	private java.sql.Date regidate;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	public String getRecipeImg() {
		return recipeImg;
	}
	public void setRecipeImg(String recipeImg) {
		this.recipeImg = recipeImg;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getRecipeContent() {
		return recipeContent;
	}
	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}
	public String getRecipeContentImg() {
		return recipeContentImg;
	}
	public void setRecipeContentImg(String recipeContentImg) {
		this.recipeContentImg = recipeContentImg;
	}
	public String getRecipeMust() {
		return recipeMust;
	}
	public void setRecipeMust(String recipeMust) {
		this.recipeMust = recipeMust;
	}
	public String getRecipeSeason() {
		return recipeSeason;
	}
	public void setRecipeSeason(String recipeSeason) {
		this.recipeSeason = recipeSeason;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	
	
	
}
