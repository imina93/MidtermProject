package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.RecipeImage;
import com.skilldistillery.kitchntabl.entities.RecipeImageId;

public interface RecipeImageDAO {
	RecipeImage createRecipeImage(RecipeImage recipeImage);
	RecipeImage updateRecipeImageg(RecipeImage recipeImage);
	// Don't know about this one...
	RecipeImage deleteRecipeImage(RecipeImageId recipeImageId);

}
