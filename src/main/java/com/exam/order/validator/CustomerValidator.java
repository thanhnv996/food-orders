package com.exam.order.validator;

import com.exam.order.model.Customer;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CustomerValidator implements Validator {
	
	private static final String PATTERN_PHONE_NUMBER = "\\d{10}|(?:\\d{3}-){2}\\d{4}|\\(\\d{3}\\)\\d{3}-?\\d{4}";
	
    @Override
    public boolean supports(Class<?> aClass) {
        return Customer.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
    	Customer customer = (Customer) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "customerName", "NotEmpty");
        if (customer.getCustomerName().length() < 6 || customer.getCustomerName().length() > 50) {
            errors.rejectValue("customerName", "Size.customerForm.customerName");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty");
        if (customer.getPhone().length() < 9 || customer.getPhone().length() > 50) {
            errors.rejectValue("phone", "Size.customerForm.phone");
            if (!customer.getPhone().matches(PATTERN_PHONE_NUMBER)) {     
            	errors.rejectValue("phone", "Format.customerForm.phone");
            }
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "addressLine1", "NotEmpty");
        if (customer.getAddressLine1().length() < 6 || customer.getAddressLine1().length() > 50) {
            errors.rejectValue("addressLine1", "Size.customerForm.addressLine1");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "NotEmpty");
        if (customer.getCity().length() < 6 || customer.getCity().length() > 50) {
            errors.rejectValue("city", "Size.customerForm.city");
        }
    }
}
