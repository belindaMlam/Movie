/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie.dao;
import movie.dao.*;
import movie.model.*;
import java.sql.*;
import java.util.*;
/**
 *
 * @author chakw
 */
public class movieDao {
    
    public movieDao() throws SQLException {
        
    }
    
    public static Connection getConnect() throws SQLException {
        Connection con = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
           
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            return con;
    }

    
    public void getRecords(String q) throws SQLException {
        try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
                Statement st = conn.createStatement();
                String query = q;
                String data;
                if(query != null){
                    data = "SELECT * from movies WHERE title like '%" + query + "%' or genre like '%" + query + "%'"; 
                } else{
                    data = "SELECT * from movies ORDER BY id asc";
                }
                ResultSet res = st.executeQuery(data);
            }catch(ClassNotFoundException cnfe){
                System.out.println("Class Not Found Exception :- " + cnfe.toString());
            } catch(SQLException sqle){
                System.out.println("SQL Query Exception :- " +sqle);
            }
            
    }

    //Add a student-data into the database
    public static int save(movieBean movieBean) throws SQLException {        
        int status = 0;        
        try{
                Connection con = getConnect();
                String qry = "INSERT INTO movies(title, genre, price, number) VALUES( ?, ?, ?, ?)";
                PreparedStatement pstmt = con.prepareStatement(qry);
                pstmt.setString(1, movieBean.getTitle());
                pstmt.setString(2, movieBean.getGenre());
                pstmt.setString(3, movieBean.getPrice());
                pstmt.setString(4, movieBean.getNumber());
                status = pstmt.executeUpdate();
            }catch(Exception e){System.out.println(e);}
                return status;
    }

    //update a student details in the database
    public static int  update(movieBean movieBean) throws SQLException {
        //code for update-operation
        int status = 0;        
        try{
                Connection con = getConnect();
                String qry = "UPDATE movies SET title = ?, genre = ?, price = ?, number = ? WHERE id = ?";
                PreparedStatement pstmt = con.prepareStatement(qry);
                pstmt.setString(1, movieBean.getTitle());
                pstmt.setString(2, movieBean.getGenre());
                pstmt.setString(3, movieBean.getPrice());
                pstmt.setString(4, movieBean.getNumber());
                pstmt.setInt(5, movieBean.getId());
                status = pstmt.executeUpdate();
            }catch(Exception e){System.out.println(e);}
                return status;
    }
    
    //delete a student from the database
    public static int delete(movieBean movieBean) throws SQLException{
        //code for delete-operation
        int status = 0;        
        try{
                Connection con = getConnect();
                String qry = "DELETE FROM movies where id = ?";
                PreparedStatement pstmt = con.prepareStatement(qry);;
                pstmt.setInt(1, movieBean.getId());
                status = pstmt.executeUpdate();
            }catch(Exception e){System.out.println(e);}
                return status;
    }
    
    public static List<movieBean> getAllRecords(){
        List<movieBean> list = new ArrayList<movieBean>();
        try{
                Connection con = getConnect();
                String qry = "SELECT * from movies ORDER BY id asc";
                PreparedStatement pstmt = con.prepareStatement(qry);;
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()){
                    movieBean m = new movieBean();
                    m.setId(rs.getInt("id"));  
                    m.setTitle(rs.getString("title"));  
                    m.setGenre(rs.getString("genre"));  
                    m.setPrice(rs.getString("price"));  
                    m.setNumber(rs.getString("number")); 
                }
            }catch(Exception e){System.out.println(e);}
                return list;
    }
    public static movieBean getRecordBy(String query){  
    movieBean u =null;  
    try{  
        Connection con=getConnect();  
        String qry = "SELECT * from movies WHERE title like '%" + query + "%' or genre like '%" + query + "%'";  
        PreparedStatement ps=con.prepareStatement(qry);  
        ps.setString(1,query);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
            u=new movieBean();  
            u.setId(rs.getInt("id"));  
            u.setTitle(rs.getString("title"));  
            u.setGenre(rs.getString("genre"));  
                    u.setPrice(rs.getString("price"));  
                    u.setNumber(rs.getString("number"));  
        }  
    }catch(Exception e){System.out.println(e);}  
    return u;  
    }
}
