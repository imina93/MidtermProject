package com.skilldistillery.kitchntabl.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.kitchntabl.data.CategoryDAO;
import com.skilldistillery.kitchntabl.entities.Category;

@Controller
public class CategoryController {
	
	@Autowired 
	private CategoryDAO dao;
	
	
	@RequestMapping(path =  "testpage.do" )
	public String searchCategory(String keyword, Model model) {
		List<Category> categories = dao.findCategoryByKeyword(keyword);
		model.addAttribute("categories", categories);
		return "testpage";
	}
	
	

	
}
