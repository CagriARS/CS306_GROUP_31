DROP PROCEDURE IF EXISTS get_movies_by_genre;

DELIMITER //
CREATE PROCEDURE get_movies_by_genre(IN genre_name VARCHAR(100))
BEGIN
    SELECT M.Title, M.ReleaseYear
    FROM Movie M
    JOIN Belongs B ON M.MovieID = B.MovieID
    JOIN Genre G ON B.GenreID = G.GenreID
    WHERE G.GenreName = genre_name;
END;
//
DELIMITER ;

