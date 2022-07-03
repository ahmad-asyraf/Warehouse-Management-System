/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author Asyraf
 */
public class ProductDAO {
    
    private static int result = 0;
    connectionDao con = new connectionDao();
    
    public static int registerProduct(Product prod) {
        
        try {
            connectionDao con = new connectionDao();
            
            PreparedStatement ps = con.getConnection().prepareStatement(
            "INSERT INTO product(prodID,prodName,prodDesc,quantity,price,prodStatus,supplierID)"
            + "VALUES(?,?,?,?,?,?,?)");
            ps.setString(1, prod.getProductCode());
            ps.setString(2, prod.getProductName());
            ps.setString(3, prod.getProductDesc());
            ps.setInt(4, prod.getQuantity());
            ps.setDouble(5, prod.getPrice());
            ps.setString(6, prod.getProductStatus());
            ps.setInt(7, prod.getSupplierID());
            
            result = ps.executeUpdate();
            
            con.getConnection().close();
        }
        catch (SQLException e) {
        }
        return result;
    }
    
    public static List<Product> getProductList() {
        
        List<Product> list = new ArrayList<Product>();
        
        try {
            connectionDao con = new connectionDao();
            
            PreparedStatement ps = con.getConnection().prepareStatement(
            "SELECT * FROM product");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Product e = new Product();
                e.setProductCode(rs.getString(1));
                e.setProductName(rs.getString(2));
                e.setProductDesc(rs.getString(3));
                e.setQuantity(rs.getInt(4));
                e.setPrice(rs.getDouble(5));
                e.setProductStatus(rs.getString(6));
                e.setSupplierID(rs.getInt(7));
                list.add(e);
            }
            con.getConnection().close();
        }
        catch(SQLException e) {
            
        }
        return list;
    }
    
    public Image get(int id) throws SQLException, IOException {
        
        Image image = null;
        
        String sql = "SELECT * FROM images WHERE userid=?";
        try {
            connectionDao con = new connectionDao();
            PreparedStatement ps = con.getConnection().prepareStatement(sql);
            ps.setInt(4, id);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                image = new Image();
                String type = rs.getString("imageType");
                int userid = rs.getInt(4);
                Blob blob = rs.getBlob("imageName");
                
                InputStream is = blob.getBinaryStream();
                ByteArrayOutputStream os = new ByteArrayOutputStream();
                byte buffer[] = new byte[4096];
                int bytesRead = -1;
                
                while((bytesRead = is.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
                
                byte imageBytes[] = os.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                
                is.close();
                os.close();
                
                image.setImageType(type);
                image.setUserid(userid);
                image.setBase64Image(base64Image);
            }
        }
        catch(Exception e) {
            e.getMessage();
            throw e;
        }
        return image;
    }
}
