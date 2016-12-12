<%-- 
    Document   : connection
    Created on : 06-oct-2016, 13:19:12
    Author     : alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver");
            try (
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spacex", "root", "")) {
                //System.out.println("Database connected!");
                Statement set = connection.createStatement();
                rs = set.executeQuery("SELECT nombre FROM cohete");
                rs.next();
                out.println("Query ejecutada");
            } catch (SQLException e) {
                throw new IllegalStateException("Cannot connect", e);
            }
        %>
        <%= rs.getString(1)%>
    </body>
</html>
