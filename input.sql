/*
IN BASH:
sqllite3 hackust.sqlite3
.read input.sql
.exit
mkdir var
mv hackust.sqlite3 var/
*/

create table Receipt(
receipt_id INT(10),
store tinytext,
purchase_date date,
purchase_time time,
card smallint(4),
tag tinytext,
total decimal(10,2),

PRIMARY KEY(receipt_id)
);


create table Item(
receipt_id INT(10),
name TINYTEXT,
price decimal(10,2),

PRIMARY KEY(receipt_id, name, price),
FOREIGN KEY(receipt_id) references Receipt on delete cascade
);
/*
INSERT INTO RECEIPT(receipt_id, store, purchase_date, purchase_time, card, tag, total) VALUES
(0, "Uraban Outfit", "2015-9-1", "16:7:00", 7803, "Bills", 73.21),
(1, "HKUST", "2018-10-12", "16:9:00", 0022, "Clothing", 97.44),
(2, "HKUST", "2017-4-17", "23:52:00", 0022, "Food", 40.75),
(3, "HKUST", "2017-5-18", "16:35:00", 7803, "Food", 78.56),
(4, "Uraban Outfit", "2018-10-1", "5:4:00", 3928, "Bills", 80.70),
(5, "Uraban Outfit", "2016-5-12", "12:59:00", 3743, "Bills", 23.77),
(6, "HKUST", "2015-9-26", "15:29:00", 3928, "Bills", 76.34),
(7, "Uraban Outfit", "2017-8-1", "17:13:00", 0022, "Bills", 40.19),
(8, "HKUST", "2016-10-12", "7:4:00", 3928, "Clothing", 75.26),
(9, "HKUST", "2017-2-21", "6:14:00", 3743, "Bills", 54.74),
(10, "HKUST", "2016-10-8", "11:23:00", 3829, "Entertainment", 72.71),
(11, "Uraban Outfit", "2017-6-9", "8:1:00", 0022, "Bills", 85.66),
(12, "Uraban Outfit", "2015-1-3", "21:38:00", 3743, "Entertainment", 81.96),
(13, "Uraban Outfit", "2018-5-5", "4:58:00", 3743, "Entertainment", 58.2),
(14, "Uraban Outfit", "2018-10-20", "17:58:00", 0022, "Food", 85.55),
(15, "Uraban Outfit", "2016-11-19", "20:44:00", 3928, "Food", 49.70),
(16, "HKUST", "2018-12-10", "0:30:00", 3743, "Clothing", 81.29),
(17, "HKUST", "2018-5-12", "7:49:00", 3829, "Clothing", 94.22),
(18, "Uraban Outfit", "2015-6-17", "9:4:00", 3928, "Clothing", 71.0),
(19, "HKUST", "2016-3-13", "11:29:00", 3928, "Bills", 71.36),
(20, "HKUST", "2016-6-21", "22:7:00", 0912, "Food", 88.99),
(21, "HKUST", "2018-7-7", "17:51:00", 0022, "Entertainment", 28.86),
(22, "Uraban Outfit", "2016-2-22", "13:39:00", 7803, "Entertainment", 99.66),
(23, "Uraban Outfit", "2017-10-11", "4:56:00", 3743, "Entertainment", 79.67),
(24, "Uraban Outfit", "2016-5-10", "4:1:00", 0022, "Entertainment", 59.95),
(25, "Uraban Outfit", "2017-3-25", "18:51:00", 3743, "Clothing", 64.10),
(26, "Uraban Outfit", "2017-12-6", "16:2:00", 0912, "Food", 51.98),
(27, "HKUST", "2017-3-8", "13:37:00", 3928, "Food", 51.59),
(28, "HKUST", "2017-1-22", "19:50:00", 7803, "Bills", 30.2),
(29, "HKUST", "2018-11-27", "5:45:00", 3743, "Clothing", 84.70),
(30, "Uraban Outfit", "2015-10-10", "4:46:00", 3743, "Bills", 81.90),
(31, "HKUST", "2018-2-4", "21:20:00", 3743, "Bills", 90.50),
(32, "Uraban Outfit", "2017-3-23", "6:20:00", 3743, "Bills", 73.16),
(33, "HKUST", "2018-10-13", "7:51:00", 3829, "Bills", 85.60),
(34, "Uraban Outfit", "2016-6-4", "9:45:00", 3829, "Bills", 12.18),
(35, "HKUST", "2018-1-6", "9:3:00", 3928, "Bills", 69.25),
(36, "Uraban Outfit", "2016-9-8", "17:19:00", 7803, "Food", 66.78),
(37, "HKUST", "2018-2-12", "19:44:00", 3743, "Bills", 59.73),
(38, "HKUST", "2016-2-19", "8:1:00", 0912, "Clothing", 24.12),
(39, "Uraban Outfit", "2015-4-16", "5:5:00", 7803, "Food", 72.57),
(40, "HKUST", "2016-1-22", "5:22:00", 3829, "Bills", 99.77),
(41, "Uraban Outfit", "2016-5-14", "5:3:00", 3743, "Bills", 77.24),
(42, "HKUST", "2018-2-11", "19:28:00", 3829, "Food", 83.69),
(43, "Uraban Outfit", "2016-2-26", "20:52:00", 0022, "Clothing", 28.67),
(44, "HKUST", "2018-6-10", "10:48:00", 3829, "Clothing", 43.99),
(45, "HKUST", "2017-4-5", "10:8:00", 3928, "Entertainment", 87.31),
(46, "Uraban Outfit", "2017-1-16", "3:3:00", 0912, "Entertainment", 40.89),
(47, "HKUST", "2016-10-8", "4:23:00", 3743, "Bills", 89.84),
(48, "HKUST", "2016-1-8", "3:11:00", 7803, "Clothing", 92.20),
(49, "Uraban Outfit", "2016-8-3", "22:1:00", 0912, "Food", 60.20),
(50, "HKUST", "2015-10-27", "18:19:00", 7803, "Entertainment", 78.39),
(51, "HKUST", "2015-9-23", "7:44:00", 0022, "Food", 20.21),
(52, "HKUST", "2016-3-28", "6:55:00", 0022, "Bills", 75.11),
(53, "HKUST", "2016-2-8", "16:35:00", 3928, "Bills", 97.5),
(54, "Uraban Outfit", "2017-3-10", "23:19:00", 3743, "Entertainment", 35.81),
(55, "HKUST", "2017-7-15", "19:50:00", 0912, "Bills", 91.77),
(56, "Uraban Outfit", "2018-10-13", "16:4:00", 0912, "Clothing", 75.54),
(57, "HKUST", "2017-1-6", "8:12:00", 3928, "Entertainment", 61.34),
(58, "HKUST", "2018-9-19", "4:4:00", 3743, "Entertainment", 90.46),
(59, "Uraban Outfit", "2018-9-13", "4:56:00", 7803, "Food", 91.16),
(60, "HKUST", "2018-6-4", "4:51:00", 0912, "Bills", 96.91),
(61, "Uraban Outfit", "2018-11-16", "9:1:00", 0022, "Food", 5.40),
(62, "HKUST", "2016-2-17", "2:10:00", 3743, "Entertainment", 42.85),
(63, "Uraban Outfit", "2016-12-7", "12:57:00", 3829, "Bills", 21.53),
(64, "Uraban Outfit", "2018-10-14", "21:45:00", 3829, "Clothing", 41.93),
(65, "HKUST", "2016-10-26", "11:15:00", 3829, "Entertainment", 24.57),
(66, "HKUST", "2015-2-13", "21:26:00", 3829, "Clothing", 81.95),
(67, "Uraban Outfit", "2016-7-1", "22:22:00", 7803, "Entertainment", 66.42),
(68, "Uraban Outfit", "2017-12-27", "8:56:00", 3743, "Bills", 12.56),
(69, "Uraban Outfit", "2018-4-3", "12:52:00", 3743, "Food", 97.37),
(70, "Uraban Outfit", "2018-12-18", "5:23:00", 7803, "Entertainment", 99.80),
(71, "Uraban Outfit", "2016-5-23", "0:34:00", 3743, "Entertainment", 88.88),
(72, "HKUST", "2015-3-12", "21:9:00", 3743, "Food", 94.94),
(73, "Uraban Outfit", "2016-2-12", "17:0:00", 3829, "Bills", 76.68),
(74, "HKUST", "2017-8-5", "2:12:00", 3928, "Bills", 50.25),
(75, "HKUST", "2017-10-9", "10:6:00", 0912, "Clothing", 33.49),
(76, "Uraban Outfit", "2015-10-4", "12:43:00", 0912, "Bills", 67.56),
(77, "HKUST", "2016-3-5", "12:11:00", 3743, "Bills", 83.16),
(78, "Uraban Outfit", "2017-9-17", "22:16:00", 0022, "Entertainment", 74.63),
(79, "Uraban Outfit", "2015-6-8", "0:24:00", 3928, "Entertainment", 74.63),
(80, "HKUST", "2015-11-9", "7:19:00", 0912, "Clothing", 73.60),
(81, "HKUST", "2017-12-5", "2:38:00", 3928, "Entertainment", 67.22),
(82, "HKUST", "2015-3-19", "7:18:00", 3829, "Clothing", 98.99),
(83, "HKUST", "2015-9-12", "2:4:00", 3743, "Clothing", 89.38),
(84, "Uraban Outfit", "2017-4-12", "23:31:00", 3743, "Food", 9.15),
(85, "Uraban Outfit", "2018-11-13", "9:41:00", 7803, "Bills", 65.34),
(86, "HKUST", "2017-8-1", "6:31:00", 3829, "Entertainment", 28.31),
(87, "Uraban Outfit", "2018-11-16", "7:33:00", 3928, "Food", 70.24),
(88, "HKUST", "2016-9-21", "0:11:00", 0022, "Food", 46.12),
(89, "Uraban Outfit", "2018-2-7", "3:28:00", 0022, "Clothing", 72.39),
(90, "Uraban Outfit", "2016-8-11", "22:40:00", 0022, "Food", 92.90),
(91, "Uraban Outfit", "2016-7-25", "5:0:00", 7803, "Entertainment", 95.81),
(92, "Uraban Outfit", "2016-2-20", "21:29:00", 3829, "Entertainment", 77.4),
(93, "Uraban Outfit", "2017-11-28", "23:53:00", 3829, "Bills", 87.52),
(94, "HKUST", "2015-3-24", "11:26:00", 0022, "Bills", 92.89),
(95, "Uraban Outfit", "2016-6-24", "12:44:00", 0022, "Food", 81.9),
(96, "Uraban Outfit", "2018-2-18", "4:18:00", 0912, "Food", 77.5),
(97, "HKUST", "2016-4-2", "6:59:00", 0022, "Clothing", 96.49),
(98, "HKUST", "2018-11-27", "19:28:00", 7803, "Bills", 86.43),
(99, "HKUST", "2015-5-4", "15:40:00", 7803, "Clothing", 21.10),
(100, "Uraban Outfit", "2016-8-10", "10:49:00", 3928, "Clothing", 39.63),
(101, "Uraban Outfit", "2015-4-17", "22:22:00", 3829, "Entertainment", 74.97),
(102, "Uraban Outfit", "2015-3-22", "7:28:00", 3829, "Clothing", 46.95),
(103, "Uraban Outfit", "2015-7-22", "1:36:00", 3928, "Clothing", 62.85),
(104, "HKUST", "2016-12-12", "1:43:00", 3829, "Bills", 72.58),
(105, "HKUST", "2017-5-2", "11:2:00", 3743, "Clothing", 57.34),
(106, "HKUST", "2015-11-26", "16:32:00", 0912, "Food", 60.92),
(107, "Uraban Outfit", "2016-11-4", "1:17:00", 3743, "Food", 79.87),
(108, "HKUST", "2015-8-25", "23:27:00", 3829, "Bills", 32.35),
(109, "Uraban Outfit", "2018-3-8", "16:0:00", 3829, "Food", 41.30),
(110, "Uraban Outfit", "2015-12-15", "3:48:00", 7803, "Clothing", 86.70),
(111, "Uraban Outfit", "2015-9-10", "12:51:00", 3829, "Bills", 48.56),
(112, "Uraban Outfit", "2017-8-26", "10:34:00", 7803, "Bills", 82.44),
(113, "Uraban Outfit", "2018-8-16", "11:41:00", 3743, "Bills", 83.69),
(114, "HKUST", "2015-2-2", "17:26:00", 3743, "Clothing", 21.89),
(115, "HKUST", "2017-8-2", "15:44:00", 0912, "Clothing", 79.53),
(116, "Uraban Outfit", "2017-1-11", "9:12:00", 3829, "Food", 41.56),
(117, "HKUST", "2018-10-11", "10:31:00", 7803, "Entertainment", 73.40),
(118, "Uraban Outfit", "2016-8-25", "16:10:00", 3829, "Food", 90.99),
(119, "HKUST", "2015-1-22", "2:8:00", 3829, "Food", 46.55),
(120, "HKUST", "2018-11-2", "12:49:00", 0022, "Bills", 96.42),
(121, "Uraban Outfit", "2018-11-16", "23:35:00", 3928, "Food", 64.30),
(122, "Uraban Outfit", "2018-7-20", "20:17:00", 3928, "Clothing", 82.24),
(123, "HKUST", "2015-11-3", "6:40:00", 3743, "Clothing", 81.21),
(124, "HKUST", "2016-3-22", "9:57:00", 3928, "Clothing", 97.55),
(125, "HKUST", "2016-5-22", "15:8:00", 0022, "Clothing", 87.77),
(126, "HKUST", "2015-4-7", "20:32:00", 7803, "Entertainment", 88.86),
(127, "HKUST", "2016-11-2", "17:24:00", 0022, "Food", 29.27),
(128, "HKUST", "2016-1-28", "17:36:00", 3829, "Entertainment", 67.60),
(129, "Uraban Outfit", "2015-4-1", "3:57:00", 0022, "Food", 97.84),
(130, "Uraban Outfit", "2018-4-5", "19:30:00", 3829, "Bills", 45.10),
(131, "HKUST", "2015-2-21", "17:41:00", 3743, "Clothing", 91.25),
(132, "HKUST", "2016-2-13", "23:6:00", 3829, "Food", 92.85),
(133, "Uraban Outfit", "2017-10-24", "19:30:00", 3829, "Entertainment", 44.35),
(134, "HKUST", "2015-2-15", "22:1:00", 3829, "Food", 72.74),
(135, "Uraban Outfit", "2017-8-4", "17:54:00", 3829, "Clothing", 70.91),
(136, "Uraban Outfit", "2018-3-9", "1:3:00", 0912, "Food", 46.82),
(137, "HKUST", "2017-9-19", "9:17:00", 3928, "Entertainment", 57.52),
(138, "Uraban Outfit", "2018-5-14", "21:40:00", 3829, "Clothing", 60.80),
(139, "HKUST", "2015-5-20", "16:6:00", 7803, "Bills", 15.28),
(140, "HKUST", "2017-12-18", "8:29:00", 7803, "Clothing", 95.78),
(141, "Uraban Outfit", "2015-10-5", "22:43:00", 3928, "Entertainment", 86.68),
(142, "HKUST", "2017-2-27", "2:27:00", 3928, "Food", 59.62),
(143, "Uraban Outfit", "2018-3-22", "17:56:00", 3928, "Entertainment", 44.61),
(144, "HKUST", "2015-10-15", "0:17:00", 3829, "Clothing", 79.80),
(145, "HKUST", "2018-11-23", "17:36:00", 0022, "Food", 83.62),
(146, "HKUST", "2016-11-5", "23:39:00", 7803, "Bills", 65.89),
(147, "HKUST", "2017-12-13", "13:29:00", 7803, "Food", 59.82),
(148, "Uraban Outfit", "2015-7-15", "2:45:00", 0912, "Clothing", 37.45),
(149, "HKUST", "2016-8-22", "15:54:00", 0912, "Food", 49.56),
(150, "Uraban Outfit", "2018-6-22", "12:10:00", 7803, "Entertainment", 82.25),
(151, "Uraban Outfit", "2017-3-28", "21:25:00", 0022, "Food", 82.96),
(152, "Uraban Outfit", "2015-12-10", "10:22:00", 0022, "Clothing", 48.25),
(153, "HKUST", "2015-6-12", "20:16:00", 3928, "Bills", 58.55),
(154, "Uraban Outfit", "2017-6-1", "2:21:00", 7803, "Food", 79.24),
(155, "Uraban Outfit", "2017-3-14", "15:6:00", 0912, "Bills", 93.30),
(156, "Uraban Outfit", "2016-2-10", "0:49:00", 3829, "Bills", 92.6),
(157, "Uraban Outfit", "2018-2-24", "0:45:00", 3928, "Bills", 85.46),
(158, "Uraban Outfit", "2015-11-28", "2:40:00", 7803, "Clothing", 50.36),
(159, "Uraban Outfit", "2017-10-1", "15:1:00", 0022, "Entertainment", 60.36),
(160, "Uraban Outfit", "2017-5-3", "21:12:00", 3928, "Bills", 59.10),
(161, "Uraban Outfit", "2017-7-28", "7:37:00", 7803, "Food", 46.3),
(162, "Uraban Outfit", "2017-10-10", "4:44:00", 0912, "Clothing", 68.6),
(163, "Uraban Outfit", "2016-11-10", "11:18:00", 3743, "Entertainment", 87.85),
(164, "Uraban Outfit", "2018-4-8", "2:9:00", 3743, "Bills", 63.11),
(165, "HKUST", "2018-6-2", "1:38:00", 7803, "Clothing", 90.75),
(166, "Uraban Outfit", "2017-10-10", "8:43:00", 7803, "Bills", 19.17),
(167, "Uraban Outfit", "2016-4-26", "8:35:00", 0022, "Bills", 78.48),
(168, "Uraban Outfit", "2018-8-6", "21:38:00", 7803, "Food", 95.67),
(169, "Uraban Outfit", "2018-5-15", "21:4:00", 3743, "Entertainment", 88.63),
(170, "Uraban Outfit", "2017-11-19", "10:44:00", 3829, "Food", 98.11),
(171, "Uraban Outfit", "2017-8-24", "22:14:00", 0022, "Clothing", 94.52),
(172, "Uraban Outfit", "2016-11-24", "2:31:00", 3928, "Entertainment", 89.8),
(173, "HKUST", "2015-6-4", "10:48:00", 0022, "Bills", 91.15),
(174, "HKUST", "2017-7-1", "17:7:00", 3743, "Food", 73.82),
(175, "HKUST", "2015-6-6", "22:18:00", 0912, "Clothing", 28.85),
(176, "HKUST", "2016-5-13", "4:59:00", 3928, "Bills", 65.95),
(177, "Uraban Outfit", "2018-12-23", "13:27:00", 0022, "Bills", 54.67),
(178, "HKUST", "2015-2-18", "7:31:00", 0912, "Entertainment", 68.18),
(179, "Uraban Outfit", "2016-3-28", "10:0:00", 7803, "Entertainment", 66.74),
(180, "Uraban Outfit", "2018-4-2", "0:3:00", 7803, "Clothing", 47.2),
(181, "Uraban Outfit", "2015-6-4", "0:38:00", 7803, "Food", 92.90),
(182, "HKUST", "2018-5-28", "14:53:00", 0912, "Clothing", 92.8),
(183, "HKUST", "2016-4-7", "14:18:00", 3928, "Bills", 67.64),
(184, "Uraban Outfit", "2018-7-22", "14:47:00", 3928, "Bills", 63.52),
(185, "Uraban Outfit", "2016-8-21", "18:46:00", 3743, "Food", 90.88),
(186, "HKUST", "2015-10-4", "15:12:00", 3829, "Bills", 53.61),
(187, "Uraban Outfit", "2017-5-20", "15:2:00", 7803, "Food", 98.95),
(188, "HKUST", "2018-1-20", "14:8:00", 3743, "Clothing", 71.77),
(189, "HKUST", "2016-2-1", "0:18:00", 3928, "Clothing", 46.48),
(190, "Uraban Outfit", "2016-1-6", "5:13:00", 3743, "Entertainment", 96.74),
(191, "Uraban Outfit", "2016-11-7", "8:17:00", 3743, "Clothing", 88.74),
(192, "Uraban Outfit", "2016-6-4", "20:4:00", 3743, "Entertainment", 96.61),
(193, "Uraban Outfit", "2017-5-14", "14:8:00", 3743, "Food", 44.82),
(194, "Uraban Outfit", "2016-9-14", "19:21:00", 7803, "Entertainment", 79.87),
(195, "HKUST", "2016-4-9", "10:56:00", 7803, "Entertainment", 42.50),
(196, "Uraban Outfit", "2017-12-16", "18:35:00", 3928, "Entertainment", 56.65),
(197, "HKUST", "2018-11-21", "6:26:00", 3928, "Clothing", 65.75),
(198, "HKUST", "2015-2-13", "8:27:00", 3829, "Clothing", 78.95),
(199, "HKUST", "2017-6-7", "3:20:00", 3829, "Entertainment", 88.80),
(200, "HKUST", "2016-6-11", "8:9:00", 7803, "Bills", 73.2),
(201, "HKUST", "2015-10-8", "13:20:00", 7803, "Clothing", 40.82),
(202, "HKUST", "2017-12-5", "13:57:00", 3743, "Food", 77.65),
(203, "HKUST", "2017-9-4", "7:45:00", 7803, "Entertainment", 99.59),
(204, "HKUST", "2018-4-6", "1:0:00", 3743, "Entertainment", 95.93),
(205, "Uraban Outfit", "2018-7-22", "3:3:00", 3928, "Entertainment", 61.84),
(206, "HKUST", "2018-12-13", "3:57:00", 3829, "Clothing", 93.36),
(207, "Uraban Outfit", "2015-5-22", "11:1:00", 3829, "Food", 20.80),
(208, "Uraban Outfit", "2018-2-27", "7:27:00", 3829, "Clothing", 81.27),
(209, "Uraban Outfit", "2016-12-11", "22:39:00", 3743, "Clothing", 96.83),
(210, "HKUST", "2018-3-12", "9:47:00", 3743, "Food", 91.67),
(211, "HKUST", "2016-6-10", "17:19:00", 0022, "Entertainment", 15.12),
(212, "Uraban Outfit", "2016-7-8", "21:19:00", 3928, "Food", 70.64),
(213, "Uraban Outfit", "2017-10-5", "4:6:00", 3743, "Clothing", 58.70),
(214, "HKUST", "2015-10-7", "14:59:00", 3743, "Clothing", 61.26),
(215, "Uraban Outfit", "2018-7-11", "13:0:00", 3928, "Clothing", 65.17),
(216, "Uraban Outfit", "2017-3-18", "0:30:00", 3829, "Food", 52.6),
(217, "HKUST", "2017-5-26", "12:33:00", 0912, "Entertainment", 16.98),
(218, "HKUST", "2017-7-20", "10:5:00", 0912, "Bills", 43.96),
(219, "HKUST", "2015-12-27", "21:16:00", 3829, "Clothing", 77.32),
(220, "HKUST", "2018-6-20", "15:15:00", 3743, "Food", 63.29),
(221, "HKUST", "2018-12-4", "6:23:00", 3928, "Food", 42.57),
(222, "Uraban Outfit", "2016-2-9", "15:36:00", 3928, "Food", 56.94),
(223, "Uraban Outfit", "2018-4-12", "11:22:00", 7803, "Bills", 59.62),
(224, "HKUST", "2015-6-11", "12:36:00", 3829, "Food", 95.68),
(225, "HKUST", "2018-12-22", "5:0:00", 3928, "Food", 59.37),
(226, "HKUST", "2015-11-25", "12:34:00", 3743, "Food", 55.98),
(227, "Uraban Outfit", "2015-7-14", "4:58:00", 0022, "Entertainment", 37.5),
(228, "HKUST", "2016-1-23", "9:37:00", 0912, "Clothing", 23.66),
(229, "Uraban Outfit", "2016-5-27", "6:40:00", 3743, "Bills", 94.14),
(230, "HKUST", "2018-4-25", "20:8:00", 0022, "Clothing", 27.19),
(231, "Uraban Outfit", "2016-1-2", "17:35:00", 7803, "Entertainment", 61.79),
(232, "HKUST", "2018-6-1", "14:34:00", 7803, "Bills", 72.74),
(233, "HKUST", "2017-7-12", "18:45:00", 7803, "Bills", 72.89),
(234, "HKUST", "2015-4-18", "10:34:00", 0912, "Bills", 83.7),
(235, "Uraban Outfit", "2017-10-14", "21:45:00", 3829, "Entertainment", 68.87),
(236, "Uraban Outfit", "2016-12-20", "4:2:00", 0912, "Bills", 25.84),
(237, "Uraban Outfit", "2017-2-8", "2:6:00", 3928, "Food", 92.19),
(238, "HKUST", "2015-10-10", "12:50:00", 0912, "Bills", 88.25),
(239, "HKUST", "2018-2-9", "23:52:00", 7803, "Clothing", 31.3),
(240, "HKUST", "2015-2-15", "14:25:00", 3829, "Entertainment", 39.33),
(241, "Uraban Outfit", "2018-3-28", "20:28:00", 3928, "Entertainment", 18.80),
(242, "Uraban Outfit", "2018-10-10", "10:50:00", 3743, "Bills", 96.40),
(243, "Uraban Outfit", "2018-11-19", "22:34:00", 3928, "Entertainment", 15.98),
(244, "HKUST", "2018-1-22", "23:0:00", 7803, "Clothing", 65.31),
(245, "HKUST", "2015-7-13", "8:17:00", 3743, "Clothing", 45.1),
(246, "Uraban Outfit", "2018-11-15", "13:38:00", 0912, "Clothing", 43.8),
(247, "HKUST", "2018-11-7", "7:55:00", 3743, "Clothing", 53.7),
(248, "Uraban Outfit", "2018-5-25", "15:43:00", 3928, "Food", 78.84),
(249, "Uraban Outfit", "2018-11-18", "23:1:00", 0022, "Food", 91.12),
(250, "HKUST", "2018-6-13", "10:39:00", 0912, "Food", 46.40),
(251, "HKUST", "2015-7-1", "22:45:00", 3928, "Entertainment", 80.7),
(252, "HKUST", "2018-9-1", "15:49:00", 3928, "Clothing", 69.10),
(253, "HKUST", "2017-11-13", "8:36:00", 3829, "Food", 40.7),
(254, "HKUST", "2018-8-21", "1:57:00", 0912, "Entertainment", 92.57),
(255, "HKUST", "2016-8-1", "21:2:00", 0912, "Bills", 72.20),
(256, "Uraban Outfit", "2018-5-27", "4:3:00", 0022, "Clothing", 63.31),
(257, "HKUST", "2016-8-7", "1:4:00", 3743, "Clothing", 63.38),
(258, "HKUST", "2017-1-24", "5:32:00", 3928, "Food", 30.95),
(259, "HKUST", "2016-11-17", "14:9:00", 3829, "Bills", 85.35),
(260, "Uraban Outfit", "2017-2-14", "23:46:00", 3928, "Clothing", 63.65),
(261, "Uraban Outfit", "2016-9-23", "3:24:00", 0022, "Bills", 99.53),
(262, "Uraban Outfit", "2015-7-21", "1:45:00", 3743, "Food", 37.28),
(263, "Uraban Outfit", "2015-7-17", "3:4:00", 0912, "Clothing", 97.66),
(264, "HKUST", "2015-4-7", "13:12:00", 7803, "Entertainment", 58.38),
(265, "HKUST", "2016-5-1", "9:9:00", 3928, "Entertainment", 73.33),
(266, "Uraban Outfit", "2017-12-22", "19:50:00", 0022, "Entertainment", 81.46),
(267, "HKUST", "2017-2-24", "22:31:00", 0022, "Bills", 98.69),
(268, "HKUST", "2016-11-20", "18:3:00", 7803, "Bills", 60.82),
(269, "HKUST", "2016-8-9", "7:6:00", 3743, "Bills", 65.7),
(270, "Uraban Outfit", "2017-12-8", "20:28:00", 3829, "Clothing", 54.57),
(271, "HKUST", "2018-7-2", "20:30:00", 3829, "Bills", 87.8),
(272, "Uraban Outfit", "2018-12-15", "17:6:00", 3928, "Food", 43.63),
(273, "HKUST", "2017-9-8", "10:12:00", 3928, "Entertainment", 44.77),
(274, "HKUST", "2018-10-22", "5:30:00", 3829, "Bills", 81.62),
(275, "Uraban Outfit", "2015-2-27", "6:15:00", 3928, "Entertainment", 27.63),
(276, "HKUST", "2017-8-24", "2:45:00", 3829, "Bills", 55.34),
(277, "HKUST", "2017-7-24", "20:43:00", 0912, "Entertainment", 76.4),
(278, "HKUST", "2016-4-22", "2:42:00", 0912, "Bills", 81.22),
(279, "Uraban Outfit", "2016-3-1", "21:20:00", 3743, "Clothing", 85.50),
(280, "Uraban Outfit", "2017-7-2", "20:24:00", 3928, "Food", 80.78),
(281, "HKUST", "2017-1-28", "23:55:00", 3928, "Bills", 86.17),
(282, "HKUST", "2017-9-12", "16:47:00", 3743, "Entertainment", 78.53),
(283, "HKUST", "2016-6-5", "12:14:00", 7803, "Bills", 69.14),
(284, "HKUST", "2016-11-9", "12:5:00", 3928, "Clothing", 46.32),
(285, "Uraban Outfit", "2018-6-8", "7:20:00", 0912, "Clothing", 38.14),
(286, "HKUST", "2016-4-9", "3:4:00", 0912, "Bills", 66.98),
(287, "Uraban Outfit", "2018-10-20", "3:15:00", 3743, "Bills", 57.32),
(288, "Uraban Outfit", "2016-4-8", "18:12:00", 0022, "Entertainment", 83.84),
(289, "HKUST", "2017-4-12", "10:46:00", 3829, "Food", 64.26),
(290, "HKUST", "2017-11-1", "6:50:00", 3928, "Entertainment", 72.43),
(291, "Uraban Outfit", "2017-10-16", "22:9:00", 3928, "Bills", 88.40),
(292, "HKUST", "2016-11-24", "5:33:00", 0022, "Clothing", 35.67),
(293, "HKUST", "2016-5-22", "5:10:00", 3928, "Bills", 99.38),
(294, "HKUST", "2016-6-21", "7:1:00", 0912, "Entertainment", 83.73),
(295, "Uraban Outfit", "2017-5-5", "12:4:00", 0022, "Bills", 37.52),
(296, "HKUST", "2017-3-14", "21:35:00", 3743, "Bills", 91.10),
(297, "Uraban Outfit", "2016-11-21", "5:3:00", 7803, "Clothing", 80.61),
(298, "Uraban Outfit", "2017-11-8", "1:8:00", 0022, "Entertainment", 22.27),
(299, "Uraban Outfit", "2016-2-28", "10:2:00", 0022, "Food", 96.13);

INSERT INTO ITEM(receipt_id, name, price) VALUES
(0, "Ticket", 18.77),
(0, "Shirt", 30.15),
(1, "Box", 30.82),
(1, "Phone", 4.51),
(2, "Shirt", 22.60),
(2, "Ticket", 8.45),
(2, "Shirt", 20.9),
(3, "Box", 30.3),
(3, "Shirt", 26.96),
(4, "Box", 9.83),
(4, "Shirt", 19.66),
(5, "apple", 13.50),
(5, "Pant", 17.43),
(6, "Shirt", 22.42),
(6, "Water", 22.22),
(7, "Pant", 29.67),
(7, "Cya", 6.10),
(8, "Pant", 28.80),
(8, "Water", 29.24),
(9, "Cya", 22.98),
(9, "orange", 27.61),
(9, "Water", 8.49),
(9, "apple", 30.96),
(10, "Box", 21.60),
(10, "orange", 8.69),
(11, "Pant", 19.5),
(11, "Box", 27.8),
(12, "Ticket", 13.1),
(12, "apple", 17.42),
(13, "Ticket", 31.2),
(13, "Backpack", 25.1),
(14, "Phone", 25.78),
(14, "orange", 27.24),
(14, "Box", 27.7),
(15, "Water", 13.30),
(15, "orange", 21.49),
(16, "Ticket", 24.33),
(16, "Pant", 31.31),
(17, "Pant", 21.70),
(17, "apple", 19.62),
(18, "Shirt", 30.67),
(18, "orange", 28.97),
(19, "Box", 13.4),
(19, "Pant", 16.50),
(19, "Shirt", 16.46),
(19, "Shirt", 15.3),
(20, "Box", 19.76),
(20, "Phone", 29.11),
(21, "orange", 28.89),
(21, "Backpack", 23.64),
(21, "Box", 26.29),
(22, "orange", 6.89),
(22, "Shirt", 25.34),
(23, "Shirt", 25.57),
(23, "Ticket", 24.71),
(23, "Shirt", 25.2),
(23, "Box", 20.76),
(24, "Ticket", 5.35),
(24, "orange", 31.71),
(24, "apple", 14.64),
(24, "Ticket", 13.64),
(25, "Shirt", 8.98),
(25, "Backpack", 22.23),
(25, "Shirt", 11.40),
(25, "Phone", 31.74),
(26, "orange", 18.94),
(26, "Water", 18.27),
(27, "Box", 29.83),
(27, "Box", 14.14),
(28, "Backpack", 12.26),
(28, "Backpack", 21.7),
(29, "Shirt", 15.77),
(29, "Water", 6.81),
(30, "Ticket", 13.64),
(30, "Water", 24.5),
(31, "Cya", 25.52),
(31, "Ticket", 20.79),
(31, "Shirt", 16.14),
(31, "Ticket", 30.25),
(32, "Cya", 25.58),
(32, "Backpack", 16.73),
(32, "Phone", 10.88),
(32, "Water", 9.90),
(33, "Ticket", 27.68),
(33, "Backpack", 28.26),
(33, "orange", 30.76),
(34, "Backpack", 17.47),
(34, "orange", 26.85),
(35, "apple", 14.64),
(35, "Shirt", 18.30),
(36, "Phone", 18.3),
(36, "Phone", 23.62),
(37, "Shirt", 26.6),
(37, "apple", 11.72),
(38, "Box", 9.12),
(38, "Phone", 13.27),
(39, "Shirt", 28.19),
(39, "apple", 25.81),
(40, "Water", 19.4),
(40, "Cya", 1.49),
(40, "orange", 27.49),
(41, "Cya", 16.74),
(41, "Phone", 28.7),
(42, "Water", 15.83),
(42, "apple", 14.37),
(43, "Cya", 8.6),
(43, "Box", 25.96),
(44, "Ticket", 15.43),
(44, "Phone", 17.77),
(44, "Shirt", 24.7),
(44, "Cya", 25.48),
(45, "orange", 25.67),
(45, "Backpack", 13.98),
(45, "Shirt", 19.17),
(45, "Pant", 18.63),
(46, "Cya", 21.27),
(46, "Box", 24.77),
(46, "Phone", 25.33),
(47, "Box", 20.21),
(47, "apple", 15.60),
(48, "Ticket", 10.43),
(48, "orange", 9.10),
(49, "Ticket", 27.94),
(49, "Backpack", 15.2),
(49, "Ticket", 28.63),
(50, "apple", 11.83),
(50, "Phone", 23.0),
(51, "Pant", 11.4),
(51, "apple", 27.91),
(52, "Ticket", 19.40),
(52, "Cya", 28.35),
(53, "Pant", 11.87),
(53, "apple", 22.69),
(53, "Box", 25.91),
(53, "Ticket", 20.9),
(54, "Cya", 14.38),
(54, "Backpack", 13.3),
(55, "Cya", 3.17),
(55, "Cya", 24.6),
(56, "Shirt", 29.2),
(56, "Backpack", 7.14),
(56, "Backpack", 23.30),
(56, "Water", 31.90),
(57, "Shirt", 9.60),
(57, "Box", 25.65),
(58, "Water", 27.18),
(58, "Ticket", 26.66),
(59, "Pant", 20.81),
(59, "Cya", 29.37),
(59, "Ticket", 29.59),
(59, "Water", 29.32),
(60, "Ticket", 3.39),
(60, "Water", 15.29),
(61, "Cya", 13.13),
(61, "Backpack", 23.69),
(62, "Backpack", 24.4),
(62, "Phone", 26.2),
(63, "Phone", 16.84),
(63, "apple", 8.26),
(64, "Backpack", 29.76),
(64, "Backpack", 30.0),
(64, "Backpack", 30.64),
(65, "Backpack", 19.54),
(65, "orange", 22.76),
(66, "orange", 26.55),
(66, "Shirt", 23.40),
(67, "Phone", 20.4),
(67, "Ticket", 19.71),
(67, "Box", 31.5),
(67, "Box", 9.48),
(68, "Shirt", 24.51),
(68, "Shirt", 31.96),
(69, "Shirt", 19.68),
(69, "Phone", 20.21),
(69, "Water", 17.14),
(69, "Cya", 8.66),
(70, "Shirt", 19.5),
(70, "apple", 28.23),
(71, "Water", 13.61),
(71, "Shirt", 13.61),
(72, "Box", 26.15),
(72, "Shirt", 23.59),
(73, "Backpack", 31.2),
(73, "Box", 26.43),
(74, "Pant", 30.79),
(74, "apple", 21.88),
(75, "Pant", 24.32),
(75, "Phone", 20.42),
(76, "Box", 14.64),
(76, "Backpack", 12.30),
(77, "Shirt", 13.10),
(77, "Water", 30.97),
(77, "apple", 24.54),
(77, "Phone", 18.42),
(78, "apple", 24.79),
(78, "Water", 28.35),
(79, "Phone", 7.49),
(79, "Ticket", 18.61),
(79, "Cya", 28.46),
(80, "Water", 20.93),
(80, "Cya", 18.79),
(81, "Shirt", 30.11),
(81, "Backpack", 31.90),
(82, "Pant", 11.68),
(82, "orange", 19.48),
(82, "orange", 25.73),
(83, "Box", 7.95),
(83, "Backpack", 15.16),
(84, "Water", 29.77),
(84, "orange", 14.86),
(85, "Shirt", 21.99),
(85, "orange", 16.93),
(85, "Box", 14.13),
(86, "Shirt", 23.29),
(86, "Ticket", 11.69),
(87, "orange", 28.60),
(87, "Ticket", 19.51),
(87, "Pant", 22.32),
(87, "orange", 25.37),
(88, "orange", 30.57),
(88, "Backpack", 21.41),
(89, "Shirt", 27.70),
(89, "Shirt", 22.78),
(90, "Phone", 16.81),
(90, "Pant", 28.54),
(90, "orange", 29.63),
(91, "Backpack", 18.5),
(91, "Ticket", 21.56),
(91, "Backpack", 18.83),
(92, "orange", 4.89),
(92, "Box", 22.11),
(93, "Water", 18.69),
(93, "Box", 23.85),
(94, "Water", 20.90),
(94, "Cya", 13.80),
(95, "Backpack", 23.47),
(95, "orange", 30.48),
(96, "apple", 25.89),
(96, "Box", 31.43),
(97, "orange", 29.82),
(97, "Box", 10.21),
(98, "apple", 4.60),
(98, "Ticket", 26.1),
(98, "Water", 30.51),
(98, "orange", 2.73),
(99, "Phone", 7.51),
(99, "Water", 27.94),
(99, "Cya", 6.31),
(99, "apple", 29.61),
(100, "Shirt", 24.46),
(100, "orange", 8.69),
(101, "Shirt", 25.75),
(101, "Backpack", 16.38),
(102, "Box", 24.72),
(102, "orange", 19.61),
(103, "Pant", 25.4),
(103, "Backpack", 3.87),
(104, "Shirt", 29.70),
(104, "apple", 16.47),
(105, "Ticket", 5.59),
(105, "Box", 16.12),
(106, "Water", 20.34),
(106, "Phone", 25.93),
(107, "Phone", 28.43),
(107, "Water", 16.82),
(107, "Backpack", 28.41),
(108, "Cya", 22.12),
(108, "Shirt", 21.80),
(108, "Pant", 16.6),
(109, "Water", 21.40),
(109, "Water", 28.15),
(109, "Water", 29.16),
(109, "orange", 20.33),
(110, "Water", 26.74),
(110, "Phone", 28.40),
(111, "Shirt", 30.48),
(111, "Water", 26.86),
(111, "Box", 14.19),
(112, "Phone", 14.43),
(112, "Pant", 15.93),
(112, "Backpack", 23.54),
(112, "Backpack", 14.26),
(113, "Phone", 20.20),
(113, "Shirt", 24.47),
(113, "Box", 29.30),
(114, "Phone", 20.54),
(114, "Phone", 29.89),
(115, "Box", 21.30),
(115, "Water", 13.57),
(116, "Phone", 11.69),
(116, "Water", 28.7),
(117, "Water", 12.92),
(117, "Box", 16.33),
(118, "Cya", 19.97),
(118, "Ticket", 30.12),
(119, "Pant", 13.12),
(119, "apple", 22.93),
(119, "Cya", 23.30),
(120, "Pant", 26.96),
(120, "Backpack", 13.95),
(121, "Phone", 7.75),
(121, "Backpack", 0.97),
(121, "Shirt", 30.28),
(121, "Shirt", 21.84),
(122, "Water", 26.10),
(122, "Backpack", 25.72),
(122, "Backpack", 20.4),
(123, "orange", 23.70),
(123, "apple", 2.15),
(124, "orange", 23.25),
(124, "Phone", 12.78),
(125, "Shirt", 22.87),
(125, "Box", 22.29),
(126, "apple", 20.13),
(126, "Water", 23.21),
(126, "Ticket", 29.27),
(127, "Box", 29.75),
(127, "Pant", 16.42),
(128, "orange", 6.75),
(128, "Pant", 15.55),
(128, "Shirt", 10.36),
(128, "Pant", 30.14),
(129, "Cya", 20.13),
(129, "orange", 16.95),
(130, "Backpack", 22.14),
(130, "Cya", 16.86),
(131, "Pant", 17.98),
(131, "apple", 22.39),
(132, "Pant", 19.75),
(132, "Cya", 0.94),
(132, "apple", 25.40),
(133, "orange", 10.43),
(133, "Ticket", 30.94),
(134, "Phone", 26.93),
(134, "Ticket", 24.26),
(135, "Shirt", 19.51),
(135, "Phone", 30.45),
(135, "Phone", 30.87),
(136, "Water", 8.52),
(136, "Shirt", 23.34),
(136, "Shirt", 21.80),
(136, "Backpack", 24.31),
(137, "Backpack", 21.66),
(137, "Backpack", 5.97),
(138, "Ticket", 16.15),
(138, "Phone", 27.72),
(139, "Ticket", 29.64),
(139, "Cya", 30.1),
(140, "Backpack", 12.73),
(140, "Phone", 17.78),
(141, "Shirt", 27.47),
(141, "apple", 13.19),
(142, "Backpack", 28.75),
(142, "Box", 28.77),
(143, "Pant", 14.14),
(143, "Backpack", 21.13),
(143, "Box", 26.21),
(143, "orange", 24.39),
(144, "Pant", 15.72),
(144, "orange", 31.58),
(144, "Shirt", 22.97),
(144, "orange", 22.66),
(145, "Water", 26.26),
(145, "orange", 26.46),
(145, "orange", 25.34),
(145, "Cya", 28.68),
(146, "Phone", 17.72),
(146, "Water", 24.68),
(147, "Shirt", 20.83),
(147, "orange", 28.98),
(147, "Backpack", 22.3),
(147, "Water", 30.57),
(148, "Ticket", 26.83),
(148, "orange", 31.45),
(148, "Shirt", 17.8),
(149, "Cya", 16.29),
(149, "Cya", 23.37),
(150, "orange", 25.27),
(150, "Cya", 30.9),
(151, "Water", 25.33),
(151, "apple", 27.28),
(152, "Ticket", 26.30),
(152, "Pant", 21.57),
(152, "Backpack", 25.57),
(152, "Shirt", 19.44),
(153, "Shirt", 17.18),
(153, "Cya", 12.51),
(153, "apple", 29.60),
(154, "Box", 26.9),
(154, "orange", 30.92),
(155, "apple", 6.8),
(155, "Ticket", 11.42),
(156, "Phone", 23.60),
(156, "Pant", 24.83),
(157, "Backpack", 20.57),
(157, "Shirt", 19.90),
(157, "Box", 20.82),
(158, "Pant", 27.92),
(158, "Pant", 23.67),
(158, "Water", 10.86),
(159, "Backpack", 31.56),
(159, "apple", 31.97),
(159, "Water", 19.46),
(160, "Shirt", 4.96),
(160, "orange", 23.87),
(161, "orange", 29.26),
(161, "Ticket", 15.93),
(162, "Backpack", 28.52),
(162, "Ticket", 23.45),
(163, "Phone", 25.98),
(163, "Cya", 29.71),
(164, "Pant", 10.47),
(164, "Phone", 26.17),
(165, "Water", 19.69),
(165, "Box", 30.59),
(166, "Water", 5.27),
(166, "Phone", 29.94),
(166, "apple", 7.26),
(166, "Water", 18.90),
(167, "Ticket", 11.58),
(167, "Backpack", 24.68),
(167, "orange", 12.74),
(167, "Water", 28.53),
(168, "apple", 23.62),
(168, "Phone", 28.78),
(168, "Water", 14.29),
(169, "Water", 15.28),
(169, "apple", 28.63),
(170, "Phone", 27.18),
(170, "Ticket", 20.48),
(170, "Cya", 22.50),
(170, "apple", 30.51),
(171, "apple", 15.76),
(171, "Phone", 20.64),
(171, "orange", 12.10),
(171, "Pant", 29.98),
(172, "apple", 24.65),
(172, "Ticket", 19.22),
(173, "Box", 31.70),
(173, "Box", 23.97),
(174, "Pant", 30.54),
(174, "apple", 11.52),
(174, "Ticket", 3.16),
(175, "apple", 29.84),
(175, "Shirt", 19.19),
(176, "Pant", 25.16),
(176, "orange", 8.57),
(177, "Cya", 24.11),
(177, "Water", 15.17),
(178, "Cya", 28.86),
(178, "Shirt", 19.36),
(179, "Shirt", 22.48),
(179, "orange", 25.36),
(180, "Ticket", 11.68),
(180, "Cya", 23.79),
(181, "Shirt", 20.99),
(181, "Backpack", 25.67),
(181, "Shirt", 6.11),
(182, "Backpack", 18.79),
(182, "Box", 15.47),
(183, "Cya", 20.97),
(183, "orange", 4.13),
(184, "Pant", 4.52),
(184, "Ticket", 30.88),
(185, "Cya", 12.76),
(185, "Water", 19.75),
(186, "Phone", 16.70),
(186, "Water", 20.38),
(187, "orange", 28.51),
(187, "apple", 8.10),
(188, "orange", 20.92),
(188, "Shirt", 21.80),
(188, "Phone", 26.80),
(189, "apple", 27.4),
(189, "Ticket", 9.97),
(190, "apple", 21.94),
(190, "Water", 10.3),
(190, "Backpack", 15.96),
(191, "Pant", 9.86),
(191, "orange", 25.0),
(192, "Backpack", 26.4),
(192, "Shirt", 25.31),
(192, "Box", 13.5),
(192, "Phone", 14.76),
(193, "Water", 19.31),
(193, "Backpack", 13.98),
(193, "Water", 29.53),
(193, "Cya", 23.5),
(194, "Pant", 31.68),
(194, "Shirt", 28.40),
(195, "Box", 29.43),
(195, "Pant", 20.87),
(196, "Pant", 19.13),
(196, "Ticket", 22.11),
(197, "Water", 17.42),
(197, "Cya", 15.49),
(197, "orange", 19.37),
(198, "orange", 29.86),
(198, "Backpack", 22.94),
(199, "Water", 19.76),
(199, "Water", 12.70),
(200, "Phone", 18.2),
(200, "Cya", 28.91),
(201, "apple", 27.21),
(201, "Water", 28.90),
(202, "orange", 28.48),
(202, "Shirt", 13.37),
(203, "Backpack", 12.82),
(203, "apple", 29.41),
(204, "Pant", 30.89),
(204, "Box", 5.92),
(204, "Box", 12.57),
(205, "Phone", 15.48),
(205, "Pant", 26.1),
(206, "Box", 18.68),
(206, "apple", 15.18),
(207, "apple", 29.28),
(207, "Shirt", 22.10),
(208, "Water", 28.18),
(208, "Box", 15.48),
(209, "Ticket", 26.7),
(209, "Backpack", 22.43),
(210, "orange", 16.49),
(210, "Cya", 31.90),
(211, "orange", 23.49),
(211, "Box", 25.68),
(212, "Box", 27.8),
(212, "Phone", 11.11),
(212, "Pant", 28.59),
(213, "orange", 28.86),
(213, "Shirt", 28.40),
(214, "orange", 17.78),
(214, "Ticket", 31.48),
(215, "orange", 15.17),
(215, "Backpack", 9.2),
(215, "Ticket", 15.22),
(216, "Water", 21.28),
(216, "Water", 15.46),
(217, "Pant", 25.4),
(217, "Backpack", 17.41),
(218, "Backpack", 12.18),
(218, "Backpack", 29.93),
(219, "Backpack", 21.94),
(219, "Ticket", 25.49),
(219, "Backpack", 26.95),
(220, "Ticket", 28.14),
(220, "Shirt", 24.27),
(220, "Ticket", 31.93),
(220, "apple", 20.94),
(221, "Shirt", 28.91),
(221, "Shirt", 15.86),
(222, "Water", 21.51),
(222, "Phone", 19.24),
(222, "Ticket", 30.23),
(223, "Box", 19.47),
(223, "apple", 3.83),
(224, "Pant", 21.30),
(224, "apple", 21.31),
(225, "apple", 25.25),
(225, "Ticket", 30.36),
(225, "Water", 14.21),
(225, "Phone", 16.68),
(226, "Phone", 29.69),
(226, "orange", 16.70),
(226, "Box", 16.30),
(226, "Cya", 19.98),
(227, "apple", 14.3),
(227, "Shirt", 30.68),
(228, "Water", 24.71),
(228, "Backpack", 20.61),
(228, "Phone", 15.17),
(228, "Water", 30.24),
(229, "Backpack", 25.12),
(229, "apple", 21.72),
(229, "Backpack", 26.84),
(229, "Phone", 3.14),
(230, "orange", 12.83),
(230, "Ticket", 18.79),
(231, "Water", 25.63),
(231, "Pant", 30.85),
(231, "Cya", 21.22),
(231, "apple", 13.69),
(232, "Box", 11.61),
(232, "Phone", 24.86),
(233, "Shirt", 29.8),
(233, "Ticket", 21.51),
(233, "Box", 28.22),
(234, "Box", 30.10),
(234, "Backpack", 7.62),
(235, "Phone", 13.42),
(235, "Water", 31.25),
(236, "Phone", 27.92),
(236, "Box", 19.79),
(237, "apple", 12.14),
(237, "Backpack", 22.56),
(238, "Pant", 14.7),
(238, "Ticket", 14.43),
(238, "orange", 31.17),
(239, "Phone", 18.77),
(239, "Water", 18.37),
(240, "orange", 28.39),
(240, "Backpack", 15.71),
(241, "Cya", 29.50),
(241, "Ticket", 11.76),
(241, "Backpack", 21.41),
(242, "Cya", 20.50),
(242, "orange", 25.58),
(243, "Pant", 6.64),
(243, "Pant", 14.81),
(244, "Cya", 14.53),
(244, "orange", 27.61),
(245, "Water", 23.26),
(245, "orange", 30.95),
(246, "Pant", 29.24),
(246, "Phone", 7.63),
(247, "Phone", 28.24),
(247, "apple", 30.19),
(248, "Shirt", 18.40),
(248, "Phone", 27.51),
(249, "Water", 14.71),
(249, "orange", 28.23),
(250, "Phone", 10.93),
(250, "Water", 28.62),
(251, "Phone", 30.13),
(251, "Pant", 26.66),
(252, "Box", 21.17),
(252, "Water", 21.36),
(252, "Pant", 15.36),
(252, "Backpack", 18.16),
(253, "apple", 1.28),
(253, "apple", 29.27),
(254, "Shirt", 25.10),
(254, "Ticket", 5.48),
(255, "orange", 29.48),
(255, "apple", 27.19),
(256, "Backpack", 15.13),
(256, "Backpack", 27.15),
(257, "Box", 2.27),
(257, "Backpack", 31.40),
(257, "Pant", 28.46),
(257, "Ticket", 15.46),
(258, "Ticket", 22.43),
(258, "Shirt", 26.98),
(259, "Cya", 30.69),
(259, "Backpack", 12.41),
(260, "Box", 14.34),
(260, "Box", 27.95),
(261, "Box", 13.25),
(261, "Water", 27.23),
(261, "Box", 19.67),
(262, "Backpack", 30.29),
(262, "Shirt", 26.12),
(262, "Box", 30.74),
(262, "Cya", 23.19),
(263, "Phone", 29.45),
(263, "Pant", 28.7),
(264, "Box", 6.93),
(264, "apple", 29.77),
(265, "Box", 13.3),
(265, "orange", 16.50),
(265, "Ticket", 23.78),
(265, "Water", 23.76),
(266, "Water", 28.23),
(266, "Cya", 13.31),
(267, "Cya", 26.53),
(267, "Box", 29.65),
(267, "Backpack", 10.61),
(268, "Backpack", 29.15),
(268, "Box", 11.3),
(269, "Cya", 17.64),
(269, "Water", 23.58),
(270, "Water", 19.34),
(270, "Pant", 10.40),
(271, "Pant", 12.53),
(271, "Cya", 11.2),
(271, "apple", 23.21),
(271, "Shirt", 26.9),
(272, "Backpack", 22.36),
(272, "orange", 30.50),
(273, "Backpack", 11.73),
(273, "Box", 25.37),
(273, "Ticket", 14.11),
(273, "Phone", 29.97),
(274, "Backpack", 16.5),
(274, "Water", 19.15),
(274, "Ticket", 12.9),
(275, "Water", 30.59),
(275, "orange", 28.83),
(276, "Ticket", 20.68),
(276, "Ticket", 23.37),
(276, "Phone", 21.52),
(277, "Phone", 28.53),
(277, "Pant", 29.28),
(278, "Pant", 28.96),
(278, "Ticket", 29.87),
(279, "Backpack", 18.19),
(279, "Ticket", 21.57),
(280, "Ticket", 27.99),
(280, "Shirt", 16.68),
(281, "Shirt", 19.90),
(281, "Water", 12.43),
(282, "Ticket", 11.40),
(282, "Shirt", 20.24),
(283, "apple", 22.79),
(283, "Box", 16.47),
(283, "apple", 16.65),
(283, "apple", 30.44),
(284, "Pant", 28.54),
(284, "Shirt", 25.80),
(285, "Pant", 19.3),
(285, "Shirt", 10.88),
(285, "orange", 25.85),
(285, "apple", 10.43),
(286, "Shirt", 4.63),
(286, "Backpack", 29.86),
(286, "Pant", 24.21),
(286, "Shirt", 21.51),
(287, "Water", 29.67),
(287, "Cya", 5.44),
(288, "apple", 19.36),
(288, "Box", 31.86),
(288, "Shirt", 13.5),
(289, "Phone", 11.94),
(289, "Backpack", 24.81),
(289, "Water", 22.92),
(289, "Pant", 25.43),
(290, "Ticket", 25.71),
(290, "Ticket", 24.18),
(290, "Pant", 8.4),
(290, "apple", 29.20),
(291, "Shirt", 28.80),
(291, "Backpack", 17.82),
(291, "Cya", 18.21),
(292, "Cya", 22.8),
(292, "Box", 25.27),
(292, "orange", 24.84),
(293, "Shirt", 29.33),
(293, "Ticket", 14.21),
(293, "apple", 22.39),
(294, "Water", 21.17),
(294, "apple", 21.22),
(294, "Ticket", 30.87),
(294, "Pant", 27.11),
(295, "Box", 27.58),
(295, "Ticket", 20.45),
(295, "Water", 27.76),
(296, "Cya", 24.31),
(296, "apple", 20.14),
(296, "Pant", 11.29),
(296, "Pant", 20.76),
(297, "Cya", 13.40),
(297, "Ticket", 20.3),
(298, "Water", 30.88),
(298, "Phone", 7.67),
(298, "Cya", 23.40),
(298, "Pant", 25.62),
(299, "Cya", 27.92),
(299, "Water", 24.41),
(299, "Ticket", 20.29),
(299, "Box", 30.30);
*/

