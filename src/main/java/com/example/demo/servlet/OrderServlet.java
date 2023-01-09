package com.example.demo.servlet;

import com.example.demo.domain.*;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet( "/OrderServlet")
public class OrderServlet extends HttpServlet {
    ObjectMapper mapper = new ObjectMapper();
    ErrorInputException eie = null;
    OrderService orderService = new OrderService();
    OrderRes orderRes = new OrderRes();

    String json = "";

    // 訂單查詢、訂單明細
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();
        List<Order> orderList = null;
        Order order = null;
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");
        String orderIds = request.getParameter("orderId");

        try {
            if(null == account){
                throw new DataNotFoundException("請登入會員");
            }

            if(null != orderIds){
                int orderId = Integer.parseInt(orderIds);
                order = orderService.get(orderId);
                out.print(new ObjectMapper().writeValueAsString(order));
            }else{
                int memberId = account.getMember().getId();
                orderList = orderService.getOrderHistory(memberId);
                out.print(new ObjectMapper().writeValueAsString(orderList));
            }


        } catch (ModuleException e) {
            out.println(e.getMessage());
        }

    }

    // 新增訂單
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();
        List<Object> orderList = new ArrayList<>();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("user");

        try {
            if(null == account){
                throw new DataNotFoundException("請登入會員在進行結帳");
            }

            BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            if(null != br){
                json = br.readLine();
            }else{
                throw new DataNotFoundException("商品結帳json資料不存在");
            }
            System.out.println(json);

            Order order = mapper.readValue(json, Order.class);

            order.setMember(account.getMember());
            System.out.println("購買人:" + order.getMember().getId());

            // 收貨人同購買人
            if(null == order.getReceiver()){
                order.setReceiver(account.getMember().getName());
                System.out.println("收貨人:" + order.getReceiver());
            }
            if(null == order.getReceiverPhone()){
                order.setReceiverPhone(account.getMember().getPhone());
                System.out.println("電話:" + order.getReceiverPhone());
            }
            if(null == order.getReceiverEmail()){
                order.setReceiverEmail(account.getMember().getEmail());
                System.out.println("信箱:" + order.getReceiverEmail());
            }
            if(null == order.getCity()){
                order.setCity(account.getMember().getCity());
                System.out.println("縣市:" + order.getCity());
            }
            if(null == order.getCounty()){
                order.setCounty(account.getMember().getCounty());
                System.out.println("鄉鎮市區:" + order.getCounty());
            }
            if(null == order.getZipcode()){
                order.setZipcode(account.getMember().getZipcode());
                System.out.println("郵遞區號:" + order.getZipcode());
            }
            if(null == order.getAddress()){
                order.setAddress(account.getMember().getAddress());
                System.out.println("地址:" + order.getAddress());
            }

            // 付費方式為信用卡時，付費狀態為已付費1
            if(order.getParmentMethod() == 0){
                order.setPaystate(1);
            }

//            order.getOrder().setOrderItem(order.getOrderItems());
            for(OrderItems orderItems: order.getOrderItem()){
                System.out.println("產品id: " + orderItems.getProducts().getId() + "," + "數量: " + orderItems.getQuantity());
            }
            System.out.println("訂單" + order.toString());
            System.out.println("訂單明細" + order.getOrderItem().toString());

            int orderId = orderService.checkOut(order);
            orderRes.setOrderId(orderId);
            orderRes.setMessage("新增訂單成功");
            orderList.add(orderRes);

            out.print(new ObjectMapper().writeValueAsString(orderList));
        }catch (JsonProcessingException e){
            out.print("json格式解析錯誤:" + e.getMessage());
        } catch (ModuleException e) {
            out.print(e.getMessage());
            System.out.println(e.getMessage());
        }


    }


}
