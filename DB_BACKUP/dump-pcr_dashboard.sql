-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: pcr_dashboard
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `daily_future_data`
--

DROP TABLE IF EXISTS `daily_future_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_future_data` (
  `curr_date` date NOT NULL,
  `SYMBOL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exp_date` date NOT NULL,
  `open_price` decimal(10,2) DEFAULT NULL,
  `high_price` decimal(10,2) DEFAULT NULL,
  `low_price` decimal(10,2) DEFAULT NULL,
  `close_price` decimal(10,2) DEFAULT NULL,
  `open_interest` decimal(20,2) DEFAULT NULL,
  `traded_quantity` decimal(20,2) DEFAULT NULL,
  `traded_value` decimal(20,2) DEFAULT NULL,
  `no_of_contracts` decimal(20,2) DEFAULT NULL,
  `no_of_trades` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`curr_date`,`SYMBOL`,`exp_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_option_data`
--

DROP TABLE IF EXISTS `daily_option_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_option_data` (
  `curr_date` date NOT NULL,
  `SYMBOL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exp_date` date NOT NULL,
  `strike_price` decimal(10,2) NOT NULL,
  `option_type` varchar(2) DEFAULT NULL,
  `open_price` decimal(10,2) DEFAULT NULL,
  `high_price` decimal(10,2) DEFAULT NULL,
  `low_price` decimal(10,2) DEFAULT NULL,
  `close_price` decimal(10,2) DEFAULT NULL,
  `open_interest` decimal(20,2) DEFAULT NULL,
  `traded_quantity` decimal(20,2) DEFAULT NULL,
  `no_of_contracts` decimal(20,2) DEFAULT NULL,
  `no_of_trades` decimal(20,2) DEFAULT NULL,
  `notional_value` decimal(20,2) DEFAULT NULL,
  `premium_value` decimal(20,2) DEFAULT NULL,
  KEY `daily_option_data_curr_date_IDX` (`curr_date`,`SYMBOL`,`exp_date`,`strike_price`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_option_data_archive`
--

DROP TABLE IF EXISTS `daily_option_data_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_option_data_archive` (
  `curr_date` date NOT NULL,
  `SYMBOL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exp_date` date NOT NULL,
  `strike_price` decimal(10,2) NOT NULL,
  `option_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `open_price` decimal(10,2) DEFAULT NULL,
  `high_price` decimal(10,2) DEFAULT NULL,
  `low_price` decimal(10,2) DEFAULT NULL,
  `close_price` decimal(10,2) DEFAULT NULL,
  `open_interest` decimal(20,2) DEFAULT NULL,
  `traded_quantity` decimal(20,2) DEFAULT NULL,
  `no_of_contracts` decimal(20,2) DEFAULT NULL,
  `no_of_trades` decimal(20,2) DEFAULT NULL,
  `notional_value` decimal(20,2) DEFAULT NULL,
  `premium_value` decimal(20,2) DEFAULT NULL,
  KEY `daily_option_data_archive_curr_date_IDX` (`curr_date`,`SYMBOL`,`exp_date`,`strike_price`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `futures_info`
--

DROP TABLE IF EXISTS `futures_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `futures_info` (
  `symbol` varchar(100) NOT NULL,
  `current_date` date NOT NULL,
  `exp_date` date NOT NULL,
  `total_oi` decimal(16,0) DEFAULT NULL,
  `oi_change` decimal(16,2) DEFAULT NULL,
  `futures_premium` decimal(10,2) DEFAULT NULL,
  `day_premium_change` decimal(10,2) DEFAULT NULL,
  `prev_date` date DEFAULT NULL,
  PRIMARY KEY (`symbol`,`current_date`,`exp_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nifty_50`
--

DROP TABLE IF EXISTS `nifty_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nifty_50` (
  `weightage` decimal(6,2) DEFAULT NULL,
  `symbol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pcr_data_otm`
--

DROP TABLE IF EXISTS `pcr_data_otm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pcr_data_otm` (
  `symbol` varchar(100) NOT NULL,
  `current_date` date NOT NULL,
  `pcr_otm_whole` decimal(10,2) DEFAULT NULL,
  `pcr_otm_current_month` decimal(10,2) DEFAULT NULL,
  `pcr_otm_next_month` decimal(10,2) DEFAULT NULL,
  `pcr_otm_current_week` decimal(10,2) DEFAULT NULL,
  `pcr_otm_next_week` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`symbol`,`current_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pcr_data_whole`
--

DROP TABLE IF EXISTS `pcr_data_whole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pcr_data_whole` (
  `symbol` varchar(100) NOT NULL,
  `current_date` date NOT NULL,
  `pcr_sod_bloomberg` decimal(10,2) DEFAULT NULL,
  `pcr_eod_bloomberg` decimal(10,2) DEFAULT NULL,
  `pcr_sod_nse` decimal(10,2) DEFAULT NULL,
  `pcr_eod_nse` decimal(10,2) DEFAULT NULL,
  `close_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`symbol`,`current_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pcr_data_whole_expiry_wise`
--

DROP TABLE IF EXISTS `pcr_data_whole_expiry_wise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pcr_data_whole_expiry_wise` (
  `symbol` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `curr_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `pcr_eod_nse` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`symbol`,`curr_date`,`expiry_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'pcr_dashboard'
--
/*!50003 DROP PROCEDURE IF EXISTS `CALCULATE_FUTURE_DATA_INFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCULATE_FUTURE_DATA_INFO`(
DATE_TARGET DATE,
TARGET_SYMBOL VARCHAR(100))
BEGIN


DECLARE DATE_PREV_DAY DATE;

DECLARE EQ_CLOSE_PRICE_CURR_DATE DECIMAL(8,2);

DECLARE EQ_CLOSE_PRICE_PREV_DATE DECIMAL(8,2);


DECLARE FUTURES_CLOSE_PRICE_CURR_DATE DECIMAL(8,2);
DECLARE FUTURES_CLOSE_PRICE_PREV_DATE DECIMAL(8,2) DEFAULT NULL;

DECLARE FUTURES_OI_CURR_DATE INT(11);
DECLARE FUTURES_OI_PREV_DATE INT(11) DEFAULT NULL;



DECLARE FUTURES_DATA_INFO CURSOR FOR
SELECT  distinct close_price,open_interest,
DATE_FORMAT(exp_date,'%Y-%m-%d')
FROM  daily_future_data
WHERE curr_date = DATE_TARGET
and symbol = TARGET_SYMBOL;

/*
select close_price from daily_equity_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
into  EQ_CLOSE_PRICE_CURR_DATE;
*/

select max(curr_date) from  daily_future_data where  curr_date < DATE_TARGET INTO DATE_PREV_DAY;

/*
select close_price from daily_equity_data
where
curr_date =  DATE_PREV_DAY
and symbol = TARGET_SYMBOL
into  EQ_CLOSE_PRICE_PREV_DATE;
*/

OPEN FUTURES_DATA_INFO;
  BEGIN

DECLARE VAR_EXP_DATE DATE;

DECLARE VAR_OI_CHANGE DECIMAL(8,2);

DECLARE VAR_FUTURES_PREMIUM DECIMAL(8,2);

DECLARE VAR_FUTURES_PREMIUM_CHANGE DECIMAL(8,2);



    DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
    CLOSE FUTURES_DATA_INFO;

    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN CLOSE FUTURES_DATA_INFO; RESIGNAL; END;
    LOOP
      FETCH FUTURES_DATA_INFO
      INTO FUTURES_CLOSE_PRICE_CURR_DATE,FUTURES_OI_CURR_DATE,VAR_EXP_DATE;

      SELECT close_price,open_interest FROM  daily_future_data
      WHERE symbol =  TARGET_SYMBOL
      and  exp_date = VAR_EXP_DATE
      and curr_date =  DATE_PREV_DAY LIMIT 1
      INTO     FUTURES_CLOSE_PRICE_PREV_DATE,FUTURES_OI_PREV_DATE;

IF(FUTURES_OI_PREV_DATE <> 0) THEN
SET VAR_OI_CHANGE =   (FUTURES_OI_CURR_DATE - FUTURES_OI_PREV_DATE) *100/  FUTURES_OI_PREV_DATE;
ELSE
SET VAR_OI_CHANGE = NULL;
END IF;

-- SET  VAR_FUTURES_PREMIUM = FUTURES_CLOSE_PRICE_CURR_DATE -  EQ_CLOSE_PRICE_CURR_DATE;

/*
SET VAR_FUTURES_PREMIUM_CHANGE = (FUTURES_CLOSE_PRICE_CURR_DATE -  EQ_CLOSE_PRICE_CURR_DATE) -
 (FUTURES_CLOSE_PRICE_PREV_DATE -  EQ_CLOSE_PRICE_PREV_DATE);
*/

REPLACE INTO futures_info
VALUES
(TARGET_SYMBOL, DATE_TARGET, VAR_EXP_DATE,FUTURES_OI_CURR_DATE,
VAR_OI_CHANGE,VAR_FUTURES_PREMIUM,VAR_FUTURES_PREMIUM_CHANGE,
 DATE_PREV_DAY);



      END LOOP;

END;










END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CALCULATE_FUTURE_INFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCULATE_FUTURE_INFO`(
FROM_DATE DATE,
TO_DATE DATE
)
BEGIN



DECLARE DATE_COUNTER DATE;

delete from daily_option_data
where CAST(exp_date as CHAR(50)) = '0000-00-00';

delete from daily_future_data
where CAST(exp_date as CHAR(50)) = '0000-00-00';

UPDATE daily_future_data SET  symbol = trim(symbol)
where curr_date between FROM_DATE and TO_DATE;

IF(TO_DATE IS NULL )   THEN
SET   TO_DATE =  CURDATE();
END IF;

IF(FROM_DATE IS NULL )   THEN
SET   FROM_DATE =  DATE_SUB(TO_DATE, INTERVAL 13 MONTH);
END IF;

SET DATE_COUNTER =  FROM_DATE;

WHILE  (DATE_COUNTER  <= TO_DATE)

DO

CALL CALCULATE_FUTURE_INFO_DATE(DATE_COUNTER);

SET DATE_COUNTER =   DATE_ADD(DATE_COUNTER, INTERVAL 1 DAY);

END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CALCULATE_FUTURE_INFO_DATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCULATE_FUTURE_INFO_DATE`(
DATE_TARGET DATE)
BEGIN




DECLARE FUTURE_DATA_FOR_DATE CURSOR FOR
SELECT distinct symbol FROM  daily_future_data
WHERE curr_date = DATE_TARGET;


OPEN FUTURE_DATA_FOR_DATE;
  BEGIN


      DECLARE VAR_SYMBOL VARCHAR(100);


    DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
    CLOSE FUTURE_DATA_FOR_DATE;

    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN CLOSE FUTURE_DATA_FOR_DATE; RESIGNAL; END;
    LOOP
      FETCH FUTURE_DATA_FOR_DATE INTO VAR_SYMBOL;

      CALL CALCULATE_FUTURE_DATA_INFO(DATE_TARGET,VAR_SYMBOL);



      END LOOP;

      END;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CALCULATE_PCR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCULATE_PCR`(
FROM_DATE DATE,
TO_DATE DATE
)
BEGIN


DECLARE DATE_COUNTER DATE;

delete from daily_option_data
where CAST(exp_date as CHAR(50)) = '0000-00-00';

delete from daily_future_data
where CAST(exp_date as CHAR(50)) = '0000-00-00';

UPDATE daily_option_data SET  symbol = trim(symbol), option_type = trim(option_type);


IF(TO_DATE IS NULL )   THEN
SET   TO_DATE =  CURDATE();
END IF;

IF(FROM_DATE IS NULL )   THEN
SET   FROM_DATE =  DATE_SUB(TO_DATE, INTERVAL 13 MONTH);
END IF;

SET DATE_COUNTER =  FROM_DATE;

WHILE  (DATE_COUNTER  <= TO_DATE)

DO

CALL CALCULATE_PCR_DATE(DATE_COUNTER);

SET DATE_COUNTER =   DATE_ADD(DATE_COUNTER, INTERVAL 1 DAY);

END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CALCULATE_PCR_DATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCULATE_PCR_DATE`(
DATE_TARGET DATE)
BEGIN




DECLARE OPTION_DATA_FOR_DATE CURSOR FOR
SELECT distinct symbol FROM  daily_option_data
WHERE curr_date = DATE_TARGET;


OPEN OPTION_DATA_FOR_DATE;
  BEGIN
      DECLARE VAR_SYMBOL VARCHAR(100); 

    DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
    CLOSE OPTION_DATA_FOR_DATE;

    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN CLOSE OPTION_DATA_FOR_DATE; RESIGNAL; END;
    LOOP
      FETCH OPTION_DATA_FOR_DATE INTO VAR_SYMBOL;

      if(VAR_SYMBOL is not null ) then
      CALL CALCULATE_PCR_WHOLE_SYMBOL(DATE_TARGET,VAR_SYMBOL);
      CALL CALCULATE_PCR_WHOLE_SYMBOL_EXPIRY_WISE(DATE_TARGET,VAR_SYMBOL);
      end if;

      -- CALL CALCULATE_PCR_OTM_SYMBOL(DATE_TARGET,VAR_SYMBOL);


      END LOOP;

      END;





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CALCULATE_PCR_OTM_SYMBOL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCULATE_PCR_OTM_SYMBOL`(
DATE_TARGET DATE,
TARGET_SYMBOL VARCHAR(100))
BEGIN

DECLARE EQ_CLOSE_PRICE DECIMAL(8,2);


DECLARE PUT_OI_WHOLE INT(15);

DECLARE CALL_OI_WHOLE INT(15);

DECLARE PCR_WHOLE DECIMAL(10,2);


DECLARE PUT_OI_CURRENT_MONTH INT(15);

DECLARE CALL_OI_CURRENT_MONTH INT(15);

DECLARE PCR_CURRENT_MONTH DECIMAL(10,2);


DECLARE PUT_OI_NEXT_MONTH INT(15);

DECLARE CALL_OI_NEXT_MONTH INT(15);

DECLARE PCR_NEXT_MONTH DECIMAL(10,2);


DECLARE PUT_OI_CURRENT_WEEK INT(15);

DECLARE CALL_OI_CURRENT_WEEK INT(15);

DECLARE PCR_CURRENT_WEEK DECIMAL(10,2);


DECLARE PUT_OI_NEXT_WEEK INT(15);

DECLARE CALL_OI_NEXT_WEEK INT(15);

DECLARE PCR_NEXT_WEEK DECIMAL(10,2);



select close_price from daily_equity_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
into  EQ_CLOSE_PRICE;




select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'PE'
and strike_price < EQ_CLOSE_PRICE
into  PUT_OI_WHOLE;

select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'CE'
and strike_price > EQ_CLOSE_PRICE
into  CALL_OI_WHOLE;



IF(CALL_OI_WHOLE <= 0) THEN

SET PCR_WHOLE = -1;

ELSE

SET PCR_WHOLE =   PUT_OI_WHOLE/CALL_OI_WHOLE;

END IF;


IF(PCR_WHOLE IS NULL)
THEN

 SET PCR_WHOLE = -1;

END IF;




select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'PE'
and strike_price < EQ_CLOSE_PRICE
AND MONTH(exp_date) = MONTH(DATE_TARGET)
into  PUT_OI_CURRENT_MONTH;

select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'CE'
and strike_price > EQ_CLOSE_PRICE
AND MONTH(exp_date) = MONTH(DATE_TARGET)
into  CALL_OI_CURRENT_MONTH;


SET PCR_CURRENT_MONTH =   PUT_OI_CURRENT_MONTH/CALL_OI_CURRENT_MONTH;

IF(PCR_CURRENT_MONTH IS NULL)
THEN

 SET PCR_CURRENT_MONTH = -1;

END IF;



select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'PE'
and strike_price < EQ_CLOSE_PRICE
AND MONTH(exp_date) = MONTH(DATE_TARGET) + 1
into  PUT_OI_NEXT_MONTH;

select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'CE'
and strike_price > EQ_CLOSE_PRICE
AND MONTH(exp_date) = MONTH(DATE_TARGET) + 1
into  CALL_OI_NEXT_MONTH;



IF(CALL_OI_NEXT_MONTH <= 0) THEN

SET PCR_NEXT_MONTH = -1;

ELSE

SET PCR_NEXT_MONTH =   PUT_OI_NEXT_MONTH/CALL_OI_NEXT_MONTH;

END IF;



IF(PCR_NEXT_MONTH IS NULL)
THEN

 SET PCR_NEXT_MONTH = -1;

 END IF;





select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'PE'
and strike_price < EQ_CLOSE_PRICE
AND WEEK(exp_date) = WEEK(DATE_TARGET)
into  PUT_OI_CURRENT_WEEK;

select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'CE'
and strike_price > EQ_CLOSE_PRICE
AND WEEK(exp_date) = WEEK(DATE_TARGET)
into  CALL_OI_CURRENT_WEEK;



IF(CALL_OI_CURRENT_WEEK <= 0) THEN

SET PCR_CURRENT_WEEK = -1;

ELSE

SET PCR_CURRENT_WEEK =   PUT_OI_CURRENT_WEEK/CALL_OI_CURRENT_WEEK;

END IF;


IF(PCR_CURRENT_WEEK IS NULL)
THEN

 SET PCR_CURRENT_WEEK = -1;

END IF;



select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'PE'
and strike_price < EQ_CLOSE_PRICE
AND WEEK(exp_date) = WEEK(DATE_TARGET) + 1
into  PUT_OI_NEXT_WEEK;

select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'CE'
and strike_price > EQ_CLOSE_PRICE
AND WEEK(exp_date) = WEEK(DATE_TARGET) + 1
into  CALL_OI_NEXT_WEEK;



IF(CALL_OI_NEXT_WEEK <= 0) THEN

SET PCR_NEXT_WEEK = -1;

ELSE

SET PCR_NEXT_WEEK =   PUT_OI_NEXT_WEEK/CALL_OI_NEXT_WEEK;

END IF;




IF(PCR_NEXT_WEEK IS NULL)
THEN

 SET PCR_NEXT_WEEK = -1;

 END IF;






REPLACE INTO pcr_data_otm

values(TARGET_SYMBOL,DATE_TARGET,PCR_WHOLE,PCR_CURRENT_MONTH,PCR_NEXT_MONTH,PCR_CURRENT_WEEK,PCR_NEXT_WEEK);







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CALCULATE_PCR_WHOLE_SYMBOL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCULATE_PCR_WHOLE_SYMBOL`(
DATE_TARGET DATE,
TARGET_SYMBOL VARCHAR(100))
BEGIN


DECLARE PUT_OI INT(15);

DECLARE CALL_OI INT(15);

DECLARE PCR DECIMAL(10,2);

DECLARE VAR_CLOSE_PRICE DECIMAL(10,2);




select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'PE'
into  PUT_OI;

select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
and option_type = 'CE'
into  CALL_OI;


IF(CALL_OI <= 0) THEN

SET PCR = -1;

ELSE

SET PCR =   PUT_OI/CALL_OI;

END IF;


IF(PCR IS NULL)
THEN

 SET PCR = -1;

 END IF;


/*
select close_price from daily_option_data
where
curr_date =  DATE_TARGET
and symbol = TARGET_SYMBOL
into  VAR_CLOSE_PRICE;

*/


REPLACE INTO pcr_data_whole

values(TARGET_SYMBOL,DATE_TARGET,-1,-1,-1,PCR,0);







END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CALCULATE_PCR_WHOLE_SYMBOL_EXPIRY_WISE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALCULATE_PCR_WHOLE_SYMBOL_EXPIRY_WISE`(
DATE_TARGET DATE,
TARGET_SYMBOL VARCHAR(100))
BEGIN


DECLARE PUT_OI INT(15);

DECLARE CALL_OI INT(15);

DECLARE PCR DECIMAL(10,2);

DECLARE VAR_CLOSE_PRICE DECIMAL(10,2);

DECLARE VAR_EXP_DATE DATE;


DECLARE OPTION_DATA_FOR_DATE CURSOR FOR
SELECT distinct CAST(exp_date as CHAR(50)) FROM  daily_option_data
WHERE curr_date = DATE_TARGET
and symbol = TARGET_SYMBOL;


OPEN OPTION_DATA_FOR_DATE;
  BEGIN

    DECLARE EXIT HANDLER FOR NOT FOUND BEGIN
    CLOSE OPTION_DATA_FOR_DATE;

    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN CLOSE OPTION_DATA_FOR_DATE; RESIGNAL; END;
    LOOP
      FETCH OPTION_DATA_FOR_DATE INTO VAR_EXP_DATE;

      if(VAR_EXP_DATE is not null ) then


select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and exp_date = VAR_EXP_DATE
and symbol = TARGET_SYMBOL
and option_type = 'PE'
into  PUT_OI;

select sum(open_interest) from daily_option_data
where
curr_date =  DATE_TARGET
and exp_date = VAR_EXP_DATE
and symbol = TARGET_SYMBOL
and option_type = 'CE'
into  CALL_OI;


IF(CALL_OI <= 0) THEN

SET PCR = -1;

ELSE

SET PCR =   PUT_OI/CALL_OI;

END IF;


IF(PCR IS NULL)
THEN

 SET PCR = -1;

 END IF;



REPLACE INTO pcr_data_whole_expiry_wise

values(TARGET_SYMBOL,DATE_TARGET,VAR_EXP_DATE,PCR);



      end if;



      END LOOP;

      END;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-01 22:33:49
