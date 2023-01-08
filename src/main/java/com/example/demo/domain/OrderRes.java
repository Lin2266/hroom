package com.example.demo.domain;

public class OrderRes {
    private int orderId;
    private String message;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "OrderRes{" +
                "orderId=" + orderId +
                ", message='" + message + '\'' +
                '}';
    }
}
