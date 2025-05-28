DROP PROCEDURE IF EXISTS top_rated_movies;
DELIMITER //
CREATE PROCEDURE top_rated_movies(IN top_n INT)
BEGIN
    SELECT M.Title, ROUND(AVG(R.RatingScore), 2) AS AvgRating
    FROM Movie M
    JOIN Review R ON M.MovieID = R.MovieID
    GROUP BY M.MovieID
    ORDER BY AvgRating DESC
    LIMIT top_n;
END;
//
DELIMITER ;



