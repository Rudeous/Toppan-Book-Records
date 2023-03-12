package com.toppan.BookLibrary.entities;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class BookRentId implements Serializable {
    private Long book;
    private Long person;
}
