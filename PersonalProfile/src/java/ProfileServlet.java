/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import model.ProfileBean;

/**
 *
 * @author NITRO V15
 */
@WebServlet(urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {

    
    private String url = "jdbc:derby://localhost:1527/student_profile";
    private String user = "app"; 
    private String pass = "app";
    
    
       protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            String id = request.getParameter("id");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection(url, user, pass);
                PreparedStatement ps = conn.prepareStatement("DELETE FROM profile WHERE id = ?");
                ps.setInt(1, Integer.parseInt(id));
                ps.executeUpdate();
                conn.close();
            } catch (Exception e) { e.printStackTrace(); }
            
         response.sendRedirect("viewProfiles.jsp");
            
        }
        
        else if ("edit".equals(action)) {
                String id = request.getParameter("id");
                ProfileBean profile = new ProfileBean();
                try (Connection conn = DriverManager.getConnection(url, user, pass)) {
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM APP.PROFILE WHERE ID = ?");
                    ps.setInt(1, Integer.parseInt(id));
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        profile.setName(rs.getString("NAME"));
                        profile.setStudentId(rs.getString("STUDENTID"));
                        profile.setProgram(rs.getString("PROGRAM"));
                        profile.setEmail(rs.getString("EMAIL"));
                        profile.setHobbies(rs.getString("HOBBIES"));
                        profile.setIntroduction(rs.getString("INTRODUCTION"));
                        request.setAttribute("editId", id); 
                    }
                }catch (Exception e) { e.printStackTrace(); }
                request.setAttribute("profileBean", profile);
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            }

            // 3. UPDATE FEATURE (Save changes from editProfile.jsp)
            else if ("update".equals(action)) {
                String id = request.getParameter("id");
                try (Connection conn = DriverManager.getConnection(url, user, pass)) {
                    String sql = "UPDATE APP.PROFILE SET NAME=?, STUDENTID=?, PROGRAM=?, EMAIL=?, HOBBIES=?, INTRODUCTION=? WHERE ID=?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, request.getParameter("name"));
                    ps.setString(2, request.getParameter("studentId"));
                    ps.setString(3, request.getParameter("program"));
                    ps.setString(4, request.getParameter("email"));
                    ps.setString(5, request.getParameter("hobbies"));
                    ps.setString(6, request.getParameter("introduction"));
                    ps.setInt(7, Integer.parseInt(id));
                    ps.executeUpdate();
                } catch (Exception e) { e.printStackTrace(); }
                response.sendRedirect("viewProfiles.jsp");
            }
        
        else
        {
        ProfileBean profile = new ProfileBean();
            profile.setName(request.getParameter("name"));
            profile.setStudentId(request.getParameter("studentId"));
            profile.setProgram(request.getParameter("program"));
            profile.setEmail(request.getParameter("email"));
            profile.setHobbies(request.getParameter("hobbies"));
            profile.setIntroduction(request.getParameter("introduction"));
            
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection(url, user, pass);
                
                String sql = "INSERT INTO APP.PROFILE (NAME, STUDENTID, PROGRAM, EMAIL, HOBBIES, INTRODUCTION) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, profile.getName());
                ps.setString(2, profile.getStudentId());
                ps.setString(3, profile.getProgram());
                ps.setString(4, profile.getEmail());
                ps.setString(5, profile.getHobbies());
                ps.setString(6, profile.getIntroduction());
                ps.executeUpdate();
                
                conn.close();
            } catch (Exception e) { e.printStackTrace(); }
            
            request.setAttribute("profileBean", profile);
            request.getRequestDispatcher("profileDisplay.jsp").forward(request, response);
        }
      }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
