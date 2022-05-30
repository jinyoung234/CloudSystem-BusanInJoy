package dao;

import java.sql.*;
import java.util.*;

import dto.ReviewDTO;

public class ReviewDAO {
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    public ReviewDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
       
    }
    public String testDAO() {
        return "dao 실행됨";
    }
    // 카드에 있는 정보들 얻어오기 위한 메서드
    public List selectAll() {
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            
        } catch(SQLException e) {
            e.printStackTrace();
        }

        // FeedDTO 리스트 생성(여러 게시물의 DTO 객체를 담기위한 리스트)
        List<ReviewDTO> res = new ArrayList<ReviewDTO>();

        // sql Query
        String sql = "select no, title, content, rating, date, uid, fId from review;";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            // dto객체 생성 후 FeedDTO 리스트에 추가
            while(rs.next()) {
                ReviewDTO dto = new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),rs.getString(7));
                res.add(dto);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null)  rs.close();
                if(stmt !=null) stmt.close();
                if(con !=null) con.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return res;
    }


    public boolean insert(String title, String content, int rating, String uid, String fId) {
        int count=0;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            
        } catch(SQLException e) {
            e.printStackTrace();
        }

       
        // sql Query
        String sql = "insert into review(title, content, rating, uid, fId) values(";
        sql += "'" + title + "','" + content + "'," + rating +",'" + uid + "'," + fId + ");";
        try {
            stmt = con.createStatement();
            count = stmt.executeUpdate(sql);
       
            // dto객체 생성 후 FeedDTO 리스트에 추가
  
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null)  rs.close();
                if(stmt !=null) stmt.close();
                if(con !=null) con.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return (count>0)? true:false;
    }

    public int countReview(int fId) {
        int count=0;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            
        } catch(SQLException e) {
            e.printStackTrace();
        }

       
        // sql Query
        String sql = "select COUNT(*) from review where fId=" + fId + ";";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
         rs.next();
        count = Integer.parseInt(rs.getString(1));

        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null)  rs.close();
                if(stmt !=null) stmt.close();
                if(con !=null) con.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }

    public ReviewDTO selectNo(String no) {
        int count=0;
        ReviewDTO dto=null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            
        } catch(SQLException e) {
            e.printStackTrace();
        }

       
        // sql Query
        String sql = "select * from review where no=" + no + ";";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
                      while(rs.next()) {
             dto = new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),rs.getString(7));
           
            }

        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null)  rs.close();
                if(stmt !=null) stmt.close();
                if(con !=null) con.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return dto;
    }
public double countRating(int fId) {
        int sum=0;
        double aver=0.0;
        int count=0;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            
        } catch(SQLException e) {
            e.printStackTrace();
        }

       
        // sql Query
        String sql = "select rating from review where fId=" + fId + ";";
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            while( rs.next()) {
                sum += rs.getInt(1);
                count++;
            }
        aver = (double)sum/count;
        aver = Math.round(aver*10)/10.0;

        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs !=null)  rs.close();
                if(stmt !=null) stmt.close();
                if(con !=null) con.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return aver;
    }

    }