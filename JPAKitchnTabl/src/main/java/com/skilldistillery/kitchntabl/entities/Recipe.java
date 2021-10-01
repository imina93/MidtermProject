package com.skilldistillery.kitchntabl.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "recipe")
public class Recipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	private String instructions;
	private Integer calories;
	private String image;
	private String description;

	@Column(name = "chef_rating")
	private Integer chefRating;

	private String category;

	@Column(name = "serving_size")
	private String servingSize;

	@Column(name = "cook_time_in_minutes")
	private Integer cookTime;

	@Column(name = "prep_time_in_minutes")
	private Integer prepTime;

	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	@OneToMany(mappedBy = "recipe")
	private List<RecipeIngredient> recipeIngredient;

	@OneToMany(mappedBy = "recipe")
	private List<RecipeRating> recipeRating;

	@OneToMany(mappedBy = "recipe")
	private List<RecipeComment> recipeComment;

	@OneToMany(mappedBy = "recipe")
	private List<RecipeImage> recipeImage;

//No arg constructor	
	public Recipe() {
		super();
	}

	public Integer getPrepTime() {
		return prepTime;
	}

	public void setPrepTime(Integer prepTime) {
		this.prepTime = prepTime;
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

	public Integer getCalories() {
		return calories;
	}

	public void setCalories(Integer calories) {
		this.calories = calories;
	}

	public Integer getChefRating() {
		return chefRating;
	}

	public void setChefRating(Integer chefRating) {
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

	public Integer getCookTime() {
		return cookTime;
	}

	public void setCookTime(Integer cookTime) {
		this.cookTime = cookTime;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<RecipeImage> getRecipeImage() {
		return recipeImage;
	}

	public void setRecipeImage(List<RecipeImage> recipeImage) {
		this.recipeImage = recipeImage;
	}

	public List<RecipeIngredient> getRecipeIngredient() {
		return recipeIngredient;
	}

	public void setRecipeIngredient(List<RecipeIngredient> recipeIngredient) {
		this.recipeIngredient = recipeIngredient;
	}

	public List<RecipeRating> getRecipeRating() {
		return recipeRating;
	}

	public void setRecipeRating(List<RecipeRating> recipeRating) {
		this.recipeRating = recipeRating;
	}

	public List<RecipeComment> getRecipeComment() {
		return recipeComment;
	}

	public void setRecipeComment(List<RecipeComment> recipeComment) {
		this.recipeComment = recipeComment;
	}

	// Hashcod and Equals
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
				+ ", image=" + image + ", description=" + description + ", chefRating=" + chefRating + ", category="
				+ category + ", servingSize=" + servingSize + ", cookTime=" + cookTime + ", prepTime=" + prepTime
				+ ", user=" + user + "]";
	}

}
