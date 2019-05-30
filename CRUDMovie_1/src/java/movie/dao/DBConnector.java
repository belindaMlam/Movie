/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author chakw
 */
public class DBConnector{
    private Connection con;

    public DBConnector() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
    }

    public Connection openConnection() throws SQLException{
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
        return this.con;
    }
    
    public void closeConnection() throws SQLException {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","");
        this.con.close();
    }
}