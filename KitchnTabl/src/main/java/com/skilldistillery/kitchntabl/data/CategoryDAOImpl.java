package com.skilldistillery.kitchntabl.data;

import java.sql.PreparedStatement;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.Category;

@Service
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Category> findCategoryByKeyword(String keyword) {

		String jpql = "SELECT c FROM Category c WHERE name LIKE :searchName OR description LIKE :searchDescription";
		//Need the Percent signs to do a wildcard search.
		keyword = "%" + keyword +  "%";
		List<Category> results = em.createQuery(jpql, Category.class).setParameter("searchName", keyword)
				.setParameter("searchDescription", keyword).getResultList();
		return results;
	}

	@Override
	public Category createCategory(Category category) {
		Category newCategory = new Category();

		newCategory.setId(0);
		newCategory.setName(" ");
		newCategory.setDescription(" ");

		em.persist(newCategory);
		em.flush();
		return newCategory;
	}

	@Override
	public Category updateCategory(int id, Category category) {
		Category updatedCategory = em.find(Category.class, id);

		updatedCategory.setDescription(category.getDescription());
		updatedCategory.setName(category.getName());
		updatedCategory.setId(category.getId());

		em.flush();
		return updatedCategory;
	}

	@Override
	public boolean deleteCategory(int categoryId) {
		Category deletedCategory = em.find(Category.class, categoryId);
		if (deletedCategory != null) {
			em.remove(deletedCategory);
		}
		return !em.contains(deletedCategory);
	}

}
