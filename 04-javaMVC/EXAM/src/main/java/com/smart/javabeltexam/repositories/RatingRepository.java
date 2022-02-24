package com.smart.javabeltexam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.smart.javabeltexam.models.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {
	
	List<Rating> findAll();

}
