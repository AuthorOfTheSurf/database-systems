--
-- ER/Studio Data Architect 9.6 SQL Code Generation
-- Project :      zk-online-music-business.DM1
--
-- Date Created : Tuesday, December 09, 2014 16:44:51
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: CUSTOMER 
--

CREATE TABLE CUSTOMER(
    c_id           CHAR(20)       NOT NULL,
    c_firstname    VARCHAR(20)    NOT NULL,
    c_lastname     VARCHAR(20)    NOT NULL,
    c_email        VARCHAR(20)    NOT NULL,
    c_phone        VARCHAR(20)    NOT NULL,
    PRIMARY KEY (c_id)
)ENGINE=INNODB
;



-- 
-- TABLE: DIGITAL_CONSUMER 
--

CREATE TABLE DIGITAL_CONSUMER(
    dc_id         CHAR(20)       NOT NULL,
    dc_country    VARCHAR(20)    NOT NULL,
    PRIMARY KEY (dc_id)
)ENGINE=INNODB
;



-- 
-- TABLE: DIGITAL_GOOD 
--

CREATE TABLE DIGITAL_GOOD(
    dg_id              CHAR(20)    NOT NULL,
    dg_is_available    BIT(1)      NOT NULL,
    PRIMARY KEY (dg_id)
)ENGINE=INNODB
;



-- 
-- TABLE: GOOD 
--

CREATE TABLE GOOD(
    g_sku            CHAR(20)         NOT NULL,
    g_name           VARCHAR(255)     NOT NULL,
    g_description    VARCHAR(2048)    NOT NULL,
    g_price          INT              NOT NULL,
    PRIMARY KEY (g_sku)
)ENGINE=INNODB
;



-- 
-- TABLE: INTERACTION 
--

CREATE TABLE INTERACTION(
    i_id      CHAR(20)    NOT NULL,
    m_id      CHAR(20),
    i_date    DATETIME    NOT NULL,
    PRIMARY KEY (i_id)
)ENGINE=INNODB
;



-- 
-- TABLE: LINE_ITEM 
--

CREATE TABLE LINE_ITEM(
    sale_id        CHAR(20)    NOT NULL,
    g_sku          CHAR(20)    NOT NULL,
    li_quantity    INT,
    PRIMARY KEY (sale_id, g_sku)
)ENGINE=INNODB
;



-- 
-- TABLE: MEDIA 
--

CREATE TABLE MEDIA(
    m_id             CHAR(20)    NOT NULL,
    m_upload_date    DATETIME,
    PRIMARY KEY (m_id)
)ENGINE=INNODB
;



-- 
-- TABLE: MUSIC_VIDEO 
--

CREATE TABLE MUSIC_VIDEO(
    mv_id       CHAR(20)        NOT NULL,
    mv_title    VARCHAR(50)     NOT NULL,
    mv_url      VARCHAR(100)    NOT NULL,
    PRIMARY KEY (mv_id)
)ENGINE=INNODB
;



-- 
-- TABLE: PHYSICAL_CONSUMER 
--

CREATE TABLE PHYSICAL_CONSUMER(
    pc_id                CHAR(20)        NOT NULL,
    pc_address_line_1    VARCHAR(255)    NOT NULL,
    pc_address_line_2    VARCHAR(255),
    pc_country           VARCHAR(20)     NOT NULL,
    pc_state             VARCHAR(20)     NOT NULL,
    PRIMARY KEY (pc_id)
)ENGINE=INNODB
;



-- 
-- TABLE: PHYSICAL_GOOD 
--

CREATE TABLE PHYSICAL_GOOD(
    pg_id                    CHAR(20)       NOT NULL,
    pg_color                 VARCHAR(20),
    pg_size                  VARCHAR(20),
    pg_quantity_available    INT            NOT NULL,
    PRIMARY KEY (pg_id)
)ENGINE=INNODB
;



-- 
-- TABLE: PLAY 
--

CREATE TABLE PLAY(
    pl_id    CHAR(20)    NOT NULL,
    PRIMARY KEY (pl_id)
)ENGINE=INNODB
;



-- 
-- TABLE: PURCHASE 
--

CREATE TABLE PURCHASE(
    sale_id              CHAR(20)       NOT NULL,
    sale_status          VARCHAR(20)    NOT NULL,
    sale_fulfill_date    DATETIME,
    sale_date            DATETIME       NOT NULL,
    c_id                 CHAR(20)       NOT NULL,
    PRIMARY KEY (sale_id)
)ENGINE=INNODB
;



-- 
-- TABLE: REDIRECT 
--

CREATE TABLE REDIRECT(
    re_id     CHAR(20)        NOT NULL,
    re_url    VARCHAR(255)    NOT NULL,
    PRIMARY KEY (re_id)
)ENGINE=INNODB
;



-- 
-- TABLE: SONG 
--

CREATE TABLE SONG(
    so_id        CHAR(20)        NOT NULL,
    so_title     VARCHAR(50)     NOT NULL,
    so_artist    VARCHAR(20)     NOT NULL,
    so_url       VARCHAR(100)    NOT NULL,
    PRIMARY KEY (so_id)
)ENGINE=INNODB
;



-- 
-- TABLE: DIGITAL_CONSUMER 
--

ALTER TABLE DIGITAL_CONSUMER ADD CONSTRAINT RefCUSTOMER2 
    FOREIGN KEY (dc_id)
    REFERENCES CUSTOMER(c_id)
;


-- 
-- TABLE: DIGITAL_GOOD 
--

ALTER TABLE DIGITAL_GOOD ADD CONSTRAINT RefGOOD7 
    FOREIGN KEY (dg_id)
    REFERENCES GOOD(g_sku)
;


-- 
-- TABLE: INTERACTION 
--

ALTER TABLE INTERACTION ADD CONSTRAINT RefMEDIA15 
    FOREIGN KEY (m_id)
    REFERENCES MEDIA(m_id)
;


-- 
-- TABLE: LINE_ITEM 
--

ALTER TABLE LINE_ITEM ADD CONSTRAINT RefPURCHASE4 
    FOREIGN KEY (sale_id)
    REFERENCES PURCHASE(sale_id)
;

ALTER TABLE LINE_ITEM ADD CONSTRAINT RefGOOD5 
    FOREIGN KEY (g_sku)
    REFERENCES GOOD(g_sku)
;


-- 
-- TABLE: MUSIC_VIDEO 
--

ALTER TABLE MUSIC_VIDEO ADD CONSTRAINT RefMEDIA10 
    FOREIGN KEY (mv_id)
    REFERENCES MEDIA(m_id)
;


-- 
-- TABLE: PHYSICAL_CONSUMER 
--

ALTER TABLE PHYSICAL_CONSUMER ADD CONSTRAINT RefCUSTOMER1 
    FOREIGN KEY (pc_id)
    REFERENCES CUSTOMER(c_id)
;


-- 
-- TABLE: PHYSICAL_GOOD 
--

ALTER TABLE PHYSICAL_GOOD ADD CONSTRAINT RefGOOD6 
    FOREIGN KEY (pg_id)
    REFERENCES GOOD(g_sku)
;


-- 
-- TABLE: PLAY 
--

ALTER TABLE PLAY ADD CONSTRAINT RefINTERACTION12 
    FOREIGN KEY (pl_id)
    REFERENCES INTERACTION(i_id)
;


-- 
-- TABLE: PURCHASE 
--

ALTER TABLE PURCHASE ADD CONSTRAINT RefCUSTOMER3 
    FOREIGN KEY (c_id)
    REFERENCES CUSTOMER(c_id)
;


-- 
-- TABLE: REDIRECT 
--

ALTER TABLE REDIRECT ADD CONSTRAINT RefINTERACTION13 
    FOREIGN KEY (re_id)
    REFERENCES INTERACTION(i_id)
;


-- 
-- TABLE: SONG 
--

ALTER TABLE SONG ADD CONSTRAINT RefMEDIA11 
    FOREIGN KEY (so_id)
    REFERENCES MEDIA(m_id)
;


