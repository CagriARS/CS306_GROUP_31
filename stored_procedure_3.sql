DROP PROCEDURE IF EXISTS movie_awards_summary;
DELIMITER //
CREATE PROCEDURE movie_awards_summary(IN movie_title VARCHAR(255))
BEGIN
    SELECT M.Title, A.AwardName, A.AwardYear, A.Category
    FROM Movie M
    JOIN Award A ON M.MovieID = A.MovieID
    WHERE M.Title = movie_title;
END;
//
DELIMITER ;

