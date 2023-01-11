package com.example.demo.dao;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

import com.example.demo.domain.Account;

public class AccountDao {
	  public void createAccount(Connection conn, Account account) throws SQLException {
		    System.out.println("createAccountStart");
		    
	
		    
		    
		    String sql = "INSERT INTO account (member_id, account, password,iv,account_type) VALUES (?, ?, ?, ?, ?)";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setInt(1, account.getMemberId());
		    System.out.println("setMemberId");
		    System.out.println("createAccountID ="+account.getMemberId());

		    pstmt.setString(2, account.getAccount());
		    System.out.println("setAccount");

		    pstmt.setString(3, account.getPassword());
		    System.out.println("setPassword"+account.getPassword());
		    
		    byte[] iv = account.getIv();
		    pstmt.setString(4,  Base64.getEncoder().encodeToString(iv));
		    System.out.println("setIv");
		    
		    pstmt.setInt(5, 1);
		    System.out.println("setAccountType");


			
		    pstmt.executeUpdate();
		    System.out.println("createAccountDone");
		  }
}
