package article.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {

	private Integer number;
	private Writer writer;
	private String category;
	private String category2;
	private String representative_image;
	private String title;
	private Date regDate;
	private Date modifiedDate;
	private int readCount;

	public Article(Integer number, Writer writer, 
			String category, String category2, String representative_image, String title, 
			Date regDate, Date modifiedDate, int readCount) {
		this.number = number;
		this.writer = writer;
		this.category = category;
		this.category2 = category2;
		this.representative_image = representative_image;
		this.title = title;
		this.regDate = regDate;
		this.modifiedDate = modifiedDate;
		this.readCount = readCount;
	}

	public Integer getNumber() {
		return number;
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

	public Date getRegDate() {
		return regDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public int getReadCount() {
		return readCount;
	}

}
