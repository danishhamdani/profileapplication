<%-- 
    Document   : editProfile
    Created on : Dec 27, 2025, 9:01:16 PM
    Author     : NITRO V15
--%>

<%@page import="model.ProfileBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
             body {
            font-family: 'courier new', sans-serif;
            background: #ccccff;
            justify-content: center;
            align-items: center;
            padding: 5px;
             }
                         
             h1 {
            font-family: 'arial', sans-serif;
            text-align: center;
            color:black;
            margin-bottom: 30px;
            }
            
            input[type="submit"] { 
                 background-color: #4CAF50;
                 color: white;
                 padding: 10px 20px;
            }
               
            .container {
             background-color:#e6e6fa;
            border: 1px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
          }
            
        </style>
    </head>
    <body>
        <h1>Edit Profile Details</h1>
        <div class="container">
            <%
                
                ProfileBean p = (ProfileBean) request.getAttribute("profileBean");
                String id = (String) request.getAttribute("editId");
                
                if (p != null) {
            %>
            <form action="ProfileServlet" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= id %>">
                
            <label>Name:</label><br><input type="text" name="name" value="<%= p.getName() %>" required><br>
            <label>Student ID:</label><br><input type="text" name="studentId" value="<%= p.getStudentId() %>"required><br>
            <label>Program:</label><br><input type="text" name="program" value="<%= p.getProgram() %>"required><br>
            <label>Email:</label><br><input type="text" name="email" value="<%= p.getEmail() %>" required><br>
            <label>Hobbies:</label><br><input type="text" name="hobbies" value="<%= p.getHobbies() %>" required><br>
            <label>Self-Introduction:<br></label><textarea name="introduction" rows="5" cols="40"><%= p.getIntroduction() %></textarea><br>

            <center><input type="submit" value="Update Profile"></center>
            </form>
                        
            <% 
                } else {
                    out.println("<p style='color:red;'>Error: Profile data not found.</p>");
                }
            %>
            <br>
        </div>
            <div class="container">
             <form action="viewProfiles.jsp">
                <input type="submit" value="Cancel">
            </form>
            </div>
    </body>
</html>
