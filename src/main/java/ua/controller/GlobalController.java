package ua.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import ua.service.UserService;
import ua.shop_e.User;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	private UserService userService;

	@ModelAttribute("authUser")
	public User getUser(){
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		if(!"anonymousUser".equals(id)){
			return userService.findById(Integer.valueOf(id));
		}
		return null;
	}
}