package article.service;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import article.model.Writer;

public class WriteRequest {

	private Writer writer;
	private String category;
	private String category2;
	private String representative_image;
	private String title;
	private String content;

	public WriteRequest(Writer writer, String category, String category2,
			String representative_image, String title, String content) {
		this.writer = writer;
		this.category = category;
		this.category2 = category2;
		this.representative_image = representative_image;
		this.title = title;
		this.content = content;
	}
	


	public Writer getWriter() {
		return writer;
	}
	public String getCategory() {
		return category;
	}
	public String getCategory2() {
		return category2;
	}
	public String getRepresentative_image() {
		return representative_image;
	}
	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public void validate(Map<String, Boolean> errors) {
		
		if(category == null || category.trim().isEmpty()) {
			errors.put("category", Boolean.TRUE);
		} else if(category2 == null || category2.trim().isEmpty()) {
			errors.put("category2", Boolean.TRUE);
		} else if (representative_image == null || representative_image.trim().isEmpty()) {
			errors.put("representative_image", Boolean.TRUE);
		} else if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
		/*
		 * else if (content == null || content.trim().isEmpty()) { errors.put("content",
		 * Boolean.TRUE); }
		 */
		
		if(!errors.isEmpty()) {
			System.out.println("id: " + writer.getId() + " name: "+ writer.getName() + " category: " +
			getCategory() + " category2: " + getCategory2() + " image:  " + getRepresentative_image()  + 
			" title: " + getTitle() + " content: " + getContent());
		}
		
		
		
		
		
		
	}
}
