package article.model;

public class ArticleProjectImages {

	private Integer number;
	private Integer article_number;
	private String  file_name;
	private String  file_path;
	
	public ArticleProjectImages(Integer number, Integer article_number, String file_name, String file_path) {
		
		this.number         = number;
		this.article_number = article_number;
		this.file_name  = file_name;
		this.file_path  = file_path;
	}
	
	public Integer getNumber() {
		return number;
	}
	
	public Integer getArticle_number() {
		return article_number;
	}
	
	public String getFile_name() {
		return file_name;
	}
	
	public String getFile_path() {
		return file_path;
	}	
}
