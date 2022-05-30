package dao;

import java.sql.*;
import java.util.*;

import dto.FeedDTO;

public class FeedDAO {
    PreparedStatement pstmt = null;
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    public FeedDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void addInfo(int f_id, String f_name, String f_subName, String f_image, int f_count, int f_reviewCount)   {
        
        //JDBC 드라이버를 통한 연결
            

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            String sql = "INSERT INTO feed(fId, fName, fSubname, fImage, fCount, fReviewCount) VALUES(?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, f_id);
            pstmt.setString(2, f_name);
            pstmt.setString(3, f_subName);
            pstmt.setString(4, f_image);
            pstmt.setInt(5, f_count);
            pstmt.setInt(6, f_reviewCount);
		    pstmt.executeUpdate();
        } catch(SQLException ex) {
                ex.printStackTrace();
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (con !=null) try { con.close(); } catch(SQLException ex) {}
            }
    }

    // 카드에 있는 정보들 얻어오기 위한 메서드
    public List<FeedDTO> selectAll() {
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            
        } catch(SQLException e) {
            e.printStackTrace();
        }

        // FeedDTO 리스트 생성(여러 게시물의 DTO 객체를 담기위한 리스트)
        List<FeedDTO> res = new ArrayList<FeedDTO>();

        // sql Query
        String sql = "select fId, fName, fSubname, fImage, fCount, fReviewCount from feed;";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

            // dto객체 생성 후 FeedDTO 리스트에 추가
            while(rs.next()) {
                FeedDTO dto = new FeedDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                res.add(dto);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(con != null) con.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return res;
    }

    public void updateReview(int review, int id) {
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            String sql = "update feed set fReviewcount=? where fId=?;";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, review);
            pstmt.setInt(2, id);
		    pstmt.executeUpdate();
        } catch(SQLException ex) {
                ex.printStackTrace();
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (con !=null) try { con.close(); } catch(SQLException ex) {}
            }
            
    }

    public void updateCount(int id) {
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            String sql = "update feed set fcount=fcount+1 where fId=?;";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();

        } catch(SQLException ex) {
                ex.printStackTrace();
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (con !=null) try { con.close(); } catch(SQLException ex) {}
            }
            
    }            

}