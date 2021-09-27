package com.skilldistillery.kitchntabl.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RecipeImageId implements Serializable {
	
	private static final long serialVersionUID = 1L;

	
	@Column(name="recipe_id")
	private int recipeId;

	@Column(name="user_id")
	private int userId;

	
	//Constructors and Methods
	public RecipeImageId(int recipeId, int userId) {
		super();
		this.recipeId = recipeId;
		this.userId = userId;
	}

	public RecipeImageId() {
		super();
	}

	
	//---getters and setters
	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	//--Hashcode and equals
	@Override
	public int hashCode() {
		return Objects.hash(recipeId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecipeImageId other = (RecipeImageId) obj;
		return recipeId == other.recipeId && userId == other.userId;
	}

	//ToString------
	@Override
	public String toString() {
		return "RecipeImageId [recipeId=" + recipeId + ", userId=" + userId + "]";
	}
	
	
	
}
