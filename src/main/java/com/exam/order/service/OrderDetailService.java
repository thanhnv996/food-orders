package com.exam.order.service;

import java.util.List;

import com.exam.order.model.OrderDetail;

public interface OrderDetailService {
	OrderDetail save(OrderDetail orderDetail);
    List<OrderDetail> findAll();
}
