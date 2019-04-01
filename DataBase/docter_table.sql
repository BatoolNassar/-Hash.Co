-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01 أبريل 2019 الساعة 20:16
-- إصدار الخادم: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docter table`
--


--
-- بنية الجدول `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `information_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `antenatalfollowup`
--

CREATE TABLE `antenatalfollowup` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `gestationalAge` int(10) NOT NULL,
  `weight` double NOT NULL,
  `bd` varchar(50) COLLATE utf8_bin NOT NULL,
  `urineAlb` varchar(50) COLLATE utf8_bin NOT NULL,
  `urineSug` varchar(50) COLLATE utf8_bin NOT NULL,
  `fundalHt` int(50) NOT NULL,
  `fhs` tinyint(1) NOT NULL,
  `oedema` varchar(50) COLLATE utf8_bin NOT NULL,
  `presentation` varchar(50) COLLATE utf8_bin NOT NULL,
  `remarks` varchar(50) COLLATE utf8_bin NOT NULL,
  `supplements` varchar(50) COLLATE utf8_bin NOT NULL,
  `nextVisit` date NOT NULL,
  `id_docter` int(10) NOT NULL,
  `id_mather` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `bloodtype`
--

CREATE TABLE `bloodtype` (
  `id` int(10) NOT NULL,
  `type` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- إرجاع أو استيراد بيانات الجدول `bloodtype`
--

INSERT INTO `bloodtype` (`id`, `type`) VALUES
(1, 'O+'),
(2, 'A+'),
(3, 'B+'),
(4, 'AB+'),
(5, 'O-'),
(6, 'A-'),
(7, 'B-'),
(8, 'AB-');

-- --------------------------------------------------------

--
-- بنية الجدول `careandpreyery`
--

CREATE TABLE `careandpreyery` (
  `id` int(10) NOT NULL,
  `id_resksralated` int(10) NOT NULL,
  `id_followup` int(10) NOT NULL,
  `id_followupantenatal` int(10) NOT NULL,
  `ramarks` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_mather` int(10) NOT NULL,
  `id_mathercare` int(10) NOT NULL,
  `id_postanatalexamination` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `child`
--

CREATE TABLE `child` (
  `id` int(10) NOT NULL,
  `information_id` int(10) NOT NULL,
  `bloodtype_id` int(10) NOT NULL,
  `gender` int(10) NOT NULL,
  `mather_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `childcare`
--

CREATE TABLE `childcare` (
  `id` int(10) NOT NULL,
  `id_immunization` int(10) NOT NULL,
  `id_childmeasletsid` int(10) NOT NULL,
  `id_transfers` int(10) NOT NULL,
  `id_child` int(10) NOT NULL,
  `id_childexamination` int(10) NOT NULL,
  `id_newborn` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `childexamination`
--

CREATE TABLE `childexamination` (
  `id` int(10) NOT NULL,
  `birthOutCome` varchar(50) COLLATE utf8_bin NOT NULL,
  `weightInGr` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `temp` double DEFAULT NULL,
  `pulse` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `respiratoryRate` varchar(50) COLLATE utf8_bin NOT NULL,
  `apgarScore` varchar(50) COLLATE utf8_bin NOT NULL,
  `StartingBreastFeedingInTheFirstHourAfterDelivery` tinyint(1) NOT NULL,
  `congenitalMalformation` varchar(50) COLLATE utf8_bin NOT NULL,
  `medication` varchar(50) COLLATE utf8_bin NOT NULL,
  `vitK` tinyint(1) NOT NULL,
  `HepatitisB1Vaccination` varchar(50) COLLATE utf8_bin NOT NULL,
  `complicationsAfterBirth` varchar(50) COLLATE utf8_bin NOT NULL,
  `Diagnosis` varchar(50) COLLATE utf8_bin NOT NULL,
  `Referred` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_docter` int(10) NOT NULL,
  `id_child` int(10) NOT NULL,
  `hc` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `childmeasletsid`
--

CREATE TABLE `childmeasletsid` (
  `id` int(10) NOT NULL,
  `age` int(10) NOT NULL,
  `wt` double NOT NULL,
  `Ht` double NOT NULL,
  `HC` double NOT NULL,
  `supplements` varchar(50) COLLATE utf8_bin NOT NULL,
  `remarks` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_docter` int(10) NOT NULL,
  `id_child` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `docter`
--

CREATE TABLE `docter` (
  `id` int(50) NOT NULL,
  `scincedegree` text COLLATE utf8_bin NOT NULL,
  `salary` int(10) NOT NULL,
  `Information_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `femalechildcheck`
--

CREATE TABLE `femalechildcheck` (
  `id` int(10) NOT NULL,
  `age` int(10) NOT NULL,
  `date` date NOT NULL,
  `generalCondition` tinyint(1) NOT NULL,
  `frontYumperClosed` tinyint(1) NOT NULL,
  `lackOfRedLightIsReversedOnThrRetina` tinyint(1) NOT NULL,
  `deviationOfTheEye` tinyint(1) NOT NULL,
  `lightReflectionOfTheCornealIsIncompete` tinyint(1) NOT NULL,
  `slideInTheHeartsOfTheHeart` tinyint(1) NOT NULL,
  `thePrudentIsAUnreasonable` tinyint(1) NOT NULL,
  `tumorInTheAbdomen` tinyint(1) NOT NULL,
  `encodingInTheLiver` tinyint(1) NOT NULL,
  `analyticalExternalGenitalOrgans` tinyint(1) NOT NULL,
  `SwillingInTheInguinalHerna` tinyint(1) NOT NULL,
  `takeOfAtDysplasia` tinyint(1) NOT NULL,
  `crisisIsLimited` tinyint(1) NOT NULL,
  `noLikeAsymmetry` tinyint(1) NOT NULL,
  `theSpineIsAbnormal` tinyint(1) NOT NULL,
  `the ChildWalkIsAbnormal` tinyint(1) NOT NULL,
  `cariesInTheTeeth` tinyint(1) NOT NULL,
  `id_child` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `followupandcareofpregnantwomen`
--

CREATE TABLE `followupandcareofpregnantwomen` (
  `id` int(10) NOT NULL,
  `tests` varchar(50) COLLATE utf8_bin NOT NULL,
  `result` varchar(50) COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `id_mather` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `hasband`
--

CREATE TABLE `hasband` (
  `id` int(10) NOT NULL,
  `information_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `immunization`
--

CREATE TABLE `immunization` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `id_child` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL,
  `id_tybeOfImmmunization` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `information`
--

CREATE TABLE `information` (
  `id` int(10) NOT NULL,
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `phone` int(11) NOT NULL,
  `number` int(10) NOT NULL,
  `identitynumber` int(10) NOT NULL,
  `Bday` date NOT NULL,
  `adress` varchar(50) COLLATE utf8_bin NOT NULL,
  `imag` varchar(255) COLLATE utf8_bin NOT NULL,
  `typeperson_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `malechildcheck`
--

CREATE TABLE `malechildcheck` (
  `id` int(10) NOT NULL,
  `age` int(10) NOT NULL,
  `date` date NOT NULL,
  `generalCondition` tinyint(1) NOT NULL,
  `anteriorFontanelle` tinyint(1) NOT NULL,
  `invertedRedLightOnTheRetina` tinyint(1) NOT NULL,
  `deviationOfTheEye` tinyint(1) NOT NULL,
  `theLightReflectionOnTheCorneaIsNotSymmetrical` tinyint(1) NOT NULL,
  `swishInTheSoundsOfTheHeart` tinyint(1) NOT NULL,
  `theFemoralArteryIsImperceptible` tinyint(1) NOT NULL,
  `aTumorInTheAbdomen` tinyint(1) NOT NULL,
  `liverHypertrophy` tinyint(1) NOT NULL,
  `swellingTheUpperPartOfTheScrotumIsSeparateFromTheTest` tinyint(1) NOT NULL,
  `swellingWithinTheScrotumIsSeparateFromTheTesticle` tinyint(1) NOT NULL,
  `theTestisIsNotPalpable` tinyint(1) NOT NULL,
  `aSwollenTesticle` tinyint(1) NOT NULL,
  `hypospadias` tinyint(1) NOT NULL,
  `inguinalHernia` tinyint(1) NOT NULL,
  `dysplasia` tinyint(1) NOT NULL,
  `SpacingHips` tinyint(1) NOT NULL,
  `thereIsNoSymmetryInTheDistanceBetweenTheHips` tinyint(1) NOT NULL,
  `theSpineChainIsAbnormal` tinyint(1) NOT NULL,
  `the ChildsWalkIsAbnormal` tinyint(1) NOT NULL,
  `cariesInTheTeeth` tinyint(1) NOT NULL,
  `id_docter` int(10) NOT NULL,
  `id_child` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `mather`
--

CREATE TABLE `mather` (
  `id` int(15) NOT NULL,
  `information_id` int(15) NOT NULL,
  `blood_id` int(15) NOT NULL,
  `husband_id` int(10) NOT NULL,
  `id_secretary` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `mathercare`
--

CREATE TABLE `mathercare` (
  `id` int(10) NOT NULL,
  `height` double NOT NULL,
  `EDD` date NOT NULL,
  `LMP` date NOT NULL,
  `abortions` varchar(50) COLLATE utf8_bin NOT NULL,
  `parity` varchar(50) COLLATE utf8_bin NOT NULL,
  `gravida` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_mather` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `matherexamination`
--

CREATE TABLE `matherexamination` (
  `id` int(10) NOT NULL,
  `placeOfBirth` varchar(50) COLLATE utf8_bin NOT NULL,
  `dateOfDelivery` date NOT NULL,
  `timeOfDelivery` time(6) NOT NULL,
  `wayOfDelivery` varchar(50) COLLATE utf8_bin NOT NULL,
  `weeksOfPregnancy` int(10) NOT NULL,
  `episiotomy` tinyint(1) NOT NULL,
  `peninealTear` int(10) NOT NULL,
  `bleedingAfterDelivery` tinyint(1) NOT NULL,
  `bloodTransfusion` tinyint(1) NOT NULL,
  `hemoglobin` varchar(50) COLLATE utf8_bin NOT NULL,
  `temp` double NOT NULL,
  `BP` varchar(50) COLLATE utf8_bin NOT NULL,
  `complicationsAfterDelivery` varchar(50) COLLATE utf8_bin NOT NULL,
  `diognosis` varchar(50) COLLATE utf8_bin NOT NULL,
  `referred` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_mather` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `newbornassessment`
--

CREATE TABLE `newbornassessment` (
  `id` int(11) NOT NULL,
  `modeOfDelivery` varchar(50) COLLATE utf8_bin NOT NULL,
  `DateOfDelivery` date NOT NULL,
  `brithWeight` double NOT NULL,
  `gestationalAgeAtDelivery` varchar(50) COLLATE utf8_bin NOT NULL,
  `temp` double NOT NULL,
  `pulse` varchar(50) COLLATE utf8_bin NOT NULL,
  `respRate` varchar(50) COLLATE utf8_bin NOT NULL,
  `WT` double NOT NULL,
  `length` double NOT NULL,
  `Hc` double NOT NULL,
  `gender` int(10) NOT NULL,
  `congenitalMalformation` varchar(50) COLLATE utf8_bin NOT NULL,
  `Jaundice` varchar(50) COLLATE utf8_bin NOT NULL,
  `cyanosis` varchar(50) COLLATE utf8_bin NOT NULL,
  `umbilicalStump` varchar(50) COLLATE utf8_bin NOT NULL,
  `feeding` varchar(50) COLLATE utf8_bin NOT NULL,
  `remarks` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_child` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `opreation`
--

CREATE TABLE `opreation` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `theAmountPaid` int(10) NOT NULL,
  `theFullAmount` int(10) NOT NULL,
  `id_secretary` int(10) NOT NULL,
  `id_mather` int(10) NOT NULL,
  `id_typeofopration` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `postanatalexamination`
--

CREATE TABLE `postanatalexamination` (
  `id` int(10) NOT NULL,
  `postanatalAssessment` varchar(50) COLLATE utf8_bin NOT NULL,
  `DaysOfDelivery` int(10) NOT NULL,
  `DateOfVisit` date NOT NULL,
  `temp` double NOT NULL,
  `pulse` varchar(50) COLLATE utf8_bin NOT NULL,
  `BP` varchar(50) COLLATE utf8_bin NOT NULL,
  `bleedingAfterDelivery` tinyint(1) NOT NULL,
  `Hb` varchar(50) COLLATE utf8_bin NOT NULL,
  `DVT` tinyint(1) NOT NULL,
  `RuptureUterus` varchar(50) COLLATE utf8_bin NOT NULL,
  `Lochia` varchar(50) COLLATE utf8_bin NOT NULL,
  `incision` varchar(50) COLLATE utf8_bin NOT NULL,
  `seizures` tinyint(1) NOT NULL,
  `booldTransfusion` tinyint(1) NOT NULL,
  `breasts` varchar(50) COLLATE utf8_bin NOT NULL,
  `FundalHeight` int(10) NOT NULL,
  `FamilyPlanningCouunseling` varchar(50) COLLATE utf8_bin NOT NULL,
  `FPAppointment` varchar(50) COLLATE utf8_bin NOT NULL,
  `recommendations` varchar(50) COLLATE utf8_bin NOT NULL,
  `remarks` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_mather` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `preventivetes`
--

CREATE TABLE `preventivetes` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `result` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_child` int(10) NOT NULL,
  `id_tests` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `risksrelatedtocurrentpregnancy`
--

CREATE TABLE `risksrelatedtocurrentpregnancy` (
  `id` int(10) NOT NULL,
  `gestationalAge` varchar(50) COLLATE utf8_bin NOT NULL,
  `gestationalDiabetes` varchar(50) COLLATE utf8_bin NOT NULL,
  `SingnsOfPreEclampsia` varchar(50) COLLATE utf8_bin NOT NULL,
  `vaginalBleeding` varchar(50) COLLATE utf8_bin NOT NULL,
  `anemia` varchar(50) COLLATE utf8_bin NOT NULL,
  `discrepancyOfFundalHeight` varchar(50) COLLATE utf8_bin NOT NULL,
  `oligoPolydraminous` varchar(50) COLLATE utf8_bin NOT NULL,
  `malpresentation` varchar(50) COLLATE utf8_bin NOT NULL,
  `absenceOfFetalMovement` varchar(50) COLLATE utf8_bin NOT NULL,
  `multiplePregnancy` varchar(50) COLLATE utf8_bin NOT NULL,
  `prom` varchar(50) COLLATE utf8_bin NOT NULL,
  `RhIncompatibility` varchar(50) COLLATE utf8_bin NOT NULL,
  `pelvicMass` varchar(50) COLLATE utf8_bin NOT NULL,
  `other` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_docter` int(10) NOT NULL,
  `id_mather` int(10) NOT NULL,
  `dateOfVist` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `secretary`
--

CREATE TABLE `secretary` (
  `id` int(10) NOT NULL,
  `information_id` int(10) NOT NULL,
  `salary` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `teststype`
--

CREATE TABLE `teststype` (
  `id` int(10) NOT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- إرجاع أو استيراد بيانات الجدول `teststype`
--

INSERT INTO `teststype` (`id`, `type`) VALUES
(1, 'PKU'),
(2, 'TSH'),
(3, 'Hb');

-- --------------------------------------------------------

--
-- بنية الجدول `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `proplem` varchar(50) COLLATE utf8_bin NOT NULL,
  `remark` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_child` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- بنية الجدول `typeofimmunization`
--

CREATE TABLE `typeofimmunization` (
  `id` int(10) NOT NULL,
  `typeOfImmunization` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- إرجاع أو استيراد بيانات الجدول `typeofimmunization`
--

INSERT INTO `typeofimmunization` (`id`, `typeOfImmunization`) VALUES
(1, 'BCG'),
(2, 'HepatitisB'),
(3, 'IPV'),
(4, 'OPV'),
(5, 'Rota'),
(6, 'Penta'),
(7, 'PCV'),
(8, 'MMR'),
(9, 'DPT'),
(10, 'DT'),
(11, 'OPV'),
(12, 'dT');

-- --------------------------------------------------------

--
-- بنية الجدول `typeofopration`
--

CREATE TABLE `typeofopration` (
  `id` int(10) NOT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- إرجاع أو استيراد بيانات الجدول `typeofopration`
--

INSERT INTO `typeofopration` (`id`, `type`) VALUES
(1, 'immunization'),
(2, 'care');

-- --------------------------------------------------------

--
-- بنية الجدول `typeperson`
--

CREATE TABLE `typeperson` (
  `id` int(10) NOT NULL,
  `type` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- إرجاع أو استيراد بيانات الجدول `typeperson`
--

INSERT INTO `typeperson` (`id`, `type`) VALUES
(1, 'admin'),
(2, 'mather'),
(3, 'secretary'),
(4, 'docter'),
(5, 'child'),
(6, 'hasband');

-- --------------------------------------------------------

--
-- بنية الجدول `vist`
--

CREATE TABLE `vist` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `nextDate` date NOT NULL,
  `aim` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_mather` int(10) NOT NULL,
  `id_docter` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `information_id` (`information_id`);

--
-- Indexes for table `antenatalfollowup`
--
ALTER TABLE `antenatalfollowup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docter` (`id_docter`),
  ADD KEY `id_mather` (`id_mather`);

--
-- Indexes for table `bloodtype`
--
ALTER TABLE `bloodtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careandpreyery`
--
ALTER TABLE `careandpreyery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_followup` (`id_followup`),
  ADD KEY `id_followupantenatal` (`id_followupantenatal`),
  ADD KEY `id_mather` (`id_mather`),
  ADD KEY `id_resksralated` (`id_resksralated`),
  ADD KEY `id_mathercare` (`id_mathercare`),
  ADD KEY `id_postanatalexamination` (`id_postanatalexamination`);

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bloodtype_id` (`bloodtype_id`),
  ADD KEY `information_id` (`information_id`),
  ADD KEY `mather_id` (`mather_id`);

--
-- Indexes for table `childcare`
--
ALTER TABLE `childcare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_childmeasletsid` (`id_childmeasletsid`),
  ADD KEY `id_immunization` (`id_immunization`),
  ADD KEY `id_transfers` (`id_transfers`),
  ADD KEY `id_childexamination` (`id_childexamination`),
  ADD KEY `id_newborn` (`id_newborn`);

--
-- Indexes for table `childexamination`
--
ALTER TABLE `childexamination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_docter` (`id_docter`);

--
-- Indexes for table `childmeasletsid`
--
ALTER TABLE `childmeasletsid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_docter` (`id_docter`);

--
-- Indexes for table `docter`
--
ALTER TABLE `docter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Information_id` (`Information_id`);

--
-- Indexes for table `femalechildcheck`
--
ALTER TABLE `femalechildcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_docter` (`id_docter`);

--
-- Indexes for table `followupandcareofpregnantwomen`
--
ALTER TABLE `followupandcareofpregnantwomen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mather` (`id_mather`),
  ADD KEY `id_docter` (`id_docter`);

--
-- Indexes for table `hasband`
--
ALTER TABLE `hasband`
  ADD PRIMARY KEY (`id`),
  ADD KEY `information_id` (`information_id`);

--
-- Indexes for table `immunization`
--
ALTER TABLE `immunization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_docter` (`id_docter`),
  ADD KEY `id_tybeOfImmmunization` (`id_tybeOfImmmunization`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `typeperson_id` (`typeperson_id`);

--
-- Indexes for table `malechildcheck`
--
ALTER TABLE `malechildcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_docter` (`id_docter`);

--
-- Indexes for table `mather`
--
ALTER TABLE `mather`
  ADD PRIMARY KEY (`id`),
  ADD KEY `information_id` (`information_id`),
  ADD KEY `blood_id` (`blood_id`),
  ADD KEY `husband_id` (`husband_id`),
  ADD KEY `id_secretary` (`id_secretary`);

--
-- Indexes for table `mathercare`
--
ALTER TABLE `mathercare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mather` (`id_mather`),
  ADD KEY `id_docter` (`id_docter`);

--
-- Indexes for table `matherexamination`
--
ALTER TABLE `matherexamination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docter` (`id_docter`),
  ADD KEY `id_mather` (`id_mather`);

--
-- Indexes for table `newbornassessment`
--
ALTER TABLE `newbornassessment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_docter` (`id_docter`);

--
-- Indexes for table `opreation`
--
ALTER TABLE `opreation`
  ADD KEY `id_secretary` (`id_secretary`),
  ADD KEY `id_mather` (`id_mather`),
  ADD KEY `id_typeofopration` (`id_typeofopration`);

--
-- Indexes for table `postanatalexamination`
--
ALTER TABLE `postanatalexamination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docter` (`id_docter`),
  ADD KEY `id_mather` (`id_mather`);

--
-- Indexes for table `preventivetes`
--
ALTER TABLE `preventivetes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`);

--
-- Indexes for table `risksrelatedtocurrentpregnancy`
--
ALTER TABLE `risksrelatedtocurrentpregnancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docter` (`id_docter`),
  ADD KEY `id_mather` (`id_mather`);

--
-- Indexes for table `secretary`
--
ALTER TABLE `secretary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `information_id` (`information_id`);

--
-- Indexes for table `teststype`
--
ALTER TABLE `teststype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_child` (`id_child`),
  ADD KEY `id_docter` (`id_docter`);

--
-- Indexes for table `typeofimmunization`
--
ALTER TABLE `typeofimmunization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typeofopration`
--
ALTER TABLE `typeofopration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typeperson`
--
ALTER TABLE `typeperson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vist`
--
ALTER TABLE `vist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docter` (`id_docter`),
  ADD KEY `id_mather` (`id_mather`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `antenatalfollowup`
--
ALTER TABLE `antenatalfollowup`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `careandpreyery`
--
ALTER TABLE `careandpreyery`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `child`
--
ALTER TABLE `child`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `childcare`
--
ALTER TABLE `childcare`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `childmeasletsid`
--
ALTER TABLE `childmeasletsid`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docter`
--
ALTER TABLE `docter`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `femalechildcheck`
--
ALTER TABLE `femalechildcheck`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followupandcareofpregnantwomen`
--
ALTER TABLE `followupandcareofpregnantwomen`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasband`
--
ALTER TABLE `hasband`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `immunization`
--
ALTER TABLE `immunization`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malechildcheck`
--
ALTER TABLE `malechildcheck`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mathercare`
--
ALTER TABLE `mathercare`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matherexamination`
--
ALTER TABLE `matherexamination`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newbornassessment`
--
ALTER TABLE `newbornassessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postanatalexamination`
--
ALTER TABLE `postanatalexamination`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preventivetes`
--
ALTER TABLE `preventivetes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `risksrelatedtocurrentpregnancy`
--
ALTER TABLE `risksrelatedtocurrentpregnancy`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `secretary`
--
ALTER TABLE `secretary`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teststype`
--
ALTER TABLE `teststype`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typeofimmunization`
--
ALTER TABLE `typeofimmunization`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `typeofopration`
--
ALTER TABLE `typeofopration`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `typeperson`
--
ALTER TABLE `typeperson`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vist`
--
ALTER TABLE `vist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`);

--
-- القيود للجدول `antenatalfollowup`
--
ALTER TABLE `antenatalfollowup`
  ADD CONSTRAINT `antenatalfollowup_ibfk_1` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`),
  ADD CONSTRAINT `antenatalfollowup_ibfk_2` FOREIGN KEY (`id_mather`) REFERENCES `mather` (`id`);

--
-- القيود للجدول `careandpreyery`
--
ALTER TABLE `careandpreyery`
  ADD CONSTRAINT `careandpreyery_ibfk_1` FOREIGN KEY (`id_followup`) REFERENCES `followupandcareofpregnantwomen` (`id`),
  ADD CONSTRAINT `careandpreyery_ibfk_2` FOREIGN KEY (`id_followupantenatal`) REFERENCES `antenatalfollowup` (`id`),
  ADD CONSTRAINT `careandpreyery_ibfk_3` FOREIGN KEY (`id_mather`) REFERENCES `mather` (`id`),
  ADD CONSTRAINT `careandpreyery_ibfk_4` FOREIGN KEY (`id_resksralated`) REFERENCES `risksrelatedtocurrentpregnancy` (`id`),
  ADD CONSTRAINT `careandpreyery_ibfk_5` FOREIGN KEY (`id_mathercare`) REFERENCES `mathercare` (`id`),
  ADD CONSTRAINT `careandpreyery_ibfk_6` FOREIGN KEY (`id_postanatalexamination`) REFERENCES `postanatalexamination` (`id`);

--
-- القيود للجدول `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `child_ibfk_1` FOREIGN KEY (`bloodtype_id`) REFERENCES `bloodtype` (`id`),
  ADD CONSTRAINT `child_ibfk_2` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`),
  ADD CONSTRAINT `child_ibfk_3` FOREIGN KEY (`mather_id`) REFERENCES `mather` (`id`);

--
-- القيود للجدول `childcare`
--
ALTER TABLE `childcare`
  ADD CONSTRAINT `childcare_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`),
  ADD CONSTRAINT `childcare_ibfk_2` FOREIGN KEY (`id_childmeasletsid`) REFERENCES `childmeasletsid` (`id`),
  ADD CONSTRAINT `childcare_ibfk_3` FOREIGN KEY (`id_immunization`) REFERENCES `immunization` (`id`),
  ADD CONSTRAINT `childcare_ibfk_4` FOREIGN KEY (`id_transfers`) REFERENCES `transfers` (`id`),
  ADD CONSTRAINT `childcare_ibfk_5` FOREIGN KEY (`id_childexamination`) REFERENCES `childexamination` (`id`),
  ADD CONSTRAINT `childcare_ibfk_6` FOREIGN KEY (`id_newborn`) REFERENCES `newbornassessment` (`id`);

--
-- القيود للجدول `childexamination`
--
ALTER TABLE `childexamination`
  ADD CONSTRAINT `childexamination_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`),
  ADD CONSTRAINT `childexamination_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `childmeasletsid`
--
ALTER TABLE `childmeasletsid`
  ADD CONSTRAINT `childmeasletsid_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`),
  ADD CONSTRAINT `childmeasletsid_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `docter`
--
ALTER TABLE `docter`
  ADD CONSTRAINT `docter_ibfk_1` FOREIGN KEY (`Information_id`) REFERENCES `information` (`id`);

--
-- القيود للجدول `femalechildcheck`
--
ALTER TABLE `femalechildcheck`
  ADD CONSTRAINT `femalechildcheck_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`),
  ADD CONSTRAINT `femalechildcheck_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `followupandcareofpregnantwomen`
--
ALTER TABLE `followupandcareofpregnantwomen`
  ADD CONSTRAINT `followupandcareofpregnantwomen_ibfk_1` FOREIGN KEY (`id_mather`) REFERENCES `mather` (`id`),
  ADD CONSTRAINT `followupandcareofpregnantwomen_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `hasband`
--
ALTER TABLE `hasband`
  ADD CONSTRAINT `hasband_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`);

--
-- القيود للجدول `immunization`
--
ALTER TABLE `immunization`
  ADD CONSTRAINT `immunization_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`),
  ADD CONSTRAINT `immunization_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`),
  ADD CONSTRAINT `immunization_ibfk_3` FOREIGN KEY (`id_tybeOfImmmunization`) REFERENCES `typeofimmunization` (`id`);

--
-- القيود للجدول `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `information_ibfk_1` FOREIGN KEY (`typeperson_id`) REFERENCES `typeperson` (`id`);

--
-- القيود للجدول `malechildcheck`
--
ALTER TABLE `malechildcheck`
  ADD CONSTRAINT `malechildcheck_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`),
  ADD CONSTRAINT `malechildcheck_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `mather`
--
ALTER TABLE `mather`
  ADD CONSTRAINT `mather_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`),
  ADD CONSTRAINT `mather_ibfk_2` FOREIGN KEY (`blood_id`) REFERENCES `bloodtype` (`id`),
  ADD CONSTRAINT `mather_ibfk_3` FOREIGN KEY (`husband_id`) REFERENCES `hasband` (`id`),
  ADD CONSTRAINT `mather_ibfk_4` FOREIGN KEY (`id_secretary`) REFERENCES `secretary` (`id`);

--
-- القيود للجدول `mathercare`
--
ALTER TABLE `mathercare`
  ADD CONSTRAINT `mathercare_ibfk_1` FOREIGN KEY (`id_mather`) REFERENCES `mather` (`id`),
  ADD CONSTRAINT `mathercare_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `matherexamination`
--
ALTER TABLE `matherexamination`
  ADD CONSTRAINT `matherexamination_ibfk_1` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`),
  ADD CONSTRAINT `matherexamination_ibfk_2` FOREIGN KEY (`id_mather`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `newbornassessment`
--
ALTER TABLE `newbornassessment`
  ADD CONSTRAINT `newbornassessment_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`),
  ADD CONSTRAINT `newbornassessment_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `opreation`
--
ALTER TABLE `opreation`
  ADD CONSTRAINT `opreation_ibfk_1` FOREIGN KEY (`id_secretary`) REFERENCES `secretary` (`id`),
  ADD CONSTRAINT `opreation_ibfk_2` FOREIGN KEY (`id_mather`) REFERENCES `mather` (`id`),
  ADD CONSTRAINT `opreation_ibfk_3` FOREIGN KEY (`id_typeofopration`) REFERENCES `typeofopration` (`id`);

--
-- القيود للجدول `postanatalexamination`
--
ALTER TABLE `postanatalexamination`
  ADD CONSTRAINT `postanatalexamination_ibfk_1` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`),
  ADD CONSTRAINT `postanatalexamination_ibfk_2` FOREIGN KEY (`id_mather`) REFERENCES `mather` (`id`);

--
-- القيود للجدول `preventivetes`
--
ALTER TABLE `preventivetes`
  ADD CONSTRAINT `preventivetes_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`);

--
-- القيود للجدول `risksrelatedtocurrentpregnancy`
--
ALTER TABLE `risksrelatedtocurrentpregnancy`
  ADD CONSTRAINT `risksrelatedtocurrentpregnancy_ibfk_1` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`),
  ADD CONSTRAINT `risksrelatedtocurrentpregnancy_ibfk_2` FOREIGN KEY (`id_mather`) REFERENCES `mather` (`id`);

--
-- القيود للجدول `secretary`
--
ALTER TABLE `secretary`
  ADD CONSTRAINT `secretary_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`);

--
-- القيود للجدول `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`id_child`) REFERENCES `child` (`id`),
  ADD CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`);

--
-- القيود للجدول `vist`
--
ALTER TABLE `vist`
  ADD CONSTRAINT `vist_ibfk_1` FOREIGN KEY (`id_docter`) REFERENCES `docter` (`id`),
  ADD CONSTRAINT `vist_ibfk_2` FOREIGN KEY (`id_mather`) REFERENCES `mather` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
