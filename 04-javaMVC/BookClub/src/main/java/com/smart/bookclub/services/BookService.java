package com.smart.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.smart.bookclub.models.Book;
import com.smart.bookclub.repositories.BookRepository;

@Service
public class BookService {

	@Autowired
	private BookRepository bookRepo;

	public Book createBook(Book newBook, BindingResult result) {
		return bookRepo.save(newBook);
	}

	public List<Book> allBooks() {
		return bookRepo.findAll();
	}

	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}

	public Book updateBook(Long id, Book book) {
		
		Book updatedBook = bookRepo.findById(id).get();

		updatedBook.setTitle(book.getTitle());
		updatedBook.setAuthor(book.getAuthor());
		updatedBook.setThoughts(book.getThoughts());

		return bookRepo.save(book);
	}
}
