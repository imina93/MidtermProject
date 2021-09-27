package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.CookbookRating;

public interface CookbookRatingDAO {
	
	CookbookRating createCookbookRating(CookbookRating cookbookRating);
	CookbookRating updateCookbookRating(CookbookRating cookbookRating);
	CookbookRating deleteRecipeRating(CookbookRating cookbookRating);

}
