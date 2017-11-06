package com.mysoft;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class Categories {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "test", "test");
    }


    public static List<Category> getCategories() throws SQLException, ClassNotFoundException {

        try (Connection c = getConnection();
             PreparedStatement sql = c.prepareStatement("SELECT * FROM categories");
             ResultSet resultSet = sql.executeQuery();
        ){
            ArrayList<Category> categories = new ArrayList<>();
            while (resultSet.next()){
                int id = resultSet.getInt(1);
                String str = resultSet.getString(2);
                categories.add(new Category(id, str));
            }
            return categories;
        }
    }


    public static void deleteCategory(int id) throws SQLException, ClassNotFoundException {
        try (Connection c = getConnection();
             PreparedStatement sql = c.prepareStatement("DELETE FROM categories WHERE id=?");
        ){
            sql.setInt(1, id);
            sql.executeUpdate();
        }
    }
    public static void addCategory(String str) throws SQLException, ClassNotFoundException {
        try (Connection c = getConnection();
             PreparedStatement sql = c.prepareStatement("INSERT INTO categories (name) VALUES (?);");
        ){
            sql.setString(1, str);
            sql.executeUpdate();
        }
    }

    public static void updateCategory(int id, String txt) throws SQLException, ClassNotFoundException {
        try (Connection c = getConnection();
             PreparedStatement sql = c.prepareStatement("UPDATE categories SET name=? WHERE id=?");
        ){
            sql.setString(1, txt);
            sql.setInt(2, id);
            sql.executeUpdate();
        }
    }
}
