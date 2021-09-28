package com.skilldistillery.kitchntabl.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.kitchntabl.data.UserDAO;
import com.skilldistillery.kitchntabl.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "getUser.do")
	public String showUser(@RequestParam Integer uid, HttpSession session) {
		User user = dao.findById(uid);
		session.setAttribute("user", user);
		return "user/userPage";
	}
	
	@RequestMapping(path = "createUserSlot.do", method = RequestMethod.POST)
	public String createUserForm(HttpSession session, User user) {
		session.setAttribute("user", dao.createUser(user));
		return "user/addUser";
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public String createUser(Model model, User user) {
		model.addAttribute("user", dao.createUser(user));
		return "user/addWorked";
	}
	
	@RequestMapping(path = "updateUserSlot.do", method = RequestMethod.POST)
	public String updateUserSlot(@RequestParam Integer uid, HttpSession session) {
		User updatedUser = dao.findById(uid);
		session.setAttribute("user", updatedUser);
		return "user/updateUser";
	}

	// update reseller
	@RequestMapping(path = "updateUser.do", method = RequestMethod.POST)
	public String updateUser(Integer uid, HttpSession session, User user) {
		session.setAttribute("user", dao.updateUser(uid, user));
		return "user/updateWorked";
	}
	
	@RequestMapping(path = "deleteUser.do")
	public String deleteUser(Integer uid, HttpSession session) {
		session.setAttribute("user", dao.destroyUser(uid));
		return "user/deleted";
	}
}