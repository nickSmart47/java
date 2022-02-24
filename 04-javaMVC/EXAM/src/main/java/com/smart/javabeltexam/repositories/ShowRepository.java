package com.smart.javabeltexam.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.smart.javabeltexam.models.Show;
import com.smart.javabeltexam.models.User;


@Repository
public interface ShowRepository extends CrudRepository<Show, Long>{

	List<Show> findAll();
	
	Optional<Show> findByTitle(String title);
}
