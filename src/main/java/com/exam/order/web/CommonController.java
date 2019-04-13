package com.exam.order.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommonController {

	@RequestMapping(value = "/check-coupon", method = RequestMethod.POST)
	public String checkCuppon(@RequestParam("couponCode") String couponCode, Model model) {
		if(CommonController.isValidCouponCode(couponCode)) {
			model.addAttribute("response", "valid");
		} else {
			model.addAttribute("response", "invalid");
		}
		return "check-coupon";
	}
	
	public static boolean isValidCouponCode(String couponCode) {
		return couponCode.equals("GO2018") ? true : false;
	}
}
