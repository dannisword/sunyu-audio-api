CREATE TABLE `ttqs_expert_demo`.`course_play_record` (
  `Seq` INT NOT NULL AUTO_INCREMENT,
  `CourseSeq` INT NOT NULL,
  `Unit` VARCHAR(200) NOT NULL,
  `SignUpUser` INT NOT NULL,
  `PlayAt` INT NOT NULL,
  `CreatDate` DATETIME NOT NULL,
  `CreatUser` INT NOT NULL,
  `ModifyDate` DATETIME NULL,
  `ModifyUser` INT NOT NULL,
  PRIMARY KEY (`Seq`, `ModifyUser`));