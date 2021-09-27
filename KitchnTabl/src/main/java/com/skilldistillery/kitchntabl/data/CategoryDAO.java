package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.Category;

public interface CategoryDAO {
	Category findCategoryByKeyword(String keyword);;
	Category createCategory(Category category);
	Category updateCategory(Category category);
	Category deleteCategory (int categoryId);
}
