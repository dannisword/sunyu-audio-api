CREATE DATABASE  IF NOT EXISTS `ttqs_expert_demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ttqs_expert_demo`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: ttqs_expert_demo
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `annual_course_planning`
--

DROP TABLE IF EXISTS `annual_course_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annual_course_planning` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `FunctionCategory` int NOT NULL DEFAULT '1' COMMENT '職能類別',
  `CourseName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程名稱',
  `TackCourseType` int NOT NULL DEFAULT '1' COMMENT '修課類型 1:必修 0: 選修',
  `TrainingGoal` int NOT NULL DEFAULT '1' COMMENT '訓練目的',
  `OtherTrainingGoal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他訓練目的',
  `Memo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '課程大綱',
  `Year` int NOT NULL DEFAULT '0' COMMENT '年度',
  `UnitSeq` int NOT NULL COMMENT '單位Seq',
  `TeachWay` int NOT NULL DEFAULT '0' COMMENT '授課方式 1:實體 2:線上',
  `CourseHours` int NOT NULL DEFAULT '0' COMMENT '課程時數',
  `TrainingObject` int NOT NULL DEFAULT '1' COMMENT '訓練對象 對應表:training_object',
  `OtherTrainingObject` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他訓練對象',
  `TrainingNumbers` int NOT NULL COMMENT '訓練人數',
  `EstimatedExpenses` int NOT NULL COMMENT '預估經費',
  `EstimatedExpensesMemo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '經費說明',
  `EstimatedStartMonth` int NOT NULL COMMENT '預計開始月份',
  `EstimatedEndMonth` int DEFAULT NULL COMMENT '預計結束月份',
  `ActualDate` date DEFAULT NULL COMMENT '實際日期',
  `SubmitReview` int NOT NULL DEFAULT '0' COMMENT '是否送審 0:否 1:是',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`),
  KEY `FK_annual_course_planning_unit` (`UnitSeq`),
  KEY `FK_annual_course_planning_training_object` (`TrainingObject`),
  KEY `FK_annual_course_planning_training_goal` (`TrainingGoal`),
  KEY `FK_annual_course_planning_function_category` (`FunctionCategory`),
  CONSTRAINT `FK_annual_course_planning_function_category` FOREIGN KEY (`FunctionCategory`) REFERENCES `function_category` (`Seq`),
  CONSTRAINT `FK_annual_course_planning_training_goal` FOREIGN KEY (`TrainingGoal`) REFERENCES `training_goal` (`Seq`),
  CONSTRAINT `FK_annual_course_planning_training_object` FOREIGN KEY (`TrainingObject`) REFERENCES `training_object` (`Seq`),
  CONSTRAINT `FK_annual_course_planning_unit` FOREIGN KEY (`UnitSeq`) REFERENCES `unit` (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='年度課程規劃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annual_course_planning`
--

LOCK TABLES `annual_course_planning` WRITE;
/*!40000 ALTER TABLE `annual_course_planning` DISABLE KEYS */;
/*!40000 ALTER TABLE `annual_course_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '序號',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名稱',
  `DeleteTag` int DEFAULT '0' COMMENT '刪除標記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'A','臺北市',0),(2,'B','新北市',0),(3,'C','桃園市',0),(4,'D','台中市',0),(5,'E','台南市',0),(6,'F','高雄市',0),(7,'G','基隆市',0),(8,'H','新竹市',0),(9,'I','嘉義市',0),(10,'J','新竹縣',0),(11,'K','苗栗縣',0),(12,'L','彰化縣',0),(13,'M','南投縣',0),(14,'N','雲林縣',0),(15,'O','嘉義縣',0),(16,'P','屏東縣',0),(17,'Q','宜蘭縣',0),(18,'R','花蓮縣',0),(19,'S','臺東縣',0),(20,'T','澎湖縣',0),(21,'U','金門縣',0),(22,'V','連江縣',0);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CourseName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程名稱',
  `CourseNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '課程編號 西元年月日+2碼流水號',
  `StartTime` date DEFAULT NULL COMMENT '開始時間',
  `EndTime` date DEFAULT NULL COMMENT '結束時間',
  `Host` int DEFAULT NULL,
  `LecturerType` int DEFAULT NULL COMMENT '講師類型 1:內部 2:外部',
  `Lecturer` int DEFAULT '0' COMMENT '內部講師Seq',
  `OtherLecturer` int DEFAULT NULL COMMENT '外部講師Seq (從講師資料庫)',
  `OpenSignUp` int NOT NULL DEFAULT '0' COMMENT '報名方法 0:限制報名 1:公開報名 2:必修',
  `AllowExternal` int NOT NULL DEFAULT '0' COMMENT '開放外部報名 0:不開放 1:開放',
  `CourseSurvey1` int NOT NULL DEFAULT '0' COMMENT '滿意度調查表',
  `CourseSurvey2` int NOT NULL DEFAULT '0' COMMENT '訓後成效追蹤表',
  `CourseSurvey3` int NOT NULL DEFAULT '0' COMMENT '課後行動方案',
  `CourseMemo` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '課程簡介',
  `AuthorMemo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者介紹',
  `CourseFocus` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '課程重點',
  `CourseRelease` int NOT NULL DEFAULT '0' COMMENT '課程發佈狀態 1:發佈 0: 未發佈',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課程清單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (3,'湯武IOT1','20221001001','2022-10-01','2022-12-31',NULL,1,0,NULL,1,1,0,0,0,'測試資料','DANNIS','測試資料',1,'2022-10-20 00:00:00',1,NULL,NULL,0),(4,'湯武IOT','20221001002','2022-10-01','2022-12-31',NULL,1,0,NULL,1,1,0,0,0,'測試資料','DANNIS','測試資料',1,'2022-10-20 00:00:00',1,NULL,NULL,0),(5,'string','string','2022-10-22','2022-10-22',0,0,0,0,0,0,0,0,0,'string','string','string',0,'2022-10-22 13:56:19',0,'2022-10-22 13:56:19',0,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_appendix`
--

DROP TABLE IF EXISTS `course_appendix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_appendix` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CourseSeq` int NOT NULL COMMENT '課程Seq',
  `Unit` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '單元數',
  `FilePath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '檔案路徑',
  `FileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '檔案名稱',
  `OriginalFileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '顯示名稱',
  `Memo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '影片說明',
  `Tag` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '標籤',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`),
  KEY `FK_course_appendix_course` (`CourseSeq`),
  CONSTRAINT `FK_course_appendix_course` FOREIGN KEY (`CourseSeq`) REFERENCES `course` (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課程檔案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_appendix`
--

LOCK TABLES `course_appendix` WRITE;
/*!40000 ALTER TABLE `course_appendix` DISABLE KEYS */;
INSERT INTO `course_appendix` VALUES (4,3,' 1','1','1','第一章','數位學習服務：數位教材製作 / 線上學習系統 / 影片教材大師AutoMedia','12','2022-01-01 00:00:00',1,'2022-01-01 00:00:00',1,0),(5,3,'2','2','2','第二章','資訊軟體開發：票務自動化系統 / 人力資源管理系統 / 會計管理系統','12','2022-01-01 00:00:00',1,'2022-01-01 00:00:00',1,0),(6,3,'3','3','3','第三章','人工智慧應用：AI語音合成技術 / 客服機器人 / 多元整合服務','12','2022-01-01 00:00:00',1,'2022-01-01 00:00:00',1,0),(7,3,'4','4','4','第四章','人工智慧應用：AI語音合成技術 / 客服機器人 / 多元整合服務','12','2022-01-01 00:00:00',1,'2022-01-01 00:00:00',1,0);
/*!40000 ALTER TABLE `course_appendix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_designate`
--

DROP TABLE IF EXISTS `course_designate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_designate` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CourseSeq` int NOT NULL COMMENT '課程Seq',
  `DivisionSeq` int NOT NULL COMMENT '指定部門',
  `SectionSeq` int DEFAULT NULL COMMENT '指定子部門',
  `AllowedCount` int NOT NULL COMMENT '參加人數',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`),
  KEY `FK_course_designate_Division` (`DivisionSeq`),
  KEY `FK_course_designate_Section` (`SectionSeq`),
  KEY `FK_course_designate_course` (`CourseSeq`),
  CONSTRAINT `FK_course_designate_course` FOREIGN KEY (`CourseSeq`) REFERENCES `course` (`Seq`),
  CONSTRAINT `FK_course_designate_Division` FOREIGN KEY (`DivisionSeq`) REFERENCES `unit` (`Seq`),
  CONSTRAINT `FK_course_designate_Section` FOREIGN KEY (`SectionSeq`) REFERENCES `unit` (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='指派參加課程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_designate`
--

LOCK TABLES `course_designate` WRITE;
/*!40000 ALTER TABLE `course_designate` DISABLE KEYS */;
INSERT INTO `course_designate` VALUES (1,3,1,NULL,10,'2022-10-01 00:00:00',0,NULL,NULL,0);
/*!40000 ALTER TABLE `course_designate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_play_record`
--

DROP TABLE IF EXISTS `course_play_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_play_record` (
  `Seq` int NOT NULL AUTO_INCREMENT,
  `CourseSeq` int NOT NULL,
  `Unit` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SignUpUser` int NOT NULL,
  `PlayAt` int NOT NULL,
  `CreatDate` datetime NOT NULL,
  `CreatUser` int NOT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `ModifyUser` int DEFAULT NULL,
  PRIMARY KEY (`Seq`),
  KEY `FK_course_play_record_idx` (`CourseSeq`),
  CONSTRAINT `FK_course_play_record` FOREIGN KEY (`CourseSeq`) REFERENCES `course` (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_play_record`
--

LOCK TABLES `course_play_record` WRITE;
/*!40000 ALTER TABLE `course_play_record` DISABLE KEYS */;
INSERT INTO `course_play_record` VALUES (1,3,'1',1,8,'2022-10-01 00:00:00',1,'2022-10-22 23:49:37',0),(2,3,'2',1,8,'2022-10-22 23:50:12',0,NULL,NULL);
/*!40000 ALTER TABLE `course_play_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_signup`
--

DROP TABLE IF EXISTS `course_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_signup` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CourseSeq` int NOT NULL COMMENT '課程Seq',
  `SignUpUser` int NOT NULL COMMENT '報名人員Seq',
  `IsDesignate` int DEFAULT NULL COMMENT '指定參加 1:是',
  `IsSignedIn` int NOT NULL DEFAULT '0' COMMENT '已簽到 0:否 1:是',
  `IsSignInTime` datetime DEFAULT NULL COMMENT '簽到時間',
  `IsSignedOut` int DEFAULT '0' COMMENT '已簽退 0:否 1:是',
  `IsSignOutTime` datetime DEFAULT NULL COMMENT '簽退時間',
  `Memo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  PRIMARY KEY (`Seq`),
  KEY `FK_course_signup_user` (`SignUpUser`),
  KEY `FK_course_signup_course` (`CourseSeq`),
  CONSTRAINT `FK_course_signup_course` FOREIGN KEY (`CourseSeq`) REFERENCES `course` (`Seq`),
  CONSTRAINT `FK_course_signup_user` FOREIGN KEY (`SignUpUser`) REFERENCES `user` (`UserSeq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課程報名清單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_signup`
--

LOCK TABLES `course_signup` WRITE;
/*!40000 ALTER TABLE `course_signup` DISABLE KEYS */;
INSERT INTO `course_signup` VALUES (1,3,1,1,1,'2022-10-01 00:00:00',1,'2022-10-01 00:00:00',NULL,'2022-10-01 00:00:00',0,NULL,NULL);
/*!40000 ALTER TABLE `course_signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_survey1`
--

DROP TABLE IF EXISTS `course_survey1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_survey1` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CourseSignUpSeq` int NOT NULL COMMENT '報名Seq',
  `Score11` int DEFAULT NULL,
  `Score12` int DEFAULT NULL,
  `Score21` int DEFAULT NULL,
  `Score22` int DEFAULT NULL,
  `Score31` int DEFAULT NULL,
  `Score41` int DEFAULT NULL,
  `Score42` int DEFAULT NULL,
  `Score43` int DEFAULT NULL,
  `Score44` int DEFAULT NULL,
  `Score51` int DEFAULT NULL,
  `Score52` int DEFAULT NULL,
  `Score61` int DEFAULT NULL,
  `Score62` int DEFAULT NULL,
  `Score63` int DEFAULT NULL,
  `Score71` int DEFAULT NULL,
  `Score72` int DEFAULT NULL,
  `Opinion1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '其他意見',
  `Opinion2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Opinion3` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  PRIMARY KEY (`Seq`),
  KEY `FK_course_survey1_course_signup` (`CourseSignUpSeq`),
  CONSTRAINT `FK_course_survey1_course_signup` FOREIGN KEY (`CourseSignUpSeq`) REFERENCES `course_signup` (`Seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='滿意度調查表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_survey1`
--

LOCK TABLES `course_survey1` WRITE;
/*!40000 ALTER TABLE `course_survey1` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_survey1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_survey2`
--

DROP TABLE IF EXISTS `course_survey2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_survey2` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CourseSignUpSeq` int NOT NULL COMMENT '報名Seq',
  `LessonLearned` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '學習心得',
  `UsageAtWork` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '應用情形',
  `FutureProposal` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '需求建議',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  PRIMARY KEY (`Seq`),
  KEY `FK_course_survey2_course_signup` (`CourseSignUpSeq`),
  CONSTRAINT `FK_course_survey2_course_signup` FOREIGN KEY (`CourseSignUpSeq`) REFERENCES `course_signup` (`Seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課程課後心得表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_survey2`
--

LOCK TABLES `course_survey2` WRITE;
/*!40000 ALTER TABLE `course_survey2` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_survey2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_survey3`
--

DROP TABLE IF EXISTS `course_survey3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_survey3` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CourseSignUpSeq` int NOT NULL COMMENT '報名Seq',
  `ContentA` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContentB` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContentC` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContentD` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContentE` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  PRIMARY KEY (`Seq`),
  KEY `FK_course_survey3_course_signup` (`CourseSignUpSeq`),
  CONSTRAINT `FK_course_survey3_course_signup` FOREIGN KEY (`CourseSignUpSeq`) REFERENCES `course_signup` (`Seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='課後行動方案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_survey3`
--

LOCK TABLES `course_survey3` WRITE;
/*!40000 ALTER TABLE `course_survey3` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_survey3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_attitude`
--

DROP TABLE IF EXISTS `description_attitude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description_attitude` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `DescriptionSeq` int NOT NULL COMMENT '職務說明書流水序',
  `Attitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工作態度',
  `Memo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '定義',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職務說明書-工作態度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_attitude`
--

LOCK TABLES `description_attitude` WRITE;
/*!40000 ALTER TABLE `description_attitude` DISABLE KEYS */;
/*!40000 ALTER TABLE `description_attitude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_certificate`
--

DROP TABLE IF EXISTS `description_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description_certificate` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `DescriptionSeq` int NOT NULL COMMENT '職務說明書流水序',
  `Certificate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '專業證照',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職務說明書-專業證照';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_certificate`
--

LOCK TABLES `description_certificate` WRITE;
/*!40000 ALTER TABLE `description_certificate` DISABLE KEYS */;
INSERT INTO `description_certificate` VALUES (1,1,'','2022-03-11 16:02:29',1,'2022-03-11 16:02:31',1,1);
/*!40000 ALTER TABLE `description_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_experience`
--

DROP TABLE IF EXISTS `description_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description_experience` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `DescriptionSeq` int NOT NULL COMMENT '職務說明書流水序',
  `WorkExperience` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工作經驗',
  `Seniority` int NOT NULL DEFAULT '0' COMMENT '年資',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職務說明書-工作經驗及年資';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_experience`
--

LOCK TABLES `description_experience` WRITE;
/*!40000 ALTER TABLE `description_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `description_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_language`
--

DROP TABLE IF EXISTS `description_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description_language` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `DescriptionSeq` int NOT NULL COMMENT '職務說明書流水序',
  `Language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '語言',
  `Hear` int NOT NULL DEFAULT '1' COMMENT '聽 1:不會 2:略懂 3:普通 4:精通',
  `Say` int NOT NULL DEFAULT '1' COMMENT '說 1:不會 2:略懂 3:普通 4:精通',
  `Read` int NOT NULL DEFAULT '1' COMMENT '讀 1:不會 2:略懂 3:普通 4:精通',
  `Write` int NOT NULL DEFAULT '1' COMMENT '寫 1:不會 2:略懂 3:普通 4:精通',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職務說明書-語言能力';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_language`
--

LOCK TABLES `description_language` WRITE;
/*!40000 ALTER TABLE `description_language` DISABLE KEYS */;
INSERT INTO `description_language` VALUES (1,1,'',1,1,1,1,'2022-03-11 16:02:40',1,'2022-03-11 16:02:43',1,1);
/*!40000 ALTER TABLE `description_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_object`
--

DROP TABLE IF EXISTS `description_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description_object` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `DescriptionSeq` int NOT NULL COMMENT '職務說明書流水序',
  `Way` int NOT NULL COMMENT '接觸地點 1:內部 2:外部',
  `Who` varchar(100) NOT NULL COMMENT '接觸對象',
  `Matter` varchar(100) NOT NULL COMMENT '工作事項',
  `Frequency` varchar(100) NOT NULL COMMENT '接觸頻率',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='職務說明書-接觸對象';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_object`
--

LOCK TABLES `description_object` WRITE;
/*!40000 ALTER TABLE `description_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `description_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_task`
--

DROP TABLE IF EXISTS `description_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description_task` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `DescriptionSeq` int NOT NULL COMMENT '職務說明書流水序',
  `Task` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任務',
  `Duty` int NOT NULL DEFAULT '1' COMMENT '責任 1:主辦 2:協辦',
  `Time` int NOT NULL DEFAULT '0' COMMENT '工時(%)',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職務說明書-執掌與任務';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_task`
--

LOCK TABLES `description_task` WRITE;
/*!40000 ALTER TABLE `description_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `description_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_certificate`
--

DROP TABLE IF EXISTS `expert_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expert_certificate` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `ExpertSeq` int NOT NULL DEFAULT '0' COMMENT '專家Seq',
  `FilePath` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '檔案路徑',
  `FileName` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '檔案名稱',
  `OriginalFileName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下載名稱',
  `Memo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '證照說明',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='專家證照';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_certificate`
--

LOCK TABLES `expert_certificate` WRITE;
/*!40000 ALTER TABLE `expert_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expert_data`
--

DROP TABLE IF EXISTS `expert_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expert_data` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `Area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '區域別 以","分隔',
  `Gender` int NOT NULL DEFAULT '1' COMMENT '性別1:男 2:女',
  `Identity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份',
  `IdentityCard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份證號',
  `Birthday` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生日',
  `Diet` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '飲食 1:葷 2:素',
  `Telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '連絡電話',
  `Mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手機',
  `Mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電子郵件',
  `Address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `ServiceAgency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服務機關',
  `JobTitle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '職稱',
  `AgencyPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '機關電話',
  `AgencyAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '機關地址',
  `Expertise` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '專長 以","分隔',
  `Memo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `Education` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '學歷',
  `Experience` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '經歷',
  `ProjectExperience` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '專案經歷',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='專家資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert_data`
--

LOCK TABLES `expert_data` WRITE;
/*!40000 ALTER TABLE `expert_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expertise`
--

DROP TABLE IF EXISTS `expertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expertise` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `CName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '序號',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '專長名稱',
  `DeleteTag` int DEFAULT '0' COMMENT '刪除標記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='專長類型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expertise`
--

LOCK TABLES `expertise` WRITE;
/*!40000 ALTER TABLE `expertise` DISABLE KEYS */;
INSERT INTO `expertise` VALUES (1,'A','資訊安全',0),(2,'B','經營管理',0),(3,'C','人力資源',0),(4,'D','經營策略',0),(5,'E','知識管理',0),(6,'F','產業發展',0),(7,'G','企業診斷',0),(8,'H','資訊服務',0),(9,'I','計畫撰寫',0),(10,'J','地方產業',0),(11,'K','產品特色',0),(12,'L','品牌形象',0),(13,'M','行銷推廣',0),(14,'N','財務管理',0),(15,'O','文創產業',0),(16,'P','公共政策',0),(17,'Q','顧客管理',0),(18,'R','觀光旅遊',0),(19,'S','社會福利',0),(20,'T','勞工政策',0),(21,'U','食品安全',0),(22,'V','醫療照護',0),(23,'W','金融產業',0),(24,'X','教育訓練',0);
/*!40000 ALTER TABLE `expertise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_category`
--

DROP TABLE IF EXISTS `function_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function_category` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '職稱',
  `DeleteTag` int DEFAULT '0' COMMENT '刪除標記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='職能類別清單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_category`
--

LOCK TABLES `function_category` WRITE;
/*!40000 ALTER TABLE `function_category` DISABLE KEYS */;
INSERT INTO `function_category` VALUES (1,'集團核心價值',0),(2,'管理訓練',0),(3,'專業職能訓練',0),(4,'法定訓練',0),(5,'自我發展',0);
/*!40000 ALTER TABLE `function_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_factor`
--

DROP TABLE IF EXISTS `function_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function_factor` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `ProjectSeq` int NOT NULL COMMENT '職能項目',
  `Num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '編碼',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '因子名稱',
  `Definition` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '職能定義',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`),
  KEY `FK_factor_factor` (`ProjectSeq`) USING BTREE,
  CONSTRAINT `FK_factor_project` FOREIGN KEY (`ProjectSeq`) REFERENCES `function_project` (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職能因子';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_factor`
--

LOCK TABLES `function_factor` WRITE;
/*!40000 ALTER TABLE `function_factor` DISABLE KEYS */;
/*!40000 ALTER TABLE `function_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_project`
--

DROP TABLE IF EXISTS `function_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function_project` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `ParentSeq` int DEFAULT NULL COMMENT '父層流水序',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '職能名稱',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`),
  KEY `FK_project_project` (`ParentSeq`),
  CONSTRAINT `FK_project_project` FOREIGN KEY (`ParentSeq`) REFERENCES `function_project` (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職能項目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_project`
--

LOCK TABLES `function_project` WRITE;
/*!40000 ALTER TABLE `function_project` DISABLE KEYS */;
INSERT INTO `function_project` VALUES (1,NULL,'一般職能','2022-01-19 10:59:56',1,NULL,NULL,0),(2,NULL,'專業職能','2022-01-19 10:59:56',1,NULL,NULL,0),(3,NULL,'核心職能','2022-01-19 10:59:56',1,NULL,NULL,0),(4,NULL,'管理職能','2022-01-19 10:59:56',1,NULL,NULL,0),(5,2,'簡報製作','2022-02-25 12:29:15',1,NULL,NULL,0),(6,1,'責任感','2022-02-25 12:29:49',1,NULL,NULL,0);
/*!40000 ALTER TABLE `function_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_set`
--

DROP TABLE IF EXISTS `function_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function_set` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `UnitSeq` int DEFAULT NULL COMMENT '單位流水序',
  `JobSeq` int DEFAULT NULL COMMENT '職稱流水序',
  `FillDate` date DEFAULT NULL COMMENT '填表日期',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  KEY `Seq` (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職能設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_set`
--

LOCK TABLES `function_set` WRITE;
/*!40000 ALTER TABLE `function_set` DISABLE KEYS */;
INSERT INTO `function_set` VALUES (1,1,1,'2022-03-11','2022-03-11 16:09:37',1,'2022-03-11 16:09:48',1,1);
/*!40000 ALTER TABLE `function_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_unit`
--

DROP TABLE IF EXISTS `function_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function_unit` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `UnitSeq` int DEFAULT NULL COMMENT '單位流水序',
  `ProjectSeq` int DEFAULT NULL COMMENT '職能類別 1.一般 2.專業 3.核心 4.管理',
  `FactorList` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '職能名稱 對應function_factor.Seq',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='單位職能';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_unit`
--

LOCK TABLES `function_unit` WRITE;
/*!40000 ALTER TABLE `function_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `function_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_description`
--

DROP TABLE IF EXISTS `job_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_description` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `UnitSeq` int DEFAULT NULL COMMENT '單位流水序',
  `JobSeq` int DEFAULT NULL COMMENT '職稱流水序',
  `Education` int DEFAULT NULL COMMENT '學歷 1:高中 2: 大學',
  `Department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '科系',
  `FillDate` date DEFAULT NULL COMMENT '填表日期',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='職務說明書';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_description`
--

LOCK TABLES `job_description` WRITE;
/*!40000 ALTER TABLE `job_description` DISABLE KEYS */;
INSERT INTO `job_description` VALUES (1,7,9,2,'經營管理系','2022-02-24','2022-02-24 16:10:18',1,NULL,NULL,0);
/*!40000 ALTER TABLE `job_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_title`
--

DROP TABLE IF EXISTS `job_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_title` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '職稱',
  `DeleteTag` int DEFAULT '0' COMMENT '刪除標記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COMMENT='職稱';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_title`
--

LOCK TABLES `job_title` WRITE;
/*!40000 ALTER TABLE `job_title` DISABLE KEYS */;
INSERT INTO `job_title` VALUES (1,'副總經理',0),(2,'財務長',0),(3,'資訊長',0),(4,'特別助理',0),(5,'資深協理',0),(6,'協理',0),(7,'資深經理',0),(8,'經理',0),(9,'專案經理',0),(10,'副理',0),(11,'主任',0),(12,'副主任',0),(13,'課長',0),(14,'副課長',0),(15,'資深專員',0),(16,'工程師',0),(17,'設計師',0),(18,'專員',0),(19,'助理專員',0),(20,'助理',0),(21,'倉管員',0),(22,'工讀生',0);
/*!40000 ALTER TABLE `job_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture_record`
--

DROP TABLE IF EXISTS `lecture_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture_record` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `ExpertSeq` int NOT NULL DEFAULT '0' COMMENT '專家Seq',
  `CourseName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '課程名稱',
  `CourseDate` date NOT NULL COMMENT '課程日期',
  `CourseScore` int NOT NULL DEFAULT '0' COMMENT '課程評分',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='講授及出席紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_record`
--

LOCK TABLES `lecture_record` WRITE;
/*!40000 ALTER TABLE `lecture_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '序號',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名稱',
  `Memo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註',
  `Region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地區',
  `RegionOrderNo` int NOT NULL DEFAULT '1' COMMENT '地區排序編號',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='上課地點';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'第一會議室',NULL,NULL,1,0),(2,'第二會議室',NULL,NULL,2,0),(3,'第三會議室',NULL,NULL,3,0),(4,'線上會議室',NULL,NULL,4,0),(5,'9樓租借會議室',NULL,NULL,5,0);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `Type` int NOT NULL COMMENT '系統別 1:前台 2:後台 3.職能分析',
  `ParentSeq` int DEFAULT NULL COMMENT '父層流水序',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '功能名稱',
  `Path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '功能路徑',
  `OrderNo` int NOT NULL COMMENT '排序',
  `ShowRole` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '顯示規則 參考user_role表 '',''分割',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `IsActive` int NOT NULL DEFAULT '1' COMMENT '是否啟用 0:不啟用 1:啟用',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`),
  KEY `FK_menu_menu` (`ParentSeq`),
  CONSTRAINT `FK_menu_menu` FOREIGN KEY (`ParentSeq`) REFERENCES `menu` (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='功能列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,NULL,'Plan',NULL,10,'1,2,3','2021-09-28 11:44:03',0,NULL,NULL,1,0),(2,1,NULL,'Design',NULL,20,'1,2,3,1,2','2021-09-28 11:44:26',0,NULL,NULL,1,0),(3,1,NULL,'Do',NULL,30,'1,2,3,4','2021-09-28 11:44:57',0,NULL,NULL,1,0),(4,1,NULL,'Review/Outcome',NULL,40,'1,2,3,4','2021-09-28 11:45:15',0,NULL,NULL,1,0),(5,1,1,'年度課程規劃','/plan/planningCourse.php',11,'1,2,3','2021-09-28 11:47:15',0,NULL,NULL,1,0),(6,1,2,'新增課程','/do/courseList.php?t=1',21,'1,2,3','2021-09-28 11:48:01',0,NULL,NULL,1,0),(7,1,2,'教材專區','/do/textbookList.php',22,'1,2','2021-09-28 11:48:26',0,NULL,NULL,1,0),(8,1,2,'指派參訓人員','/desing/assign\nTraining.php',23,'1,2,4','2021-09-28 11:51:18',0,NULL,NULL,1,0),(9,1,3,'課程報名','/desing/courseSignUp.php',32,'1,2,3,4','2021-09-28 11:51:44',0,NULL,NULL,1,0),(10,1,3,'出席簽到','/desing/signIn.php',33,'1,2,3,4','2021-09-28 11:51:59',0,NULL,NULL,1,0),(11,1,4,'課後評核','/outcome/assessment.php',41,'1,2,3,4','2021-09-28 11:52:12',0,NULL,NULL,1,0),(12,1,4,'統計查詢','/outcome/statistics.php',42,'1,2','2021-09-28 11:52:28',0,NULL,NULL,1,0),(13,2,NULL,'資料維護管理',NULL,10,'1','2021-09-28 11:53:31',0,NULL,NULL,1,0),(14,2,13,'使用者管理','/admin/index.php',11,'1','2021-09-28 11:54:13',0,NULL,NULL,1,0),(15,2,13,'角色管理','/admin/role.php',12,'1','2021-09-28 11:54:33',0,NULL,NULL,1,0),(16,2,13,'功能權限管理','/admin/menu.php',13,'1','2021-09-28 11:54:52',0,NULL,NULL,1,0),(17,2,NULL,'資料維護管理',NULL,20,'1','2021-09-28 11:53:31',0,NULL,NULL,0,1),(18,2,17,'職能因子管理','/maintenance/factor.php',21,'1','2021-09-28 11:53:31',0,NULL,NULL,0,1),(19,2,17,'課程類別管理',NULL,22,'1','2021-09-28 11:53:31',0,NULL,NULL,1,1),(20,2,17,'單位職能管理','/maintenance/unit.php',23,'1','2021-09-28 11:53:31',0,NULL,NULL,0,1),(21,2,17,'課程提醒',NULL,24,'1','2021-09-28 11:53:31',0,NULL,NULL,1,1),(22,2,NULL,'專家資料庫',NULL,30,'1','2021-09-28 11:53:31',0,NULL,NULL,0,1),(23,2,22,'專家資料登錄','/expert/expertLogin.php',31,'1','2021-09-28 11:53:31',0,NULL,NULL,0,1),(24,2,22,'批次匯入資料','/expert/import.php',32,'1','2021-09-28 11:53:31',0,NULL,NULL,0,1),(25,2,22,'專家資料查詢','/expert/expertSearch.php',33,'1','2021-09-28 11:53:31',0,NULL,NULL,0,1),(26,1,3,'訓練課程總覽','/do/courseList.php?t=2',31,'1,2,3','2022-01-12 12:13:23',0,NULL,NULL,1,0),(27,3,NULL,'基本資料管理',NULL,10,'1','2022-01-26 10:24:23',0,NULL,NULL,0,1),(28,3,27,'職能設定','/functionAnalysis/functionSet.php',11,'1','2022-01-26 10:24:23',0,NULL,NULL,0,1),(29,3,27,'職務說明書','/functionAnalysis/jobDescription.php',12,'1','2022-01-26 10:24:23',0,NULL,NULL,0,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_goal`
--

DROP TABLE IF EXISTS `training_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_goal` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '職稱',
  `DeleteTag` int DEFAULT '0' COMMENT '刪除標記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='訓練目的清單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_goal`
--

LOCK TABLES `training_goal` WRITE;
/*!40000 ALTER TABLE `training_goal` DISABLE KEYS */;
INSERT INTO `training_goal` VALUES (1,' 強化目前工作職能',0),(2,'提升未來工作技能、知識',0),(3,'法令規範需求',0),(4,'其它',0);
/*!40000 ALTER TABLE `training_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_object`
--

DROP TABLE IF EXISTS `training_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_object` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名稱',
  `DeleteTag` int DEFAULT '0' COMMENT '刪除標記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='訓練對象';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_object`
--

LOCK TABLES `training_object` WRITE;
/*!40000 ALTER TABLE `training_object` DISABLE KEYS */;
INSERT INTO `training_object` VALUES (1,'所有同仁',0),(2,'部門主管',0),(3,'理級主管',0),(4,'一般同仁',0),(5,'新進同仁',0),(6,'其他',0);
/*!40000 ALTER TABLE `training_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '單位名稱',
  `NameEN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '單位名稱(英文)',
  `Abbreviation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '單位縮寫',
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '單位代碼',
  `PhoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '單位電話',
  `ParentSeq` int DEFAULT NULL COMMENT '父層流水序',
  `Level` int DEFAULT NULL COMMENT '下拉選單層級',
  `OrderNo` int DEFAULT NULL COMMENT '排序',
  `IsActive` int NOT NULL DEFAULT '1' COMMENT '是否啟用',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='單位清單';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'總經理室',NULL,'',NULL,'',NULL,1,1,1),(2,'稽核室\r\n',NULL,NULL,NULL,'',NULL,1,2,1),(3,'台灣業務中心',NULL,NULL,NULL,'',NULL,1,3,1),(4,'業務一部\r\n',NULL,NULL,NULL,NULL,NULL,1,4,1),(5,'業務二部',NULL,NULL,NULL,NULL,NULL,1,5,1),(6,'專案產品部',NULL,NULL,NULL,NULL,NULL,1,6,1),(7,'供應鏈管理部',NULL,NULL,NULL,NULL,NULL,1,7,1),(8,'品保部',NULL,NULL,NULL,NULL,NULL,1,8,1),(9,'包裝設計部',NULL,NULL,NULL,NULL,NULL,1,9,1),(10,'亞太業務部',NULL,NULL,NULL,NULL,NULL,1,10,1),(11,'財務中心',NULL,NULL,NULL,NULL,NULL,1,11,1),(12,'財務部',NULL,NULL,NULL,NULL,NULL,1,12,1),(13,'人力資源部',NULL,NULL,NULL,NULL,NULL,1,13,1),(14,'管理部',NULL,NULL,NULL,NULL,NULL,1,14,1),(15,'法務部',NULL,NULL,NULL,NULL,NULL,1,15,1),(16,'資訊中心',NULL,NULL,NULL,NULL,NULL,1,16,1),(17,'資訊部',NULL,NULL,NULL,NULL,NULL,1,17,1),(18,'南區分部',NULL,NULL,NULL,NULL,NULL,1,18,1);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserSeq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `UserWorkNum` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '員工編號',
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用者姓名',
  `UserAccount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用者帳號',
  `UserPassword` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '使用者密碼',
  `UserRole` int NOT NULL DEFAULT '3' COMMENT '使用者權限 對應表user_role',
  `UserMobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '使用者手機',
  `Extension` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分機號碼',
  `UserMail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '使用者信箱',
  `UserUnit` int NOT NULL COMMENT '使用者單位 對應表unit',
  `UserJobTitle` int DEFAULT NULL COMMENT '使用者職稱',
  `Management` int DEFAULT NULL COMMENT '是否為管理職 0:否 1:部門主管 2:理級主管',
  `StratWorkDay` date DEFAULT NULL COMMENT '到職日期',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL DEFAULT '0' COMMENT '建立人 0:自行註冊',
  `IsActive` int NOT NULL DEFAULT '1' COMMENT '是否啟用 1:啟用 0:不啟用',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`UserSeq`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='使用者資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'111','Admin/系統管理員','admin','827ccb0eea8a706c4c34a16891f84e7b',1,'0977377874','','',1,1,0,'2021-11-02','2021-09-28 11:56:43',0,1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `Sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '權限名稱',
  `Memo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備註說明',
  `DeleteTag` int DEFAULT '0' COMMENT '刪除標記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='帳號權限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,'系統管理者','',0),(2,2,'課程管理者','',0),(3,4,'一般使用者',NULL,0),(4,3,'指派人員','',0);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_function_set`
--

DROP TABLE IF EXISTS `work_function_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_function_set` (
  `Seq` int NOT NULL AUTO_INCREMENT COMMENT '流水序',
  `SetSeq` int DEFAULT NULL COMMENT '職能設定流水序',
  `FactorSeq` int DEFAULT NULL COMMENT '職能因子流水序',
  `StandardScore` int DEFAULT NULL COMMENT '標準分',
  `CreatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `CreatUser` int NOT NULL COMMENT '建立人員Seq',
  `ModifyDate` datetime DEFAULT NULL COMMENT '異動日期',
  `ModifyUser` int DEFAULT NULL COMMENT '異動人員Seq',
  `DeleteTag` int NOT NULL DEFAULT '0' COMMENT '刪除註記',
  PRIMARY KEY (`Seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工作職能設定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_function_set`
--

LOCK TABLES `work_function_set` WRITE;
/*!40000 ALTER TABLE `work_function_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_function_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ttqs_expert_demo'
--

--
-- Dumping routines for database 'ttqs_expert_demo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-23  7:02:18
