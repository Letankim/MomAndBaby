/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnection.DBConnection;
import Model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class FeedbackDAO {

    private Connection conn;

    public FeedbackDAO() {
        try {
            conn = DBConnection.connect();
        } catch (Exception e) {
//            handle error here
            conn = null;
        }
    }

    public List<Feedback> allFeedbackByProduct(int idProduct) {
        String sql = "select * from feedback where productId=? order by id desc";
        List<Feedback> feebacks = new ArrayList<>();
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idProduct);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                feebacks.add(this.getFeedback(result));
            }
        } catch (SQLException er) {
            System.out.println("Get all feedback: " + er);
        }
        return feebacks;
    }

    public Feedback getFeedback(ResultSet result) {
        try {
            int id = result.getInt("id");
            int userId = result.getInt("userId");
            int productId = result.getInt("productId");
            String comment = result.getString("comment");
            int status = result.getInt("status");
            int star = result.getInt("star");
            Timestamp datePost = result.getTimestamp("datePost");
            Timestamp dateUpdate = result.getTimestamp("dateUpdate");
            Feedback f = new Feedback(id, userId, productId, comment, star, status, datePost, dateUpdate);
            return f;
        } catch (Exception e) {
            System.out.println("Get feedback: " + e);
        }
        return null;
    }
}
