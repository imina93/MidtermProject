package com.skilldistillery.kitchntabl.data;

import java.util.List;

import com.skilldistillery.kitchntabl.entities.Cookbook;

public interface CookBookDAO {	
	List<Cookbook> findCookbookByKeyword(String keyword);
	Cookbook createCookbook(Cookbook cookbook);
	Cookbook updateCookbook(int id, Cookbook cookbook);
	boolean deleteCookbook(int cookbookId);

}
