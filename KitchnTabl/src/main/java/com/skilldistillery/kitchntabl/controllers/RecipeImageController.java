package com.skilldistillery.kitchntabl.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.kitchntabl.data.RecipeImageDAO;
import com.skilldistillery.kitchntabl.entities.RecipeImage;

@Controller
public class RecipeImageController {

	@Autowired
	private RecipeImageDAO dao;
	
	// change searchpage.do to whatever my test jsp is named. 
	@RequestMapping(path = "createRecipeImageForm.do", method = RequestMethod.POST)
	public String createRecipeImageForm(Model model, RecipeImage recipeImage) {
		return "addRecipeImage";
	}

	@RequestMapping(path = "createRecipeImage.do", method = RequestMethod.POST)
	public String createReseller(Model model, RecipeImage recipeImage) {
		model.addAttribute("recipeImage", dao.createRecipeImage(recipeImage));
		return "addWorked";
	}

//	// update reseller
//	@RequestMapping(path = "updateResellerSlot.do", method = RequestMethod.POST)
//	public String updateResellerSlot(@RequestParam Integer rid, Model model) {
//		Reseller updatedReseller = dao.findById(rid);
//		model.addAttribute("reseller", updatedReseller);
//		return "updateReseller";
//	}
//
//	// update reseller
//	@RequestMapping(path = "updateReseller.do", method = RequestMethod.POST)
//	public String updateReseller(Integer rid, Model model, Reseller reseller) {
//		model.addAttribute("reseller", dao.updateReseller(rid, reseller));
//		return "updateSuccess";
//	}
//
//	@RequestMapping(path = "deleteReseller.do")
//	public String deleteReseller(Integer rid, Model model) {
//		model.addAttribute("reseller", dao.destroy(rid));
//		return "deleted";
//	}
}
