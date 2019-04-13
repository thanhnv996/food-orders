package com.exam.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exam.order.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{
}
