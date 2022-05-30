package dao;

import java.sql.*;
import java.util.*;

import dto.SearchDTO;

public class SearchDAO {
    PreparedStatement pstmt = null;
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    public SearchDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

   
    // 게시판 검색 기능을 위한 메서드
    public List<SearchDTO> searchContent(String searchContent) {


            try {
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
                
            } catch(SQLException e) {
                e.printStackTrace();
            }

            // FeedDTO 리스트 생성(여러 게시물의 DTO 객체를 담기위한 리스트)
            List<SearchDTO> res = new ArrayList<SearchDTO>();

            // sql Query
            String sql = "select * from feed where fName like ?;";

            try {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, "%"+searchContent+"%");
                rs = pstmt.executeQuery();

                // dto객체 생성 후 FeedDTO 리스트에 추가
                while(rs.next()) {
                    SearchDTO dto = new SearchDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6));
                    res.add(dto);
                }
            } catch(SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if(rs != null) rs.close();
                    if(pstmt != null) pstmt.close();
                    if(con != null) con.close();
                    
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            return res;
        }

    }