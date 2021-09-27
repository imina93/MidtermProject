package com.skilldistillery.kitchntabl.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.Cookbook;


@Service
@Transactional
public class CookBookDAOImpl implements CookBookDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Cookbook> findCookbookByKeyword(String keyword) {
		String jpql = "SELECT c FROM Cookbook c WHERE name LIKE :searchName OR description LIKE :searchDescription";
		//Need the Percent signs to do a wildcard search.
		keyword = "%" + keyword +  "%";
		List<Cookbook> results = em.createQuery(jpql, Cookbook.class).setParameter("searchName", keyword)
				.setParameter("searchDescription", keyword).getResultList();
		return results;
	}

	// TODO: Edit the null values
	@Override
	public Cookbook createCookbook(Cookbook cookbook) {
		Cookbook newCookbook = new Cookbook();
		newCookbook.setCookbookRating(null);
		newCookbook.setDescription(" ");
		newCookbook.setImage(" ");
		newCookbook.setCreatedDate(null);
		newCookbook.setLastUpdate(null);
		newCookbook.setName(" ");
		newCookbook.setId(0);
		newCookbook.setUser(null);
		return newCookbook;
	}

	@Override
	public Cookbook updateCookbook(int id, Cookbook cookbook) {
		Cookbook updatedCookbook = em.find(Cookbook.class, id);
		
		updatedCookbook.setCookbookRating(cookbook.getCookbookRating());
		updatedCookbook.setDescription(cookbook.getDescription());
		updatedCookbook.setImage(cookbook.getImage());
		updatedCookbook.setCreatedDate(cookbook.getCreatedDate());
		updatedCookbook.setLastUpdate(cookbook.getLastUpdate());
		updatedCookbook.setName(cookbook.getName());
		updatedCookbook.setId(cookbook.getId());
		updatedCookbook.setUser(cookbook.getUser());
		return updatedCookbook;
	}

	@Override
	public boolean deleteCookbook(int cookbookId) {
		Cookbook deletedCookbook = em.find(Cookbook.class, cookbookId);
		if (deletedCookbook != null) {
			em.remove(deletedCookbook);
		}
		return !em.contains(deletedCookbook);
	}
	

}
