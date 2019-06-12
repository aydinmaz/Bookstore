package com.example.bookstore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.User;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.BooksViewService;

@Controller
public class BookController {

	@Autowired
	BookService bookserve;

	@Autowired
	BooksViewService booksViewServe;

	@GetMapping("/task/login")
	public String login(Model model) {
		model.addAttribute("userForm", new User());
		return "login";
	}

	@PostMapping("/task/login")
	public String login(@ModelAttribute("userForm") User userForm, Model model) throws IOException {

		List<String> errorList = new ArrayList<>();
		errorList = new Utils().errorValidation(userForm, errorList);
		if (!errorList.isEmpty()) {
			model.addAttribute("error", errorList);
			return "/login";
		}
		List<Book> books = bookserve.findAllBooks();
		if (books==null) {
			model.addAttribute("error", "seems book couldnt get read from DB");	
		}
		model.addAttribute("user", userForm.getEmail());
		model.addAttribute("books", books);
		return "/books";
	}

	@PostMapping("/bookdetail")
	public String detailsofBooks(@RequestParam("userEmail") String userEmail,
								 @RequestParam("bookId") String bookId,
			Model model) throws IOException {
		if (!userEmail.equals(null) && !bookId.equals(null) && !userEmail.isEmpty() && !bookId.isEmpty()) {	
			List<Book> Similarbooks = booksViewServe.findSimliarity(bookId);
			if (Similarbooks == null) {
				model.addAttribute("error", "the csv file couldnt saved");
				return "/error";
			}
			model.addAttribute("books", Similarbooks);
			Book book = bookserve.findOneBook(bookId);
			if (book == null) {
				model.addAttribute("error", "Book is not found from DB");
				return "/error";
			}
			model.addAttribute("book", book);
		}	
		booksViewServe.saveBooksView(userEmail, bookId);	
		model.addAttribute("user", userEmail);
		return "/bookDetail";
	}

}
