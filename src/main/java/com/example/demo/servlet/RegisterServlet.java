package com.example.demo.servlet;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
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
import javax.xml.bind.DatatypeConverter;

import com.example.demo.dao.AccountDao;
import com.example.demo.dao.MemberDao;
import com.example.demo.domain.Account;
import com.example.demo.domain.Member;
import com.example.demo.exception.ModuleException;
import com.example.demo.service.CipherUtilsService;
import com.example.demo.utils.JdbcUtils;

@WebServlet("/registerAccount")
public class RegisterServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
  	System.out.println("1");

    // Get the form data
  	request.setCharacterEncoding("UTF-8");
    String account = request.getParameter("account");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String city = request.getParameter("city");
    String county = request.getParameter("county");
    String zipcode = request.getParameter("zipcode");
    String address = request.getParameter("address");

    System.out.println(account+","+password+","+name+","+phone+","+email+","+city+","+county+","+zipcode+","+address);
    // Create a new Member bean and set the values from the form data
    Member newMember = new Member();
    newMember.setName(name);
    newMember.setPhone(phone);
    newMember.setEmail(email);
    newMember.setCity(city);
    newMember.setCounty(county);
    newMember.setZipcode(zipcode);
    newMember.setAddress(address);
    
    String newpassword=null;
    byte[] iv=null;
	/*加密*/
    try {
        String key = "kittymickysnoopy"; // symmetric key
         iv = new byte[128 / 8]; // initialization vector
        SecureRandom srnd = new SecureRandom();
        srnd.nextBytes(iv);
        System.out.println("iv:" + iv);

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
        IvParameterSpec ivSpec = new IvParameterSpec(iv);
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);

        byte[] encryptedPassword = cipher.doFinal(password.getBytes());
        System.out.println("Encrypted password: " + new String(encryptedPassword));
         newpassword = Base64.getEncoder().encodeToString(encryptedPassword);


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

    // Create a new Account bean and set the values from the form data
    Account newAccount = new Account();
    newAccount.setAccount(account);
    newAccount.setPassword(newpassword);
    newAccount.setIv(iv);
    Connection conn = null;
    try {
    	System.out.println("2");
      conn = JdbcUtils.getConnection();
      // Set the auto-commit to false
      conn.setAutoCommit(false);

      // Use a MemberDAO object to create a new row in the member table
      MemberDao memberDAO = new MemberDao();
      memberDAO.createMember(conn, newMember);
      int memberId=memberDAO.findIdByName(conn,name);
      System.out.println("3");

      // Set the member_id in the Account bean
      newAccount.setMemberId(memberId);
      System.out.println("4");

      // Use an AccountDAO object to create a new row in the account table
      AccountDao accountDAO = new AccountDao();
      accountDAO.createAccount(conn, newAccount);
      System.out.println("beforecommit");
      // Commit the transaction
      conn.commit();
      response.sendRedirect("/hroom/login.jsp");

    } catch (SQLException | ModuleException e) {
      // Rollback the transaction if an exception occurs
      try {
		conn.rollback();
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
     
}}}