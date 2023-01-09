package com.example.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.example.demo.domain.Account;

public class AccountDao {
	  public void createAccount(Connection conn, Account account) throws SQLException {
		    String sql = "INSERT INTO account (member_id, account, password) VALUES (?, ?, ?)";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, account.getMemberId());
		    pstmt.setString(2, account.getAccount());
		    pstmt.setString(3, account.getPassword());
		    pstmt.executeUpdate();
		  }
}
