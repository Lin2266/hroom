package com.example.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.example.demo.domain.Member;
import com.example.demo.exception.ModuleException;
import com.example.demo.utils.JdbcUtils;

public class MemberDao {
	// Other methods here

	  public int createMember(Connection conn, Member member) throws SQLException {
	    String sql = "INSERT INTO member (name, phone, email, city, county, zipcode, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, member.getName());
	    pstmt.setString(2, member.getPhone());
	    pstmt.setString(3, member.getEmail());
	    pstmt.setString(4, member.getCity());
	    pstmt.setString(5, member.getCounty());
	    pstmt.setString(6, member.getZipcode());
	    pstmt.setString(7, member.getAddress());
	    pstmt.executeUpdate();

	    // Get the generated id for the new row
	    ResultSet rs = pstmt.getGeneratedKeys();
	    int id = -1;
	    if (rs.next()) {
	      id = rs.getInt(1);
	    }
	    return id;
	  }
	  
	  
	  public Member getMemberData(Connection conn,int memberId) throws SQLException {
		  String sql = "SELECT * FROM member WHERE id = ?";
		  PreparedStatement pstmt = conn.prepareStatement(sql);
		  pstmt.setInt(1, memberId);
		  ResultSet rs = pstmt.executeQuery();

		  if (rs.next()) {
		    Member member = new Member();
		    member.setId(rs.getInt("id"));
		    member.setName(rs.getString("name"));
		    member.setPhone(rs.getString("phone"));
		    member.setEmail(rs.getString("email"));
		    member.setCity(rs.getString("city"));
		    member.setCounty(rs.getString("county"));
		    member.setZipcode(rs.getString("zipcode"));
		    member.setAddress(rs.getString("address"));
		    // Set any other member data you want to retrieve
		    return member;
		  }
		  return null;
		}
}
