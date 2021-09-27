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

class RecipeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Recipe recipe;

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
		recipe = em.find(Recipe.class,1);
	}

	@AfterEach
	void tearDown() throws Exception {
	recipe = null;
	em.close();
	}

	@Test
	void test_recipe_entity_mapping() {
		assertNotNull(recipe);
		assertEquals(5, recipe.getChefRating());
	}

	@Test
	void test_mappingRecipeToRecipeImageOneToMany() {
		assertNotNull(recipe);
		assertEquals(5, recipe.getChefRating());
		assertEquals("https://cdn-icons-png.flaticon.com/512/184/184514.png", recipe.getRecipeImage().get(0).getImageUrl());
	}
	
	@Test
	void test_mappingRecipeToRecipeRatingOneToMany() {
		assertNotNull(recipe);
		assertEquals("gross.", recipe.getRecipeRating().get(0).getRatingComment());
	}
	
	@Test
	void test_mappingRecipeToRecipeIngredientOneToMany() {
		assertNotNull(recipe);
		assertEquals("1 tablespoon", recipe.getRecipeIngredient().get(0).getAmount());
	}
	
	@Test
	void test_mappingRecipeToRecipeIngredientToIngredientOneToMany() {
		assertNotNull(recipe);
		assertEquals("peanut butter", recipe.getRecipeIngredient().get(0).getIngredient().getName());
	}
	
	@Test
	void test_mappingRecipeToRecipeCommentOneToMany() {
		assertNotNull(recipe);
		assertEquals("gross.", recipe.getRecipeComment().get(0).getCommentText());
	}
}
