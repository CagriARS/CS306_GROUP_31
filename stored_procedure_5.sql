DROP PROCEDURE IF EXISTS box_office_summary_by_director;
DELIMITER //
CREATE PROCEDURE box_office_summary_by_director(IN director_name VARCHAR(255))
BEGIN
    SELECT D.Name AS Director, M.Title, B.Budget, B.DomesticGross, B.InternationalGross
    FROM Director D
    JOIN Movie M ON D.DirectorID = M.DirectorID
    JOIN BoxOffice B ON M.MovieID = B.MovieID
    WHERE D.Name = director_name;
END;
//
DELIMITER ;

