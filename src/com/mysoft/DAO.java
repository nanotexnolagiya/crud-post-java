package com.mysoft;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "test", "test");
    }


    public static List<Post> getPosts() throws SQLException, ClassNotFoundException {

        try (Connection c = getConnection();
             PreparedStatement sql = c.prepareStatement("SELECT * FROM posts");
             ResultSet resultSet = sql.executeQuery();
        ){
            ArrayList<Post> posts = new ArrayList<>();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String str = resultSet.getString(2);
                posts.add(new Post(id, str));
            }
            return posts;
        }
    }


    public static void deletePost(int id) throws SQLException, ClassNotFoundException {
        try (Connection c = getConnection();
             PreparedStatement sql = c.prepareStatement("DELETE FROM posts WHERE id=?");
        ){
            sql.setInt(1, id);
            sql.executeUpdate();
        }
    }
    public static void addPost(String str) throws SQLException, ClassNotFoundException {
        try (Connection c = getConnection();
             PreparedStatement sql = c.prepareStatement("INSERT INTO posts (txt) VALUES (?);");
        ){
            sql.setString(1, str);
            sql.executeUpdate();
        }
    }

    public static void updatePost(int id, String txt) throws SQLException, ClassNotFoundException {
        try (Connection c = getConnection();
             PreparedStatement sql = c.prepareStatement("UPDATE posts SET txt=? WHERE id=?");
        ){
            sql.setString(1, txt);
            sql.setInt(2, id);
            sql.executeUpdate();
        }
    }
}
