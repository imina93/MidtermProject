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

class CookbookTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Cookbook cookbook;

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
		cookbook = em.find(Cookbook.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		cookbook = null;
	}

	@Test
	void test() {
		assertNotNull(cookbook);
		assertEquals(1, cookbook.getId());
		assertEquals("a collection of my grandmas best recipes.", cookbook.getDescription());
	}
}
