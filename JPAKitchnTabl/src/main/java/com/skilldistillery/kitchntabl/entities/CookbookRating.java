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
@Table(name = "cookbook_rating")
public class CookbookRating {

	@EmbeddedId
	private CookbookRatingId id;

	private int rating;

	@Column(name = "rating_date")
	@CreationTimestamp
	private LocalDateTime ratingDate;

	@Column(name = "rating_comment")
	private String ratingComment;

	@ManyToOne
	@JoinColumn(name = "cookbook_id")
	@MapsId(value = "cookbookId")
	private Cookbook cookbook;

	@ManyToOne
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;

	public CookbookRating() {
		super();
	}

	public CookbookRating(CookbookRatingId id, int rating, LocalDateTime ratingDate, String ratingComment) {
		super();
		this.id = id;
		this.rating = rating;
		this.ratingDate = ratingDate;
		this.ratingComment = ratingComment;
	}

	public CookbookRatingId getId() {
		return id;
	}

	public void setId(CookbookRatingId id) {
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

	public Cookbook getCookbook() {
		return cookbook;
	}

	public void setCookbook(Cookbook cookbook) {
		this.cookbook = cookbook;
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
		CookbookRating other = (CookbookRating) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CookbookRating [id=");
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
