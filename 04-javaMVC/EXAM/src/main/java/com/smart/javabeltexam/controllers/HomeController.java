package com.smart.javabeltexam.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smart.javabeltexam.models.LoginUser;
import com.smart.javabeltexam.models.Show;
import com.smart.javabeltexam.models.User;
import com.smart.javabeltexam.services.ShowService;
import com.smart.javabeltexam.services.UserService;



@Controller
public class HomeController {

	// Add once service is implemented:
	@Autowired
	private UserService userServ;
	
	@Autowired
	private ShowService showServ;

	@GetMapping("/")
	public String index(Model model, @ModelAttribute("newUser") User newUser,
			@ModelAttribute("newLogin") User newLogin) {

		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		// TO-DO Later -- call a register method in the service
		userServ.register(newUser, result);
		// to do some extra validations and create a new user!

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("loggedInUserID", newUser.getId());
		return "redirect:/shows";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		User user = userServ.login(newLogin, result);

		System.out.println(user);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("loggedInUserID", user.getId());
		return "redirect:/shows";
	}

	@RequestMapping("/shows")
	public String dashboard(HttpSession session, Model model) {
		
		Long loggedInUserID = (Long) session.getAttribute("loggedInUserID");
		
		if (loggedInUserID == null) {
			
			return "redirect:/";
		}
		
		User loggedInUser = userServ.findOneUser(loggedInUserID);
		
		model.addAttribute("user", loggedInUser);
		
		List<Show> shows = showServ.allShows();
		
		model.addAttribute("shows", shows);
		
		return "dashboard.jsp";

	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	

}
