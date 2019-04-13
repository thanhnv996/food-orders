package com.exam.order.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.exam.order.model.MenuCategory;

public interface MenuCategoryRepository extends JpaRepository<MenuCategory, Long>{
}
