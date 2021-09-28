package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.User;

public interface UserDAO {

	User findByUsername(String username);
	User updateUser(int id, User user);
	User createUser(User user);
	boolean destroyUser(int id);
	//get username by username and password
}
