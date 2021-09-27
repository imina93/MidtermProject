package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.Category;
import com.skilldistillery.kitchntabl.entities.Cookbook;
import com.skilldistillery.kitchntabl.entities.CookbookRating;
import com.skilldistillery.kitchntabl.entities.Recipe;
import com.skilldistillery.kitchntabl.entities.RecipeComment;
import com.skilldistillery.kitchntabl.entities.RecipeCommentId;
import com.skilldistillery.kitchntabl.entities.RecipeImage;
import com.skilldistillery.kitchntabl.entities.RecipeImageId;
import com.skilldistillery.kitchntabl.entities.RecipeRating;
import com.skilldistillery.kitchntabl.entities.RecipeRatingId;
import com.skilldistillery.kitchntabl.entities.User;

public interface UserDAO {
	
	User findByUsername(String username);
	User findRecipe(int recipeId);
	User findRecipeByKeyword(String keyword);;
	User createRecipe(Recipe recipe);
	User updateRecipe(Recipe recipe);
	User deleteRecipe (int recipeId);

	User findCategoryByKeyword(String keyword);;
	User createCategory(Category category);
	User updateCategory(Category category);
	User deleteCategory (int categoryId);
	
	User findCookbookByKeyword(String keyword);;
	User createCookbook(Cookbook cookbook);
	User updateCookbook(Cookbook cookbook);
	User deleteCookbook(int cookbookId);
	
	User createCookbookRating(CookbookRating cookbookRating);
	User updateCookbookRating(CookbookRating cookbookRating);
	User deleteRecipeRating(CookbookRating cookbookRating);
	
	User createRecipeComment(RecipeComment recipeComment);
	User deleteRecipeComment(RecipeComment recipeComment);
	// Don't know about this one...
	User deleteRecipeComment(RecipeCommentId recipeCommentId);
	
	User createRecipeRating(RecipeRating recipeRating);
	User updateRecipeRating(RecipeRating recipeRating);
	// Don't know about this one...
	User deleteRecipeRating(RecipeRatingId recipeRatingId);

	User createRecipeImage(RecipeImage recipeImage);
	User updateRecipeImageg(RecipeImage recipeImage);
	// Don't know about this one...
	User deleteRecipeImage(RecipeImageId recipeImageId);

	


}
