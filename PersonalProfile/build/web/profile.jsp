<%-- 
    Document   : profile
    Created on : Dec 26, 2025, 8:48:17 PM
    Author     : NITRO V15
--%>

<%@page import="model.ProfileBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Profile Saved Successfully!</h1>
    <% ProfileBean p = (ProfileBean) request.getAttribute("profileBean"); %>
    <table border="1" style="background: white; padding: 10px;">
        <tr><td><b>Name:</b></td><td><%= p.getName() %></td></tr>
        <tr><td><b>Student ID:</b></td><td><%= p.getStudentId() %></td></tr>
        <tr><td><b>Email:</b></td><td><%= p.getEmail() %></td></tr>
    </table>
    <br>
    <a href="viewProfiles.jsp">View All Profiles</a> | <a href="index.html">Add New</a>
    </body>
</html>
