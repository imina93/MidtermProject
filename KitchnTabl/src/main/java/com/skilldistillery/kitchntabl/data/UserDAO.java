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

}
