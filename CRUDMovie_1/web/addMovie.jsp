<%-- 
    Document   : addEmployee
    Created on : May 21, 2019, 10:46:54 PM
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
            String qry;
        %>
        <%
            if(request.getParameter("btnAdd")!=null){
                 try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
                qry = "INSERT INTO movies(title, genre, price, number) VALUES( ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(qry);
                pstmt.setString(1, request.getParameter("txtName"));
                pstmt.setString(2, request.getParameter("genre"));
                pstmt.setString(3, request.getParameter("price"));
                pstmt.setString(4, request.getParameter("number"));
                pstmt.executeUpdate();
                response.sendRedirect("./movie.jsp");
            }catch(ClassNotFoundException cnfe){
                out.println("Class Not Found Exception :- " + cnfe.toString());
            } catch(SQLException sqle){
                out.println("SQL Query Exception :- " +sqle);
            }
            }
        %>
            
    <center>
        
        <h1>Add Details of Movies</h1>
        <form name="form" id="addForm" action="" onsubmit="return validateForm()" method="POST">
            <table id="tables" border="1" cellspacing="5" cellpadding="5">
            <tbody>

                <tr>
                    <td>Movie Title: </td>
                    <td><input type="text" name="txtName" id="txtName" /></td>                
                </tr>
                <tr>
                    <td>Movie Genre: </td>
                    <td><input type="text" name="genre" id="genre" /></td>                
                </tr>
                <tr>
                    <td>Price per copy: </td>
                    <td><input type="number" name="price" id="price" /></td>                
                </tr>
                <tr>
                    <td>Number per copies: </td>
                    <td><input type="number" name="number" id="number" /></td>                
                </tr>
                
                    <td> <a class="one" href="movie.jsp">Back</a> </td>
                    <td> <input type="submit" name="btnAdd" value="Add" />   </td>             
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
