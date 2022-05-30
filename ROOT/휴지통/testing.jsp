<%@ page contentType ="text/html; charset=utf-8" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<html>
    <head>
        <title>Tomcat, Mysql 연동 테스트</title>
    </head>
    <body>
        테이블 내용
        <table width="100%" border="1">
            <tr>
                <td>TAbleName</td>
            </tr>
            <% // MySQL JDBC Driver Loading
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                Connection conn =null;
                Statement stmt =null;
                ResultSet rs =null;
                try {
										
                    String jdbcDriver ="jdbc:mysql://localhost:3306/project?serverTimezone=UTC"; 
                    String dbUser ="busaninjoy"; //mysql id
                    String dbPass ="1234"; //mysql password
                    String query ="select * from user"; //query
                    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(query);
                    while(rs.next()) {
             %>
            <tr>
                <td><%= rs.getString("id") %></td>
                <td><%= rs.getString("pw") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("profile") %></td>
                <td><%= rs.getString("age") %></td>
            </tr>
            <%
                }
            } catch(SQLException ex) {
                out.println(ex.getMessage());
                ex.printStackTrace();
            } finally {
                // Close Statement
                if (rs !=null) try { rs.close(); } catch(SQLException ex) {}
                if (stmt !=null) try { stmt.close(); } catch(SQLException ex) {}
                // Close Connection
                if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
            }
            %>
        </table>
    </body>
</html>