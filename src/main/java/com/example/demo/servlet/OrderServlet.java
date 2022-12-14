package com.example.demo.servlet;

import com.example.demo.domain.*;
import com.example.demo.exception.DataNotFoundException;
import com.example.demo.exception.ErrorInputException;
import com.example.demo.exception.ModuleException;
import com.example.demo.service.OrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;

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
        Member member = (Member) session.getAttribute("member");
        String orderIds = request.getParameter("orderId");
        String type = request.getParameter("type");

        try {
            if(null == member){
                throw new ErrorInputException("請登入會員");
            }

            if(StringUtils.isBlank(type)){
                throw new ErrorInputException("查詢型態type是空值");
            }
                // type=get ,有orderld的查詢訂單明細
            if("get".equals(type)){
                if(StringUtils.isBlank(orderIds)){
                    throw new ErrorInputException("orderId是空值");
                }
                int orderId = Integer.parseInt(orderIds);
                order = orderService.get(orderId);
                out.print(new ObjectMapper().writeValueAsString(order));
                // type=getAll 有memberId的查詢會員所有訂單
            }else if("getAll".equals(type)){
                int memberId = member.getId();
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
        Member member = (Member) session.getAttribute("member");

        try {
            if(null == member){
                throw new ErrorInputException("請登入會員");
            }

            BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
            if(null != br){
                json = br.readLine();
            }else{
                throw new ErrorInputException("商品結帳資料是空的");
            }
            System.out.println(json);

            Order order = mapper.readValue(json, Order.class);

            order.setMember(member);

            // 收貨人同購買人，收貨人資料必須是空的
            if(null == order.getReceiver() && null == order.getReceiverPhone() && null == order.getReceiverEmail()
                    && null == order.getCity() && null == order.getCounty() && null == order.getZipcode()
                    && null == order.getAddress()
            ){
                order.setReceiver(member.getName());
                order.setReceiverPhone(member.getPhone());
                order.setReceiverEmail(member.getEmail());
                order.setCity(member.getCity());
                order.setCounty(member.getCounty());
                order.setZipcode(member.getZipcode());
                order.setAddress(member.getAddress());
            }else if(null != order.getReceiver() && null != order.getReceiverPhone() && null != order.getReceiverEmail()
                    && null != order.getCity() && null != order.getCounty() && null != order.getZipcode()
                    && null != order.getAddress()){
                    System.out.println("收貨人資料齊全");
            }else {
                // 如果收貨人資料不是全空的或是全有值的就拋錯
                throw new ErrorInputException("收貨人資料不齊全: \n姓名" + order.getReceiver() + ",\n電話" + order.getReceiverPhone()
                        + ",\n信箱" + order.getReceiverEmail() + ",\n縣市" + order.getCity() + ",\n鄉鎮市區" + order.getCounty()
                        + ",\n郵遞區號" + order.getZipcode() + ",\n地址" + order.getAddress()
                );
            }


            // 付費方式為信用卡時，付費狀態為已付費1
            if(order.getParmentMethod() == 0){
                order.setPaystate(1);
            }

//            order.getOrder().setOrderItem(order.getOrderItems());
            for(OrderItems orderItems: order.getOrderItem()){
                if(null == orderItems.getProducts()){
                    throw new ErrorInputException("products資料是空的");
                }
                System.out.println("產品id: " + orderItems.getProducts().getId() + "," + "數量: " + orderItems.getQuantity());
            }


            int orderId = orderService.checkOut(order);
            orderRes.setOrderId(orderId);
            orderRes.setMessage("新增訂單成功");
            orderList.add(orderRes);

            out.print(new ObjectMapper().writeValueAsString(orderList));
        }catch (JsonProcessingException e){
            e.printStackTrace();
            out.print("json格式解析錯誤:" + e.getMessage());
        } catch (ModuleException e) {
            e.printStackTrace();
            out.print(e.getMessage());
        }


    }


}
