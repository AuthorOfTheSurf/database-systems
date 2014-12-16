-- (1) How many video plays today?

SELECT count(`p`.`i_date`)
FROM       `MUSIC_VIDEO` AS `mv`
INNER JOIN `PLAY`        AS `p`
ON         `mv`.`m_id`   =  `p`.`m_id`
WHERE      `p`.`i_date`  >= curdate()
AND        `p`.`i_date`  <= curdate()
;

-- (2) How many redirects to Soundcloud from embedded music players?

SELECT count(`r`.`to`)
FROM       `SONG`     AS `s`
INNER JOIN `REDIRECT` AS `r`
ON         `s`.`m_id` =  `r`.`m_id`
WHERE      `r`.`to`   =  "soundcloud"
;

-- (3) What is the redirect rate for videos?

SELECT count(`p`.`m_id`), count(`r`.`m_id`)
FROM       `MUSIC_VIDEO` AS `mv`
INNER JOIN `PLAY`        AS `p`
ON         `mv`.`m_id`   =  `p`.`m_id`
INNER JOIN `REDIRECT`    AS `r`
ON         `mv`.`m_id`   =  `r`.`m_id`
;

-- (4) Is “Black Silk Hooded Sweatshirt” sold out?

SELECT `pg`.`pg_quantity_available`
FROM   `PHYSICAL_GOOD` AS `pg`
;

-- (5) How many “Red Summer Beanie” items were sold in October 2014?

SELECT count(`s`.`sale_id`)
FROM  `PURCHASE`      AS `s`
WHERE `s`.`sale_date` >= "2014-10-1"
AND   `s`.`sale_date` <= "2014-10-31"
;

-- (6) What physical goods are currently frozen? (sales prevented)

SELECT `pg`.`pg_name`
FROM   `PHYSICAL_GOOD`     AS `pg`
WHERE  `pg`.`pg_is_frozen` =  1
;

-- (7) How many orders do I have to fill to the US?

SELECT count(`pg`.`sale_id`)
FROM       `PHYSICAL_CUSTOMER` AS `pc`
INNER JOIN `PURCHASE`          AS `sale`
ON         `pc`.`c_id`         =  `sale`.`c_id`
WHERE      `pc`.`pc_country`   =  "US"
;

-- (8) What precentage of my digital consumers are from outside the US?
SELECT count(`dg`.`c_id`), count(`foreign`.`c_id`)
FROM   `DIGITAL_CUSTOMER`     AS `dg`
   ,   `DIGITAL_CUSTOMER`     AS `foreign`
WHERE  `foreign`.`dc_country` != "US"
;

-- (9) What is the average monthly revenue over the past six months?

#  INCOMPLETE 

-- (10) What products have garnered zero sales in the past 14 days?

SELECT DISTINCT `g`.`g_name`
FROM            `LINE_ITEM`      AS `li`
LEFT JOIN       `GOOD`           AS `g`
ON              `li`.`g_sku`     =  `g`.`g_sku`
WHERE           `li`.`sale_date` >= DATE_SUB(curdate(), INTERVAL 2 WEEK)
AND             `g`.`g_sku`      IS NULL
;






