
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Catalogue Management</title>
        <link href="css.css" rel="stylesheet" type="text/css">
        <script src="script.js"></script>
    </head>
    <body>


           
    <center> 
        <h1>Movie List</h1>
        <h3><a href="addMovie.jsp">Add Details</a></h3>
        <div class="search">
            <form action="" method="get">
                <input type="text" class="form-control" name="q" placeholder="Search by Title or Genre..."/>
            </form>
        </div>
        <div class="searchContainer">
            <i class="fa fa-search searchIcon"></i>
            <input class="searchBox" type="search" name="q" placeholder="Search...">
            
        </div>
        <br></br>
        
        <table id="movies" border="1" cellspacing="5" cellpadding="5">
            <thead>
                <tr>
                    <th>Movie ID</th>
                    <th>Movie Title</th>
                    <th>Movie Genre</th>
                    <th>Price per copy</th>
                    <th>Number per copies</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
        <%  
            Connection conn;
            Statement stat = null;
            ResultSet res = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
                stat = conn.createStatement();
                String query = request.getParameter("q");
                String data;
                if(query != null){
                    data = "SELECT * from movies WHERE title like '%" + query + "%' or genre like '%" + query + "%'"; 
                } else{
                    data = "SELECT * from movies ORDER BY id asc";
                }
                res = stat.executeQuery(data);
            }catch(ClassNotFoundException cnfe){
                out.println("Class Not Found Exception :- " + cnfe.toString());
            } catch(SQLException sqle){
                out.println("SQL Query Exception :- " +sqle);
            }
            while(res.next()){
            
        %>
                
                <tr>

                    <td><%=res.getInt("id")%></td>
                    <td><%=res.getString("title")%></td>
                    <td><%=res.getString("genre")%></td>
                    <td><%=res.getString("price")%></td>
                    <td><%=res.getString("number")%></td>
                    
                    <td><a class="one" href="updateMovie.jsp?id=<%=res.getInt("id")%>" onclick="return confirm('Are you sure you want to update?')"> Update</a></td> 
                    <td><a class="two" href="deleteMovie.jsp?id=<%=res.getInt("id")%>" onclick="return confirm('Are you sure you want to delete?')"> Delete</a></td>    
                    
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
            <br></br>
            
        <form name="list" action="movie.jsp" method="post">
            <div><input type="submit" value="List All Movies"></div>
        </form>
            <br></br>
        <form name="logout" action="index.html" method="post">
            <div><input type="submit" value="Logout"></div>
        </form>
    </center>
       
    </body>
</html>
