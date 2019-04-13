package com.exam.order.service;

import com.exam.order.model.MenuCategory;
import com.exam.order.repository.MenuCategoryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuCategoryServiceImpl implements MenuCategoryService {
	@Autowired
	private MenuCategoryRepository menuCategoryRepository;

	@Override
	public List<MenuCategory> findAll() {
		return menuCategoryRepository.findAll();
	}
}
