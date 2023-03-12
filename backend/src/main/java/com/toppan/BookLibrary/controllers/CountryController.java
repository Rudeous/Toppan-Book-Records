package com.toppan.BookLibrary.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.toppan.BookLibrary.entities.Country;
import com.toppan.BookLibrary.services.CountryService;



@RestController
public class CountryController {
    @Autowired
    private CountryService CountryService;

    @GetMapping("/getRandomCountry")
    public ResponseEntity<Country> getRandomCountry() {
        Country country = CountryService.getRandomCountry();
        if (country == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(country, HttpStatus.OK);
    }
}
