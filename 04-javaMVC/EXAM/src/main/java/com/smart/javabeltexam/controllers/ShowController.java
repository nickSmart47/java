package com.smart.javabeltexam.controllers;

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

import com.smart.javabeltexam.models.Rating;
import com.smart.javabeltexam.models.Show;
import com.smart.javabeltexam.models.User;
import com.smart.javabeltexam.services.ShowService;
import com.smart.javabeltexam.services.UserService;

@Controller
public class ShowController {

	@Autowired
	private UserService userServ;

	@Autowired
	private ShowService showServ;

	@GetMapping("/shows/new")
	public String newShow(@ModelAttribute("newShow") Show newShow, HttpSession session) {

		Long loggedInUserID = (Long) session.getAttribute("loggedInUserID");
		if (loggedInUserID == null) {
			return "redirect:/";
		}

		return "newShow.jsp";

	}

	@PostMapping("/shows/new")
	public String createNewShow(@Valid @ModelAttribute("newShow") Show newShow, BindingResult result,
			HttpSession session) {

		User poster = userServ.findOneUser((Long) session.getAttribute("loggedInUserID"));
		showServ.createShow(newShow, result, poster);

		if (result.hasErrors()) {
			return "newShow.jsp";
		} else {
			return "redirect:/shows";
		}
	}

	@GetMapping("/shows/{id}")
	public String viewShow(@PathVariable("id") Long showId, Model model, HttpSession session,
			@ModelAttribute("newRating") Rating newRating, BindingResult result) {

		Long loggedInUserID = (Long) session.getAttribute("loggedInUserID");

		if (loggedInUserID == null) {

			return "redirect:/";
		}

		model.addAttribute("loggedInUserID", loggedInUserID);

		Show show = showServ.findShow(showId);
		model.addAttribute("show", show);
		
		List<Rating> showRatings = show.getShowRatings();
		model.addAttribute("showRatings", showRatings);

		return "viewShow.jsp";
	}

	@GetMapping("/shows/{id}/edit")
	public String editShow(@PathVariable("id") Long showId, Model model, HttpSession session) {

		
		Show show = showServ.findShow(showId);

		if (show.getPoster().getId() != (Long) session.getAttribute("loggedInUserID")) {
			System.out.println(show.getPoster().getId());
			System.out.println(session.getAttribute("loggedInUserID"));
			return "redirect:/shows";
		}
		else {
			model.addAttribute("editShow", show);
			
			return "editShow.jsp";
		}
	}

	@PutMapping("/shows/{id}/edit")
	public String updateShow(@PathVariable("id") Long showId, Model model, HttpSession session,
			@Valid @ModelAttribute("editShow") Show updatedShow, BindingResult result) {

		showServ.updateShow(showId, updatedShow, result);

		if (result.hasErrors()) {
			return "editShow.jsp";
		} else {
			return "redirect:/shows";
		}
	}

	@DeleteMapping("/shows/{id}")
	public String deleteShow(@PathVariable("id") Long showId) {
		System.out.println(String.format("deleting id of %s", showId));
		
		
		
		showServ.deleteShow(showId);

		return "redirect:/shows";
	}

	@PostMapping("/shows/{id}/rate")
	public String rateShow(@PathVariable("id") Long showId, HttpSession session,
			@Valid @ModelAttribute("newRating") Rating newRating, BindingResult result, Model model) {

		Long userId = (Long) session.getAttribute("loggedInUserID");
		User ratingUser = userServ.findOneUser(userId);

		Show showToBeRated = showServ.findShow(showId);

		showServ.rateShow(newRating, ratingUser, showToBeRated, result);

		if (result.hasErrors()) {
			Show show = showServ.findShow(showId);
			model.addAttribute("show", show);
			return "viewShow.jsp";
		} else {
			return "redirect:/shows/" + showId;
		}
	}

}
