-- SQL Workshop
-- Zane Kansil

-- (a)
SELECT employee_name
FROM   `works`
WHERE  company_name =  "First Bank Corporation"
ORDER BY employee_name ASC
LIMIT 0, 30
;

-- (b)
SELECT       e.employee_name
           , e.city
FROM        `works`    AS `w`
INNER JOIN  `employee` AS `e`
ON           w.employee_name = e.employee_name
WHERE        w.company_name = "First Bank Corporation"
LIMIT 0, 30
;

-- (c)
SELECT e.employee_name
     , e.street
     , e.city
FROM       `works`    AS `w`
INNER JOIN `employee` AS `e`
ON          w.employee_name = e.employee_name
WHERE       w.company_name = "First Bank Corporation"
AND         w.salary > 10000
LIMIT 0, 30
;

-- (d)
SELECT      e.employee_name
FROM       `works`    AS `w`
INNER JOIN `employee` AS `e`
ON          w.employee_name = e.employee_name
INNER JOIN `company`  AS `c`
ON          w.company_name = c.company_name
WHERE       e.city = c.city
LIMIT 0, 30
;

-- (e)
SELECT      e.employee_name
FROM       `manages`  AS `m`
INNER JOIN `employee` AS `mgrdetail`
ON          m.manager_name = mgrdetail.employee_name
INNER JOIN `employee` AS `e`
ON          m.employee_name = e.employee_name
WHERE       mgrdetail.city = e.city
AND         mgrdetail.street = e.street
LIMIT 0, 30
;

-- (f)
SELECT    employee_name
FROM     `works`
WHERE     company_name != "First Bank Corporation"
ORDER BY `works`.`employee_name` ASC
LIMIT 0, 30
;

-- (g)
CREATE TEMPORARY TABLE `lowest_paid` (
    SELECT      MAX(w1.salary) AS salary
    FROM       `works` AS `w1`
    INNER JOIN `works` AS `w2`
    ON          w1.company_name = w2.company_name
    WHERE       w1.company_name = "Small Bank Corporation"
);

SELECT      w.employee_name
          , w.salary
FROM       `works`       AS `w`
          ,`lowest_paid` AS `l`
WHERE       w.salary > l.salary
LIMIT 0, 30
;

-- (h)
CREATE TEMPORARY TABLE `SBC_city` (
    SELECT city
    FROM `company`
    WHERE company_name = "Small Bank Corporation"
);

SELECT c2.company_name
FROM `company2` AS `c2`
    ,`SBC_city`
WHERE c2.city = SBC_city.city
GROUP BY c2.company_name
LIMIT 0, 30
;

-- (i)
CREATE TEMPORARY TABLE `avg_salary` (
    SELECT company_name
         , AVG(salary) AS salary
    FROM `works`
    GROUP BY company_name
);

SELECT    w.employee_name
FROM     `works`      AS `w`
        ,`avg_salary` AS `s`
WHERE     w.company_name = s.company_name
AND       w.salary > s.salary
ORDER BY  w.employee_name ASC
LIMIT 0, 30
;

-- (j)
SELECT company_name
     , COUNT(DISTINCT employee_name) AS num_employees
FROM `works` AS `w`
GROUP BY company_name
ORDER BY num_employees DESC
LIMIT 1
;

-- (k)
SELECT       c.company_name
           , SUM(salary)  AS payroll
FROM        `company`     AS `c`
INNER JOIN  `works`       AS `w`
ON           c.company_name = w.company_name
GROUP BY     c.company_name
ORDER BY     payroll ASC
LIMIT 1
;

-- (l)
-- Also uses table `avg_salary` defined in (i)
CREATE TEMPORARY TABLE `avg_salary_FBC` (
    SELECT AVG(salary) AS salary
    FROM `works`
    WHERE company_name = "First Bank Corporation"
);

SELECT    company_name
FROM     `avg_salary`     AS `c`
        ,`avg_salary_FBC` AS `fbc`
WHERE     c.salary > fbc.salary
ORDER BY  company_name ASC
;
