package com.example.demo.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.example.demo.utils.JdbcUtils;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void GoToProducts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       
    	System.out.println("GoToProducts");
    	
    	JdbcUtils.getConnection();

		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("");
		
	}
    
}
