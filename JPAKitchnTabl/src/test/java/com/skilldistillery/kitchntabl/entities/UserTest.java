package com.skilldistillery.kitchntabl.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAKitchnTabl");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class,1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_mappingUserToRecipeImageOneToMany() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("https://cdn-icons-png.flaticon.com/512/184/184514.png", user.getRecipeImage().get(0).getImageUrl());
	}
	@Test
	void test_mappingUserToRecipeRatingOneToMany() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("gross.", user.getRecipeRating().get(0).getRatingComment());
	}

	@Test
	void test_mappingUserToRecipeCommentOneToMany() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("gross.", user.getRecipeComment().get(0).getCommentText());
	}
	
	@Test
	void test_mappingUserToCookbookOneToMany() {
	}
	
	@Test
	void test_mappingUserToRecipeOneToMany() {
	}
	
	@Test
	void test_mappingUserToCookbookRatingOneToMany() {
	}
}
