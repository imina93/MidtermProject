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
	
	
//	@Column(name="user_id")
//	private int userId;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany(mappedBy = "recipe")
	private List<RecipeIngredient> recipeIngredient;
	
	@OneToMany(mappedBy = "recipe")
	private List<RecipeRating> recipeRating;
	
	@OneToMany(mappedBy = "recipe")
	private List<RecipeComment> recipeComment;
	
	
	
	public int getPrepTime() {
		return prepTime;
	}


	public void setPrepTime(int prepTime) {
		this.prepTime = prepTime;
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
		StringBuilder builder = new StringBuilder();
		builder.append("Recipe [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", instructions=");
		builder.append(instructions);
		builder.append(", calories=");
		builder.append(calories);
		builder.append(", image=");
		builder.append(image);
		builder.append(", description=");
		builder.append(description);
		builder.append(", chefRating=");
		builder.append(chefRating);
		builder.append(", category=");
		builder.append(category);
		builder.append(", servingSize=");
		builder.append(servingSize);
		builder.append(", cookTime=");
		builder.append(cookTime);
		builder.append(", prepTime=");
		builder.append(prepTime);
		builder.append(", user=");
		builder.append(user);
		builder.append(", recipeIngredient=");
		builder.append(recipeIngredient);
		builder.append(", recipeRating=");
		builder.append(recipeRating);
		builder.append(", recipeComment=");
		builder.append(recipeComment);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	

}
