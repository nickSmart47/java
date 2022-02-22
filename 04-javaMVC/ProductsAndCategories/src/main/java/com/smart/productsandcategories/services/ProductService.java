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
public class ProductService {

	@Autowired
	private ProductRepository productRepo;

	@Autowired
	private CategoryRepository categoryRepo;

	public Product createProduct(Product newProduct, BindingResult result) {
		return productRepo.save(newProduct);
	}

	public List<Product> allProducts() {
		return productRepo.findAll();
	}

	public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepo.findById(id);
		if (optionalProduct.isPresent()) {
			return optionalProduct.get();
		} else {
			return null;
		}
	}

	public Product addCategoryToProduct(Long productId, Long categoryId) {

		Product updatedProduct = productRepo.findById(productId).get();

		Category category = categoryRepo.findById(categoryId).get();

		List<Category> newCategoriesList = updatedProduct.getCategories();
		newCategoriesList.add(category);
		updatedProduct.setCategories(newCategoriesList);

		return productRepo.save(updatedProduct);
	}

	public void deleteProduct(Long id) {
		Product productToDelete = productRepo.findById(id).get();

		productRepo.delete(productToDelete);
	}
	
	public List<Product> findProductsNotInCategory(Category c){
		return this.productRepo.findByCategoriesNotContaining(c);
	}
}
