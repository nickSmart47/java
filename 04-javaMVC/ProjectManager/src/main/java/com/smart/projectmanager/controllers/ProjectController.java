package com.smart.projectmanager.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smart.projectmanager.models.Project;
import com.smart.projectmanager.models.Task;
import com.smart.projectmanager.models.User;
import com.smart.projectmanager.services.ProjectService;
import com.smart.projectmanager.services.UserService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectServ;

	@Autowired
	private UserService userServ;

	@GetMapping("/projects/new")
	public String createProjectForm(@ModelAttribute("newProject") Project newProject, BindingResult result, Model model,
			HttpSession session) {

		Long leaderId = (Long) session.getAttribute("loggedInUserID");

		model.addAttribute("leaderId", leaderId);
		return "newproject.jsp";
	}

	@PostMapping("/projects/new")
	public String createProject(@Valid @ModelAttribute("newProject") Project newProject, BindingResult result,
			HttpSession session) {

		if (result.hasErrors()) {
			return "newproject.jsp";
		}

		// Use session to get logged in user and set them as project leader of new
		// project
		Long leaderId = (Long) session.getAttribute("loggedInUserID");
		User newProjectLeader = userServ.findOneUser(leaderId);
		newProject.setLeader(newProjectLeader);

		// add the new project to the new project leader's list of projects
		List<Project> newProjectLeaderProjects = newProjectLeader.getProjects();
		newProjectLeaderProjects.add(newProject);
		newProjectLeader.setProjects(newProjectLeaderProjects);

		projectServ.createProject(newProject, result);

		return "redirect:/dashboard";
	}

	@PutMapping("/projects/join/{id}")
	public String joinProject(@PathVariable("id") Long projectId, HttpSession session) {
		Long userId = (Long) session.getAttribute("loggedInUserID");

		userServ.addProject(projectId, userId);

		return "redirect:/dashboard";
	}

	@PutMapping("/projects/leave/{id}")
	public String leaveProject(@PathVariable("id") Long projectId, HttpSession session) {
		Long userId = (Long) session.getAttribute("loggedInUserID");

		userServ.removeProject(projectId, userId);

		return "redirect:/dashboard";
	}

	@GetMapping("/projects/{id}")
	public String viewProject(@PathVariable("id") Long projectId, HttpSession session, Model model) {

		Project project = projectServ.findProject(projectId);

		model.addAttribute("project", project);

		return "viewproject.jsp";

	}

	@DeleteMapping("/projects/{id}")
	public String deleteProject(@PathVariable("id") Long projectId, HttpSession session, Model model) {

		projectServ.deleteProject(projectId);

		return "redirect:/dashboard";
	}

	@GetMapping("/projects/edit/{id}")
	public String editProject(@PathVariable("id") Long projectId, HttpSession session, Model model) {

		Project project = projectServ.findProject(projectId);

		model.addAttribute("project", project);
		
		Long loggedInUserID = (Long) session.getAttribute("loggedInUserID");
		
		User user = userServ.findOneUser(loggedInUserID);
		
		if (user == project.getLeader()) {
			return "editproject.jsp";
			
		}
		else {
			return "redirect:/dashboard";
		}

	}

	@PutMapping("/projects/edit/{id}")
	public String updateProject(@PathVariable("id") Long projectId, HttpSession session, Model model,
			@Valid @ModelAttribute("project") Project updatedProject, BindingResult result) {
		if (result.hasErrors()) {
			return "editproject.jsp";
		} else {
			projectServ.updateProject(projectId, updatedProject);
			return "redirect:/dashboard";
		}

	}
	
	@GetMapping("/projects/tasks/{id}")
	public String getProjectTasks(@PathVariable("id") Long projectId, Model model) {
		
		Project project = projectServ.findProject(projectId);

		model.addAttribute("project", project);
		
		List<Task> tasks = project.getTasks();
		
		model.addAttribute("tasks",tasks);
	
		return "projectTasks.jsp";
	}
	
	
	@PostMapping("/projects/tasks/{id}")
	public String addTaskToProject(@PathVariable("id") Long projectId, Model model, @RequestParam("task") String ticket, HttpSession session) {
		
		Project project = projectServ.findProject(projectId);
		
		User creator = userServ.findOneUser((Long) session.getAttribute("loggedInUserID"));
		
		projectServ.createTask(ticket, creator, project);
		
		return String.format("redirect:/projects/tasks/%s", projectId);
	}
}
