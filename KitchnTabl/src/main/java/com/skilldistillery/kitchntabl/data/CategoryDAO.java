package com.skilldistillery.kitchntabl.data;

import java.util.List;

import com.skilldistillery.kitchntabl.entities.Category;

public interface CategoryDAO {
	List<Category> findCategoryByKeyword(String keyword);;
	Category createCategory(Category category);
	Category updateCategory(int id, Category category);
	boolean deleteCategory (int categoryId);
}
