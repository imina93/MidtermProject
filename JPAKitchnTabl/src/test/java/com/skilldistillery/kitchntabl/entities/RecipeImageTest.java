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

class RecipeImageTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeImage recipeImage;

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
		RecipeImageId rii = new RecipeImageId();
		rii.setRecipeId(1);
		rii.setUserId(1);
		recipeImage = em.find(RecipeImage.class, rii);
	}

	@AfterEach
	void tearDown() throws Exception {
	recipeImage = null;
	em.close();
	}

	@Test
	void test_recipeComment_entity_mapping() {
		assertNotNull(recipeImage);
		assertEquals("https://cdn-icons-png.flaticon.com/512/184/184514.png", recipeImage.getImageUrl());
	}

}
