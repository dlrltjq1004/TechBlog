package article.service;

import java.util.Map;

public class ModifyRequest {

	private String userId;
	private int articleNumber;
	private String category;
	private String category2;
	private String representative_image;	
	private String title;
	private String content;
	
	public ModifyRequest(String userId, int articleNumber, String category, String category2, 
			String representative_image, String title, String content) {
		this.userId = userId;
		this.articleNumber = articleNumber;
		this.category = category;
		this.category2 = category2;
		this.representative_image = representative_image;
		this.title = title;
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public int getArticleNumber() {
		return articleNumber;
	}
	
	public String getCategory() {
		return category;
	}
	
	public String getCategory2() {
		return category2;
	}
	
	public String getrepresentative_image() {
		return representative_image;
	}
	

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

}
