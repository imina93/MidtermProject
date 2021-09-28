package com.skilldistillery.kitchntabl.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.kitchntabl.data.UserDAO;
import com.skilldistillery.kitchntabl.entities.User;

@Controller
public class LoginController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "login.do", method=RequestMethod.GET)
	public String goToLoginForm() {
		
		return "login";
	}
	
	
	
	@RequestMapping(path = "login.do", method=RequestMethod.POST)
	public String logIn(HttpSession session, User user, Model model) {
		user = dao.logUserIn(user);
		if(user != null) {
			session.setAttribute("loggedInUser", user);
			return "user/userPage";
		}
		else {
			model.addAttribute("loginError", "Invalid Login Information, Try Again.");
			return "login";
		}
	}
	@RequestMapping(path = "logout.do")
	public String logOut(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "login";
	}
}
