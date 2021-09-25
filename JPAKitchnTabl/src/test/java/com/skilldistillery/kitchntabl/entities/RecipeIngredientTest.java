package com.skilldistillery.kitchntabl.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class RecipeIngredientTest {


	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeIngredient recipeIngredient;
	
	
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
		RecipeIngredientId rId = new RecipeIngredientId();
		rId.setIngredientId(1);
		rId.setRecipeId(1);
		recipeIngredient = em.find(RecipeIngredient.class, rId);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipeIngredient = null;
		
	}
	
	@Test
	void test() {
		assertNotNull(recipeIngredient);
		assertEquals("1 tablespoon", recipeIngredient.getAmount());
		assertEquals(1, recipeIngredient.getId().getRecipeId());
	}

}
