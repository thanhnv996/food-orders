package com.exam.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exam.order.model.Food;

public interface FoodRepository extends JpaRepository<Food, Integer>{
}
