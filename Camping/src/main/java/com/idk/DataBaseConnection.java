package com.idk;

import java.sql.*;

public class DataBaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/camping";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
