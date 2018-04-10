-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2018 at 08:39 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock_diwulapitiya_ps`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountbatch`
--

CREATE TABLE `accountbatch` (
  `accountBatch_id` int(11) NOT NULL,
  `accountBatch_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accountbatch_batch`
--

CREATE TABLE `accountbatch_batch` (
  `accountBatch_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `batch_id` int(11) NOT NULL,
  `batch_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch_category`
--

CREATE TABLE `batch_category` (
  `category_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_type` varchar(60) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category_subcategory`
--

CREATE TABLE `category_subcategory` (
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `composite_number`
--

CREATE TABLE `composite_number` (
  `composite_id` int(11) NOT NULL,
  `composite_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_type` varchar(200) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items_composite`
--

CREATE TABLE `items_composite` (
  `item_id` int(11) NOT NULL,
  `composite_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` varchar(5) NOT NULL,
  `section_name` varchar(25) NOT NULL,
  `created_at` date NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_name`, `created_at`, `is_deleted`) VALUES
('A', 'ප්‍රධාන කාර්යාලය', '2018-04-09', 0),
('B', 'උප කාර්යාල', '2018-04-09', 0),
('C', 'පුස්තකාල', '2018-04-09', 0),
('D', 'පෙර පාසල්', '2018-04-09', 0),
('E', 'ආයුර්වේද', '2018-04-09', 0),
('F', 'අංගන', '2018-04-09', 0),
('G', 'මධ්‍යස්ථාන', '2018-04-09', 0),
('H', 'ආදාහනාගාර', '2018-04-09', 0),
('I', 'සතිපොල', '2018-04-09', 0),
('J', 'පොදු වෙළෙඳපොළ', '2018-04-09', 0),
('K', 'පොදු වැසිකිලි', '2018-04-09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `section_subsection`
--

CREATE TABLE `section_subsection` (
  `section_id` varchar(5) NOT NULL,
  `subSection_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_subsection`
--

INSERT INTO `section_subsection` (`section_id`, `subSection_id`) VALUES
('A', 'AA'),
('A', 'AB'),
('A', 'AC'),
('A', 'AD'),
('A', 'AE'),
('A', 'AF'),
('B', 'BA'),
('B', 'BB'),
('B', 'BC'),
('C', 'CA'),
('C', 'CB'),
('C', 'CC'),
('C', 'CD'),
('C', 'CE'),
('C', 'CF'),
('C', 'CG'),
('D', 'DA'),
('D', 'DB'),
('D', 'DC');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `subcategory_type` varchar(90) NOT NULL,
  `subcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory_items`
--

CREATE TABLE `subcategory_items` (
  `subcategory_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subsection`
--

CREATE TABLE `subsection` (
  `subSection_id` varchar(5) NOT NULL,
  `subSection_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subsection`
--

INSERT INTO `subsection` (`subSection_id`, `subSection_name`) VALUES
('AA', 'පරිපාලන අංශය'),
('AB', 'ගිණුම් අංශය'),
('AC', 'සංවර්ධණ අංශය'),
('AD', 'සවෞකය අංශය'),
('AE', 'ප්‍රවර්ධන හ පරිසර අංශය'),
('AF', 'සභා කටයුතු අංශය'),
('BA', 'දිවුලපිටිය '),
('BB', 'කොටදෙනියාව'),
('BC', 'බඩල්ගම '),
('CA', 'උනගහ සකලසූරිය '),
('CB', 'දිවුලපිටිය පුණ්‍යවර්ධන '),
('CC', 'තොටිල්ලගහවත්ත '),
('CD', 'කොටදෙනියාව'),
('CE', 'කලු අග්ගල '),
('CF', 'තමිට්ට '),
('CG', 'බඩල්ගම '),
('DA', 'මරදගහමුල '),
('DB', 'කටුකුරුදුගස්යාය '),
('DC', 'බඩල්ගම ');

-- --------------------------------------------------------

--
-- Table structure for table `subsection_accountbatch`
--

CREATE TABLE `subsection_accountbatch` (
  `subSection_id` varchar(5) NOT NULL,
  `accountBatch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountbatch`
--
ALTER TABLE `accountbatch`
  ADD PRIMARY KEY (`accountBatch_id`);

--
-- Indexes for table `accountbatch_batch`
--
ALTER TABLE `accountbatch_batch`
  ADD PRIMARY KEY (`accountBatch_id`,`batch_id`),
  ADD KEY `accountBatch_batch_batch` (`batch_id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`batch_id`);

--
-- Indexes for table `batch_category`
--
ALTER TABLE `batch_category`
  ADD PRIMARY KEY (`category_id`,`batch_id`),
  ADD KEY `batch_category_batch` (`batch_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_subcategory`
--
ALTER TABLE `category_subcategory`
  ADD PRIMARY KEY (`category_id`,`subcategory_id`),
  ADD KEY `category_subcategory_subcategory` (`subcategory_id`);

--
-- Indexes for table `composite_number`
--
ALTER TABLE `composite_number`
  ADD PRIMARY KEY (`composite_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `items_composite`
--
ALTER TABLE `items_composite`
  ADD PRIMARY KEY (`item_id`,`composite_id`),
  ADD KEY `items_composite_composite_number` (`composite_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `section_subsection`
--
ALTER TABLE `section_subsection`
  ADD PRIMARY KEY (`section_id`,`subSection_id`),
  ADD KEY `Table_3_SubSection` (`subSection_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `subcategory_items`
--
ALTER TABLE `subcategory_items`
  ADD PRIMARY KEY (`subcategory_id`,`item_id`),
  ADD KEY `subcategory_items_items` (`item_id`);

--
-- Indexes for table `subsection`
--
ALTER TABLE `subsection`
  ADD PRIMARY KEY (`subSection_id`);

--
-- Indexes for table `subsection_accountbatch`
--
ALTER TABLE `subsection_accountbatch`
  ADD PRIMARY KEY (`subSection_id`,`accountBatch_id`),
  ADD KEY `subSection_accountBatch_accountBatch` (`accountBatch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountbatch_batch`
--
ALTER TABLE `accountbatch_batch`
  ADD CONSTRAINT `accountBatch_batch_accountBatch` FOREIGN KEY (`accountBatch_id`) REFERENCES `accountbatch` (`accountBatch_id`),
  ADD CONSTRAINT `accountBatch_batch_batch` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`);

--
-- Constraints for table `batch_category`
--
ALTER TABLE `batch_category`
  ADD CONSTRAINT `batch_category_batch` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  ADD CONSTRAINT `batch_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `category_subcategory`
--
ALTER TABLE `category_subcategory`
  ADD CONSTRAINT `category_subcategory_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `category_subcategory_subcategory` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`);

--
-- Constraints for table `items_composite`
--
ALTER TABLE `items_composite`
  ADD CONSTRAINT `items_composite_composite_number` FOREIGN KEY (`composite_id`) REFERENCES `composite_number` (`composite_id`),
  ADD CONSTRAINT `items_composite_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `section_subsection`
--
ALTER TABLE `section_subsection`
  ADD CONSTRAINT `Table_3_Section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  ADD CONSTRAINT `Table_3_SubSection` FOREIGN KEY (`subSection_id`) REFERENCES `subsection` (`subSection_id`);

--
-- Constraints for table `subcategory_items`
--
ALTER TABLE `subcategory_items`
  ADD CONSTRAINT `subcategory_items_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `subcategory_items_subcategory` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`);

--
-- Constraints for table `subsection_accountbatch`
--
ALTER TABLE `subsection_accountbatch`
  ADD CONSTRAINT `subSection_accountBatch_accountBatch` FOREIGN KEY (`accountBatch_id`) REFERENCES `accountbatch` (`accountBatch_id`),
  ADD CONSTRAINT `subSection_accountBatch_subSection` FOREIGN KEY (`subSection_id`) REFERENCES `subsection` (`subSection_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
