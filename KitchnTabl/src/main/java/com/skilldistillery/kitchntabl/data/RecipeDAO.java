package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.Recipe;

public interface RecipeDAO {
	Recipe findRecipe(int recipeId);
	Recipe findRecipeByKeyword(String keyword);;
	Recipe createRecipe(Recipe recipe);
	Recipe updateRecipe(Recipe recipe);
	Recipe deleteRecipe (int recipeId);

}
