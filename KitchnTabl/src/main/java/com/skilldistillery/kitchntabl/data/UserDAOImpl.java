package com.skilldistillery.kitchntabl.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.kitchntabl.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		em.close();
		return user;
	}

	@Override
	public User updateUser(int id, User user) {
		User dbUser = em.find(User.class, id);
		dbUser.setEmail(user.getEmail());
		dbUser.setUsername(user.getUsername());
		dbUser.setPassword(user.getPassword());
		dbUser.setImageURL(user.getImageURL());
		dbUser.setFirstName(user.getFirstName());
		dbUser.setLastName(user.getLastName());
		dbUser.setBiography(user.getBiography());

		em.flush();
		em.close();
		return dbUser;
	}

	@Override
	public boolean destroyUser(int id) {
		boolean successfullyRemovedUser = false;
		User user = em.find(User.class, id);
		if (user != null) {
			em.remove(user); // performs the delete on the managed entity
			successfullyRemovedUser = !em.contains(user);
		}
		em.close();
		return successfullyRemovedUser;
	}

	@Override
	public User findByUsername(String username) {
		String jpql = "SELECT u FROM User u WHERE u.username = :uname";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class).setParameter("uname", username).getSingleResult();
		} catch (Exception e) {
			System.err.println("No user found with username " + username);
		}
		return user;
	}

}
