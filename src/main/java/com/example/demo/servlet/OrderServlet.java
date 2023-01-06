package com.example.demo.servlet;

import com.example.demo.domain.Account;
import com.example.demo.domain.OrderItems;
import com.example.demo.domain.OrderReq;
import com.example.demo.exception.DataNotFoundException;
import com.example.demo.exception.ErrorInputException;
import com.example.demo.exception.ModuleException;
import com.example.demo.service.OrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

@WebServlet( "/OrderServlet")
public class OrderServlet extends HttpServlet {
    ObjectMapper mapper = new ObjectMapper();
    ErrorInputException eie = null;
    OrderService orderService = new OrderService();
    String json = "";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");

//        System.out.println(account.getMember().getId());
//        System.out.println(account.getMember().getName());
//        System.out.println(account.getMember().getPhone());
//        System.out.println(account.getMember().getEmail());
//        System.out.println(account.getMember().getCity());
//        System.out.println(account.getMember().getCounty());
//        System.out.println(account.getMember().getZipcode());
//        System.out.println(account.getMember().getAddress());


        try {
            if(account == null){
                throw new ModuleException("請登入會員在進行結帳");
            }

            BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            if(null != br){
                json = br.readLine();
            }else{
                eie.getEie(eie,"商品結帳資料不存在");
            }
            System.out.println(json);

            OrderReq order = mapper.readValue(json, OrderReq.class);

            if(0 == order.getOrder().getMemberId()){
                order.getOrder().setMemberId(account.getMember().getId());
                System.out.println("購買人:" + order.getOrder().getMemberId());
            }
            // 收貨人同購買人
            if(null == order.getOrder().getReceiver()){
                order.getOrder().setReceiver(account.getMember().getName());
                System.out.println("收貨人:" + order.getOrder().getReceiver());
            }
            if(null == order.getOrder().getReceiverPhone()){
                order.getOrder().setReceiverPhone(account.getMember().getPhone());
                System.out.println("電話:" + order.getOrder().getReceiverPhone());
            }
            if(null == order.getOrder().getReceiverEmail()){
                order.getOrder().setReceiverEmail(account.getMember().getEmail());
                System.out.println("信箱:" + order.getOrder().getReceiverEmail());
            }
            if(null == order.getOrder().getCity()){
                order.getOrder().setCity(account.getMember().getCity());
                System.out.println("縣市:" + order.getOrder().getCity());
            }
            if(null == order.getOrder().getCounty()){
                order.getOrder().setCounty(account.getMember().getCounty());
                System.out.println("鄉鎮市區:" + order.getOrder().getCounty());
            }
            if(null == order.getOrder().getZipcode()){
                order.getOrder().setZipcode(account.getMember().getZipcode());
                System.out.println("郵遞區號:" + order.getOrder().getZipcode());
            }
            if(null == order.getOrder().getAddress()){
                order.getOrder().setAddress(account.getMember().getAddress());
                System.out.println("地址:" + order.getOrder().getAddress());
            }

            order.getOrder().setOrderItem(order.getOrderItems());
            for(OrderItems orderItems: order.getOrder().getOrderItem()){
                System.out.println("產品id: " + orderItems.getProductId() + "," + "數量: " + orderItems.getQuantity());
            }
            System.out.println("訂單" + order.getOrder().toString());
            System.out.println("訂單明細" + order.getOrderItems().toString());

            orderService.checkOut(order.getOrder());

            out.print(new ObjectMapper().writeValueAsString("ok"));
        }catch (JsonProcessingException e){
            out.print("json格式解析錯誤:" + e.getMessage());
        } catch (ModuleException e) {
            out.print(e.getMessage());
            System.out.println(e.getMessage());
        }


    }


}
