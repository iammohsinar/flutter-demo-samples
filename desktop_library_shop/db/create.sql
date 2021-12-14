-- -------------------------------------------------------------
-- TablePlus 3.11.0(352)
--
-- https://tableplus.com/
--
-- Database: flutter_library_shop_demo
-- Generation Time: 2021-12-15 00:22:48.8550
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookId` int NOT NULL AUTO_INCREMENT,
  `publishYear` int DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `isActive` int NOT NULL DEFAULT '1',
  `stockKeeper` int DEFAULT NULL,
  `stockOn` datetime DEFAULT NULL,
  `isIssue` int DEFAULT NULL,
  `condition` enum('new','useable') DEFAULT 'new',
  `retire` enum('discard','poor') DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `categoryId_idx` (`categoryId`),
  KEY `stockKeeper_idx` (`stockKeeper`),
  CONSTRAINT `categoryId` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`),
  CONSTRAINT `stockKeeper` FOREIGN KEY (`stockKeeper`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `books_borrowed`;
CREATE TABLE `books_borrowed` (
  `bookId` int NOT NULL,
  `borrower` int NOT NULL,
  `borrowOn` datetime NOT NULL,
  `issuer` int NOT NULL,
  `issueOn` datetime NOT NULL,
  `returnOn` datetime DEFAULT NULL,
  `shouldReturnOn` datetime DEFAULT NULL,
  `fineAmount` int NOT NULL DEFAULT '0',
  KEY `bookId_idx` (`bookId`),
  KEY `borrower_idx` (`borrower`),
  KEY `issuer_idx` (`issuer`),
  CONSTRAINT `bookId` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`),
  CONSTRAINT `borrower` FOREIGN KEY (`borrower`) REFERENCES `students` (`studentId`),
  CONSTRAINT `issuer` FOREIGN KEY (`issuer`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `studentId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `enrolledCardNumber` varchar(45) DEFAULT NULL,
  `isActive` int DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `isActive` int DEFAULT NULL,
  `role` enum('admin','manager') DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `books` (`bookId`, `publishYear`, `code`, `title`, `author`, `publisher`, `cost`, `categoryId`, `isActive`, `stockKeeper`, `stockOn`, `isIssue`, `condition`, `retire`) VALUES
('2', '2002', 'CS10001', 'Clean Code', 'Uncle bob', 'OReilly Media', '23', '2', '1', '1', '2021-11-02 00:00:00', '1', 'new', NULL),
('3', '2010', 'CS10002', 'Introduction to Algorithms 3rd Edition', 'Joshua Bloch', 'OReilly Media', '69', '2', '1', '1', '2021-11-02 00:00:00', '0', 'new', NULL),
('4', '2012', 'CS10003', 'Cracking the Coding Interview', 'Gayle Laakmann McDowell', 'OReilly Media', '24', '2', '1', '1', '2021-11-02 00:00:00', '0', 'new', NULL),
('5', '2016', '234234', 'Java jvm book', 'Gayle Laakmann McDowell', 'OReilly Media', '300', '2', '1', '1', '2021-11-02 00:00:00', '1', 'new', NULL),
('6', '2002', '23425523523', 'java book ', 'Gayle Laakmann McDowell', 'OReilly Media', '20', '1', '1', '1', '2021-12-03 19:02:23', '0', 'new', NULL);

INSERT INTO `books_borrowed` (`bookId`, `borrower`, `borrowOn`, `issuer`, `issueOn`, `returnOn`, `shouldReturnOn`, `fineAmount`) VALUES
('2', '1', '2021-11-01 00:00:00', '1', '2021-11-01 00:00:00', '2021-11-03 14:18:49', '2021-11-09 14:09:34', '0'),
('3', '1', '2021-11-02 00:00:00', '1', '2021-11-02 00:00:00', NULL, '2021-11-10 14:22:24', '0');

INSERT INTO `categories` (`categoryId`, `name`, `isActive`) VALUES
('1', 'physics', '1'),
('2', 'information technology', '1');

INSERT INTO `students` (`studentId`, `name`, `enrolledCardNumber`, `isActive`) VALUES
('1', 'fahad', '2k7/CSE/18', '1');

INSERT INTO `users` (`userId`, `userName`, `password`, `isActive`, `role`) VALUES
('1', 'mohsin', '123456', '1', 'admin'),
('2', 'fahad', '123456', '1', 'manager');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;