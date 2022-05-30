package dao;

import java.sql.*;
import java.util.*;
import dto.UserDTO;

public class UserDAO {

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;


    public UserDAO()  {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //회원가입 메소드 / profile은 사진이 들어갈 거임
    public boolean signUp(String id, String pw, String name, String age, String email, String profile)   {
    
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            String sql = "INSERT INTO user(id, pw, name, age, email, profile ) VALUES(?, ?, ?, ?, ?, ?)";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, pw);
            stmt.setString(3, name);
            stmt.setString(4, age);
            stmt.setString(5, email);
            stmt.setString(6, profile);
		
            int count = stmt.executeUpdate();
            boolean result = (count == 1) ? true : false;
            return result;

        } catch(SQLException ex) {
                ex.printStackTrace();
                return false;
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (con !=null) try { con.close(); } catch(SQLException ex) {}
            }
    }
    
    //회원가입_회원 id 중복 체크
    public boolean check(String id)  {
        
         //JDBC 드라이버를 통한 연결
                  
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
            String sql = "SELECT id FROM user WHERE id = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, id);

            rs = stmt.executeQuery();
            boolean result = rs.next();
            return result;

        } catch(SQLException ex) {
                ex.printStackTrace();
                return false;
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (con !=null) try { con.close(); } catch(SQLException ex) {}
            }
    }

    public int login(String id, String pw) { // 어떤 계정에 대한 실제로 로그인을 시도하는 함수, 인자값으로 ID와 Password를 받아 login을 판단함.
		try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
    		String sql = "SELECT pw FROM user WHERE id = ?"; // 실제로 DB에 입력될 명령어를 SQL 문장으로 만듬.
			stmt = con.prepareStatement(sql);

			stmt.setString(1, id);

			rs = stmt.executeQuery();
            // 어떠한 결과를 받아오는 ResultSet 타입의 rs 변수에 쿼리문을 실행한 결과를 넣어줌 

			if(rs.next())
            {
                if(pw.equals(rs.getString("pw")))
                    {
                        return 1;
                    }
            }
		    else if(!rs.next())
            {
			    return 0;
            }
		} catch(SQLException ex) {
                ex.printStackTrace();
                return 3;
            }
		return -1; // DB 오류 
	}

    //마이페이지 회원 정보 출력 메소드
    
}