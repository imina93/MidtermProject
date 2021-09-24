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

class RecipeCommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeComment recipeComment;

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
		recipeComment = em.find(RecipeComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	recipeComment = null;
	}

	@Test
	void test_recipeComment_entity_mapping() {
		assertNotNull(recipeComment);
	}

}
