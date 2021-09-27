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
@Table(name="recipe_comment")
public class RecipeComment {
	
	@EmbeddedId
	private RecipeCommentId id;
	
	@Column(name = "comment_text")
	private String commentText;

	@Column(name = "comment_date")
	@CreationTimestamp
	private LocalDateTime commentDate;

	@ManyToOne  //(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
	@MapsId(value = "userId") 
    private User user;

	@ManyToOne  //(fetch = FetchType.LAZY)
    @JoinColumn(name = "recipe_id")
	@MapsId(value = "recipeId") 
    private Recipe recipe;
	
	//Constructors
	public RecipeComment() {
		super();
	}

	public RecipeComment(RecipeCommentId id, String commentText, LocalDateTime commentDate, User user, Recipe recipe) {
		super();
		this.id = id;
		this.commentText = commentText;
		this.commentDate = commentDate;
		this.user = user;
		this.recipe = recipe;
	}

	//getters and settesr
	public RecipeCommentId getId() {
		return id;
	}

	public void setId(RecipeCommentId id) {
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
	
	//hashcode and equals

	@Override
	public int hashCode() {
		return Objects.hash(commentDate, commentText, id, recipe, user);
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
				&& Objects.equals(id, other.id) && Objects.equals(recipe, other.recipe)
				&& Objects.equals(user, other.user);
	}

	//tostring
	@Override
	public String toString() {
		return "RecipeComment [id=" + id + ", commentText=" + commentText + ", commentDate=" + commentDate + ", user="
				+ user + ", recipe=" + recipe + "]";
	}

	
	
	
}