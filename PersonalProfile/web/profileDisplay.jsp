<%-- 
    Document   : profileDisplay
    Created on : Nov 19, 2025, 6:17:10 PM
    Author     : NITRO V15
--%>

<%@page import="model.ProfileBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Profile Details</title>
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
    <% ProfileBean p = (ProfileBean) request.getAttribute("profileBean"); %>
    <h1>Profile Saved Successfully!</h1>
    <h1>Personal Profile Details</h1><hr>
    <div>
        <table>
        <tr>
            <th colspan="2">
                <h2>Profile Information</h2>
            </th>
        </tr>
        <tr>
            <td class="label">Name:</td>
            <td><%= p.getName() %></td>
        </tr>
        <tr>
            <td class="label">Student ID:</td>
            <td><%= p.getStudentId() %></td>
        </tr>
        <tr>
            <td class="label">Program:</td>
            <td><%= p.getProgram() %></td>
        </tr>
        <tr>
            <td class="label">Email:</td>
            <td><%= p.getEmail() %></td>
        </tr>
        <tr>
            <td class="label">Hobbies:</td>
            <td>
                <% 
                    String hobbies = (String) p.getHobbies();
                    if(hobbies != null && !hobbies.trim().isEmpty()) {
                        out.print(hobbies);
                    } else {
                        out.print("Not specified");
                    }
                %>
            </td>
        </tr>
        <tr>
            <td class="label">Self Introduction:</td>
            <td>
                <% 
                    String intro = (String) p.getIntroduction();
                    if(intro != null && !intro.trim().isEmpty()) {
                        out.print(intro);
                    } else {
                        out.print("No introduction provided");
                    }
                %>
            </td>
        </tr>
    </table>
    </div>
    
    <br><br>
    
    <form action="index.html">
        <center> <input type="submit" value="Create Another Profile"></center>
    </form><br>
    
    <form action="viewProfiles.jsp">
        <center> <input type="submit" value="View All Profiles"></center>
    </form>
    
     
</body>
</html>
