package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import article.model.ArticleProjectImages;
import article.model.ArticleProjectVideo;
import jdbc.JdbcUtil;

public class ArticleFileDao {

	public ArticleProjectImages imagesinsert(Connection conn, ArticleProjectImages article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("insert into projectimages_files "
					+ "(id, article_id, file_name, file_path) "
					+ "values (?,?,?,?)");
			pstmt.setInt(1, article.getNumber());
			pstmt.setInt(2, article.getArticle_number());
			pstmt.setString(3, article.getFile_name());
			pstmt.setString(4, article.getFile_path());
			int insertedCount = pstmt.executeUpdate();

			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from article");
				if (rs.next()) {
					Integer newNo = rs.getInt(1);
					return new ArticleProjectImages(newNo,
							article.getArticle_number(),
							article.getFile_name(),
							article.getFile_path());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
		
		
	}
	
	public ArticleProjectVideo Vidoeinsert(Connection conn, ArticleProjectVideo article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("insert into projectv_files "
					+ "(id, article_id, file_name, file_path) "
					+ "values (?,?,?,?)");
			pstmt.setInt(1, article.getNumber());
			pstmt.setInt(2, article.getArticle_number());
			pstmt.setString(3, article.getFile_name());
			pstmt.setString(4, article.getFile_path());
			int insertedCount = pstmt.executeUpdate();

			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from article");
				if (rs.next()) {
					Integer newNo = rs.getInt(1);
					return new ArticleProjectVideo(newNo,
							article.getArticle_number(),
							article.getFile_name(),
							article.getFile_path());
				}
			}
			return null;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
		
		
	}
}
