package com.skilldistillery.kitchntabl.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "recipe_image")
public class RecipeImage {

	@EmbeddedId
	private RecipeImageId id;

	@Column(name = "image_url")
	private String imageUrl;

//  Only do in IDs for composite keys///
//	@Column(name = "user_id")
//	private int userId;
//	@Column(name = "recipe_id")
//	private int recipeId;

	@ManyToOne // (fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;

	@ManyToOne // (fetch = FetchType.LAZY)
	@JoinColumn(name = "recipe_id")
	@MapsId(value = "recipeId")
	private Recipe recipe;

	public RecipeImage() {
		super();
	}

	public RecipeImage(RecipeImageId id, String imageUrl, User user) {
		super();
		this.id = id;
		this.imageUrl = imageUrl;
		this.user = user;
	}

	public RecipeImageId getId() {
		return id;
	}

	public void setId(RecipeImageId id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, imageUrl, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecipeImage other = (RecipeImage) obj;
		return Objects.equals(id, other.id) && Objects.equals(imageUrl, other.imageUrl)
				&& Objects.equals(user, other.user);
	}

	@Override
	public String toString() {
		return "RecipeImage [id=" + id + ", imageUrl=" + imageUrl + ", user=" + user + "]";
	}

}
