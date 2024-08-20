CREATE TABLE cinemas
    (id SERIAL, seat_id INT);


INSERT INTO cinemas(seat_id)
VALUES
    (1),
    (0),
    (0),
    (1),
    (1),
    (1),
    (0);


SELECT * FROM CINEMAS

-- Write a SQL query to find the id where the seat is empty
-- and both the seat immediately before and immediately after it are also empty

-- 1 ---> empty
-- 0 ---> full


WITH CTE AS
(
SELECT *,
      LAG(SEAT_ID)OVER(ORDER BY ID )AS PREVIOUS_SEAT_ID,
      LEAD(SEAT_ID)OVER(ORDER BY ID)AS NEXT_SEAT_ID
FROM CINEMAS
)
SELECT ID,SEAT_ID
FROM CTE WHERE 
SEAT_ID=1
AND
PREVIOUS_SEAT_ID=1
AND
NEXT_SEAT_ID=1

--For this output only there is empty seat both before after and that place