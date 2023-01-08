package com.example.demo.dao;

import com.example.demo.domain.Order;
import com.example.demo.domain.OrderItems;
import com.example.demo.exception.ErrorInputException;
import com.example.demo.exception.ModuleException;
import com.example.demo.utils.JdbcUtils;
import org.apache.commons.lang3.StringUtils;

import java.sql.*;
import java.util.List;

public class OrderDao implements DaoInterface<Integer, Order>{
    private final String INSERT_ORDER =
            "insert into hroom.order\n" +
            "(ordertime,amount,receiver,receiverphone,receiveremail,city,county,zipcode,address\n" +
            ",info,payment_method,paystate,member_id,shipping)\n" +
            "values (now(),?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private final String INSERT_ORDERITEMS =
            "insert into hroom.order_items( quantity, order_id, product_id) values (?,?,?)";
    private final String SELECT_ORDER_BY_MBMBERID =
            "SELECT * FROM hroom.order a join hroom.member b on a.member_id = b.id\n" +
            "join hroom.order_items c on a.id = c.order_id where b.id = ?";
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
    private ErrorInputException  eie = null;


    /**
     * 新增訂單
     * @param order
     * @throws ModuleException
     */
    @Override
    public int insert(Order order) throws ModuleException {
        Connection con = null;
        PreparedStatement stmt = null;
//        PreparedStatement stmt2 = null;
//        PreparedStatement stmt3 = null;
//        PreparedStatement stmt4 = null;
        ResultSet rs = null;
//        ResultSet rs2 = null;
        int key=0;
        int stock=0;

        try {
            con = JdbcUtils.getConnection();
            if (null == con) {
                eie.getEie(eie,"資料庫連線為 null，請取得連線後再查詢");
            }

            if (StringUtils.isBlank(INSERT_ORDER)) {
                eie.getEie(eie,"查詢的order SQL不得為空，請傳入正確SQL");
            }

            if (StringUtils.isBlank(INSERT_ORDERITEMS)) {
                eie.getEie(eie,"查詢的orderItems SQL不得為空，請傳入正確SQL");
                throw eie;
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
            stmt.setInt(12,order.getMemberId());
            stmt.setInt(13,order.getShipping());
            stmt.executeUpdate();

            //取得自動給號的order id值
            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                key = rs.getInt(1);
                order.setId(key);
                System.out.println("自動給號:" + key);
            }

            stmt = con.prepareStatement(INSERT_ORDERITEMS);
            for(OrderItems orderItems: order.getOrderItem()){
                // 新增訂單明細
                stmt.setInt(1,orderItems.getQuantity());
                stmt.setInt(2,order.getId());
                stmt.setInt(3,orderItems.getProductId());
                stmt.executeUpdate();
                // 查詢產品庫存
                stmt = con.prepareStatement(SELECT_PRODUCTS_STOCK);
                stmt.setInt(1,orderItems.getProductId());
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
                stmt.setInt(2,orderItems.getProductId());
                stmt.executeUpdate();
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
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert order stmt1關閉失敗: " + e.getMessage());
                }
            }

//            if (stmt2 != null) {
//                try {
//                    stmt2.close();
//                } catch (SQLException e) {
//                    throw new ModuleException("OrderDao insert orderItems stmt2關閉失敗: " + e.getMessage());
//                }
//            }
//
//            if (stmt3 != null) {
//                try {
//                    stmt3.close();
//                } catch (SQLException e) {
//                    throw new ModuleException("OrderDao select products stmt3關閉失敗: " + e.getMessage());
//                }
//            }
//
//            if (stmt4 != null) {
//                try {
//                    stmt4.close();
//                } catch (SQLException e) {
//                    throw new ModuleException("OrderDao update products stmt4關閉失敗: " + e.getMessage());
//                }
//            }

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao order 自動流水號 rs關閉失敗: " + e.getMessage());
                }
            }
//
//            if (rs2 != null) {
//                try {
//                    rs2.close();
//                } catch (SQLException e) {
//                    throw new ModuleException("OrderDao select products rs2關閉失敗: " + e.getMessage());
//                }
//            }

            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert con關閉失敗: " + e.getMessage());
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

        try {
            con = JdbcUtils.getConnection();
            stmt = con.prepareStatement(SELECT_ORDER_BY_ORDERID);
            stmt.setInt(1,orderId);
            stmt.executeQuery();
            while (rs.next()){
                order.setId(rs.getInt("id"));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<Order> getAll() throws ModuleException {
        return null;
    }
}
