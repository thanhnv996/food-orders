package com.exam.order.service;

import java.util.List;

import com.exam.order.model.Customer;

public interface CustomerService {
    List<Customer> findAll();
    Customer save(Customer customer);
}
