package com.skilldistillery.kitchntabl.entities;

import java.time.LocalDateTime;
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
@Table(name="recipe_comment")
public class RecipeComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "comment_text")
	private String commentText;

	@Column(name = "comment_date")
	private LocalDateTime commentDate;
	
	@Column(name = "recipe_id")
	private int recipeId;
	@Column(name = "user_id")
	private int userId;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "recipe_id")
    private Recipe recipe;
	
	public RecipeComment() {
		super();
	}
	
	

	public RecipeComment(int id, String commentText, LocalDateTime commentDate, int recipeId, int userId, User user,
			Recipe recipe) {
		super();
		this.id = id;
		this.commentText = commentText;
		this.commentDate = commentDate;
		this.recipeId = recipeId;
		this.userId = userId;
		this.user = user;
		this.recipe = recipe;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecipeComment [id=");
		builder.append(id);
		builder.append(", commentText=");
		builder.append(commentText);
		builder.append(", commentDate=");
		builder.append(commentDate);
		builder.append(", recipeId=");
		builder.append(recipeId);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", user=");
		builder.append(user);
		builder.append(", recipe=");
		builder.append(recipe);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		return Objects.hash(commentDate, commentText, id, recipe, recipeId, user, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecipeComment other = (RecipeComment) obj;
		return Objects.equals(commentDate, other.commentDate) && Objects.equals(commentText, other.commentText)
				&& id == other.id && Objects.equals(recipe, other.recipe) && recipeId == other.recipeId
				&& Objects.equals(user, other.user) && userId == other.userId;
	}

}
