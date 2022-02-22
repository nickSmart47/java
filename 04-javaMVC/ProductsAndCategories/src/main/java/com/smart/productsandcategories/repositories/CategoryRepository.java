package com.smart.productsandcategories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.smart.productsandcategories.models.Category;
import com.smart.productsandcategories.models.Product;

public interface CategoryRepository extends CrudRepository<Category, Long> {
	
	List<Category> findAll();
	
	List<Category> findByProductsNotContaining(Product p);
}
