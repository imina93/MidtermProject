package com.skilldistillery.kitchntabl.data;

import com.skilldistillery.kitchntabl.entities.User;

public interface UserDAO {
	
	User findByUsername(String username);

}
