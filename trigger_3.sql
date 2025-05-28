-- Create history table (if not exists)
DROP TABLE IF EXISTS RatingHistory;
CREATE TABLE IF NOT EXISTS RatingHistory (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    ReviewID INT,
    OldScore DECIMAL(3,1),
    NewScore DECIMAL(3,1),
    ChangedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Trigger: Log score changes
DROP TRIGGER IF EXISTS trg_after_rating_update;
DELIMITER $$
CREATE TRIGGER trg_after_rating_update
AFTER UPDATE ON Review
FOR EACH ROW
BEGIN
    IF OLD.RatingScore <> NEW.RatingScore THEN
        INSERT INTO RatingHistory (ReviewID, OldScore, NewScore)
        VALUES (OLD.ReviewID, OLD.RatingScore, NEW.RatingScore);
    END IF;
END$$
DELIMITER ;

