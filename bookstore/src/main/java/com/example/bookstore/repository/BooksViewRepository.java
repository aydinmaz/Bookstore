package com.example.bookstore.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.bookstore.model.BooksView;

public interface BooksViewRepository extends CrudRepository<BooksView, Integer>{

}
