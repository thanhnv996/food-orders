package com.exam.order.service;

import java.util.List;

import com.exam.order.model.Order;

public interface OrderService {
	Order save(Order order);
    List<Order> findAll();
}
