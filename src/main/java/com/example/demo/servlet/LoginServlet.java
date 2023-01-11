package com.example.demo.servlet;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.demo.dao.AccountDao;
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

        // Get the login data
        request.setCharacterEncoding("UTF-8");
        String account = request.getParameter("account");
        String password = request.getParameter("password");

        // Connect to the database and retrieve the stored password and IV for the account
        Connection conn = null;
        byte[] iv = null;
        String storedPassword = null;
        Account accountBean =null;
        try {
            conn = JdbcUtils.getConnection();
            AccountDao accountDAO = new AccountDao();
            accountBean = accountDAO.findAccount(conn, account);
            if (accountBean != null) {
                storedPassword = accountBean.getPassword();
                iv = accountBean.getIv();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Decrypt the stored password and compare it to the password entered by the user
        String decryptedPassword = null;
        try {
            String key = "kittymickysnoopy"; // symmetric key
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
            IvParameterSpec ivSpec = new IvParameterSpec(iv);
            cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec);
            byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(storedPassword));
            decryptedPassword = new String(decryptedBytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (InvalidAlgorithmParameterException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        }
        
        if (decryptedPassword != null && decryptedPassword.equals(password)) {
            // Login successful, create a session for the user
            HttpSession session = request.getSession();
            session.setAttribute("user", accountBean);
            // Get the member data for the account
            MemberDao memberDao = new MemberDao();
            try {
				Connection conn = JdbcUtils.getConnection();
				Member member = memberDao.getMemberData(conn, accountBean.getMemberId());
				  // Save the member data in the session
	            session.setAttribute("member", member);
	            // Redirect the user to a protected page
	            response.sendRedirect("loginSuccess.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
    } else {
            // Login failed, display an error message
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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