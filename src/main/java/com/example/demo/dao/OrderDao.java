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
    private final String INSERT_ORDER = "insert into hroom.order\n" +
            "    (ordertime,amount,receiver,receiverphone,receiveremail,city,county,zipcode,address\n" +
            "    ,info,payment_method,paystate,member_id,shipping)\n" +
            "values (now(),?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private final String INSERT_ORDERITEMS = "insert into hroom.order_items( quantity, order_id, product_id)\n" +
            "values (?,?,?);";
    private final String SELECT_ORDER_BY_MBMBERID = "";
    private final String SELECT_ORDER_BY_ORDERID = "";
    private ErrorInputException  eie = null;


    /**
     * 新增訂單
     * @param order
     * @throws ModuleException
     */
    @Override
    public void insert(Order order) throws ModuleException {
        Connection con = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        ResultSet rs = null;

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
            }

            con.setAutoCommit(false);
            stmt1 = con.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);
            stmt1.setDouble(1,order.getAmount());
            stmt1.setString(2,order.getReceiver());
            stmt1.setString(3,order.getReceiverPhone());
            stmt1.setString(4,order.getReceiverEmail());
            stmt1.setString(5,order.getCity());
            stmt1.setString(6,order.getCounty());
            stmt1.setString(7,order.getZipcode());
            stmt1.setString(8,order.getAddress());
            stmt1.setString(9,order.getInfo());
            stmt1.setInt(10,order.getParmentMethod());
            stmt1.setInt(11,order.getPaystate());
            stmt1.setInt(12,order.getMemberId());
            stmt1.setInt(13,order.getShipping());
            stmt1.executeUpdate();

            //取得自動給號的order id值
            rs = stmt1.getGeneratedKeys();
            int key=0;
            if (rs.next()) {
                key = rs.getInt(1);
                order.setId(key);
                System.out.println("自動給號:" + key);
            }
            stmt2 = con.prepareStatement(INSERT_ORDERITEMS);
            for(OrderItems orderItems: order.getOrderItem()){
                stmt2.setInt(1,orderItems.getQuantity());
                stmt2.setInt(2,order.getId());
                stmt2.setInt(3,orderItems.getProductId());
                stmt2.executeUpdate();
            }

            con.commit();
        } catch (SQLException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                throw new ModuleException("order Insert rollback異常: " + e.getMessage());
            }
            throw new ModuleException("新增訂單失敗: " + e.getMessage());
        }finally {
            if (stmt1 != null) {
                try {
                    stmt1.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert stmt1關閉失敗: " + e.getMessage());
                }
            }

            if (stmt2 != null) {
                try {
                    stmt2.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert stmt2關閉失敗: " + e.getMessage());
                }
            }

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert rs關閉失敗: " + e.getMessage());
                }
            }

            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    throw new ModuleException("OrderDao insert con關閉失敗: " + e.getMessage());
                }
            }
        }
    }

    @Override
    public Order get(Integer integer) throws ModuleException {
        return null;
    }

    @Override
    public List<Order> getAll() throws ModuleException {
        return null;
    }
}
