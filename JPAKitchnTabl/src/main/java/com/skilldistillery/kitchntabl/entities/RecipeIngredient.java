package com.skilldistillery.kitchntabl.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "recipe_ingredient")
public class RecipeIngredient {

	@EmbeddedId
	private RecipeIngredientId id;
	
	private String amount;
	private String preparation;
	
	@ManyToOne
	@JoinColumn(name = "recipe_id")
	@MapsId(value = "recipeId")
	private Recipe recipe;
	
	@ManyToOne
	@JoinColumn(name = "ingredient_id")
	@MapsId(value = "ingredientId")
	private Ingredient ingredient;
	
	public RecipeIngredient() {
		super();
	}

	public RecipeIngredient(String amount, String preparation) {
		super();
		this.amount = amount;
		this.preparation = preparation;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getPreparation() {
		return preparation;
	}

	public void setPreparation(String preparation) {
		this.preparation = preparation;
	}

	@Override
	public int hashCode() {
		return Objects.hash(amount, preparation);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecipeIngredient other = (RecipeIngredient) obj;
		return Objects.equals(amount, other.amount) && Objects.equals(preparation, other.preparation);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecipeIngredient [amount=");
		builder.append(amount);
		builder.append(", preparation=");
		builder.append(preparation);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
