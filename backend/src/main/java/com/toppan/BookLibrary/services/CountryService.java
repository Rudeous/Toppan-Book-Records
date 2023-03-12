package com.toppan.BookLibrary.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toppan.BookLibrary.entities.Country;
import com.toppan.BookLibrary.repositories.CountryRepository;

// import java.sql.ResultSet;
// import java.util.HashMap;

@Service
public class CountryService {
    @Autowired
    private CountryRepository countryRepository;


    public Country getRandomCountry() {
        return countryRepository.getRandomCountry();
    }

}
