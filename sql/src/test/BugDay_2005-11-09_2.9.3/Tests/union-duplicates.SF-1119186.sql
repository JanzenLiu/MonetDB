CREATE TABLE aap(id int);
INSERT INTO aap VALUES (1);
INSERT INTO aap VALUES (6);
COMMIT;

SELECT id FROM aap;


SELECT * FROM aap UNION SELECT * FROM aap;

SELECT * FROM aap UNION ALL SELECT * FROM aap;

SELECT 'a' AS test FROM aap;

SELECT 'a' AS test FROM aap UNION SELECT 'b' AS
test FROM aap;

SELECT 'a' AS test FROM aap UNION ALL SELECT 'b' AS
test FROM aap;

DROP TABLE aap;
COMMIT;
