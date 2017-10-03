SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_ID` int(10) NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `patientID` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_ID`, `date`, `amount`, `patientID`) VALUES
(663, '2017-04-28', 230, '4046'),
(664, '2017-04-11', 3000, '4047'),
(665, '2017-04-10', 632, '4045'),
(666, '2017-04-24', 1200, '4040'),
(667, '2017-04-23', 1500, '4041'),
(668, '2017-04-25', 182, '4043'),
(669, '2017-04-18', 870, '4044');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `diagnosisID` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`diagnosisID`, `date`, `notes`) VALUES
('3232', '2017-04-01', 'thrombosis'),
('3233', '2017-04-16', 'arthritis'),
('3234', '2017-04-27', 'cramps'),
('3235', '2017-04-22', 'labor'),
('3236', '2017-04-17', 'migraine');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorID` varchar(9) NOT NULL,
  `first` varchar(255) NOT NULL,
  `last` varchar(255) NOT NULL,
  `wardID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorID`, `first`, `last`, `wardID`) VALUES
('12344', 'Chris', 'Jackson', '40323HB1'),
('12345', 'Arun', 'Sandut', '04929332'),
('123454', 'Lindsay', 'Graham', '04929332'),
('123456', 'Hailee', 'Marshall', '3242467'),
('123459', 'Jet', 'Knight', '04929332'),
('12346', 'Jane', 'Masterson', '0302942B'),
('12347', 'Toby', 'Michaels', '40323HB1');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `capacity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospitalID`, `name`, `address`, `city`, `capacity`) VALUES
('BBBH17', 'Barley', '4400 Massachussetts Ave', 'Brighton', 3000),
('BBBH18', 'Penobscot', '3231 Dreary St', 'Camden', 800),
('BBBH19', 'Sibley', '2300 Collins Lane', 'Rockville', 1400),
('BBBH20', 'Thaylis', '9392 Independence Ave', 'Bethesda', 1200),
('BBBH21', 'Tremaine', '45 Wishy  Way', 'New York City', 4500);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_serial` varchar(10) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `diagnosisID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_serial`, `price`, `quantity`, `diagnosisID`) VALUES
('0009', 200, 5, '3234'),
('009', 500, 10, '3233'),
('0090', 730, 5, '3236'),
('0091', 340, 2, '3235'),
('09', 543, 20, '3232');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurseID` varchar(10) NOT NULL,
  `last` varchar(10) NOT NULL,
  `doctorID` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurseID`, `last`, `doctorID`) VALUES
('0303', 'Johnson', '12346'),
('0304', 'Spear', '123454'),
('0305', 'Cronin', '12349'),
('0306', 'Mendelsohn', '12346'),
('0307', 'Barton', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientID` varchar(4) NOT NULL,
  `last` varchar(20) NOT NULL,
  `weight` int(3) NOT NULL,
  `height_cm` int(255) NOT NULL,
  `doctorID` varchar(9) NOT NULL,
  `diagnosisID` int(11) NOT NULL,
  `room_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientID`, `last`, `weight`, `height_cm`, `doctorID`, `diagnosisID`, `room_no`) VALUES
('4040', 'smith', 210, 200, '12345', 11110, '32'),
('4041', 'Maldive', 154, 156, '12346', 11112, '18'),
('4042', 'Marks', 164, 160, '12344', 11105, '32'),
('4043', 'Lavelle', 153, 170, '12348', 11110, '14'),
('4044', 'Telly', 132, 152, '12346', 1112, '54'),
('4045', 'Dresden', 210, 162, '123459', 11101, '14'),
('4046', 'Jamison', 167, 167, '123454', 1111, '22'),
('4047', 'Berry', 143, 159, '123456', 1110, '25');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_no` int(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `wardID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_no`, `type`, `duration`, `wardID`) VALUES
(11, 'single', '20', '3242467'),
(12, 'single', '4', '0302942B'),
(14, 'double', '8', '0302942B'),
(15, 'single', '4', '04929332'),
(16, 'double', '6', '04929332'),
(17, 'single', '5', '04929332'),
(18, 'single', '4', '1039832'),
(19, 'single', '2', '1039832'),
(21, 'single', '6', '3242467'),
(22, 'double', '3', '0302942B'),
(25, 'double', '5', '3242467'),
(32, 'single', '1', '40323HB1'),
(33, 'double', '2', '40323HB1'),
(43, 'triple', '2', '40323HB1'),
(54, 'single', '8', '0302942B');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `wardID` varchar(255) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `address` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `name`, `wardID`, `gender`, `address`) VALUES
(1, 'Monaghan', '49S92021', 'M', '98 June Ave'),
(2, 'Collins', '4333H201', 'F', '43 July Ave'),
(3, 'Taylor', '40323HB1', 'F', '12 Jan Ln'),
(4, 'Smith', '0302942B', 'M', '9 Sixth Ln'),
(5, 'Marsden', '783235B3', 'F', '4 May Ln'),
(6, 'Dresden', '1039832', 'M', '3 March St'),
(7, 'Franklin', '3242467', 'M', '2 Feb Ln'),
(8, 'Phipps', '04929332', 'F', '23 Short St'),
(9, 'Lamont', '9392924', 'M', '1 Might Ave'),
(10, 'Rigsby', '9393920', 'F', '3 Hope Ln'),
(11, 'Travone', '49399293', 'M', '7 March Ln'),
(12, 'Lois', '54839393', 'M', '6 June St'),
(13, 'Rankin', '94939291', 'M', '5 May Ave'),
(14, 'Owens', '483828283', 'F', '4 April Ave'),
(15, 'Parks', '593920201', 'M', '3 March Ave');

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `wardID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `hospitalID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`wardID`, `name`, `capacity`, `hospitalID`) VALUES
('0302942B', 'Neuro', 20, 'BBBH17'),
('04929332', 'Burn', 20, 'BBBH17'),
('1039832', 'Pediatric', 90, 'BBBH21'),
('3242467', 'Pediatric', 200, 'BBBH20'),
('40323HB1', 'ICU', 130, 'BBBH18'),
('4333H201', 'Pediatric', 200, 'BBBH19'),
('483828283', 'Neuro', 30, 'BBBH21'),
('49399293', 'Burn', 320, 'BBBH18'),
('49S92021', 'Burn', 50, 'BBBH20'),
('54839393', 'Neuro', 50, 'BBBH18'),
('593920201', 'Neuro', 50, 'BBBH19'),
('783235B3', 'Podiatry', 20, 'BBBH21'),
('9392924', 'Neuro', 50, 'BBBH20'),
('9393920', 'ICU', 130, 'BBBH21'),
('94939291', 'Podiatry', 20, 'BBBH17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_ID`),
  ADD UNIQUE KEY `patientID` (`patientID`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`diagnosisID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalID`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_serial`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurseID`),
  ADD UNIQUE KEY `last` (`last`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientID`),
  ADD KEY `doctorID` (`doctorID`),
  ADD KEY `diagnosisID` (`diagnosisID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_no`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`),
  ADD KEY `wardID` (`wardID`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`wardID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `patientID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `wardID` FOREIGN KEY (`wardID`) REFERENCES `ward` (`wardID`);
