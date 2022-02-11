package com.smart.firstspring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
//2. Importing dependencies
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
// 1. Annotation
@Controller
public class FirstspringApplication {

	public static void main(String[] args) {
		SpringApplication.run(FirstspringApplication.class, args);
	}

	// 1.Annotation
	@RequestMapping("/")
	// 3. Method that maps to the request route above
	public String hello() { // 3
		return "Hello World";
	}

	@RequestMapping("/whatup")
	public String whatup() {
		return "Whatup dude, you did it!";
	}

	@RequestMapping("/demo")
	public String demo() {
		return "demo.jsp";
	}

}
