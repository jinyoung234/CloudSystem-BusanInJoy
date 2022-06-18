package dao;

import java.sql.*;
import java.util.*;
import dto.UserDTO;

public class UserDAO {

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;
String forConnection = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";

    public UserDAO()  {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //회원가입 메소드
    public boolean signUp(String id, String pw, String name, String age, String email)   {
    
        try {
            con = DriverManager.getConnection(forConnection, "busaninjoy", "1234");
            String sql = "INSERT INTO user(id, pw, name, age, email ) VALUES(?, ?, ?, ?, ?)";
            //id, pw, name, age, email 회원 정보 삽입
            stmt = con.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, pw);
            stmt.setString(3, name);
            stmt.setString(4, age);
            stmt.setString(5, email);
		
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
    public boolean checkID(String id)  {
        try {
            con = DriverManager.getConnection(forConnection, "busaninjoy", "1234");
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

    public boolean checkEmail(String email)  {
        try {
            con = DriverManager.getConnection(forConnection, "busaninjoy", "1234");
            String sql = "SELECT email FROM user WHERE email = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
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
            con = DriverManager.getConnection(forConnection, "busaninjoy", "1234");
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
    public boolean deleteMember(String id)  {

        boolean flag = false;

        try {
            con = DriverManager.getConnection(forConnection, "busaninjoy", "1234");
            String sql = "delete from user where id = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, id);
            int i = stmt.executeUpdate();
            
            if(i == 1) {
				flag = true;
			} else {
				flag = false;
			}

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
            return flag;
    }

    //회원 이름 변경
    public boolean updateName(String name, String id)  {

        boolean flag = false;

        try {
            con = DriverManager.getConnection(forConnection, "busaninjoy", "1234");
            String sql = "update user set name = ? where id = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, id);
            int i = stmt.executeUpdate();
            
            if(i == 1) {
				flag = true;
			} else {
				flag = false;
			}

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
            return flag;
    }

    //회원 이메일 변경
    public boolean updateEmail(String email, String id)  {

        boolean flag = false;

        try {
            con = DriverManager.getConnection(forConnection, "busaninjoy", "1234");
            String sql = "update user set email = ? where id = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, id);
            int i = stmt.executeUpdate();
            
            if(i == 1) {
				flag = true;
			} else {
				flag = false;
			}

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
            return flag;
    }

    //회원 나이 변경
    public boolean updateAge(String age, String id)  {

        boolean flag = false;

        try {
            con = DriverManager.getConnection(forConnection, "busaninjoy", "1234");
            String sql = "update user set age = ? where id = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, age);
            stmt.setString(2, id);
            int i = stmt.executeUpdate();
            
            if(i == 1) {
				flag = true;
			} else {
				flag = false;
			}

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
            return flag;
    }
}