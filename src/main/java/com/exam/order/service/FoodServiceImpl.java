package com.exam.order.service;

import com.exam.order.model.Food;
import com.exam.order.repository.FoodRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodServiceImpl implements FoodService {
	@Autowired
	private FoodRepository foodRepository;

	@Override
	public List<Food> findAll() {
		return foodRepository.findAll();
	}
	
	@Override
	public Food findById(Integer id) {
		return foodRepository.findOne(id);
	};
}
