package selenium.crwaling;

import artFairs.bean.ArtFairsDTO;

import java.sql.*;


public class crwalingDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "C##dbexam";
	String password = "m1234";

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public crwalingDAO() {
	      try {
	         Class.forName(driver);
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	   }

	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int insertArtFairsMain(ArtFairsDTO dto) {
		int result = 0;
		String sql = "insert into artFairsMain values(?, ?, ?)";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMainimg_src());
			pstmt.setString(2, dto.getAfdate());
			pstmt.setString(3, dto.getTitle());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int insertArtFairsView(ArtFairsDTO dto) {
		int result = 0;
		String sql = "insert into artFairsView values(?, ?, ?, ?, ?, ?, ?, ?)";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getInfo_date());
			pstmt.setString(3, dto.getInfo());
			pstmt.setString(4, dto.getDetailimg_src());
			pstmt.setString(5, dto.getPlace());
			pstmt.setString(6, dto.getPlace_detail());
			pstmt.setString(7, dto.getArtists());
			pstmt.setString(8, dto.getArtist_name());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

}
