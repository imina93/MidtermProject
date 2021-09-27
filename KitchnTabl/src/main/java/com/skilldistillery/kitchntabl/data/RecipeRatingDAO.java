package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.RecipeRating;
import com.skilldistillery.kitchntabl.entities.RecipeRatingId;

public interface RecipeRatingDAO {
	RecipeRating createRecipeRating(RecipeRating recipeRating);
	RecipeRating updateRecipeRating(RecipeRating recipeRating);
	// Don't know about this one...
	RecipeRating deleteRecipeRating(RecipeRatingId recipeRatingId);
}
