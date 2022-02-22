package com.smart.projectmanager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.smart.projectmanager.models.Project;
import com.smart.projectmanager.models.User;
import com.smart.projectmanager.repositories.ProjectRepository;

@Service
public class ProjectService {

	@Autowired
	private ProjectRepository projectRepo;
	
	public Project createProject(Project newProject, BindingResult result) {
		return projectRepo.save(newProject);
	}
	
	public List<Project> allProjects(){
		return projectRepo.findAll();
	}
	
	public Project findProject(Long id) {
		Optional<Project> optionalProject = projectRepo.findById(id);
		if (optionalProject.isPresent()) {
			return optionalProject.get();
		} else {
			return null;
		}
		
		
	}
	
	public List<Project> findProjectsUserNotIn(User u){
		return this.projectRepo.findByUsersNotContaining(u);
	}

	public void deleteProject(Long id) {
		projectRepo.deleteById(id);
	}
	
	public Project updateProject(Long id, Project project) {
		
		Project updatedProject = projectRepo.findById(id).get();
		
		updatedProject.setTitle(project.getTitle());
		updatedProject.setDescription(project.getDescription());
		updatedProject.setDueDate(project.getDueDate());
		
		return projectRepo.save(updatedProject);
	}
	
}
