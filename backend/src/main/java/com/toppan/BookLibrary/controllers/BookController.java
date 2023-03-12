package com.toppan.BookLibrary.controllers;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.toppan.BookLibrary.dto.Top3ReadBooksDto;
import com.toppan.BookLibrary.services.BookService;

@RestController
public class BookController {
    
    @Autowired
    private BookService BookService;

    @RequestMapping("/getTop3ReadBooks")
    public String top3persons(@RequestParam(value="country_code", defaultValue="SG") String countryCode) throws JsonProcessingException {
        HashMap<String, Object> map = new HashMap<>();
        List<Top3ReadBooksDto> result = BookService.getTop3PersonsByBook();
        for (Top3ReadBooksDto dto : result) {
            map.put("name", dto.getBookName());
            map.put("author", dto.getAuthorName());
            map.put("borrower", dto.getTop3Persons());
        }
        // convert hashmap to json
        String json = new ObjectMapper().writeValueAsString(map);
        return json;
    }
}
