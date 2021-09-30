package com.skilldistillery.kitchntabl.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.kitchntabl.data.CategoryDAO;
import com.skilldistillery.kitchntabl.data.CookBookDAO;
import com.skilldistillery.kitchntabl.data.RecipeDAO;
import com.skilldistillery.kitchntabl.entities.Category;
import com.skilldistillery.kitchntabl.entities.Cookbook;
import com.skilldistillery.kitchntabl.entities.Recipe;

@Controller
public class SearchController {
	
	@Autowired 
	private CategoryDAO catDao;
	@Autowired 
	private CookBookDAO cookbookDao;
	@Autowired 
	private RecipeDAO repDao;
	
	
	@RequestMapping(path =  "search.do" )
	public String searchCategory(String searchTerm, Model model,String searchType) {
			switch (searchType) {
			case "category":
				List<Category> categories = catDao.findCategoryByKeyword(searchTerm);
				model.addAttribute("categories", categories);
				System.out.println(categories);
				return "categorysearchresults";
			case "recipe":
				List<Recipe> recipes = repDao.findRecipeByKeyword(searchTerm);
				model.addAttribute("recipes",recipes);
				
				return "recipe/recipesearchresult";
			case "cookbook":
				List<Cookbook> cookbooks = cookbookDao.findCookbookByKeyword(searchTerm);
				model.addAttribute("cookbooks", cookbooks);
				System.out.println(cookbooks);
				return "cookbooksearchresults";
				
			default:
				return "redirect:home.do";
			}
	}
	
	
	
	
}
