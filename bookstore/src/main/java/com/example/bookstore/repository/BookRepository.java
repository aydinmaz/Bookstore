package com.example.bookstore.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.bookstore.model.Book;
@Repository
public interface BookRepository extends CrudRepository<Book, String> {

}
