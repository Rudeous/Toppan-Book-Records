package com.toppan.BookLibrary.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.persistence.OneToMany;

@Entity
@Table(name="country")
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    @Column(name = "country_code", nullable = false)
    private String countryCode;

    @OneToMany(mappedBy = "country", fetch = FetchType.LAZY)
    private List<Person> people; // list of people from a country

    // getters
    public Long getId() {
        return id;
    }
    public String getFullName() {
        return fullName;
    }
    public String getCountryCode() {
        return countryCode;
    }

}
