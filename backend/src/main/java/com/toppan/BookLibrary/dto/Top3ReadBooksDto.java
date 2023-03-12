package com.toppan.BookLibrary.dto;

import java.util.List;

public class Top3ReadBooksDto {
    private String bookName;
    private String authorName;
    private List<String> top3Persons;

    public Top3ReadBooksDto(String bookName, String authorName, List<String> top3Persons) {
        this.bookName = bookName;
        this.authorName = authorName;
        this.top3Persons = top3Persons;
    }

    public String getBookName() {
        return bookName;
    }
    public String getAuthorName() {
        return authorName;
    }
    public List<String> getTop3Persons() {
        return top3Persons;
    }
}
