<%-- 
    Document   : deleteEmployee
    Created on : May 22, 2019, 12:57:25 PM
    Author     : chakw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

    <%!
            Connection conn;
            PreparedStatement pstmt; 
            String qry;
            int id;
            String title;
            String genre;
            String price;
            String number;
        %>
        <%
            if(request.getParameter("id")!=null && request.getParameter("id")!= "" ){
                id = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
                qry = "DELETE FROM movies where id = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setInt(1, id);
                pstmt.executeUpdate();
                response.sendRedirect("./movie.jsp");
            }catch(ClassNotFoundException cnfe){
                out.println("Class Not Found Exception :- " + cnfe.toString());
            } catch(SQLException sqle){
                out.println("SQL Query Exception :- " +sqle);
            }
            }
        %>
