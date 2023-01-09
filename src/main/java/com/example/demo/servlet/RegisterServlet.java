package com.example.demo.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.demo.dao.AccountDao;
import com.example.demo.dao.MemberDao;
import com.example.demo.domain.Account;
import com.example.demo.domain.Member;
import com.example.demo.exception.ModuleException;
import com.example.demo.utils.JdbcUtils;

@WebServlet("/registerAccount")
public class RegisterServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
  	System.out.println("1");

    // Get the form data
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String city = request.getParameter("city");
    String county = request.getParameter("county");
    String zipcode = request.getParameter("zipcode");
    String address = request.getParameter("address");

    // Create a new Member bean and set the values from the form data
    Member newMember = new Member();
    newMember.setName(name);
    newMember.setPhone(phone);
    newMember.setEmail(email);
    newMember.setCity(city);
    newMember.setCounty(county);
    newMember.setZipcode(zipcode);
    newMember.setAddress(address);

    // Create a new Account bean and set the values from the form data
    Account newAccount = new Account();
    newAccount.setAccount(account);
    newAccount.setPassword(password);

    Connection conn = null;
    try {
    	System.out.println("2");
      conn = JdbcUtils.getConnection();
      // Set the auto-commit to false
      conn.setAutoCommit(false);

      // Use a MemberDAO object to create a new row in the member table
      MemberDao memberDAO = new MemberDao();
      int memberId = memberDAO.createMember(conn, newMember);

      // Set the member_id in the Account bean
      newAccount.setMemberId(memberId);

      // Use an AccountDAO object to create a new row in the account table
      AccountDao accountDAO = new AccountDao();
      accountDAO.createAccount(conn, newAccount);

      // Commit the transaction
      conn.commit();
    } catch (SQLException | ModuleException e) {
      // Rollback the transaction if an exception occurs
      try {
		conn.rollback();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
     
}}}