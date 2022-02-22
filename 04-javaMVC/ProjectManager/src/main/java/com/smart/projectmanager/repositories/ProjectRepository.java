package com.smart.projectmanager.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.smart.projectmanager.models.Project;
import com.smart.projectmanager.models.User;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long>{
	
	List<Project> findAll();
	
	List<Project> findByUsersNotContaining(User u);
}
