package com.skilldistillery.kitchntabl.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "recipe_image")
public class RecipeImage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "image_url")
	private String imageUrl;

//  Only do in IDs for composite keys///
//	@Column(name = "user_id")
//	private int userId;
//	@Column(name = "recipe_id")
//	private int recipeId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	public RecipeImage() {
		super();
	}

	public RecipeImage(int id, String imageUrl, User user) {
		super();
		this.id = id;
		this.imageUrl = imageUrl;
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecipeImage [id=");
		builder.append(id);
		builder.append(", imageUrl=");
		builder.append(imageUrl);
		builder.append(", user=");
		builder.append(user);
		builder.append("]");
		return builder.toString();
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
		return id == other.id && Objects.equals(imageUrl, other.imageUrl) && Objects.equals(user, other.user);
	}

}
