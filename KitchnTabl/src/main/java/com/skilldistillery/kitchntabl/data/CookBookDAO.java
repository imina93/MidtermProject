package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.Cookbook;

public interface CookBookDAO {	
	Cookbook findCookbookByKeyword(String keyword);
	Cookbook createCookbook(Cookbook cookbook);
	Cookbook updateCookbook(Cookbook cookbook);
	Cookbook deleteCookbook(int cookbookId);

}
