package com.smart.omikujiforms.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OmikujiController {

	@RequestMapping("/omikuji")
	public String omikujiForm(HttpSession session) {
		return "index.jsp";
	}
	
	@RequestMapping("/omikuji/show")
	public String showOmikuji(HttpSession session,Model model) {
		
		Integer number = (Integer) session.getAttribute("number");
		String city = (String) session.getAttribute("city");
		String person = (String) session.getAttribute("person");
		String profession = (String) session.getAttribute("profession");
		String livingThing = (String) session.getAttribute("livingThing");
		String somethingNice = (String) session.getAttribute("somethingNice");
		
		model.addAttribute("number", number);
		model.addAttribute("city", city);
		model.addAttribute("profession", profession);
		model.addAttribute("person", person);
		model.addAttribute("livingThing", livingThing);
		model.addAttribute("somethingNice", somethingNice);
		
		
		return "omikuji.jsp";
	}
	

	@RequestMapping(value ="/omikuji/send", method=RequestMethod.POST)
	public String sendOmikuji(
			HttpSession session,
			@RequestParam(value="number") Integer number,
			@RequestParam(value="city") String city,
			@RequestParam(value="person") String person,
			@RequestParam(value="profession") String profession,
			@RequestParam(value="livingThing") String livingThing,
			@RequestParam(value="somethingNice") String somethingNice
			) {
		session.setAttribute("number", number);
		session.setAttribute("city", city);
		session.setAttribute("person", person);
		session.setAttribute("profession", profession);
		session.setAttribute("livingThing", livingThing);
		session.setAttribute("somethingNice", somethingNice);
		
//		System.out.println(session.getAttribute("number"));
		return "redirect:/omikuji/show";
	}
}
