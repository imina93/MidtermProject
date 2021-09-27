package com.skilldistillery.kitchntabl.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.kitchntabl.data.RecipeRatingDAO;
import com.skilldistillery.kitchntabl.entities.RecipeRating;

public class RecipeRatingController {

	

	@Autowired
	private RecipeRatingDAO dao;
	
	@RequestMapping(path = "testpagedr.do")
	public String searchRecipeRating(String keyword, Model model) {
		List<RecipeRating> recipeRatings = dao.findRecipeRatingByKeyword(keyword);
		model.addAttribute("recipeRatings", recipeRatings);
		System.out.println(recipeRatings);
		return "home.do";
	}
}
