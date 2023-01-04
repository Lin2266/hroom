package com.example.demo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.demo.utils.JdbcUtils;
import com.example.demo.servlet.InitServlet;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends InitServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Connection conn = JdbcUtils.getConnection();
		
		if (conn != null) {		
			System.out.println("DB connection ok");
		}else {
			System.out.println("DB connection fail");
		}
		String sqlcmd = "select * from products;";
		//System.out.println(sqlcmd);

		try {
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("/category.jsp").forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
}
