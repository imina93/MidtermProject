package com.skilldistillery.kitchntabl.data;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.kitchntabl.entities.RecipeRating;

public class RecipeRatingDAOtest {


	@Autowired
	private RecipeRatingDAOImpl dao;
	
	@Test
	void test_createRecipeRating() {
			
	};
	
	@Test
	void test_updateRecipeRating() {
			
	};
	
	@Test
	void test_deleteRecipeRating() {
			
	}
	
	void test_findByKeyWord() {
		List<RecipeRating> recipeRating = dao.findRecipeRatingByKeyword("gross");
}
}