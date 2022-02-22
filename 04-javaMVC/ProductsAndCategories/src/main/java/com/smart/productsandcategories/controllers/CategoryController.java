package com.smart.productsandcategories.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smart.productsandcategories.models.Category;
import com.smart.productsandcategories.models.Product;
import com.smart.productsandcategories.services.CategoryService;
import com.smart.productsandcategories.services.ProductService;

@Controller
public class CategoryController {

	@Autowired
	private ProductService productServ;
	
	@Autowired
	private CategoryService categoryServ;
	
	@GetMapping("/categories/new")
	public String newCategory(Model model, @ModelAttribute("newCategory") Category newCategory) {
		return "newcategory.jsp";
	}

	@PostMapping("/categories/new")
	public String createCategory(Model model, @Valid @ModelAttribute("newCategory") Category newCategory,
			BindingResult result, HttpSession session) {

		if (result.hasErrors()) {
			return "newcategory.jsp";
		}
		Category newlyCreatedCategory = categoryServ.createCategory(newCategory, result);

		Long newCategoryId = newlyCreatedCategory.getId();

		return String.format("redirect:/categories/%s", newCategoryId);
	}

	@GetMapping("/categories/{id}")
	public String viewCategory(Model model, @PathVariable("id") Long id, @ModelAttribute("product") Product product) {

		Category category = categoryServ.findCategory(id);

		model.addAttribute("category", category);
		
		List<Product> products = productServ.allProducts();
		
		model.addAttribute("products", products);
		
		List<Product> productsNotInCategory = productServ.findProductsNotInCategory(category);
		
		model.addAttribute("productsNotInCategory",productsNotInCategory);
		
		return "viewcategory.jsp";

	}
	
	@PostMapping("/categories/{id}")
	public String addProduct(Model model, @PathVariable("id") Long categoryId,
			@RequestParam("product") Long productId) {

		categoryServ.addProductToCategory(categoryId, productId);
		
		return String.format("redirect:/categories/%s", categoryId);

	}
	
	
}
