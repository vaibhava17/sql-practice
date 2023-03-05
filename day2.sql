-- Q1 - Write a query to find the top 3 highest paid employees in each department
-- Ans 1 -
-- SELECT
--   DEPARTMENT,
--   NAME,
--   SALARY
-- FROM
--   EMPLOYEES
-- WHERE
--   DEPARTMENT IN (
--     SELECT
--       DEPARTMENT
--     FROM
--       EMPLOYEES
--     GROUP BY
--       DEPARTMENT
--     ORDER BY
--       SUM(SALARY) DESC FETCH FIRST 2 ROWS ONLY
--   );

-- Q2 - Write a query to find name, department and salary of the least-paid employee in each department
-- Ans 2 -
SELECT
  DEPARTMENT,
  NAME,
  SALARY
FROM
  EMPLOYEES
WHERE
  DEPARTMENT IN (
    SELECT
      DEPARTMENT
    FROM
      EMPLOYEES
    GROUP BY
      DEPARTMENT
    ORDER BY
      SUM(SALARY) ASC FETCH FIRST 2 ROWS ONLY
  );