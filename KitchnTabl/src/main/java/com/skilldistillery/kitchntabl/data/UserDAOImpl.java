package com.skilldistillery.kitchntabl.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.Category;
import com.skilldistillery.kitchntabl.entities.Cookbook;
import com.skilldistillery.kitchntabl.entities.CookbookRating;
import com.skilldistillery.kitchntabl.entities.Recipe;
import com.skilldistillery.kitchntabl.entities.RecipeComment;
import com.skilldistillery.kitchntabl.entities.RecipeCommentId;
import com.skilldistillery.kitchntabl.entities.RecipeImage;
import com.skilldistillery.kitchntabl.entities.RecipeImageId;
import com.skilldistillery.kitchntabl.entities.RecipeRating;
import com.skilldistillery.kitchntabl.entities.RecipeRatingId;
import com.skilldistillery.kitchntabl.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User findByUsername(String username) {
		String jpql = "SELECT u FROM User u WHERE u.username = :uname";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("uname", username)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("No user found with username " + username);
		}
		return user;
	}

	
	
	
	// Recipe Methods
	
	@Override
	public User findRecipe(int recipeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findRecipeByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createRecipe(Recipe recipe) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateRecipe(Recipe recipe) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteRecipe(int recipeId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public User deleteRecipeRating(CookbookRating cookbookRating) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createRecipeComment(RecipeComment recipeComment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteRecipeComment(RecipeComment recipeComment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteRecipeComment(RecipeCommentId recipeCommentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createRecipeRating(RecipeRating recipeRating) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateRecipeRating(RecipeRating recipeRating) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteRecipeRating(RecipeRatingId recipeRatingId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createRecipeImage(RecipeImage recipeImage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateRecipeImageg(RecipeImage recipeImage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteRecipeImage(RecipeImageId recipeImageId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	// Category Methods
	

	@Override
	public User findCategoryByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createCategory(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateCategory(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteCategory(int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}
	

	
	// Cook Methods
	
	@Override
	public User findCookbookByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createCookbook(Cookbook cookbook) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateCookbook(Cookbook cookbook) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteCookbook(int cookbookId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createCookbookRating(CookbookRating cookbookRating) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateCookbookRating(CookbookRating cookbookRating) {
		// TODO Auto-generated method stub
		return null;
	}

}
