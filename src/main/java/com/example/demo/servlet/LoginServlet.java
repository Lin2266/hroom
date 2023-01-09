package com.example.demo.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.example.demo.dao.MemberDao;
import com.example.demo.domain.Account;
import com.example.demo.domain.Member;
import com.example.demo.exception.ModuleException;
import com.example.demo.utils.JdbcUtils;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the login credentials from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate the login credentials
        Account user;
		try {
			user = validateUser(username, password);
			  if (user != null) {
		            // Login successful, create a session for the user
		            HttpSession session = request.getSession();
		            session.setAttribute("user", user);
		            // Get the member data for the account
		            MemberDao memberDao = new MemberDao();
					Connection conn = JdbcUtils.getConnection();
		            
		            Member member = memberDao.getMemberData(conn,user.getMemberId());
		            // Save the member data in the session
		            session.setAttribute("member", member);
		            // Redirect the user to a protected page
		            response.sendRedirect("loginSuccess.jsp");
		        } else {
		            // Login failed, display an error message
		            request.setAttribute("errorMessage", "Invalid username or password");
		            request.getRequestDispatcher("/login.jsp").forward(request, response);
		        }
		} catch (ModuleException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
    
  }

    private Account validateUser(String username, String password) throws ModuleException {
    	  try {
    	    Connection conn = JdbcUtils.getConnection();
    	    // Retrieve the account and member data for the given username and password
    	    String sql = "SELECT a.*, m.* FROM account a INNER JOIN member m ON a.member_id = m.id WHERE a.account = ? AND a.password = ?";
    	    PreparedStatement pstmt = conn.prepareStatement(sql);
    	    pstmt.setString(1, username);
    	    pstmt.setString(2, password);
    	    ResultSet rs = pstmt.executeQuery();

    	    if (rs.next()) {
    	      // Create a new Account object and set the data from the result set
    	      Account account = new Account();
    	      account.setAccount(rs.getString("account"));
    	      account.setPassword(rs.getString("password"));
    	      account.setMemberId(rs.getInt("member_id"));

    	      // Create a new Member object and set the data from the result set
    	      Member member = new Member();
    	      member.setId(rs.getInt("member_id"));
    	      member.setName(rs.getString("name"));
    	      member.setPhone(rs.getString("phone"));
    	      member.setEmail(rs.getString("email"));
    	      member.setCity(rs.getString("city"));
    	      member.setCounty(rs.getString("county"));
    	      member.setZipcode(rs.getString("zipcode"));
    	      member.setAddress(rs.getString("address"));
    	      // Set any other member data you want to retrieve

    	      // Set the member data in the Account object
    	      account.setMember(member);

    	      return account;
    	    } else {
    	      return null;
    	    }
    	  } catch (SQLException e) {
    	    throw new RuntimeException(e);
    	  }
    	}
  

  
}