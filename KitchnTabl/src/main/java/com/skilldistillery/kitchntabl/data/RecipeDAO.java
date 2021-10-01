package com.skilldistillery.kitchntabl.data;

import java.util.List;

import com.skilldistillery.kitchntabl.entities.Recipe;
import com.skilldistillery.kitchntabl.entities.User;

public interface RecipeDAO {
	public Recipe findById(int recipeId); //done
	List<Recipe> findAll();
	public List<Recipe> findRecipeByKeyword(String keyword);
	public Recipe updateRecipe(Recipe recipe, int id);
	public Recipe createRecipe(Recipe recipe);
	public boolean deleteRecipe (int recipeId);
	List<Recipe> randomRecipeList(int size);

}
