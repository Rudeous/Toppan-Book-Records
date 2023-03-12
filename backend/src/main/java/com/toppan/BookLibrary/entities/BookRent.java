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
@Table(name="book_rents")
@IdClass(BookRentId.class)
public class BookRent {
    
        @Id
        @ManyToOne
        @JoinColumn(name = "book_id", referencedColumnName = "id")
        private Book book;
    
        @Id
        @ManyToOne
        @JoinColumn(name = "person_id", referencedColumnName = "id")
        private Person person;
    
        @Column(name="created_at" , insertable = false, updatable = false)
        private Timestamp created_at;
    
        @Column(name="updated_at" , insertable = false, updatable = false)
        private Timestamp updated_at;
    
        // public Book getBook() {
        //     return book;
        // }
        // public Person getPerson() {
        //     return person;
        // }
        // public Timestamp getCreated_at() {
        //     return created_at;
        // }
        // public Timestamp getUpdated_at() {
        //     return updated_at;
        // }
}
