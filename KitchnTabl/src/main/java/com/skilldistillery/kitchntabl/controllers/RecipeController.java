package com.skilldistillery.kitchntabl.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.kitchntabl.data.RecipeDAO;
import com.skilldistillery.kitchntabl.entities.Recipe;

@Controller
public class RecipeController {

	@Autowired
	private RecipeDAO dao;
	
//	@RequestMapping(path = "testpageag.do")
//	public String searchById(int recipeId, Model model) {
//		Recipe recipe = dao.findRecipe(recipeId);
//		model.addAttribute("recipe",recipe);
//		
//		
//		return "testpageag";
//	}
//	
//	@RequestMapping(path = "testpageag.do")
//	public String searchRecipe(String keyword, Model model) {
//		List<Recipe> recipes = dao.findRecipeByKeyword(keyword);
//		model.addAttribute("recipes",recipes);
//		
//		return "testpageag";
//	}
//	
//	@RequestMapping(path = "testpageag.do", method = RequestMethod.POST)
//	public String createRecipe(Recipe recipe, Model model) {
//		Recipe addRecipe = dao.createRecipe(recipe);
//		model.addAttribute("recipe" ,addRecipe);
//		
//		
//		return "testpageag";
//	}
//	
//	@RequestMapping(path = "testpageag.do", method = RequestMethod.POST)
//	public String editRecipe(Recipe recipe, int id, Model model) {
//		Recipe dbRecipe = dao.updateRecipe(recipe, id);
//		model.addAttribute("recipe", dbRecipe);
//		
//
//		return "testpageag";
//		
//	}
//	
//	@RequestMapping(path = "testpageag.do")
//	public boolean deleteRecipe(int recipeId, Model model) {
//		boolean result = dao.deleteRecipe(recipeId);
//		
//		return false;
//		
//	} 
	
	
}