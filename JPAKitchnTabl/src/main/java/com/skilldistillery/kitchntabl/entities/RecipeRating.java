package com.skilldistillery.kitchntabl.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "recipe_rating")
public class RecipeRating {

	@EmbeddedId
	private RecipeRatingId id;

	private int rating;

	@Column(name = "rating_date")
	@CreationTimestamp
	private LocalDateTime ratingDate;

	@Column(name = "rating_comment")
	private String ratingComment;

	@ManyToOne
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;

	@ManyToOne
	@JoinColumn(name = "recipe_id")
	@MapsId(value = "recipeId")
	private Recipe recipe;

	// Don't map repeated composite key variable, ID class will handle that.
//	@Column(name = "user_id")
//	private int userId;
//	@Column(name = "recipe_id")
//	private int recipeId;

	// no arg constructors and all constructor
	public RecipeRating(RecipeRatingId id, int rating, LocalDateTime ratingDate, String ratingComment) {
		super();
		this.id = id;
		this.rating = rating;
		this.ratingDate = ratingDate;
		this.ratingComment = ratingComment;
	}

	public RecipeRating() {
	}

	// getters and setters

	public RecipeRatingId getId() {
		return id;
	}

	public void setId(RecipeRatingId id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public LocalDateTime getRatingDate() {
		return ratingDate;
	}

	public void setRatingDate(LocalDateTime ratingDate) {
		this.ratingDate = ratingDate;
	}

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
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

	// hascode and equals
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
		RecipeRating other = (RecipeRating) obj;
		return Objects.equals(id, other.id);
	}

	// toString
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecipeRating [id=");
		builder.append(id);
		builder.append(", rating=");
		builder.append(rating);
		builder.append(", ratingDate=");
		builder.append(ratingDate);
		builder.append(", ratingComment=");
		builder.append(ratingComment);
		builder.append("]");
		return builder.toString();
	}

}
