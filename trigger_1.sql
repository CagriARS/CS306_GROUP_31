-- Create log table (if not exists)
DROP TABLE IF EXISTS ReviewLog;
CREATE TABLE IF NOT EXISTS ReviewLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    ReviewID INT,
    MovieID INT,
    ReviewDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Action VARCHAR(50)
);

-- Trigger: Log review insert
DROP TRIGGER IF EXISTS trg_after_review_insert;
DELIMITER $$
CREATE TRIGGER trg_after_review_insert
AFTER INSERT ON Review
FOR EACH ROW
BEGIN
    INSERT INTO ReviewLog (ReviewID, MovieID, Action)
    VALUES (NEW.ReviewID, NEW.MovieID, 'INSERT');
END$$
DELIMITER ;
