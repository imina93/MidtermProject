package com.skilldistillery.kitchntabl.data;

import java.util.List;

import com.skilldistillery.kitchntabl.entities.Recipe;

public interface RecipeDAO {
	public Recipe findRecipe(int recipeId); //done
	
	public List<Recipe> findRecipeByKeyword(String keyword);
	public Recipe createRecipe(Recipe recipe);
	public Recipe updateRecipe(Recipe recipe, int id);
	public boolean deleteRecipe (int recipeId);
	List<Recipe> randomRecipeList(int size);

}
