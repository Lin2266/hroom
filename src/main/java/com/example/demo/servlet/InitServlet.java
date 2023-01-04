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

import com.example.demo.utils.JdbcUtils;

/**
 * Servlet implementation class InitServlet
 */
@WebServlet("/InitServlet")
public class InitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
			request.getRequestDispatcher("/index.jsp").forward(request, response);

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
	
	public static List<HashMap<String, String>> queryAllData(Connection con, String sqlCmd) throws SQLException {

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
					//System.out.println("key: "+ ColumnName +"/ item: "+ ColumnValue);
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
