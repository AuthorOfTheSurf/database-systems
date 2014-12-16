INSERT INTO CUSTOMER (c_id,c_firstname,c_lastname,c_email,c_phone)
VALUES ('cust0000000000000001','Jobe','Lau','jlau@hotmail.com','555-402-2023')
    ,  ('cust0000000000000002','Rodney','Elway','r.j.elway@gmail.com','555-231-2415')
    ,  ('cust0000000000000003','Missy','Moore','ladiva@gmail.com','555-235-2425')
    ,  ('cust0000000000000004','Jam','Boree','jb@business.io','555-215-5232')
    ,  ('cust0000000000000005','Martin','Garnier','m.garnier@garnier.org','555-250-9439')
;

INSERT INTO DIGITAL_CONSUMER (dc_id,dc_country)
VALUES ('cust0000000000000001','Albania')
    ,  ('cust0000000000000002','US')
    ,  ('cust0000000000000003','US')
    ,  ('cust0000000000000004','Germany')
;

INSERT INTO PHYSICAL_CONSUMER (pc_id,pc_address_line_1,pc_address_line_2,pc_country,pc_state)
VALUES ('cust0000000000000003','123 Travesty Ln.','','US','TX')
    ,  ('cust0000000000000005','600 Alra Blvd.','Unit #545','US','UT')
;

INSERT INTO PURCHASE (sale_id,sale_status,sale_fulfill_date,sale_date,c_id)
VALUES ('sale0000000000000001','shipped','2014-10-02 07:31:52-08:00','2014-10-01 12:13:57-08:00','cust0000000000000003')
    ,  ('sale0000000000000002','recieved','NULL','2014-12-03 12:17:29-08:00','cust0000000000000005')
    ,  ('sale0000000000000003','fulfilled','2014-12-07 09:11:51-08:00','2014-12-07 09:11:49-08:00','cust0000000000000001')
    ,  ('sale0000000000000004','fulfilled','2014-12-07 11:08:18-08:00','2014-12-07 11:08:17-08:00','cust0000000000000002')
    ,  ('sale0000000000000005','fulfilled','2014-12-07 12:11:52-08:00','2014-12-07 12:11:50-08:00','cust0000000000000003')
    ,  ('sale0000000000000006','fulfilled','2014-12-08 01:12:40-08:00','2014-12-08 01:12:39-08:00','cust0000000000000004')
;

INSERT INTO GOOD (g_sku,g_name,g_description,g_price)
VALUES ('good0000000000000001','Rise of John: Rap Emperor','The first mixtape by John. 2007. Bone Records.','0')
    ,  ('good0000000000000002','Return of John: No more Disciples','After 6 years John is back, with hot new beats and tracks featuring the latest and greates. 2013. Bone Records.','0')
    ,  ('good0000000000000003','Black Silk Hooded Sweatshirt','Quality Egyptian wool-silk, unique black dye patterns for a trendy look.','2499')
    ,  ('good0000000000000004','Red Summer Beanie','A comfortable beanie for the summertime','1299')
    ,  ('good0000000000000005','Plain White Perfect Tee','The perfect white t-shirt you have always wanted. 100% Cotton and woven with care.','999')
;

INSERT INTO PHYSICAL_GOOD (pg_id,pg_color,pg_size,pg_quantity_available)
VALUES ('good0000000000000003','Black','M','3')
    ,  ('good0000000000000004','Red','OSFA','7')
    ,  ('good0000000000000005','White','M','2')
;

INSERT INTO DIGITAL_GOOD (dg_id,dg_is_available)
VALUES ('good0000000000000001','0')
    ,  ('good0000000000000002','1')
;

INSERT INTO LINE_ITEM (li_quantity,sale_id,g_sku)
VALUES ('2','sale0000000000000001','good0000000000000004')
    ,  ('1','sale0000000000000002','good0000000000000004')
    ,  ('1','sale0000000000000002','good0000000000000005')
    ,  ('1','sale0000000000000003','good0000000000000001')
    ,  ('1','sale0000000000000004','good0000000000000002')
    ,  ('1','sale0000000000000005','good0000000000000001')
    ,  ('1','sale0000000000000006','good0000000000000002')
;

INSERT INTO MEDIA (m_id,m_upload_date)
VALUES ('media000000000000001','2014-10-15 13:23:31-08:00')
    ,  ('media000000000000002','2014-10-30 18:12:42-08:00')
    ,  ('media000000000000003','2014-11-2 08:23:09-08:00')
    ,  ('media000000000000004','2014-11-2 08:30:12-08:00')
    ,  ('media000000000000005','2014-11-27 11:45:10-08:00')
    ,  ('media000000000000006','2014-12-6 09:03:19-08:00')
;

INSERT INTO SONG (so_id,so_title,so_artist,so_url)
VALUES ('media000000000000002','Bad Phone','John','soundcloud.com/john/song/22')
    ,  ('media000000000000003','Street Judgement ft. Lawriee','John','soundcloud.com/john/song/23')
    ,  ('media000000000000006','Walk Before You Crawl ft. Caleb','John','soundcloud.com/john/song/45')
;

INSERT INTO MUSIC_VIDEO (mv_id,mv_title,mv_url)
VALUES ('media000000000000001','A day in the life of John pt. 1','youtube.com/v/aExs42')
    ,  ('media000000000000004','Street Judgement [OFFICIAL VIDEO]','youtube.com/v/820uykY')
    ,  ('media000000000000005','Leading the Way [OFFICIAL VIDEO]','youtube.com/v/w92n212')
;

INSERT INTO INTERACTION (i_id,i_date,m_id)
VALUES ('inter000000000000001','2014-12-10 11:47:23-08:00','media000000000000001')
    ,  ('inter000000000000002','2014-12-12 13:08:20-08:00','media000000000000001')
    ,  ('inter000000000000003','2014-12-12 13:47:23-08:00','media000000000000002')
    ,  ('inter000000000000004','2014-12-13 08:02:07-08:00','media000000000000006')
    ,  ('inter000000000000005','2014-12-13 09:44:21-08:00','media000000000000003')
    ,  ('inter000000000000006','2014-12-14 13:57:13-08:00','media000000000000003')
    ,  ('inter000000000000007','2014-12-14 14:08:03-08:00','media000000000000004')
    ,  ('inter000000000000008','2014-12-15 15:59:49-08:00','media000000000000002')
    ,  ('inter000000000000009','2014-12-15 18:42:03-08:00','media000000000000006')
    ,  ('inter000000000000010','2014-12-15 19:02:02-08:00','media000000000000005')
    ,  ('inter000000000000011','2014-12-15 23:41:48-08:00','media000000000000005')
;

INSERT INTO PLAY (pl_id)
VALUES ('inter000000000000001')
    ,  ('inter000000000000003')
    ,  ('inter000000000000004')
    ,  ('inter000000000000005')
    ,  ('inter000000000000007')
    ,  ('inter000000000000008')
    ,  ('inter000000000000010')
;

INSERT INTO REDIRECT (re_id,re_url)
VALUES ('inter000000000000002','youtube.com/v/aExs42')
    ,  ('inter000000000000006','soundcloud.com/john/song/23')
    ,  ('inter000000000000009','soundcloud.com/john/song/45')
;
