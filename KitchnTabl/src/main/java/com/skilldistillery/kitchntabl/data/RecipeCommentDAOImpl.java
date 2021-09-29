package com.skilldistillery.kitchntabl.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.RecipeComment;
import com.skilldistillery.kitchntabl.entities.RecipeCommentId;

@Service
@Transactional
public class RecipeCommentDAOImpl implements RecipeCommentDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public RecipeComment createRecipeComment(RecipeComment recipeComment) {
		em.persist(recipeComment);
		em.flush();
		em.close();
		return recipeComment;
	}

	@Override
	public RecipeComment updateRecipeComment(RecipeComment recipeComment) {
		RecipeComment updatedRecipeComment = em.find(RecipeComment.class, recipeComment);
		em.flush();
		return updatedRecipeComment;
	}

	@Override
	public boolean deleteRecipeComment(RecipeCommentId recipeCommentId) {
		RecipeComment deletedRecipeComment = em.find(RecipeComment.class, recipeCommentId);
		if (deletedRecipeComment != null) {
			em.remove(deletedRecipeComment);
		}
		return !em.contains(deletedRecipeComment);
	}
}
