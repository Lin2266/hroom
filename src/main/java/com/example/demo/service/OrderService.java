package com.example.demo.service;

import com.example.demo.dao.OrderDao;
import com.example.demo.domain.Member;
import com.example.demo.domain.Order;
import com.example.demo.exception.ModuleException;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    OrderDao orderDao = new OrderDao();
    public int checkOut(Order order) throws ModuleException {
        return orderDao.insert(order);
    }

    public Order get(int orderId) throws ModuleException{

        return  orderDao.get(orderId);
    }

    public List<Order> getOrderHistory(int memberId) throws ModuleException{
        List<Order> orders = new ArrayList<>();

        return orders;
    }


}
