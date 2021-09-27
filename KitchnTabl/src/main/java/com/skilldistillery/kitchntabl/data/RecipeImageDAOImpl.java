package com.skilldistillery.kitchntabl.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.RecipeImage;
import com.skilldistillery.kitchntabl.entities.RecipeImageId;

@Service
@Transactional
public class RecipeImageDAOImpl implements RecipeImageDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public RecipeImage createRecipeImage(RecipeImage recipeImage) {
		em.persist(recipeImage);
		em.flush();
		em.close();
		return recipeImage;
	}

	@Override
	public RecipeImage updateRecipeImage(RecipeImage recipeImage) {
		RecipeImage updatedRecipeImage = em.find(RecipeImage.class, recipeImage);
		updatedRecipeImage.setImageUrl(recipeImage.getImageUrl());
		em.flush();
		return updatedRecipeImage;
	}

	@Override
	public boolean deleteRecipeImage(RecipeImageId recipeImageId) {
		RecipeImage deletedRecipeImage = em.find(RecipeImage.class, recipeImageId);
		if (deletedRecipeImage != null) {
			em.remove(deletedRecipeImage);
		}
		return !em.contains(deletedRecipeImage);
	}
}
