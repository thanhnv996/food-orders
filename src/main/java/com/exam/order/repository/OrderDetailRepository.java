package com.exam.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exam.order.model.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{
}
