package sk.uniza.fri.sem_vaii.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "books", schema = "public")
@Access(AccessType.FIELD)
@Getter
@Setter
@NoArgsConstructor
public class Book {
    private @Id Long id;
    private String isbn;
    @NotBlank(message = "Title is mandatory")
    private String title;

    @Column(name = "release_year")
    private Long releaseYear;

    @Column(name = "number_of_pages")
    private Long numberOfPages;

    private String info;
    private Long available;

    @ManyToOne
    @JoinColumn(name = "language_id", nullable = false)
    private Language language;

    @ManyToMany
    @JoinTable(
            name = "authors_book",
            joinColumns = @JoinColumn(name = "book_id"),
            inverseJoinColumns = @JoinColumn(name = "author_id")
    )
    private Set<Author> authors = new HashSet<>();

    @ManyToMany
    @JoinTable(
        name = "book_genre",
        joinColumns = @JoinColumn(name = "book_id"),
        inverseJoinColumns = @JoinColumn(name = "genre_id")
    )
    private Set<Genre> bookGenres = new HashSet<>();

    @JsonIgnore
    @ManyToMany(mappedBy = "reservationBooks")
    private Set<Reservation> bookReservations = new HashSet<>();
}
