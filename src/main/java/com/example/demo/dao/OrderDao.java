package com.example.demo.dao;

import com.example.demo.domain.Order;
import com.example.demo.domain.OrderItems;
import com.example.demo.domain.ProductBean;
import com.example.demo.exception.DataNotFoundException;
import com.example.demo.exception.ErrorInputException;
import com.example.demo.exception.ModuleException;
import com.example.demo.utils.JdbcUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao implements DaoInterface<Integer, Order>{
    private final String INSERT_ORDER =
            "insert into hroom.order\n" +
            "(ordertime,amount,receiver,receiverphone,receiveremail,city,county,zipcode,address\n" +
            ",info,payment_method,paystate,member_id,shipping,processing_status)\n" +
            "values (now(),?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private final String INSERT_ORDERITEMS =
            "insert into hroom.order_items( quantity, order_id, product_id) values (?,?,?)";
    private final String SELECT_ORDER_BY_MBMBERID =
            "SELECT a.id,a.ordertime,a.payment_method,a.amount,a.processing_status\n" +
            "FROM hroom.order a JOIN hroom.member b ON a.member_id = b.id\n" +
            "JOIN hroom.order_items c ON a.id=c.order_id\n" +
            "WHERE b.id = ?\n" +
            "GROUP BY a.id";
    private final String SELECT_ORDER_BY_ORDERID =
            "SELECT a.id,a.ordertime,a.amount,a.payment_method,a.info,a.shipping,a.amount,\n" +
            "       a.receiver,a.receiverphone,a.receiveremail,a.city,a.county,a.address,a.zipcode,\n" +
            "       b.product_id,b.quantity,\n" +
            "       c.name,c.cost\n" +
            "FROM hroom.order a\n" +
            "join hroom.order_items b on a.id = b.order_id\n" +
            "join hroom.products c on b.product_id = c.id\n" +
            "where a.id = ?";
    private final String SELECT_PRODUCTS_STOCK=
            "select stock from products where id = ?";
    private final String UPDATE_PRODUCTS_STOCK=
            "update products set stock = ? where id= ?";

    /**
     * 新增訂單
     * @param order
     * @throws ModuleException
     */
    @Override
    public int insert(Order order) throws ModuleException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int key=0;
        int stock=0;
        int result =0;

        try {
            con = JdbcUtils.getConnection();
            if (null == con) {
                throw new ErrorInputException("資料庫連線為 null，請取得連線後再查詢");
            }

            if(null == order){
                throw new ErrorInputException("order 資料不得為空");
            }

            if(null == order.getOrderItem()){
                throw new ErrorInputException("orderItem 資料不得為空");
            }

            con.setAutoCommit(false);
            // 新增訂單
            stmt = con.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);
            stmt.setDouble(1,order.getAmount());
            stmt.setString(2,order.getReceiver());
            stmt.setString(3,order.getReceiverPhone());
            stmt.setString(4,order.getReceiverEmail());
            stmt.setString(5,order.getCity());
            stmt.setString(6,order.getCounty());
            stmt.setString(7,order.getZipcode());
            stmt.setString(8,order.getAddress());
            stmt.setString(9,order.getInfo());
            stmt.setInt(10,order.getParmentMethod());
            stmt.setInt(11,order.getPaystate());
            stmt.setInt(12,order.getMember().getId());
            stmt.setInt(13,order.getShipping());
            order.setProcessing_status("訂單確認中");
            stmt.setString(14,order.getProcessing_status());
            result = stmt.executeUpdate();
            System.out.println("order insert:" + result);

            if(0 == result){
                throw new DataNotFoundException("新增 order 資料失敗");
            }

            //取得自動給號的order id值
            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                key = rs.getInt(1);
                order.setId(key);
                System.out.println("取得order id:" + key);
            }

            for(OrderItems orderItems: order.getOrderItem()){
                if(null == orderItems.getProducts()){
                    throw new ErrorInputException("products 資料不得為空");
                }

                // 新增訂單明細
                stmt = con.prepareStatement(INSERT_ORDERITEMS);
                stmt.setInt(1,orderItems.getQuantity());
                stmt.setInt(2,order.getId());
                stmt.setInt(3,orderItems.getProducts().getId());
                result = stmt.executeUpdate();
                System.out.println("OrderItems insert:" + result);

                if(0 == result){
                    throw new DataNotFoundException("新增 OrderItems 資料失敗");
                }

                // 查詢產品庫存
                stmt = con.prepareStatement(SELECT_PRODUCTS_STOCK);
                stmt.setInt(1,orderItems.getProducts().getId());
                rs = stmt.executeQuery();

                while (rs.next()){
                    stock = rs.getInt("stock");
                    System.out.println("庫存量:" + stock);
                    System.out.println("產品購買量:" +  orderItems.getQuantity());
                    System.out.println("剩餘庫存量:" + (stock - orderItems.getQuantity()));
                }

                // 現在庫存 - 訂單購買量 = 剩餘庫存
                stmt = con.prepareStatement(UPDATE_PRODUCTS_STOCK);
                stmt.setInt(1,stock - orderItems.getQuantity());
                stmt.setInt(2,orderItems.getProducts().getId());
                result = stmt.executeUpdate();
                System.out.println("products 庫存修改:" + result);

                if(0 == result){
                    throw new DataNotFoundException("修改 Products庫存量 資料失敗");
                }
            }

            con.commit();

        } catch (SQLException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                throw new ModuleException("order Insert rollback異常: " + e.getMessage());
            }
                e.printStackTrace();
                throw new ModuleException("新增訂單失敗: " + e.getMessage());

        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert order rs關閉失敗: " + e.getMessage());
                }
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert 關閉失敗: " + e.getMessage());
                }
            }

            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert order con關閉失敗: " + e.getMessage());
                }
            }
        }
        // 訂單完成導向訂單明細時需要訂單id
        return key;
    }

    @Override
    public Order get(Integer orderId) throws ModuleException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Order order = new Order();
        List<OrderItems> orderItemsList = new ArrayList<>();

        try {

            con = JdbcUtils.getConnection();
            if (null == con) {
                throw new ErrorInputException("資料庫連線為 null，請取得連線後再查詢");
            }

            if (null == orderId) {
                throw new ErrorInputException("orderId 不得為空");
            }

            stmt = con.prepareStatement(SELECT_ORDER_BY_ORDERID);
            stmt.setInt(1,orderId);
            rs = stmt.executeQuery();

            while (rs.next()){
                order.setId(rs.getInt("id"));
                order.setOrderTimeS(rs.getString("ordertime"));
                order.setAmount(rs.getInt("amount"));
                order.setParmentMethod(rs.getInt("payment_method"));
                order.setInfo(rs.getString("info"));
                order.setShipping(rs.getInt("shipping"));
                order.setReceiver(rs.getString("receiver"));
                order.setReceiverPhone(rs.getString("receiverphone"));
                order.setReceiverEmail(rs.getString("receiveremail"));
                order.setCity(rs.getString("city"));
                order.setCounty(rs.getString("county"));
                order.setAddress(rs.getString("address"));
                order.setZipcode(rs.getString("zipcode"));

                OrderItems orderItems = new OrderItems();
                orderItems.setQuantity(rs.getInt("quantity"));

                ProductBean products = new ProductBean();
                products.setId(rs.getInt("product_id"));
                products.setName(rs.getString("name"));
                products.setCost(rs.getInt("cost"));

                orderItems.setProducts(products);
                orderItemsList.add(orderItems);
                order.setOrderItem(orderItemsList);

            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ModuleException("查詢明細失敗: " + e.getMessage());
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao get order rs關閉失敗: " + e.getMessage());
                }
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao get 關閉失敗: " + e.getMessage());
                }
            }

            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao get order con關閉失敗: " + e.getMessage());
                }
            }
        }
        return order;
    }

    @Override
    public List<Order> getAllByMember(Integer memberId) throws ModuleException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Order> orderList = new ArrayList<>();

        try {

            con = JdbcUtils.getConnection();
            if (null == con) {
                throw new ErrorInputException("資料庫連線為 null，請取得連線後再查詢");
            }

            stmt = con.prepareStatement(SELECT_ORDER_BY_MBMBERID);
            stmt.setInt(1,memberId);
            rs = stmt.executeQuery();

            while (rs.next()){
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setOrderTimeS(rs.getString("ordertime"));
                order.setParmentMethod(rs.getInt("payment_method"));
                order.setAmount(rs.getInt("amount"));
                order.setProcessing_status(rs.getString("processing_status"));
                orderList.add(order);
            }

        } catch (SQLException e) {
            throw new ModuleException("查詢會員訂單失敗: " + e.getMessage());
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao get order rs關閉失敗: " + e.getMessage());
                }
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao get 關閉失敗: " + e.getMessage());
                }
            }

            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao get order con關閉失敗: " + e.getMessage());
                }
            }

        }
        
        return orderList;
    }
}
