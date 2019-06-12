package com.example.bookstore.service;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.BooksView;
import com.example.bookstore.repository.BooksViewRepository;

@Service
public class BooksViewService {

	@Autowired
	private BooksViewRepository bookViewRepo;
	@Autowired
	private BookService bookServ;

	public List<BooksView> findAllView() throws IOException {
		List<BooksView> allViews = (List<BooksView>) bookViewRepo.findAll();
		if (allViews.isEmpty()) {
			boolean saved = savebookViewsfromExcel(allViews);
			if (saved)
				allViews = (List<BooksView>) bookViewRepo.findAll();
		}
		return (allViews.isEmpty() ? null : allViews);
	}

	public void saveBooksView(String userEmail, String bookId) throws IOException {
		List<BooksView> allViews = findAllView();
		BooksView bookView = new BooksView();
		bookView.setEmail(userEmail);
		bookView.setBookId(bookId);
		boolean exist = false;
		if (allViews != null) {
			for (BooksView bkv : allViews) {
				if (bkv.getBookId().equals(bookId) && bkv.getEmail().equals(userEmail)) {
					exist = true;
					break;
				}
			}
		}
		if (!exist) {
			bookViewRepo.save(bookView);
		}
	}

	public boolean savebookViewsfromExcel(List<BooksView> allViews) throws IOException {
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
				BooksView booksview = new BooksView();
				booksview.setBookId(rec.get(0).toUpperCase());
				booksview.setEmail(rec.get(1).replace("\"", ""));
				allViews.add(booksview);
			});
			bookViewRepo.saveAll(allViews);
			return true;
		}
		return false;
	}

	public List<List<String>> readfromExcel(List<List<String>> records) throws FileNotFoundException, IOException {

		try (BufferedReader br = new BufferedReader(new FileReader("books-views.csv"))) {
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

	public List<Book> findSimliarity(String bookId) throws IOException {
		List<BooksView> allViews = findAllView();
		if (allViews==null)
			return null;
		Set<String> userset = new HashSet<>();

		// for make users distinct
		for (BooksView v : allViews) {
			userset.add(v.getEmail());
		}
		List<Book> allbooks = bookServ.findAllBooks();

		// for make possible of using getters
		List<String> users = new ArrayList<>();
		users.addAll(userset);
		Vector<Vector<Integer>> matrix = new Vector<Vector<Integer>>();
		// creating matrix with all zero value

		for (int i = 0; i < allbooks.size(); i++) {
			Vector<Integer> vec = new Vector<>();
			for (int j = 0; j < users.size(); j++) {
				vec.add(0);
			}
			matrix.add(vec);
		}

		// setting matrix with correct values
		for (BooksView b : allViews) {
			for (int i = 0; i < allbooks.size(); i++) {
				if (b.getBookId().equals(allbooks.get(i).getId())) {
					for (int j = 0; j < users.size(); j++) {
						if (b.getEmail().equals(users.get(j))) {
							matrix.get(i).set(j, 1);
						}
					}
				}
			}
		}
		int indx_book = 0;
		for (int i = 0; i < allbooks.size(); i++) {
			if (allbooks.get(i).getId().equals(bookId)) {
				indx_book = i;
				break;
			}
		}

		double a = 0, b = 0, c = 0;
		Vector<Integer> vec1, vec2 = new Vector<>();
		Vector<Double> vec_result = new Vector<>();
		vec1 = matrix.get(indx_book);
		vec_result.setSize(allbooks.size());
		vec_result.set(indx_book, 0.0);
		for (int i = 0; i < allbooks.size(); i++) {
			if (i != indx_book) {
				vec2 = matrix.get(i);
				for (int j = 0; j < users.size(); j++) {
					a += vec1.get(j) * vec2.get(j);
					b += vec1.get(j) * vec1.get(j);
					c += vec2.get(j) * vec2.get(j);
				}
				if (a == 0.0 || b == 0.0) {
					vec_result.set(i, 0.0);
				} else {
					vec_result.set(i, a / (b * c));
				}

			}

		}

		for (int i = 0; i < allbooks.size(); i++) {
			allbooks.get(i).setImportance(vec_result.get(i));
		}
		List<Book> sortedbooks = allbooks.stream().sorted(Comparator.comparing(Book::getImportance).reversed())
				.collect(Collectors.toList());
		return sortedbooks;
	}

}
