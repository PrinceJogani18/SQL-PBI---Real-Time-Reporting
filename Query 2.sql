


DROP PROCEDURE IF EXISTS insert_loop;
DELIMITER $$

CREATE PROCEDURE insert_loop()
BEGIN
    DECLARE in_val DECIMAL(5,2);
    DECLARE out_val DECIMAL(5,2);
    DECLARE r INT;
    DECLARE tr INT;
    DECLARE g INT;
    DECLARE tg INT;
    DECLARE b INT;
    DECLARE tb INT;
    DECLARE d INT;
    DECLARE td INT;
    DECLARE i INT DEFAULT 0;

    WHILE i < 50 DO
        SET in_val = 90 + RAND() * 10;
        SET out_val = in_val - RAND() * 2;
        SET r = FLOOR(RAND() * 2);
        SET tr = IFNULL((SELECT SUM(Red) FROM TJ), 0) + r;
        SET g = FLOOR(RAND() * 2);
        SET tg = IFNULL((SELECT SUM(Green) FROM TJ), 0) + g;
        SET b = FLOOR(RAND() * 2);
        SET tb = IFNULL((SELECT SUM(Blue) FROM TJ), 0) + b;
        SET d = FLOOR(RAND() * 2);
        SET td = IFNULL((SELECT SUM(Damaged) FROM TJ), 0) + d;

        INSERT INTO TJ VALUES (
            NOW(),
            90 + RAND() * 10,
            80 + RAND() * 10,
            in_val,
            out_val,
            in_val - out_val,
            r,
            tr,
            g,
            tg,
            b,
            tb,
            r + g + b,
            tr + tg + tb,
            d,
            td
        );

        SET i = i + 1;
        DO SLEEP(1);
    END WHILE;
END$$

DELIMITER ;

CALL insert_loop();

select * from tj;

USE TJ;
SHOW TABLES;

SELECT * FROM tj
ORDER BY T DESC
LIMIT 5;
