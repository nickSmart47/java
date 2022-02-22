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
public class ProductController {

	@Autowired
	private ProductService productServ;
	
	@Autowired
	private CategoryService categoryServ;

	@GetMapping("/products/new")
	public String newProduct(Model model, @ModelAttribute("newProduct") Product newProduct) {
		return "newproduct.jsp";
	}

	@PostMapping("/products/new")
	public String createProduct(Model model, @Valid @ModelAttribute("newProduct") Product newProduct,
			BindingResult result, HttpSession session) {

		if (result.hasErrors()) {
			return "newproduct.jsp";
		}
		Product newlyCreatedProduct = productServ.createProduct(newProduct, result);

		Long newProductId = newlyCreatedProduct.getId();

		return String.format("redirect:/products/%s", newProductId);
	}

	@GetMapping("/products/{id}")
	public String viewProduct(Model model, @PathVariable("id") Long id, @ModelAttribute("category") Category category) {

		Product product = productServ.findProduct(id);
		
		List<Category> categories = categoryServ.allCategories();
		model.addAttribute("categories", categories);

		
		model.addAttribute("product", product);
		
		List<Product> nonMemberCategories = this.productServ.findCategoriesProductNotIn(category);
		model.addAttribute("nonMemberCategories", nonMemberCategories);
		
		return "viewproduct.jsp";

	}

	@PostMapping("/products/{id}")
	public String addCategory(Model model, @PathVariable("id") Long id,
			@RequestParam("category") Long categoryId) {

		productServ.addCategoryToProduct(id, categoryId);
		
		return String.format("redirect:/products/%s", id);

	}
}
