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

class CookbookRatingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CookbookRating cookbookRating;

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
		cookbookRating = em.find(CookbookRating.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cookbookRating = null;
	}

	@Test
	void test() {
		assertNotNull(cookbookRating);
		assertEquals(1, cookbookRating.getId());
		assertEquals(3, cookbookRating.getRating());
		assertEquals("its ok.", cookbookRating.getRatingComment());
	}
}
