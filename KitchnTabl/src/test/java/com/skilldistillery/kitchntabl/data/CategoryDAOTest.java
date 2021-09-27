package com.skilldistillery.kitchntabl.data;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.kitchntabl.entities.Category;

	@SpringBootTest
	class CategoryDAOTest {

		@Autowired
		private CategoryDAOImpl dao;
		
		@Test
		void test_findByKeyWord() {
			List<Category> category = dao.findCategoryByKeyword("Kid");
			
		}

	}
