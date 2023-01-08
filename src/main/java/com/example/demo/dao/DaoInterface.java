package com.example.demo.dao;

import com.example.demo.domain.Order;
import com.example.demo.exception.ModuleException;

import java.sql.Connection;
import java.util.List;

public interface DaoInterface<K,T> {
    int insert(T order) throws ModuleException;
    public T get(K orderId) throws  ModuleException;
    public abstract List<T> getAll() throws  ModuleException;

}
