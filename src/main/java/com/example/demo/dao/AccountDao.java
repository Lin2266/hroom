package com.example.demo.dao;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import com.example.demo.domain.Account;

public class AccountDao {
	  public void createAccount(Connection conn, Account account) throws SQLException {
		    
	
		    
		    
		    String sql = "INSERT INTO account (member_id, account, password,iv,account_type) VALUES (?, ?, ?, ?, ?)";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setInt(1, account.getMemberId());


		    pstmt.setString(2, account.getAccount());

		    pstmt.setString(3, account.getPassword());
		    
		    byte[] iv = account.getIv();
		    pstmt.setString(4,  Base64.getEncoder().encodeToString(iv));
		    
		    pstmt.setInt(5, 1);


			
		    pstmt.executeUpdate();
		  }
	  
	  
	  public Account findAccount(Connection conn, String account) throws SQLException, Exception {
		  
		    String sql = "SELECT * FROM account WHERE account=?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, account);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            Account acc = new Account();
	            acc.setAccount(rs.getString("account"));
	            
	            acc.setPassword(rs.getString("password"));

	            
	            acc.setIv(rs.getString("iv").getBytes("UTF-8"));

	            
	            acc.setMemberId(rs.getInt("member_id"));

	            acc.setAccountType(rs.getInt("account_type"));

	            return acc;
	        }
	        return null;
	    }
}
