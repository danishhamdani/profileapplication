<%-- 
    Document   : viewProfiles
    Created on : Dec 26, 2025, 8:48:58 PM
    Author     : NITRO V15
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
         <style>
        
        body{
            font-family: 'courier new', sans-serif;
            background:  #ccccff;
            justify-content: center;
            align-items: center;
            padding: 5px;
        }
        
        h1{
           font-family: 'arial', sans-serif;
            text-align: center;
            color: black;
            margin-bottom: 30px;
        } 
        
        h2{
            font-family: 'arial', sans-serif;
            text-align: center;
            color: black;
            margin-bottom: 30px;
        }
        
        input[type="submit"] { 
                 background-color: #4CAF50;
                 color: white;
                 padding: 10px 20px;
                 
            }
            
        table {
            border: 2px solid #333;
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #e6e6fa;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f0f8ff;
        }
        tr:nth-child(odd) {
            background-color: #ffffff;
        }
        .label {
            width: 30%;
            font-weight: bold;
        }
        .center {
            text-align: center;
        }
 </style>
    </head>
    <body>
        <h1 align="center">List of All Profiles</h1>
    <table border="1" align="center" style="width: 80%; background: white;">
        <tr style="background: #e6e6fa;">
            <th>Name</th>
            <th>Student ID</th>
            <th>Program</th>
            <th>Email</th>
            <th>Hobbies</th>
            <th>Introduction</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/student_profile", "app", "app");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM profile");
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("studentId") %></td>
            <td><%= rs.getString("program") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("hobbies") %></td>
            <td><%= rs.getString("introduction") %></td>
            <td>
                <a href="ProfileServlet?action=delete&id=<%= rs.getInt("id") %>" onclick="return confirm('Delete this?')">Delete</a>  <a href="ProfileServlet?action=edit&id=<%= rs.getInt("ID") %>" class="edit-btn">Edit Profile</a>
            </td>
           
        </tr>
        <% } conn.close(); } catch(Exception e) { e.printStackTrace(); } %>
    </table>
    
    <form action="index.html">
     <center><input type="submit" value="Back"></center>
    </form>
    </body>
</html>
