package dao;

import java.sql.*;
import java.util.*;
public class MyDAO {

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;
    public String id;
    public String pw;
    public String name;
    public String profile;
    public String email;
    public String age;
    public String sql;

    public MyDAO()  {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void getInfo(String id)
    {
        try{
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "busaninjoy", "1234");
        sql="select * from user where id = ?";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, id);
        rs = stmt.executeQuery();        
        while(rs.next()) {
            id =rs.getString("id");
            pw = rs.getString("pw");
            name = rs.getString("name");
            email = rs.getString("email");
            profile = rs.getString("profile");
            age = rs.getString("age");
        }

        } catch(SQLException ex) {
                ex.printStackTrace();
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (con !=null) try { con.close(); } catch(SQLException ex) {}
            }
    }
}