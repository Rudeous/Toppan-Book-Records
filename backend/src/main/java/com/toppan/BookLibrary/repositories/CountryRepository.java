package com.toppan.BookLibrary.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.toppan.BookLibrary.entities.Country;

public interface CountryRepository extends JpaRepository<Country, Long> {

    @Query(nativeQuery = true, value = "SELECT * FROM country ORDER BY random() LIMIT 1;")
    Country getRandomCountry();


}
