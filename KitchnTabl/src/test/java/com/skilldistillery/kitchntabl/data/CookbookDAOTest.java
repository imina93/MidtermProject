package com.skilldistillery.kitchntabl.data;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.kitchntabl.entities.Cookbook;
@SpringBootTest
class CookbookDAOTest {

	@Autowired
	private CookBookDAOImpl dao;
	
	@Test
	void test_findByKeyWord() {
		List<Cookbook> category = dao.findCookbookByKeyword("grandmas");
		
	}
	
	
}
