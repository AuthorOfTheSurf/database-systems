--
-- ER/Studio Data Architect 9.6 SQL Code Generation
-- Project :      zk-online-music-business.DM1
--
-- Date Created : Tuesday, November 04, 2014 21:18:16
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: CUSTOMER 
--

CREATE TABLE CUSTOMER(
    c_id           VARCHAR(20)    NOT NULL,
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
    c_id          VARCHAR(20)    NOT NULL,
    dc_country    VARCHAR(20)    NOT NULL,
    dc_phone      VARCHAR(20)    NOT NULL,
    PRIMARY KEY (c_id)
)ENGINE=INNODB
;



-- 
-- TABLE: DIGITAL_GOOD 
--

CREATE TABLE DIGITAL_GOOD(
    g_sku           VARCHAR(20)    NOT NULL,
    dg_is_frozen    BIT(1)         NOT NULL,
    PRIMARY KEY (g_sku)
)ENGINE=INNODB
;



-- 
-- TABLE: GOOD 
--

CREATE TABLE GOOD(
    g_sku            VARCHAR(20)    NOT NULL,
    g_name           VARCHAR(20)    NOT NULL,
    g_description    VARCHAR(20)    NOT NULL,
    g_price          VARCHAR(20)    NOT NULL,
    PRIMARY KEY (g_sku)
)ENGINE=INNODB
;



-- 
-- TABLE: INTERACTION 
--

CREATE TABLE INTERACTION(
    m_id      VARCHAR(20)    NOT NULL,
    i_date    DATETIME       NOT NULL,
    PRIMARY KEY (m_id)
)ENGINE=INNODB
;



-- 
-- TABLE: LINE_ITEM 
--

CREATE TABLE LINE_ITEM(
    sale_id     VARCHAR(20)    NOT NULL,
    g_sku       VARCHAR(20)    NOT NULL,
    quantity    INT,
    PRIMARY KEY (sale_id, g_sku)
)ENGINE=INNODB
;



-- 
-- TABLE: MEDIA 
--

CREATE TABLE MEDIA(
    m_id    VARCHAR(20)    NOT NULL,
    PRIMARY KEY (m_id)
)ENGINE=INNODB
;



-- 
-- TABLE: MUSIC_VIDEO 
--

CREATE TABLE MUSIC_VIDEO(
    m_id              VARCHAR(20)     NOT NULL,
    mv_title          VARCHAR(50)     NOT NULL,
    mv_upload_date    DATETIME        NOT NULL,
    mv_url            VARCHAR(100)    NOT NULL,
    PRIMARY KEY (m_id)
)ENGINE=INNODB
;



-- 
-- TABLE: PHYSICAL_CONSUMER 
--

CREATE TABLE PHYSICAL_CONSUMER(
    c_id                 VARCHAR(20)     NOT NULL,
    pc_address_line_1    VARCHAR(255)    NOT NULL,
    pc_address_line_2    VARCHAR(255),
    pc_country           VARCHAR(20)     NOT NULL,
    pc_state             VARCHAR(20)     NOT NULL,
    pc_phone             VARCHAR(20)     NOT NULL,
    PRIMARY KEY (c_id)
)ENGINE=INNODB
;



-- 
-- TABLE: PHYSICAL_GOOD 
--

CREATE TABLE PHYSICAL_GOOD(
    g_sku                    VARCHAR(20)    NOT NULL,
    pg_color                 VARCHAR(20),
    pg_size                  VARCHAR(20),
    pg_price                 FLOAT(8, 0)    NOT NULL,
    pg_quantity_available    INT            NOT NULL,
    PRIMARY KEY (g_sku)
)ENGINE=INNODB
;



-- 
-- TABLE: PLAY 
--

CREATE TABLE PLAY(
    m_id    VARCHAR(20)    NOT NULL,
    PRIMARY KEY (m_id)
)ENGINE=INNODB
;



-- 
-- TABLE: PURCHASE 
--

CREATE TABLE PURCHASE(
    sale_id        VARCHAR(20)    NOT NULL,
    sale_status    VARCHAR(20)    NOT NULL,
    sale_date      DATETIME       NOT NULL,
    c_id           VARCHAR(20)    NOT NULL,
    PRIMARY KEY (sale_id)
)ENGINE=INNODB
;



-- 
-- TABLE: REDIRECT 
--

CREATE TABLE REDIRECT(
    m_id           VARCHAR(20)    NOT NULL,
    destination    VARCHAR(20)    NOT NULL,
    PRIMARY KEY (m_id)
)ENGINE=INNODB
;



-- 
-- TABLE: SONG 
--

CREATE TABLE SONG(
    m_id              VARCHAR(20)     NOT NULL,
    so_title          VARCHAR(50)     NOT NULL,
    so_artist         VARCHAR(20)     NOT NULL,
    so_upload_date    DATETIME        NOT NULL,
    so_url            VARCHAR(100)    NOT NULL,
    PRIMARY KEY (m_id)
)ENGINE=INNODB
;



-- 
-- INDEX: Ref22 
--

CREATE INDEX Ref22 ON DIGITAL_CONSUMER(c_id)
;
-- 
-- INDEX: Ref97 
--

CREATE INDEX Ref97 ON DIGITAL_GOOD(g_sku)
;
-- 
-- INDEX: Ref148 
--

CREATE INDEX Ref148 ON INTERACTION(m_id)
;
-- 
-- INDEX: Ref84 
--

CREATE INDEX Ref84 ON LINE_ITEM(sale_id)
;
-- 
-- INDEX: Ref95 
--

CREATE INDEX Ref95 ON LINE_ITEM(g_sku)
;
-- 
-- INDEX: Ref1610 
--

CREATE INDEX Ref1610 ON MUSIC_VIDEO(m_id)
;
-- 
-- INDEX: Ref21 
--

CREATE INDEX Ref21 ON PHYSICAL_CONSUMER(c_id)
;
-- 
-- INDEX: Ref96 
--

CREATE INDEX Ref96 ON PHYSICAL_GOOD(g_sku)
;
-- 
-- INDEX: Ref1312 
--

CREATE INDEX Ref1312 ON PLAY(m_id)
;
-- 
-- INDEX: Ref23 
--

CREATE INDEX Ref23 ON PURCHASE(c_id)
;
-- 
-- INDEX: Ref1313 
--

CREATE INDEX Ref1313 ON REDIRECT(m_id)
;
-- 
-- INDEX: Ref1611 
--

CREATE INDEX Ref1611 ON SONG(m_id)
;
-- 
-- TABLE: DIGITAL_CONSUMER 
--

ALTER TABLE DIGITAL_CONSUMER ADD CONSTRAINT RefCUSTOMER2 
    FOREIGN KEY (c_id)
    REFERENCES CUSTOMER(c_id)
;


-- 
-- TABLE: DIGITAL_GOOD 
--

ALTER TABLE DIGITAL_GOOD ADD CONSTRAINT RefGOOD7 
    FOREIGN KEY (g_sku)
    REFERENCES GOOD(g_sku)
;


-- 
-- TABLE: INTERACTION 
--

ALTER TABLE INTERACTION ADD CONSTRAINT RefMUSIC_VIDEO8 
    FOREIGN KEY (m_id)
    REFERENCES MUSIC_VIDEO(m_id)
;

ALTER TABLE INTERACTION ADD CONSTRAINT RefSONG9 
    FOREIGN KEY (m_id)
    REFERENCES SONG(m_id)
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
    FOREIGN KEY (m_id)
    REFERENCES MEDIA(m_id)
;


-- 
-- TABLE: PHYSICAL_CONSUMER 
--

ALTER TABLE PHYSICAL_CONSUMER ADD CONSTRAINT RefCUSTOMER1 
    FOREIGN KEY (c_id)
    REFERENCES CUSTOMER(c_id)
;


-- 
-- TABLE: PHYSICAL_GOOD 
--

ALTER TABLE PHYSICAL_GOOD ADD CONSTRAINT RefGOOD6 
    FOREIGN KEY (g_sku)
    REFERENCES GOOD(g_sku)
;


-- 
-- TABLE: PLAY 
--

ALTER TABLE PLAY ADD CONSTRAINT RefINTERACTION12 
    FOREIGN KEY (m_id)
    REFERENCES INTERACTION(m_id)
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
    FOREIGN KEY (m_id)
    REFERENCES INTERACTION(m_id)
;


-- 
-- TABLE: SONG 
--

ALTER TABLE SONG ADD CONSTRAINT RefMEDIA11 
    FOREIGN KEY (m_id)
    REFERENCES MEDIA(m_id)
;


