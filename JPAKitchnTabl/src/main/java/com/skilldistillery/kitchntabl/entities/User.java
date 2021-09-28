package com.skilldistillery.kitchntabl.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private boolean enabled;
	private String role;
	private String email;

	@Column(name = "image_url")
	private String imageUrl;

	private String biography;

	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;

//	private List<User> user;

	@OneToMany(mappedBy = "user")
	private List<CookbookRating> cookbookRating;

	@OneToMany(mappedBy = "user")
	private List<RecipeRating> recipeRating;

	@OneToMany(mappedBy = "user")
	private List<RecipeImage> recipeImage;

	@OneToMany(mappedBy = "user")
	private List<RecipeComment> recipeComment;

	@OneToMany(mappedBy = "user")
	private List<Cookbook> cookbook;

	@OneToMany(mappedBy = "user")
	private List<Recipe> recipe;

///////Methods + Hash+ Equals + toString

	public User() {
		super();
	}

	public User(int id, String username, String password, boolean enabled, String role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageURL) {
		this.imageUrl = imageURL;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<RecipeComment> getRecipeComment() {
		return recipeComment;
	}

	public void setRecipeComment(List<RecipeComment> recipeComment) {
		this.recipeComment = recipeComment;
	}

	public List<CookbookRating> getCookbookRating() {
		return cookbookRating;
	}

	public void setCookbookRating(List<CookbookRating> cookbookRating) {
		this.cookbookRating = cookbookRating;
	}

	public List<RecipeRating> getRecipeRating() {
		return recipeRating;
	}

	public void setRecipeRating(List<RecipeRating> recipeRating) {
		this.recipeRating = recipeRating;
	}

	public List<RecipeImage> getRecipeImage() {
		return recipeImage;
	}

	public void setRecipeImage(List<RecipeImage> recipeImage) {
		this.recipeImage = recipeImage;
	}

	public List<Cookbook> getCookbook() {
		return cookbook;
	}

	public List<Recipe> getRecipe() {
		return recipe;
	}

	public void setRecipe(List<Recipe> recipe) {
		this.recipe = recipe;
	}

	public void setCookbook(List<Cookbook> cookbook) {
		this.cookbook = cookbook;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", email=" + email + ", imageUrl=" + imageUrl + ", biography=" + biography
				+ ", firstName=" + firstName + ", lastName=" + lastName + "]";
	}

}
