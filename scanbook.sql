-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2015 at 07:20 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scanbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `isbn` varchar(50) NOT NULL COMMENT 'ISBN number',
  `title` varchar(50) NOT NULL COMMENT 'title of the book',
  `author` varchar(50) NOT NULL COMMENT 'author of the book',
  `pno` int(10) NOT NULL COMMENT 'number of pages in the book',
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`isbn`, `title`, `author`, `pno`) VALUES
(' 0439358078', '(Book 5)', '(Book 5)', 870),
('0026515628', 'Health: A Guide to Wellness ', 'McGraw-Hill', 390),
('0073124451', 'Literature: Approaches to Fiction, Poetry, and Dra', 'Robert DiYanni', 1680),
('0545522439', 'Wild Born', 'Brandon Mull', 224),
('0618615385', 'McDougal Littell Earth Science ', 'McDougal Littell ', 784),
('1285077261', 'Complete Digital Photography', 'Ben Long', 624),
('9780756686772', 'Animal', 'unknown', 632);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `dnt` datetime NOT NULL COMMENT 'Time the notes posted',
  `isbn` varchar(50) NOT NULL COMMENT 'ISBN number',
  `notes` text NOT NULL COMMENT 'notes about the book'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`dnt`, `isbn`, `notes`) VALUES
('2015-10-24 23:20:54', '0545522439', 'nice animal book'),
('2015-10-24 23:21:07', '0545522439', 'not at all a book'),
('2015-10-24 23:35:20', '0545522439', 'nice literarture'),
('2015-10-25 00:34:51', '0073124451', 'I have no clue how this book would be.'),
('2015-10-25 10:23:31', '0545522439', 'nice book\r\n'),
('2015-10-25 10:23:42', '0545522439', 'literature');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
