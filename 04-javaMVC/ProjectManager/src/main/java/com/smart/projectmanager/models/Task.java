package com.smart.projectmanager.models;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "tasks")
public class Task {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message = "Task ticket must be provided.")
	private String ticket;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="creator_id")
	private User creator;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="project_id")
	private Project projectTasks;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	
	public Task() {
		
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTicket() {
		return ticket;
	}


	public void setTicket(String ticket) {
		this.ticket = ticket;
	}


	public User getCreator() {
		return creator;
	}


	public void setCreator(User creator) {
		this.creator = creator;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}


	public Project getProjectTasks() {
		return projectTasks;
	}


	public void setProjectTasks(Project projectTasks) {
		this.projectTasks = projectTasks;
	}
	
	public String getFormattedCreatedAt() {
		Date date = this.getCreatedAt();
		String dateDisplay = new SimpleDateFormat("hh:mm aa MMMM d").format(date);
		return dateDisplay;
	}
	
	
	
}
