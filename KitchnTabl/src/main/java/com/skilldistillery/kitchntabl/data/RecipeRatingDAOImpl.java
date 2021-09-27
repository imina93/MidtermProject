package com.skilldistillery.kitchntabl.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.RecipeRating;


@Service
@Transactional
public class RecipeRatingDAOImpl implements RecipeRatingDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<RecipeRating> findRecipeRatingByKeyword(String keyword) {

		String jpql = "SELECT c FROM RecipeRating c WHERE name LIKE :searchRatingComment";
		//Need the Percent signs to do a wildcard search.
		keyword = "%" + keyword +  "%";
		List<RecipeRating> results = em.createQuery(jpql, RecipeRating.class).setParameter("searchRatingComment", keyword)
				.getResultList();
		return results;
	}

//	@Override
//	public RecipeRating createRecipeRating(RecipeRating recipeRating) {
//		RecipeRating newRecipeRating = new RecipeRating();
//
//		newRecipeRating.setId(0);
//		newRecipeRating.setRating(0);
//		newRecipeRating.setRatingDate(" ");
//		newRecipeRating.setRatingComment(" ");
//
//		em.persist(newRecipeRating);
//		em.flush();
//		return newRecipeRating;
//	}

	@Override
	public RecipeRating updateRecipeRating(int id, RecipeRating recipeRating) {
		RecipeRating updatedRecipeRating = em.find(RecipeRating.class, id);

		
		updatedRecipeRating.setRatingComment(recipeRating.getRatingComment());
		updatedRecipeRating.setRatingDate(recipeRating.getRatingDate());
		updatedRecipeRating.setRating(recipeRating.getRating());
		updatedRecipeRating.setId(recipeRating.getId());

		em.flush();
		return updatedRecipeRating;
	}

	@Override
	public boolean deleteRecipeRating(int RecipeRatingId) {
		RecipeRating deletedRecipeRating = em.find(RecipeRating.class, RecipeRatingId);
		if (deletedRecipeRating != null) {
			em.remove(deletedRecipeRating);
		}
		return !em.contains(deletedRecipeRating);
	}



}
