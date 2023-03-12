package com.toppan.BookLibrary.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toppan.BookLibrary.dto.Top3ReadBooksDto;
import com.toppan.BookLibrary.repositories.BookRepository;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;

    public List<Top3ReadBooksDto> getTop3PersonsByBook() {
        return bookRepository.getTop3Books();
    }
}