package com.example.demo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.demo.exception.ModuleException;
import com.example.demo.utils.JdbcUtils;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dispatch(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dispatch(request, response);
	}
	
	protected void dispatch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		try {
			this.getClass().getMethod(method, 
					HttpServletRequest.class, HttpServletResponse.class)
			.invoke(this, request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void AllProductsRender(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where id not in(1,2,3);";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void HotProductsRender(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where popular = 'Y';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void ProjectProductsRender(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where id between 1 and 3;";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void DeskProductsRender(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where kind = '休閒椅';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void BedProductsRender(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where popular = 'Y';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void BrandHroom(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where brand = 'hroom';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void BrandIkea(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where brand = 'IKEA';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void BrandEdli(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where brand = '宜得利';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void BrandLife(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where brand = '生活倉庫';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void ColorWhite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where color = '白色';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void ColorBrown(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where color = '棕色';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void ColorOther(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where color not in('白色','黑色','橘色','NA') ;";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	public void ColorBlack(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sqlcmd = "select * from products where color = '黑色';";
		try {
			Connection conn = JdbcUtils.getConnection();
			request.setAttribute("rtnList", queryAllData(conn, sqlcmd));
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (ModuleException|SQLException e) {
			e.printStackTrace();
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	

	public static List<HashMap<String, String>> queryAllData(Connection con, String sqlCmd)
			throws SQLException, JsonProcessingException {

		Statement stmt = null;
		ResultSet rs = null;

		if (con == null) {
			throw new SQLException("資料庫連線為 null，請取得連線後再查詢");
		}
		if (sqlCmd == "" || sqlCmd == null) {
			throw new SQLException("查詢的SQL不得為空，請傳入正確SQL");
		}
		// queryData
		List<HashMap<String, String>> resultList = new ArrayList<HashMap<String, String>>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sqlCmd);
			ResultSetMetaData rsmd = rs.getMetaData();

			while (rs.next()) {

				HashMap<String, String> detail = new HashMap<String, String>();

				for (int i = 1; i < rsmd.getColumnCount() + 1; i++) {
					String ColumnName = rsmd.getColumnLabel(i);
					String ColumnValue = Objects.toString(rs.getString(ColumnName), "");
					detail.put(ColumnName, ColumnValue);
					// System.out.println("key: "+ ColumnName +"/ item: "+ ColumnValue);
				}
				resultList.add(detail);
			}
			stmt.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("查詢資料庫異常 e: " + e);
		}
		return resultList;
	}

}
