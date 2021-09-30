package com.skilldistillery.kitchntabl.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.Recipe;
import com.skilldistillery.kitchntabl.entities.RecipeComment;
import com.skilldistillery.kitchntabl.entities.RecipeImage;
import com.skilldistillery.kitchntabl.entities.RecipeIngredient;
import com.skilldistillery.kitchntabl.entities.RecipeRating;

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
	public List<Recipe> randomRecipeList(int size) {
		List<Recipe> recipes = null;
		String sql = "SELECT * FROM recipe ORDER BY RAND() LIMIT :s";
		recipes = em.createNativeQuery(sql, Recipe.class).setParameter("s", size).getResultList();
		return recipes;
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
		em.persist(recipe);
		em.flush();
		em.close();
		return recipe;
		
	
		
	}

	@Override
	public Recipe updateRecipe(Recipe recipe, int id) {
		Recipe updateRecipe = em.find(Recipe.class, id);
		
//		updateRecipe.setId(recipe.getId());
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
		for ( RecipeComment recipeComment : deleteRecipe.getRecipeComment()) {
			em.remove(recipeComment);
		}
		for ( RecipeIngredient recipeIngredient : deleteRecipe.getRecipeIngredient()) {
			em.remove(recipeIngredient);
		}
		for ( RecipeRating recipeRating : deleteRecipe.getRecipeRating()) {
			em.remove(recipeRating);
		}
		for ( RecipeImage recipeImage : deleteRecipe.getRecipeImage()) {
			em.remove(recipeImage);
		}
		if(deleteRecipe != null	) {
			
			em.remove(deleteRecipe);
		}
	
		return !em.contains(deleteRecipe);
	}

}
