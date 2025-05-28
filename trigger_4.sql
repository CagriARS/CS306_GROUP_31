DELIMITER $$
CREATE TRIGGER trg_before_belongs_insert
BEFORE INSERT ON Belongs
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Belongs
        WHERE MovieID = NEW.MovieID AND GenreID = NEW.GenreID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This genre is already assigned to the movie.';
    END IF;
END$$
DELIMITER ;