package com.skilldistillery.kitchntabl.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CookbookRatingId implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "cookbook_id")
	private int cookbookId;

	@Column(name = "user_id")
	private int userId;

	public CookbookRatingId() {
		super();
	}

	public CookbookRatingId(int cookbookId, int userId) {
		super();
		this.cookbookId = cookbookId;
		this.userId = userId;
	}

	public int getCookbookId() {
		return cookbookId;
	}

	public void setCookbookId(int cookbookId) {
		this.cookbookId = cookbookId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cookbookId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CookbookRatingId other = (CookbookRatingId) obj;
		return cookbookId == other.cookbookId && userId == other.userId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CookbookRatingId [cookbookId=");
		builder.append(cookbookId);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}

}
