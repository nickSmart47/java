package com.smart.productsandcategories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.smart.productsandcategories.models.Category;
import com.smart.productsandcategories.models.Product;

public interface ProductRepository extends CrudRepository<Product, Long> {
	
	List<Product> findAll();
	
	List<Product> findByCategoriesNotContaining(Category c);

}
