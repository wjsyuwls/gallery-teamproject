package selenium.dao;

import selenium.dto.DTO;

import java.sql.*;

public class DAO {

    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String username = "C##dbexam";
    String password = "m1234";

    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;

    public DAO() {
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

//    public int insert(DTO dto) {
//        int result = 0;
//        String sql = "insert into artist values(?, ?, ?)";
//        conn = getConnection();
//        try {
//            pstmt = conn.prepareStatement(sql);
//            pstmt.setString(1, dto.getEng_name());
//            pstmt.setString(2, dto.getKor_name());
//            pstmt.setString(3, dto.getHead_img());
//
//            result = pstmt.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return result;
//    }

    public int insert_info(DTO dto) {
        int result = 0;
        String sql = "insert into artist_info values(?, ?)";
        conn = getConnection();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getEng_name());
            pstmt.setString(2, dto.getInfo());

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
