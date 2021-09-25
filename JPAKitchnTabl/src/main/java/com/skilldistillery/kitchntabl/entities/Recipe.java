package com.skilldistillery.kitchntabl.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Recipe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private String instructions;
	private int calories;
	private String image;
	private String description;
	
	@Column(name="chef_rating")
	private int chefRating;
	
	private String category;
	
	@Column(name="serving_size")
	private String servingSize;
	
	@Column(name="cook_time_in_minutes")
	private int cookTime;
	
	@Column(name="prep_time_in_minutes")
	private int prepTime;
	
	
	@Column(name="user_id")
	private int userId;
	
	@OneToMany(mappedBy = "recipe")
	private List<RecipeIngredient> recipeIngredient;
	
	@OneToMany(mappedBy = "recipe")
	private List<RecipeRating> recipeRating;
	
	
	
	
	
	public Recipe() {
		super();
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getInstructions() {
		return instructions;
	}


	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}


	public int getCalories() {
		return calories;
	}


	public void setCalories(int calories) {
		this.calories = calories;
	}


	public int getChefRating() {
		return chefRating;
	}


	public void setChefRating(int chefRating) {
		this.chefRating = chefRating;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getServingSize() {
		return servingSize;
	}


	public void setServingSize(String servingSize) {
		this.servingSize = servingSize;
	}


	public int getCookTime() {
		return cookTime;
	}


	public void setCookTime(int cookTime) {
		this.cookTime = cookTime;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Recipe other = (Recipe) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "Recipe [id=" + id + ", name=" + name + ", instructions=" + instructions + ", calories=" + calories
				+ ", chefRating=" + chefRating + ", category=" + category + ", servingSize=" + servingSize
				+ ", cookTime=" + cookTime + ", userId=" + userId + ", image=" + image + ", description=" + description
				+ "]";
	}
	
	
	
	

}
