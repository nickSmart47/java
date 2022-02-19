package com.smart.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.smart.bookclub.models.Book;
import com.smart.bookclub.services.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookServ;

	@GetMapping("/books/new")
	public String newBook(Model model, @ModelAttribute("newBook") Book newBook, HttpSession session) {
		System.out.println(session.getAttribute("loggedInUserID"));
		model.addAttribute("userId", session.getAttribute("loggedInUserID"));
		return "newbook.jsp";
	}

	@PostMapping("/books/new")
	public String createBook(Model model, @Valid @ModelAttribute("newBook") Book newBook, BindingResult result,
			HttpSession session) {

//		System.out.println(session.getAttribute("loggedInUserId"));

		if (result.hasErrors()) {
			return "newbook.jsp";
		}
		bookServ.createBook(newBook, result);
		return "redirect:/home";
	}

	@GetMapping("/books/{id}")
	public String viewBook(Model model, HttpSession session, @PathVariable("id") Long id) {

		Book book = bookServ.findBook(id);

		model.addAttribute("book", book);

//		System.out.println(session.getAttribute("loggedInUserID"));
//		System.out.println(book.getUser().getId());
		return "viewbook.jsp";
	}

	@GetMapping("/books/{id}/edit")
	public String editBook(Model model, HttpSession session, @PathVariable("id") Long id) {
		Book book = bookServ.findBook(id);

		model.addAttribute("book", book);

		return "editbook.jsp";
	}

	@PutMapping("/books/{id}")
	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "editbook.jsp";
		} else {
//			System.out.println(book.getId());
			bookServ.updateBook(book.getId(), book);
			return "redirect:/home";
		}
	}
}
