package com.skilldistillery.kitchntabl.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name ="recipe_rating")
public class RecipeRating {


	public RecipeRating(RecipeRatingId id, int rating, LocalDateTime ratingDate, String ratingComment) {
		super();
		this.id = id;
		this.rating = rating;
		this.ratingDate = ratingDate;
		this.ratingComment = ratingComment;
	}

	@EmbeddedId
	private RecipeRatingId id;
	
	private int rating;

	@Column(name = "rating_date")
	private LocalDateTime ratingDate;

	@Column(name = "rating_comment")
	private String ratingComment;
	
	
	// Don't map repeated composite key variable, ID class will handle that.
//	@Column(name = "user_id")
//	private int userId;
//	@Column(name = "recipe_id")
//	private int recipeId;
	
	

	
	
	public RecipeRating() {
	}

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
