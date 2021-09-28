package com.skilldistillery.kitchntabl.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.kitchntabl.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "createUserSlot.do", method = RequestMethod.POST)
	public String createUserForm(Model model, User user) {
		return "addUser";
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public String createUser(Model model, User user) {
		model.addAttribute("user", dao.createUser(user));
		return "addWorked";
	}

}
