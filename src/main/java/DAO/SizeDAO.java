/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Size;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class SizeDAO {

    private Connection conn;
    public SizeDAO() {
        try {
            conn = DBConnection.DBConnection.connect();
        } catch (Exception e) {
            System.out.println("Connection fail: " + e);
        }
    }
    
    public List<Size> getAllSIzeByProduct(int productID) {
        List<Size> sizes = new ArrayList<>();
        String sql = "select * from Size where productID=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                int Id = result.getInt("ID");
                int productId = result.getInt("productID");
                String name = result.getString("name");
                float oldPrice = result.getFloat("oldPrice");
                float newPrice = result.getFloat("newPrice");
                int quantity = result.getInt("quantity");
                Size c = new Size(Id, productId, name, oldPrice, newPrice, quantity);
                sizes.add(c);
            }
        } catch (SQLException e) {

        }
        return sizes;
    }
    
    public Size getSizeByID(int ID) {
        String sql = "select * from Size where ID=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet result = st.executeQuery();
            if (result.next()) {
                int Id = result.getInt("ID");
                int productId = result.getInt("productID");
                String name = result.getString("name");
                float oldPrice = result.getFloat("oldPrice");
                float newPrice = result.getFloat("newPrice");
                int quantity = result.getInt("quantity");
                Size c = new Size(Id, productId, name, oldPrice, newPrice, quantity);
                return c;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public int insert(Size c) {
        int result = 0;
        String sql = "insert into Size (productID, name, oldPrice, newPrice, quantity) values (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            int i = 1;
            st.setInt(i++, c.getProductID());
            st.setString(i++, c.getName());
            st.setFloat(i++, c.getOldPrice());
            st.setFloat(i++, c.getNewPrice());
            st.setFloat(i++, c.getQuantity());
            result = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Add new size product: " + e);
        }
        return result;
    }

    public int delete(int idProduct) {
        int result = 0;
        String sql = "delete from Size where ProductID=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idProduct);
            result = st.executeUpdate();
        } catch (SQLException e) {

        }
        return result;
    }
}
