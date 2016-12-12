<%-- 
    Document   : indexpool
    Created on : 10-oct-2016, 12:20:15
    Author     : alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nombre ="";
            
            InitialContext initCtx = new InitialContext();;
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource dataSource = (DataSource) envCtx.lookup("jdbc/spacex");
            
            Connection connection=dataSource.getConnection(); //Obtener la conexión del pool
            
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT nombre FROM cohete");
            rs.next();
            nombre = rs.getString(1);
            connection.close();
        %>

           <h1><%=nombre%></h1> 
        
    </body>
</html>
