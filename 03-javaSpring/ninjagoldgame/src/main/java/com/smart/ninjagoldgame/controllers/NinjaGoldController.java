package com.smart.ninjagoldgame.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class NinjaGoldController {

	@RequestMapping("/")
	public String index() {
		return "redirect:/gold";
	}

	@RequestMapping("/gold")
	public String goldGame(HttpSession session, RedirectAttributes redirectAttributes) {
		if (session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
			session.setAttribute("messages", new ArrayList<String>());
			Integer gold = (Integer) session.getAttribute("gold");
		} else {
			Integer gold = (Integer) session.getAttribute("gold");
		}

		System.out.println(session.getAttribute("messages"));
		return "index.jsp";
	}

	@PostMapping("/gold/find")
	public String findGold(HttpSession session, RedirectAttributes redirectAttributes,
			@RequestParam(name = "farm", required = false) String farm,
			@RequestParam(name = "cave", required = false) String cave,
			@RequestParam(name = "house", required = false) String house,
			@RequestParam(name = "casino", required = false) String casino,
			@RequestParam(name = "spa", required = false) String spa) {

		Random rand = new Random();

		Integer gold = (Integer) session.getAttribute("gold");

		if (farm != null) {
			int min = 10;
			int max = 20;
			int randomInt = (int) Math.floor(Math.random() * (max - min + 1) + min);
			Date date = new Date();
			String dateDisplay = new SimpleDateFormat("EEEE, MMMM d, y, h:mm aa").format(date);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			String message = String.format("You entered a farm and earned %s gold. (%s)", randomInt, dateDisplay);
			ArrayList<String> newMessages = new ArrayList<String>();
			newMessages = (ArrayList<String>) session.getAttribute("messages");
			newMessages.add(0, message);
			session.setAttribute("messages", newMessages);

		} else if (spa != null) {
			int min = -5;
			int max = -20;
			int randomInt = (int) Math.floor(Math.random() * (max - min + 1) + min);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			Date date = new Date();
			String dateDisplay = new SimpleDateFormat("EEEE, MMMM d, y, h:mm aa").format(date);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			randomInt = Math.abs(randomInt);
			String message = String.format("You entered a spa and lost %s gold. (%s)", randomInt, dateDisplay);
			ArrayList<String> newMessages = new ArrayList<String>();
			newMessages = (ArrayList<String>) session.getAttribute("messages");
			newMessages.add(0, message);
			session.setAttribute("messages", newMessages);
			
		} else if (cave != null) {
			int min = 5;
			int max = 10;
			int randomInt = (int) Math.floor(Math.random() * (max - min + 1) + min);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			Date date = new Date();
			String dateDisplay = new SimpleDateFormat("EEEE, MMMM d, y, h:mm aa").format(date);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			String message = String.format("You entered a cave and earned %s gold. (%s)", randomInt, dateDisplay);
			ArrayList<String> newMessages = new ArrayList<String>();
			newMessages = (ArrayList<String>) session.getAttribute("messages");
			newMessages.add(0, message);
			session.setAttribute("messages", newMessages);
//			System.out.println(cave);
		} else if (house != null) {
			int min = 2;
			int max = 5;
			int randomInt = (int) Math.floor(Math.random() * (max - min + 1) + min);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			Date date = new Date();
			String dateDisplay = new SimpleDateFormat("EEEE, MMMM d, y, h:mm aa").format(date);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			String message = String.format("You entered a house and earned %s gold. (%s)", randomInt, dateDisplay);
			ArrayList<String> newMessages = new ArrayList<String>();
			newMessages = (ArrayList<String>) session.getAttribute("messages");
			newMessages.add(0, message);
			session.setAttribute("messages", newMessages);
//			System.out.println(house);
		} else if (casino != null) {
			int min = -50;
			int max = 50;
			int randomInt = (int) Math.floor(Math.random() * (max - min + 1) + min);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			Date date = new Date();
			String dateDisplay = new SimpleDateFormat("EEEE, MMMM d, y, h:mm aa").format(date);
			session.setAttribute("gold", (Integer) session.getAttribute("gold") + randomInt);
			if (randomInt > 0) {
				String earnedOrLost = "earned";
				String message = String.format("You entered a cave and %s %s gold. (%s)", earnedOrLost, randomInt,
						dateDisplay);
				ArrayList<String> newMessages = new ArrayList<String>();
				newMessages = (ArrayList<String>) session.getAttribute("messages");
				newMessages.add(0, message);
				session.setAttribute("messages", newMessages);
			} else {
				String earnedOrLost = "lost";
				randomInt = Math.abs(randomInt);
				String message = String.format("You entered a cave and %s %s gold. Ouch! (%s)", earnedOrLost, randomInt,
						dateDisplay);
				ArrayList<String> newMessages = new ArrayList<String>();
				newMessages = (ArrayList<String>) session.getAttribute("messages");
				newMessages.add(0, message);
				session.setAttribute("messages", newMessages);
			}

//			System.out.println(casino);
		}

		return "redirect:/gold";
	}

	@PostMapping("/gold/reset")
	public String resetGold(HttpSession session) {
		session.invalidate();
		return "redirect:/gold";
	}
}
