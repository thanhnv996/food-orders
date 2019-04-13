package com.exam.order.web;

import com.exam.order.model.MenuCategory;
import com.exam.order.service.MenuCategoryService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuCategoryController {
	@Autowired
	private MenuCategoryService menuCategoryService;

	@RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
	public ModelAndView showHome(Model model) {
		System.out.print(menuCategoryService.findAll().size());
		List<MenuCategory> menuCategories = menuCategoryService.findAll();
		ModelAndView map = new ModelAndView("home");
	    map.addObject("menuCategories", menuCategories);
		return map;
	}
}
