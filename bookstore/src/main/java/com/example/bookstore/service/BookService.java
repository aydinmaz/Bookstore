package com.example.bookstore.service;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bookstore.model.Book;
import com.example.bookstore.repository.BookRepository;

@Service
public class BookService {

	@Autowired
	private BookRepository bookrepo;

	public Book findOneBook(String id) {

		Optional<Book> bookOptional = bookrepo.findById(id);

		Book book = new Book();
		if (bookOptional.isPresent()) {
			book = bookOptional.get();
			return book;
		}
		return null;
	}

	public List<Book> findAllBooks() throws IOException {
		List<Book> books = new ArrayList<>();
		books = (List<Book>) bookrepo.findAll();
		if (books.isEmpty()) {
			boolean saved = savebooksfromExcel(books);
			if (saved)
				{books = (List<Book>) bookrepo.findAll();
				return books;}
			return null;
		}
		return books;
	}

	public boolean savebooksfromExcel(List<Book> books) throws IOException {
		List<List<String>> records = new ArrayList<>();
		records = readfromExcel(records);
		if (records != null) {
			/*
			 * for (int i = 1; i < records.size(); i++) { Book book = new Book();
			 * List<String> bookCSV = records.get(i);
			 * book.setId(bookCSV.get(0).toUpperCase());
			 * book.setName(bookCSV.get(1).replace("\"", ""));
			 * book.setDetails(bookCSV.get(2).replace("\"", ""));
			 * book.setPrice(bookCSV.get(3)); book.setImage(bookCSV.get(4));
			 * books.add(book); }
			 */
			records.stream().skip(1).forEach(rec -> {
				Book book = new Book();
				book.setId(rec.get(0).toUpperCase());
				book.setName(rec.get(1).replace("\"", ""));
				book.setDetails(rec.get(2).replace("\"", ""));
				book.setPrice(rec.get(3));
				book.setImage(rec.get(4));
				books.add(book);
			});
			bookrepo.saveAll(books);
			return true;
		}
		return false;
	}

	public List<List<String>> readfromExcel(List<List<String>> records) throws FileNotFoundException, IOException {

		try (BufferedReader br = new BufferedReader(new FileReader("books.csv"))) {
			String line;
			while ((line = br.readLine()) != null) {
				String[] values = line.split(";");
				records.add(Arrays.asList(values));
			}
		} catch (FileNotFoundException ex) {
			System.out.println("File not found.");
			return null;
		}
		return records;
	}
}
