package com.exam.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exam.order.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long>{
}
