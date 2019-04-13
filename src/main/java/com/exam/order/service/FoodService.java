package com.exam.order.service;

import java.util.List;

import com.exam.order.model.Food;

public interface FoodService {
    List<Food> findAll();
    Food findById(Integer id);
}
