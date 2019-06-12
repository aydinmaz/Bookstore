package com.example.bookstore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.bookstore.model.Book;
import com.example.bookstore.service.BookService;

@RestController
public class BookRestcontroller {

	@Autowired
	BookService bookserve;

	@GetMapping("/task/books")
	public List<Book> getallbooks() throws IOException {
		List<Book> books=new ArrayList<>();
		bookserve.savebooksfromExcel(books); 
		books = bookserve.findAllBooks();
		return books;
	}

}
