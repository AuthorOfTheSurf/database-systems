-- (1) How many video plays today?

SELECT     COUNT(`i`.`i_date`) AS `plays`
FROM       `MUSIC_VIDEO` AS `mv`
INNER JOIN `INTERACTION` AS `i`
ON         `mv`.`mv_id`  =  `i`.`m_id`
INNER JOIN `PLAY`        AS `pl`
ON         `pl`.`pl_id`  =  `i`.`i_id`
WHERE      DATE(`i`.`i_date`)  = curdate()
;

-- (2) How many redirects to Soundcloud from embedded music players?

SELECT     COUNT(`re`.`re_url`) AS `redirects`
FROM       `SONG`        AS `so`
INNER JOIN `INTERACTION` AS `i`
ON         `so`.`so_id`  =  `i`.`m_id`
INNER JOIN `REDIRECT`    AS `re`
ON         `i`.`i_id`    =  `re`.`re_id`
;

-- (3) What is the redirect rate for videos?

SELECT          COUNT(`pl`.`pl_id`) AS `plays`
    ,           COUNT(`re`.`re_id`) AS `redirects`
FROM            `MUSIC_VIDEO` AS `mv`
INNER JOIN      `INTERACTION` AS `i`
ON              `mv`.`mv_id`  =  `i`.`m_id`
LEFT OUTER JOIN `PLAY`        AS `pl`
ON              `i`.`i_id`    =  `pl`.`pl_id`
LEFT OUTER JOIN `REDIRECT`    AS `re`
ON                `i`.`i_id`  =  `re`.`re_id`
;

-- (4) Is “Black Silk Hooded Sweatshirt” sold out?

SELECT     `pg`.`pg_quantity_available` > 0 AS `is_available`
FROM       `PHYSICAL_GOOD` AS `pg`
INNER JOIN `GOOD` AS `g`
ON         `pg`.`pg_id` = `g`.`g_sku`
WHERE      `g`.`g_name` = "Black Silk Hooded Sweatshirt"
;

-- (5) How many “Red Summer Beanie” items were sold in October 2014?

SELECT count(`s`.`sale_id`) AS `sold`
FROM  `PURCHASE`      AS `s`
WHERE `s`.`sale_date` >= "2014-10-1"
AND   `s`.`sale_date` <= "2014-10-31"
;

-- (6) What digital goods are currently unavailable?

SELECT     `g`.`g_name`
FROM       `DIGITAL_GOOD`         AS `dg`
INNER JOIN `GOOD`                 AS `g`
ON         `dg`.`dg_id`           =  `g`.`g_sku`
WHERE      `dg`.`dg_is_available` =  0
;

-- (7) How many orders do I have to fill to the US?

SELECT COUNT(`sale`.`sale_id`)  AS `orders`
FROM       `PURCHASE`           AS `sale`
INNER JOIN `PHYSICAL_CONSUMER`  AS `pc`
ON         `sale`.`c_id`        =  `pc`.`pc_id`
WHERE      `pc`.`pc_country`    =  "US"
AND        `sale`.`sale_status` =  "recieved"
;

-- (8) What precentage of my digital consumers are from outside the US?

SELECT COUNT(`dc`.`dc_id`)      AS `total`
    ,  COUNT(`foreign`.`dc_id`) AS `foreign`
FROM `DIGITAL_CONSUMER`         AS `dc`
LEFT OUTER JOIN (
	SELECT `dc_id`
	FROM   `DIGITAL_CONSUMER`
    WHERE  `dc_country` != "US"
) AS `foreign`
ON `dc`.`dc_id` = `foreign`.`dc_id`
;

-- (9) How many digital consumers are also physical consumers?

SELECT COUNT(`dc`.`dc_id`) AS `digital_and_physical`
FROM `DIGITAL_CONSUMER` AS `dc`
INNER JOIN `PHYSICAL_CONSUMER` AS `pc`
ON `dc`.`dc_id` = `pc`.`pc_id`
;

-- (10) What products have garnered zero sales in the past 14 days?

SELECT `g`.`g_name`
FROM   `GOOD`                     AS `g`
LEFT JOIN (
	SELECT     `li`.`g_sku`       AS `g_sku`
	FROM       `PURCHASE`         AS `sale`
	INNER JOIN `LINE_ITEM`        AS `li`
	ON         `li`.`sale_id`     =  `sale`.`sale_id`
	WHERE      `sale`.`sale_date` >= DATE_SUB(curdate(), INTERVAL 2 WEEK)
)   AS         `items_sold`
ON     `g`.`g_sku`                = `items_sold`.`g_sku`
WHERE  `items_sold`.`g_sku`       IS NULL
;