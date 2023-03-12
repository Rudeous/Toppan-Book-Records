package com.toppan.BookLibrary.entities;


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="author_books")
@IdClass(AuthorBookId.class)
public class AuthorBook {

    @Id
    @ManyToOne
    @JoinColumn(name = "author_id", referencedColumnName = "id")
    private Author author;

    @Id
    @ManyToOne
    @JoinColumn(name = "book_id", referencedColumnName = "id")
    private Book book;

    @Column(name="created_at" , insertable = false, updatable = false)
    private Timestamp created_at;

    @Column(name="updated_at" , insertable = false, updatable = false)
    private Timestamp updated_at;

    

}
