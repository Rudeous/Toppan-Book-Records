package com.toppan.BookLibrary.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.toppan.BookLibrary.dto.Top3ReadBooksDto;
import com.toppan.BookLibrary.entities.Book;
public interface BookRepository extends JpaRepository<Book, Long> {
    @Query(nativeQuery = true, value = "SELECT subquery.book_name, ARRAY_AGG(CASE WHEN subquery.country_code = 'SG' THEN subquery.person_name ELSE NULL END ORDER BY subquery.rent_count DESC) AS top_3_persons, ARRAY_AGG(DISTINCT subquery.author_name) AS all_authors FROM (SELECT b.name AS book_name, p.name AS person_name, a.name AS author_name,COUNT(*) AS rent_count,ROW_NUMBER() OVER (PARTITION BY b.name ORDER BY COUNT(*) DESC) AS rent_rank,c.country_code FROM book_rents br  JOIN people p ON br.person_id = p.id JOIN books b ON br.book_id = b.id JOIN author_books ab ON b.id = ab.book_id JOIN authors a ON ab.author_id = a.id JOIN country c ON p.country_id = c.id GROUP BY b.name, p.name, a.name, c.country_code) AS subquery WHERE rent_rank <= 3 GROUP BY subquery.book_name ORDER BY MAX(subquery.rent_count) DESC, subquery.book_name LIMIT 3;")
    List<Top3ReadBooksDto> getTop3Books();

}
