package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.RecipeImage;
import com.skilldistillery.kitchntabl.entities.RecipeImageId;

public interface RecipeImageDAO {
	RecipeImage createRecipeImage(RecipeImage recipeImage);
	RecipeImage updateRecipeImage(RecipeImage recipeImage);
	// Don't know about this one...
	boolean deleteRecipeImage(RecipeImageId recipeImageId);

}
