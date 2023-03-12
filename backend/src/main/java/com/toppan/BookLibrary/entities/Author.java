package com.toppan.BookLibrary.entities;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="authors")
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @Column(name="created_at" , insertable = false, updatable = false)
    private Timestamp created_at;
    private Timestamp updated_at;
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "author_book", 
        joinColumns = @JoinColumn(name = "author_id"), 
        inverseJoinColumns = @JoinColumn(name = "book_id"))
    private List<Book> books;

    public Long getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public Timestamp getCreated_at() {
        return created_at;
    }
    public Timestamp getUpdated_at() {
        return updated_at;
    }
    public List<Book> getBooks() {
        return books;
    }
}
