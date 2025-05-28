-- Trigger: Assign default RatingID if NULL
DROP TRIGGER IF EXISTS trg_before_review_insert;
DELIMITER $$
CREATE TRIGGER trg_before_review_insert
BEFORE INSERT ON Review
FOR EACH ROW
BEGIN
    IF NEW.RatingID IS NULL THEN
        SET NEW.RatingID = 1;  -- Assuming 1 is PG or default
    END IF;
END$$
DELIMITER ;
