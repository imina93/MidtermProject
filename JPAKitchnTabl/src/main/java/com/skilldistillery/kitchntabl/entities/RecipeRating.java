package com.skilldistillery.kitchntabl.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RecipeRating {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rating;

	@Column(name = "rating_date")
	private LocalDateTime ratingDate;

	@Column(name = "rating_comment")
	private String ratingComment;

	public RecipeRating() {
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
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecipeRating [rating=");
		builder.append(rating);
		builder.append(", ratingDate=");
		builder.append(ratingDate);
		builder.append(", ratingComment=");
		builder.append(ratingComment);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		return Objects.hash(rating);
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
		return rating == other.rating;
	}

}
