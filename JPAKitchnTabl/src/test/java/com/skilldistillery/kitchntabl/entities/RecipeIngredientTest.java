package com.skilldistillery.kitchntabl.entities;

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
		RecipeIngredientId rii = new RecipeIngredientId();
		rii.setIngredientId(1);
		rii.setRecipeId(1);
		recipeIngredient = em.find(RecipeIngredient.class, rii);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		
	}
	
	@Test
	void test() {
		assertNotNull(recipeIngredient);
	}

}
