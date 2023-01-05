package com.example.demo.servlet;

import com.example.demo.domain.Order;
import com.example.demo.domain.OrderItems;
import com.example.demo.domain.OrderReq;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet( "/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        BufferedReader br =
                new BufferedReader(new InputStreamReader(request.getInputStream()));

        String jsonFromJSP = "";
        if(br != null){
            jsonFromJSP = br.readLine();
        }
        System.out.println(jsonFromJSP);
        ObjectMapper mapper = new ObjectMapper();

        try {
            OrderReq order = mapper.readValue(jsonFromJSP, OrderReq.class);
//            System.out.println(order.getOrder());
            System.out.println(order.getOrderItems());
            for(OrderItems orderItems: order.getOrderItems()){
                System.out.println(orderItems.getQuantity());
            }
        }catch (JsonProcessingException e){
            e.printStackTrace();
        }

        out.print(new ObjectMapper().writeValueAsString("ok"));

    }
}
