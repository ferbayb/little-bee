-- -------------------------------------------------------------
-- TablePlus 3.12.8(368)
--
-- https://tableplus.com/
--
-- Database: users_db
-- Generation Time: 2021-05-30 02:18:05.0140
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS login_db_id_seq;

-- Table Definition
CREATE TABLE "public"."login_db" (
    "id" int4 NOT NULL DEFAULT nextval('login_db_id_seq'::regclass),
    "user_name" varchar(16),
    "user_pass" varchar(16),
    PRIMARY KEY ("id")
);

INSERT INTO "public"."login_db" ("id", "user_name", "user_pass") VALUES
(1, 'Ben', 'neB'),
(2, 'Teej', 'jeeT'),
(3, 'Ash', 'hsA'),
(4, 'Walter', 'retlaW'),
(5, 'Arm', 'mrA'),
(6, 'Benedicte', 'etcideneB'),
(7, 'Jobe', 'eboJ'),
(8, 'Edson', 'nosdE'),
(9, 'Johnny', 'ynnohJ'),
(10, 'Matty', 'yttaM'),
(11, 'Natalia', 'ailataN'),
(12, 'Natalie', 'eilataN'),
(13, 'Russ', 'ssuR'),
(14, 'Isaac', 'caasI'),
(15, 'Yoko', 'okoY'),
(16, 'Hannah', 'hannaH'),
(17, 'Ethan', 'nahtE'),
(18, 'Jack', 'kcaJ'),
(19, 'Alistair', 'riatsilA'),
(20, 'Nandini', 'inidnaN'),
(21, 'Alex', 'xelA'),
(22, 'Julian', 'nialuJ');
