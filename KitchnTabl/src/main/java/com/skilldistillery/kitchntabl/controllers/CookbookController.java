package com.skilldistillery.kitchntabl.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.kitchntabl.data.CookBookDAOImpl;
import com.skilldistillery.kitchntabl.entities.Cookbook;

@Controller
public class CookbookController {

	@Autowired 
	private CookBookDAOImpl dao;
	
	@RequestMapping(path =  "testpageim.do" )
	public String searchCookBook(String keyword, Model model) {
		List<Cookbook> cookbooks = dao.findCookbookByKeyword(keyword);
		model.addAttribute("cookbooks", cookbooks);
		System.out.println(cookbooks);
		return "testpageim";
	}
	
	
}
