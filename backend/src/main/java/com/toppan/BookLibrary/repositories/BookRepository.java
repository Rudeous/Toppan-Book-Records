package com.toppan.BookLibrary.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.toppan.BookLibrary.dto.Top3ReadBooksDto;
import com.toppan.BookLibrary.entities.Book;
public interface BookRepository extends JpaRepository<Book, Long> {
    @Query(nativeQuery = true, value = "SELECT book_name, ARRAY_AGG(CASE WHEN subquery.country_code = 'SG' THEN subquery.person_name ELSE NULL END ORDER BY subquery.rent_count DESC) AS top_3_persons FROM (SELECT b.name AS book_name, p.name AS person_name, COUNT(*) AS rent_count, ROW_NUMBER() OVER (PARTITION BY b.name ORDER BY COUNT(*) DESC) AS rent_rank, c.country_code FROM book_rents br JOIN people p ON br.person_id = p.id JOIN books b ON br.book_id = b.id JOIN country c ON p.country_id = c.id GROUP BY b.name, p.name, c.country_code) AS subquery WHERE rent_rank <= 3 GROUP BY book_name ORDER BY MAX(subquery.rent_count) DESC, book_name LIMIT 3")
    List<Top3ReadBooksDto> getTop3Books();

}
