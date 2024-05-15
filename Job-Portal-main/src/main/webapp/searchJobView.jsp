<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Jobs Table</title>
    <style>
        body {
            background-color: black;
            color: yellow;
            font-family: Arial, sans-serif;
        }

        h2 {
            color: yellow;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid yellow;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: yellow;
        }

        tr:nth-child(even) {
            background-color: #555;
        }
    </style>
</head>
<body>
    <h2>Jobs Table Data</h2>
    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Location</th>
                <th>Category</th>
                <th>Status</th>
                <th>Description</th>
                
            </tr>
        </thead>
        <tbody>
            <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
            
            <% 
                try {
                    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
                    String DB_URL = "jdbc:mysql://localhost:3306/job_portal";
                    String USER = "root";
                    String PASS = "123456789";

                    Connection conn = null;
                    Statement stmt = null;

                    // Register JDBC driver
                    Class.forName(JDBC_DRIVER);

                    // Open a connection
                    conn = DriverManager.getConnection(DB_URL, USER, PASS);

                    // Execute SQL query
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM jobs";
                    ResultSet rs = stmt.executeQuery(sql);

                    // Iterate through the result set and display data
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("location") %></td>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getString("status") %></td>
                <td><%= rs.getString("description") %></td>
                
            </tr>
            <% 
                    }
                    
                    // Clean-up environment
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</body>
</html>
