package com.skilldistillery.kitchntabl.data;

import java.util.List;

import com.skilldistillery.kitchntabl.entities.RecipeRating;

public interface RecipeRatingDAO {
	List<RecipeRating> findRecipeRatingByKeyword(String keyword);
//	RecipeRating createRecipeRating(RecipeRating recipeRating);
	RecipeRating updateRecipeRating(int id, RecipeRating recipeRating);
	boolean deleteRecipeRating(int recipeRatingId);
}
