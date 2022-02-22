package com.smart.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.smart.productsandcategories.models.Category;
import com.smart.productsandcategories.models.Product;
import com.smart.productsandcategories.repositories.CategoryRepository;
import com.smart.productsandcategories.repositories.ProductRepository;

@Service
public class CategoryService {

	@Autowired
	private ProductRepository productRepo;

	@Autowired
	private CategoryRepository categoryRepo;
	
	public Category createCategory(Category newCategory, BindingResult result) {
		return categoryRepo.save(newCategory);
	}

	public List<Category> allCategories() {
		return categoryRepo.findAll();
	}

	public Category findCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepo.findById(id);
		if (optionalCategory.isPresent()) {
			return optionalCategory.get();
		} else {
			return null;
		}
	}
	
	public Category addProductToCategory(Long categoryId, Long productId) {

		Category updatedCategory = categoryRepo.findById(categoryId).get();

		Product product = productRepo.findById(productId).get();

		List<Product> newProductsList = updatedCategory.getProducts();
		newProductsList.add(product);
		updatedCategory.setProducts(newProductsList);

		return categoryRepo.save(updatedCategory);
	}
	
	public List<Category> findNonMemberCategories(Product p){
		return this.categoryRepo.findByProductsNotContaining(p);
	}
}
