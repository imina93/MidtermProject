package com.skilldistillery.kitchntabl.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.kitchntabl.data.RecipeDAO;
import com.skilldistillery.kitchntabl.data.UserDAO;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private RecipeDAO recipeDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("randomRecipes", recipeDao.randomRecipeList(3));
		return "home"; 
	}
}
