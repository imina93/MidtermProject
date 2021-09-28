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
		Recipe recipe = dao.findRecipe(rid);
		model.addAttribute("recipe",recipe);
		
		
		return "recipebyidresult";
	}
	
	@RequestMapping(path = "searchrecipe.do")
	public String searchRecipe(String keyword, Model model) {
		List<Recipe> recipes = dao.findRecipeByKeyword(keyword);
		model.addAttribute("recipes",recipes);
		
		return "recipesearchresult";
	}

	@RequestMapping(path = "addRecipe.do", method = RequestMethod.POST)
	public String createRecipe(Recipe recipe, Model model) {
		Recipe addRecipe = dao.createRecipe(recipe);
		model.addAttribute("recipe" ,addRecipe);
		
		
		return "addRecipeSuccess";
	}
	
	
	@RequestMapping(path = "editRecipe.do", method = RequestMethod.POST)
	public String editRecipe(Recipe recipe, Integer rid, Model model) {
		Recipe dbRecipe = dao.updateRecipe(recipe, rid);
		model.addAttribute("recipe", dbRecipe);
		

		return "editRecipeSuccessful";
		
	}
	
	@RequestMapping(path = "deleteRecipe.do")
	public String deleteRecipe(Integer rid, HttpSession session) {
		session.setAttribute("recipe", dao.deleteRecipe(rid));
		
		return "updateRecipe";
		
	} 
	
	
}