package com.exam.order.web;

import com.exam.order.model.Customer;
import com.exam.order.model.Food;
import com.exam.order.model.Order;
import com.exam.order.model.OrderDetail;
import com.exam.order.model.OrderdetailId;
import com.exam.order.service.CustomerService;
import com.exam.order.service.FoodService;
import com.exam.order.service.OrderDetailService;
import com.exam.order.service.OrderService;
import com.exam.order.validator.CustomerValidator;

import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private FoodService foodService;
	
	@Autowired
    private CustomerValidator customerValidator;
	
	private static final String ORDERED = "ORDERED";
	

	@RequestMapping(value = "/order-confirm", method = RequestMethod.POST)
	public ModelAndView orderConfirm(@RequestParam("orderJSON") String orderJSON, Model model) {
		model.addAttribute("customerForm", new Customer());
		ModelAndView map = new ModelAndView("order-confirm");
		map.addObject("orderJSON", orderJSON);
		return map;
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public ModelAndView insertOrder(@ModelAttribute("customerForm") Customer customerForm,
										BindingResult bindingResult,
										@RequestParam("orderJSON") String orderJSON,
										@RequestParam("couponCode") String couponCode, 
										Model model) {
		ModelAndView map = new ModelAndView("order-success");;
		customerValidator.validate(customerForm, bindingResult);

        if (bindingResult.hasErrors()) {
        	map = new ModelAndView("order-confirm");
        	map.addObject("orderJSON", orderJSON);
        	return map;
        }
        
        Customer customer= (Customer) customerForm;
        customerService.save(customer);
        
        Order order = new Order();
        order.setCustomer(customer);
        order.setOrderDate(new Date());
        order.setStatus(ORDERED);
        order = orderService.save(order);
        
        JSONArray jArray = new JSONArray(orderJSON);
        Double sumPrice = 0d;

        for (int i = 0; i < jArray.length(); i++) {
            JSONObject jb = jArray.getJSONObject(i);
            
            Food food = foodService.findById(jb.getInt("id"));
            
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setId(new OrderdetailId(order.getId(),food.getId()));
            orderDetail.setFood(food);
            orderDetail.setOrderLineNumber((short) 123);
            orderDetail.setPriceEach(food.getBuyPrice());
            orderDetail.setQuantityOrdered(jb.getInt("quantity"));
            orderDetailService.save(orderDetail);
            
            sumPrice += food.getBuyPrice().intValue()*jb.getInt("quantity")*(1d+food.getTax().doubleValue());
        }
        
        if(CommonController.isValidCouponCode(couponCode)) {
        	sumPrice *= 0.9;
        	order.setCouponCode(couponCode);
        }
        
        order.setSumPrice(sumPrice.intValue());
        order = orderService.save(order);
        
        map.addObject("order", order);
        map.addObject("customer", customer);
        map.addObject("orderJSON", orderJSON);
        map.addObject("couponCode", couponCode);
        map.addObject("sumPrice", sumPrice);
		
		return map;
	}
}
