DROP PROCEDURE IF EXISTS average_rating_for_movie;
DELIMITER //
CREATE PROCEDURE average_rating_for_movie(IN movie_title VARCHAR(255))
BEGIN
    SELECT M.Title, ROUND(AVG(R.RatingScore), 2) AS AverageRating
    FROM Movie M
    JOIN Review R ON M.MovieID = R.MovieID
    WHERE M.Title = movie_title
    GROUP BY M.Title;
END;
//
DELIMITER ;


