package com.smart.hellohuman;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloHumanController {

//	@RequestMapping("/")
//	public String index() {
//		return "Hello Human";
//	}
//	
	@RequestMapping("/")
	public String name(@RequestParam(value = "name", required = false) String firstName,
			@RequestParam(value = "last_name", required = false) String lastName,
			@RequestParam(value = "times", required = false) Integer times) {
		if (times != null) {
			String message = "";
			if (lastName == null) {
				lastName = "";
			}
			else if (firstName == null) {
				firstName = "";
			}
			for (int i = 0; i<times; i++) {
				message += String.format("Hello %s %s ", firstName, lastName) ;
			}
			return message;
		}

		else if (firstName != null && lastName == null) {
			System.out.println(times);
			return "Hello " + firstName;
		} else if (firstName != null && lastName != null) {

			return String.format("Hello %s %s", firstName, lastName);
		} else {
			return "Hello Human";
		}
	}
}
