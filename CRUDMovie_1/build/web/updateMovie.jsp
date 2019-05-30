<%-- 
    Document   : updateEmployee
    Created on : May 22, 2019, 2:39:42 PM
    Author     : chakw
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Catalogue Management</title>
        <link href="css.css" rel="stylesheet" type="text/css">
        <script src="script.js"></script>
    </head>
    <body>
        <%!
            Connection conn;
            PreparedStatement pstmt; 
            ResultSet result;
            String qry;
            int id;
            String title;
            String genre;
            String price;
            String number; 
        %>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
            if(request.getParameter("btnUpd")!=null){
                id = Integer.parseInt(request.getParameter("hiddenId"));
                try{
                Class.forName("com.mysql.jdbc.Driver");
                qry = "UPDATE movies SET title = ?, genre = ?, price = ?, number = ? WHERE id = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1, request.getParameter("txtName"));
                pstmt.setString(2, request.getParameter("genre"));
                pstmt.setString(3, request.getParameter("price"));
                pstmt.setString(4, request.getParameter("number"));
                pstmt.setInt(5, id);
                pstmt.executeUpdate();
                response.sendRedirect("./movie.jsp");
            }catch(ClassNotFoundException cnfe){
                out.println("Class Not Found Exception :- " + cnfe.toString());
            } catch(SQLException sqle){
                out.println("SQL Query Exception :- " +sqle);
            }
            }
            if(request.getParameter("id")!=null && request.getParameter("id") != ""){
                id = Integer.parseInt(request.getParameter("id"));
                try{
                Class.forName("com.mysql.jdbc.Driver");
                qry = "SELECT * FROM movies WHERE id = ?";
                pstmt = conn.prepareStatement(qry);
                pstmt.setInt(1, id);
                result = pstmt.executeQuery();
                result.first();
            }catch(ClassNotFoundException cnfe){
                out.println("Class Not Found Exception :- " + cnfe.toString());
            } catch(SQLException sqle){
                out.println("SQL Query Exception :- " +sqle);
            }
            } else{
                response.sendRedirect("./movie.jsp");
            }
        %>
        <center>
        
        <h1>Update Details of Movies</h1>
        <form id="tables" name="form" id="updForm" action="" onsubmit="return validateForm()" method="POST">
            <table border="1" cellspacing="5" cellpadding="5">
            <tbody>
                <tr>
                    <td>Movie Title: </td>
                    <td><input type="hidden" id="hiddenId" name="hiddenId" value="<%=id%>" />
                        <input type="text" name="txtName" id="txtName" value='<%=result.getString("title")%>'/></td>   
                </tr>
                <tr>
                    <td>Movie Genre: </td>
                    <td><input type="hidden" id="hiddenId" name="hiddenId" value="<%=id%>" />
                        <input type="text" name="genre" id="genre" value='<%=result.getString("genre")%>'/></td>   
                </tr>
                <tr>
                    <td>Price per copy: </td>
                    <td><input type="hidden" id="hiddenId" name="hiddenId" value="<%=id%>" />
                        <input type="text" name="price" id="price" value='<%=result.getString("price")%>'/></td>   
                </tr>
                <tr>
                    <td>Number per copies: </td>
                    <td><input type="hidden" id="hiddenId" name="hiddenId" value="<%=id%>" />
                        <input type="text" name="number" id="number" value='<%=result.getString("number")%>'/></td>    
                </tr>
            
                <tr>
                    <td> <a class="one" href="movie.jsp">Back</a> </td>
                    <td><input type="submit" name="btnUpd" value="Update" id="btnUpd"/></td>                
                </tr>
            </tbody>
            </table>
        
        </form>
        <br></br>
        <form name="logout" action="index.html" method="post">
            <div><input type="submit" value="Logout"></div>
        </form>
    </center>
    </body>
</html>
