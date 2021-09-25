package com.skilldistillery.kitchntabl.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Cookbook {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToMany(mappedBy = "cookbook")
	private List<CookbookRating> cookbookRating;

	private String name;

	@Column(name = "user_id")
	private int userId;

	private String description;

	private String image;

	@Column(name = "created_date")
	private LocalDateTime createdDate;

	@Column(name = "last_update")
	private LocalDateTime lastUpdate;

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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public List<CookbookRating> getCookbookRating() {
		return cookbookRating;
	}

	public void setCookbookRating(List<CookbookRating> cookbookRating) {
		this.cookbookRating = cookbookRating;
	}

	@Override
	public String toString() {
		return "Cookbook [id=" + id + ", name=" + name + ", userId=" + userId + ", description=" + description
				+ ", image=" + image + ", createdDate=" + createdDate + ", lastUpdate=" + lastUpdate + "]";
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
		Cookbook other = (Cookbook) obj;
		return id == other.id;
	}

}
