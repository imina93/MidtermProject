package com.skilldistillery.kitchntabl.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.Recipe;

@Service
@Transactional
public class RecipeDaoImpl implements RecipeDAO {

	@PersistenceContext
	private EntityManager em;;
	
	@Override
	public Recipe findRecipe(int recipeId) {
		
		
		return em.find(Recipe.class, recipeId);
	}

	@Override
	public List<Recipe> findRecipeByKeyword(String keyword) {
		
		String jpql= "SELECT r FROM Recipe r Where name LIKE :searchName OR description LIKE :searchDescription";
		keyword = "%" + keyword + "%";
		List<Recipe> results = em.createQuery(jpql, Recipe.class).setParameter("searchName",keyword)
				.setParameter("searchDescription", keyword).getResultList();
		
		return results;
	}

	@Override
	public Recipe createRecipe(Recipe recipe) {
		Recipe newRecipe = new Recipe();
		
		newRecipe.setId(0);
		newRecipe.setName(" ");
		newRecipe.setInstructions(" ");
		newRecipe.setCalories(0);
		newRecipe.setChefRating(0);
		newRecipe.setCategory(" ");
		newRecipe.setServingSize(" ");
		newRecipe.setCookTime(0);
		newRecipe.setPrepTime(0);
		newRecipe.setImage(" ");
		newRecipe.setDescription(" ");
		
		em.persist(newRecipe);
		em.flush();
		
	
		return newRecipe;
	}

	@Override
	public Recipe updateRecipe(Recipe recipe, int id) {
		Recipe updateRecipe = em.find(Recipe.class, id);
		
		updateRecipe.setId(recipe.getId());
		updateRecipe.setName(recipe.getName());
		updateRecipe.setInstructions(recipe.getInstructions());
		updateRecipe.setCalories(recipe.getCalories());
		updateRecipe.setChefRating(recipe.getChefRating());
		updateRecipe.setCategory(recipe.getCategory());
		updateRecipe.setServingSize(recipe.getServingSize());
		updateRecipe.setCookTime(recipe.getCookTime());
		updateRecipe.setPrepTime(recipe.getPrepTime());
		updateRecipe.setImage(recipe.getImage());
		updateRecipe.setDescription(recipe.getDescription());
		
		em.flush();
		return updateRecipe;
	}

	@Override
	public boolean deleteRecipe(int recipeId) {
		Recipe deleteRecipe = em.find(Recipe.class, recipeId);
		if(deleteRecipe != null	) {
			em.remove(deleteRecipe);
		}
	
		return !em.contains(deleteRecipe);
	}

}
