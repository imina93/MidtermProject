package com.skilldistillery.kitchntabl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.kitchntabl.entities.Ingredient;

class IngredientTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Ingredient ingredient;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf=Persistence.createEntityManagerFactory("JPAKitchnTabl");
		
	}
	

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		ingredient = em.find(Ingredient.class, 1);
		assertNotNull(ingredient);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ingredient = null;
	}

	@Test
	@DisplayName("test Ingredient entity mappings")
	void test() {

	assertNotNull(ingredient);
//	assertEquals("1", ingredient.getId());
	
	}

}
