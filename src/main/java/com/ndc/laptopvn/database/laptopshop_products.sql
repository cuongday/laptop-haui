CREATE DATABASE  IF NOT EXISTS `laptopvn` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laptopvn`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: laptopshop
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail_desc` mediumtext NOT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `sold` bigint NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` 
VALUES (1,'ASUS TUF Gaming F15 FX506HF HN017W là chiếc laptop gaming giá rẻ nhưng vô cùng mạnh mẽ. Không chỉ bộ vi xử lý Intel thế hệ thứ 11, card đồ họa RTX 20 series mà điểm mạnh còn đến từ việc trang bị sẵn 16GB RAM, cho bạn hiệu năng xuất sắc mà không cần nâng cấp máy.','ASUS','Laptop Asus TUF Gaming',17490000,100,' Intel, Core i5, 11400H',0,'GAMING'),
(2,'Khám phá sức mạnh tối ưu từ Dell Inspiron 15 N3520, chiếc laptop có cấu hình cực mạnh với bộ vi xử lý Intel Core i5 1235U thế hệ mới và dung lượng RAM lên tới 16GB. Bạn có thể thoải mái xử lý nhiều tác vụ, nâng cao năng suất trong công việc mà không gặp bất kỳ trở ngại nào.','DELL','Laptop Dell Inspiron 15 ',15490000,200,'i5 1235U/16GB/512GB/15.6\"FHD',0,'SINHVIEN-VANPHONG'),
(3,' Mới đây, Lenovo đã tung ra thị trường một sản phẩm gaming thế hệ mới với hiệu năng mạnh mẽ, thiết kế tối giản, lịch lãm phù hợp cho những game thủ thích sự đơn giản. Tản nhiệt mát mẻ với hệ thống quạt kép kiểm soát được nhiệt độ máy luôn mát mẻ khi chơi game.','LENOVO','Lenovo IdeaPad Gaming 3',19500000,150,' i5-10300H, RAM 8G',0,'GAMING'),
(4,'Tận hưởng cảm giác mát lạnh sành điệu với thiết kế kim loại\r\nĐược thiết kế để đáp ứng những nhu cầu điện toán hàng ngày của bạn, dòng máy tính xách tay ASUS K Series sở hữu thiết kế tối giản, gọn nhẹ và cực mỏng với một lớp vỏ họa tiết vân kim loại phong cách. Hiệu năng của máy rất mạnh mẽ nhờ trang bị bộ vi xử lý Intel® Core™ i7 processor và đồ họa mới nhất. Bên cạnh đó, các công nghệ sáng tạo độc quyền của ASUS đưa thiết bị lên đẳng cấp mới, cho bạn một trải nghiệm người dùng trực quan và tính năng công thái học vượt trội.','ASUS','Asus K501UX',11900000,99,'VGA NVIDIA GTX 950M- 4G',0,'THIET-KE-DO-HOA'),
(5,'Chiếc MacBook Air có hiệu năng đột phá nhất từ trước đến nay đã xuất hiện. Bộ vi xử lý Apple M1 hoàn toàn mới đưa sức mạnh của MacBook Air M1 13 inch 2020 vượt xa khỏi mong đợi người dùng, có thể chạy được những tác vụ nặng và thời lượng pin đáng kinh ngạc.','APPLE','MacBook Air 13',17690000,99,'Apple M1 GPU 7 nhân',0,'GAMING'),
(6,'14.0 Chính: inch, 2880 x 1800 Pixels, OLED, 90 Hz, OLED','LG','Laptop LG Gram Style',31490000,99,'Intel Iris Plus Graphics',0,'DOANH-NHAN'),
(7,'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm  ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.','APPLE','MacBook Air 13 ',24990000,99,' Apple M2 GPU 8 nhân',0,'MONG-NHE'),
(8,'Là chiếc laptop gaming thế hệ mới nhất thuộc dòng Nitro 5 luôn chiếm được rất nhiều cảm tình của game thủ trước đây, Acer Nitro Gaming AN515-58-769J nay còn ấn tượng hơn nữa với bộ vi xử lý Intel Core i7 12700H cực khủng và card đồ họa RTX 3050, sẵn sàng cùng bạn chinh phục những đỉnh cao.\r\n','ACER','Laptop Acer Nitro ',23490000,99,'AN515-58-769J i7 12700H',0,'SINHVIEN-VANPHONG'),
(9,'15.6 inch, FHD (1920 x 1080), IPS, 144 Hz, 250 nits, Acer ComfyView LED-backlit','ASUS','Laptop Acer Nitro V',26999000,99,' NVIDIA GeForce RTX 4050',0,'MONG-NHE'),
(10,'Dell Inspiron N3520 là chiếc laptop lý tưởng cho công việc hàng ngày. Bộ vi xử lý Intel Core i5 thế hệ thứ 12 hiệu suất cao, màn hình lớn 15,6 inch Full HD 120Hz mượt mà, thiết kế bền bỉ sẽ giúp bạn giải quyết công việc nhanh chóng mọi lúc mọi nơi.','DELL','Laptop Dell Latitude 3420',21399000,99,' Intel Iris Xe Graphics',0,'MONG-NHE');
UNLOCK TABLES;

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
insert INTO `product_images`
values (1,'1711078092373-asus-01.png',1),
(2,'1711078452562-dell-01.png',2),
(3,'1711079073759-lenovo-01.png',3),
(4,'1711079496409-asus-02.png',4),
(5,'1711079954090-apple-01.png',5),
(6,'1711078092373-asus-01.png',6),
(7,'1711080386941-lg-01.png',7),
(8,'1711080948771-acer-01.png',8),
(9,'1711081080930-asus-03.png',9),
(10,'1711081278418-dell-02.png',10),
(11,'1711078092373-asus-01.png',1),
(12,'1711081080930-asus-03.png',1),
(13,'1711078092373-asus-01.png',2),
(14,'1711078092373-asus-01.png',2),
(15,'1711078092373-asus-01.png',3),
(16,'1711081080930-asus-03.png',3),
(17,'1711078092373-asus-01.png',4),
(18,'1711081080930-asus-03.png',4),
(19,'1711078092373-asus-01.png',5),
(20,'1711081080930-asus-03.png',5),
(21,'1711078092373-asus-01.png',6),
(22,'1711081080930-asus-03.png',6);
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-22 12:37:00
