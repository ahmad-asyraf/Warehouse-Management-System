/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Asyraf
 */
public class userDao {
    
    public void grantAccess() throws SQLException {
        connectionDao con = new connectionDao();
        
        PreparedStatement ps = con.getConnection().prepareStatement(
                "UPDATE users SET userType");
    }
}
