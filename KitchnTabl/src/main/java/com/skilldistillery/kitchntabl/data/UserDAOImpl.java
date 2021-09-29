package com.skilldistillery.kitchntabl.data;

import java.util.List;

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
		user.setRole("user");
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
		dbUser.setImageUrl(user.getImageUrl());
		dbUser.setFirstName(user.getFirstName());
		dbUser.setLastName(user.getLastName());
		dbUser.setBiography(user.getBiography());

		em.flush();
		em.close();
		return dbUser;
	}

	@Override
	public boolean destroyUser(int uid) {
		boolean successfullyRemovedUser = false;
		User user = em.find(User.class, uid);
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

	@Override
	public User findById(int uid) {
		return em.find(User.class, uid);
	}
	@Override
	public List<User> findAll() {
		String jpql = "SELECT u FROM User u";
		List<User> user = em.createQuery(jpql, User.class).getResultList();
		return user;
	}
	
	@Override
	public User logUserIn(User user) {
		String jpql = "SELECT u FROM User u WHERE u.username = :u AND u.password = :p";
		 try {
			user = em.createQuery(jpql, User.class)
					.setParameter("u", user.getUsername())
					.setParameter("p", user.getPassword()).getSingleResult();
			System.out.println(user);
		} catch (Exception e) {
			System.err.println("Invalid User Name And/Or Password.");
			user = null;
		}

		return user;
	}
}
