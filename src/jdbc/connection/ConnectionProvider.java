package jdbc.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	// 커넥션 연결을 위한 jdbc driver URL을 담은 클래스
	
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                "jdbc:apache:commons:dbcp:board");
    }
}
