package com.example.demo.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.demo.domain.Account;
import com.example.demo.domain.Member;
import com.example.demo.utils.JdbcUtils;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	  private String errorMessage;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // Get the login credentials from the request
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    System.out.println("getusername and password!");

    // Validate the login credentials
    Account user = validateUser(username, password);
    if (user != null) {
      // Login successful, create a session for the user
      HttpSession session = request.getSession();
      session.setAttribute("user", user);
      System.out.println("loginsuccess!");
      // Redirect the user to a protected page
      response.sendRedirect("loginSuccess.jsp");
    } else {
      // Login failed, display an error message
      request.setAttribute("errorMessage", "Invalid username or password");
      request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
    
    
    
  }

  private Account validateUser(String username, String password) {
    try {
//      // Replace YOUR_USERNAME and YOUR_PASSWORD with your MySQL login credentials
//      String url = "jdbc:mysql://localhost:3306/hroom?user=root&password=";
//
//      // Load the JDBC driver
//      Class.forName("com.mysql.cj.jdbc.Driver");
//
//      // Connect to the database
//      Connection conn = DriverManager.getConnection(url);

    	
      Connection conn = JdbcUtils.getConnection();
      // Retrieve the account data for the given username and password
      String sql = "SELECT a.*, m.* FROM account a INNER JOIN member m ON a.member_id = m.id WHERE a.account = ? AND a.password = ?";      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, username);
      pstmt.setString(2, password);
      ResultSet rs = pstmt.executeQuery();

      if (rs.next()) {
        Account account = new Account();
        account.setAccount(rs.getString("account"));
        account.setPassword(rs.getString("password"));
        // Set the member data for the account
        Member member = new Member();
        member.setId(rs.getInt("member_id"));
        member.setName(rs.getString("name"));
        member.setPhone(rs.getString("phone"));
        member.setEmail(rs.getString("email"));
        member.setCity(rs.getString("city"));
        member.setCountry(rs.getString("country"));
        member.setZipcode(rs.getString("zipcode"));
        member.setAddress(rs.getString("address"));
        
        
        // Set any other member data you want to retrieve
        account.setMember(member);
        return account;
      }
    } catch (Exception e) {
      // Handle any exceptions
      e.printStackTrace();
    }
    return null;
  }
  

  

  public String getErrorMessage() {
    return errorMessage;
  }

  public void setErrorMessage(String errorMessage) {
    this.errorMessage = errorMessage;
  }
  
}