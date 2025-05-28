-- Trigger: Prevent long movie durations
DROP TRIGGER IF EXISTS trg_before_movie_insert;
DELIMITER $$
CREATE TRIGGER trg_before_movie_insert
BEFORE INSERT ON Movie
FOR EACH ROW
BEGIN
    IF NEW.Duration > 300 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Movie duration cannot exceed 300 minutes.';
    END IF;
END$$
DELIMITER ;
