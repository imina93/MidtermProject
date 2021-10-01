package com.skilldistillery.kitchntabl.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.kitchntabl.data.RecipeDAO;
import com.skilldistillery.kitchntabl.entities.Cookbook;
import com.skilldistillery.kitchntabl.entities.Recipe;
import com.skilldistillery.kitchntabl.entities.User;

@Controller
public class RecipeController {

	@Autowired
	private RecipeDAO dao;
	
	@RequestMapping(path = "searchrecipebyid.do")
	public String searchById(Integer rid, Model model) {
		Recipe recipe = dao.findById(rid);
		model.addAttribute("recipe",recipe);
		
		// could be showRecipe
		return "recipebyidresult";
	}
	@RequestMapping(path = "showRecipe.do")
	public String showUserRecipeById(Integer rid, Model model) {
		Recipe recipe = dao.findById(rid);
		model.addAttribute("recipe",recipe);
		
		return "recipe/showRecipe";
	}
	
	@RequestMapping(path = "searchrecipe.do")
	public String searchRecipe(String keyword, Model model) {
		List<Recipe> recipes = dao.findRecipeByKeyword(keyword);
		model.addAttribute("recipes",recipes);
		
		return "recipe/recipesearchresult";
	}

	@RequestMapping(path = "addRecipe.do", method = RequestMethod.POST)
	public String createRecipe(Recipe recipe, Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		recipe.setUser(user);
		Recipe addRecipe = dao.createRecipe(recipe);
		model.addAttribute("recipe" ,addRecipe);
		
		
		return "recipe/recipeAdded";
	}
	
	
	@RequestMapping(path = "editRecipe.do", method = RequestMethod.POST)
	public String editRecipe(Recipe recipe, Integer rid, Model model) {
		Recipe dbRecipe = dao.updateRecipe(recipe, rid);
		model.addAttribute("recipe", dbRecipe);
		

		return "recipe/recipeEdited";
		
	}
	
	@RequestMapping(path = "deleteRecipe.do")
	public String deleteRecipe(Integer rid, Model model) {
		boolean result = dao.deleteRecipe(rid);
		
		
		return "recipe/recipeDeleted";
		
	} 
	
	
}