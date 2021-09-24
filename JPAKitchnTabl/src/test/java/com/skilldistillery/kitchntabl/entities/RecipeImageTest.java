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
		recipeImage = em.find(RecipeImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	recipeImage = null;
	}

	@Test
	void test_recipeComment_entity_mapping() {
		assertNotNull(recipeImage);
	}

}
