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

class RecipeRatingTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeRating recipeRating;

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
		recipeRating = em.find(RecipeRating.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	recipeRating = null;
	}

	@Test
	void test_recipeComment_entity_mapping() {
		assertNotNull(recipeRating);
	}

}