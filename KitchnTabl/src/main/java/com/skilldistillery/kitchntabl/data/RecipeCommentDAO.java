package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.RecipeComment;
import com.skilldistillery.kitchntabl.entities.RecipeCommentId;

public interface RecipeCommentDAO {
	RecipeComment createRecipeComment(RecipeComment recipeComment);
	RecipeComment updateRecipeComment(RecipeComment recipeComment);
	// Don't know about this one...
	boolean deleteRecipeComment(RecipeCommentId recipeCommentId);    
}
