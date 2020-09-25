-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `DepartmentId` INT NOT NULL,
  `DepartmentName` VARCHAR(45) NOT NULL,
  `HOD` VARCHAR(45) NULL,
  PRIMARY KEY (`DepartmentId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Admissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Admissions` (
  `StudentId` INT NOT NULL,
  `DateOfAdmission` DATE NOT NULL,
  `Fee` DECIMAL NOT NULL,
  `StudentDOB` DATE NOT NULL,
  `StudentPhone` VARCHAR(45) NOT NULL,
  `StudentEmail` VARCHAR(145) NOT NULL,
  `StudentAddress` VARCHAR(245) NOT NULL,
  `Admission ID` INT NOT NULL,
  PRIMARY KEY (`Admission ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `StudentId` INT NOT NULL,
  `StudentName` VARCHAR(45) NOT NULL,
  `CourseId` INT NOT NULL,
  `DepartmentId` INT NOT NULL,
  `Admission ID` INT NOT NULL,
  PRIMARY KEY (`StudentId`),
  INDEX `DepartmentId_idx` (`DepartmentId` ASC) VISIBLE,
  CONSTRAINT `DepartmentId`
    FOREIGN KEY (`DepartmentId`)
    REFERENCES `mydb`.`Department` (`DepartmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AdmissionID`
    FOREIGN KEY (`AdmissionID`)
    REFERENCES `mydb`.`Admissions` (`AdmissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Faculty` (
  `FacultyId` INT NOT NULL,
  `FacultyName` VARCHAR(45) NOT NULL,
  `MobileNumber` VARCHAR(45) NOT NULL,
  `EmailId` VARCHAR(45) NOT NULL,
  `Qualification` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `DepartmentId` INT NOT NULL,
  PRIMARY KEY (`FacultyId`),
  INDEX `DepartmentId_idx` (`DepartmentId` ASC) VISIBLE,
  CONSTRAINT `DepartmentId`
    FOREIGN KEY (`DepartmentId`)
    REFERENCES `mydb`.`Department` (`DepartmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
  `CourseId` INT NOT NULL,
  `CourseName` VARCHAR(45) NOT NULL,
  `DepartmentId` INT NOT NULL,
  `FacultyId` INT NOT NULL,
  PRIMARY KEY (`CourseId`),
  INDEX `FacultyId_idx` (`FacultyId` ASC) VISIBLE,
  INDEX `DepartmentId_idx` (`DepartmentId` ASC) VISIBLE,
  CONSTRAINT `FacultyId`
    FOREIGN KEY (`FacultyId`)
    REFERENCES `mydb`.`Faculty` (`FacultyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DepartmentId`
    FOREIGN KEY (`DepartmentId`)
    REFERENCES `mydb`.`Department` (`DepartmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GradeReport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GradeReport` (
  `StudentId` INT NOT NULL,
  `CourseId` INT NOT NULL,
  `CGPA` DECIMAL NOT NULL,
  PRIMARY KEY (`StudentId`),
  INDEX `CourseId_idx` (`CourseId` ASC) VISIBLE,
  CONSTRAINT `StudentId`
    FOREIGN KEY (`StudentId`)
    REFERENCES `mydb`.`Student` (`StudentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CourseId`
    FOREIGN KEY (`CourseId`)
    REFERENCES `mydb`.`Course` (`CourseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Attendence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Attendence` (
  `StudentId` INT NOT NULL,
  `Date` DATE NOT NULL,
  `CourseId` INT NOT NULL,
  `Attendence%` DECIMAL NOT NULL,
  PRIMARY KEY (`Date`),
  INDEX `CourseId_idx` (`CourseId` ASC) VISIBLE,
  CONSTRAINT `StudentId`
    FOREIGN KEY (`StudentId`)
    REFERENCES `mydb`.`Student` (`StudentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CourseId`
    FOREIGN KEY (`CourseId`)
    REFERENCES `mydb`.`Course` (`CourseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Library_Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Library_Books` (
  `BookId` INT NOT NULL,
  `Issuedate` DATE NOT NULL,
  `SubmissionDate` DATE NOT NULL,
  `Student_StudentId` INT NOT NULL,
  `Student_Admissions_Admission ID` VARCHAR(45) NOT NULL,
  `Student_StudentId1` INT NOT NULL,
  `Student_Admissions_Admission ID1` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BookId`, `Student_StudentId1`, `Student_Admissions_Admission ID1`),
  INDEX `fk_Library_Student1_idx` (`Student_StudentId1` ASC, `Student_Admissions_Admission ID1` ASC) VISIBLE,
  CONSTRAINT `fk_Library_Student1`
    FOREIGN KEY (`Student_StudentId1`)
    REFERENCES `mydb`.`Student` (`StudentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Events` (
  `EventName` VARCHAR(100) NOT NULL,
  `DateOfEvent` DATE NOT NULL,
  `cultural_activities_conducted` VARCHAR(125) NOT NULL,
  `FacultyId` INT NOT NULL,
  PRIMARY KEY (`EventName`),
  UNIQUE INDEX `cultural_activities_conducted_UNIQUE` (`cultural_activities_conducted` ASC) VISIBLE,
  INDEX `facultyId_idx` (`FacultyId` ASC) VISIBLE,
  CONSTRAINT `facultyId`
    FOREIGN KEY (`FacultyId`)
    REFERENCES `mydb`.`Faculty` (`FacultyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CulturalActivities_AND_Sports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CulturalActivities_AND_Sports` (
  `StudentId` INT NOT NULL,
  `Sports_intrested_in` VARCHAR(45) NULL,
  `ActivitiesInterestedIn` VARCHAR(125) NULL,
  `Events_EventName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`StudentId`, `Events_EventName`),
  UNIQUE INDEX `StudentId_UNIQUE` (`StudentId` ASC) VISIBLE,
  UNIQUE INDEX `ActivitiesInterestedIn_UNIQUE` (`ActivitiesInterestedIn` ASC) VISIBLE,
  INDEX `fk_CulturalActivities_AND_Sports_Events1_idx` (`Events_EventName` ASC) VISIBLE,
  CONSTRAINT `EventName`
    FOREIGN KEY (`StudentId`)
    REFERENCES `mydb`.`Student` (`StudentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CulturalActivities_AND_Sports_Events1`
    FOREIGN KEY (`Events_EventName`)
    REFERENCES `mydb`.`Events` (`EventName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`class_time_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`class_time_table` (
  `StudentId` INT NOT NULL,
  `CourseId` INT NOT NULL,
  `timings` TIME NOT NULL,
  PRIMARY KEY (`StudentId`, `CourseId`),
  INDEX `fk_Student_has_Course_Course1_idx` (`CourseId` ASC) VISIBLE,
  INDEX `fk_Student_has_Course_Student1_idx` (`StudentId` ASC) VISIBLE,
  UNIQUE INDEX `timings_UNIQUE` (`timings` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Course_Student1`
    FOREIGN KEY (`StudentId`)
    REFERENCES `mydb`.`Student` (`StudentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Course_Course1`
    FOREIGN KEY (`CourseId`)
    REFERENCES `mydb`.`Course` (`CourseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Feedback` (
  `Student_StudentId` INT NOT NULL,
  `Faculty_FacultyId` INT NOT NULL,
  `Ratings out of 10` INT NOT NULL,
  `Remarks` VARCHAR(45) NULL,
  PRIMARY KEY (`Student_StudentId`, `Faculty_FacultyId`),
  INDEX `fk_Student_has_Faculty_Faculty1_idx` (`Faculty_FacultyId` ASC) VISIBLE,
  INDEX `fk_Student_has_Faculty_Student1_idx` (`Student_StudentId` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Faculty_Student1`
    FOREIGN KEY (`Student_StudentId`)
    REFERENCES `mydb`.`Student` (`StudentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Faculty_Faculty1`
    FOREIGN KEY (`Faculty_FacultyId`)
    REFERENCES `mydb`.`Faculty` (`FacultyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

