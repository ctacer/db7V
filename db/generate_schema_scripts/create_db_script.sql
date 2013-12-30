SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `university` ;
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`organizational_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`organizational_events` ;

CREATE  TABLE IF NOT EXISTS `university`.`organizational_events` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Payment` INT(11) NULL DEFAULT NULL ,
  `StartDate` DATETIME NULL DEFAULT NULL ,
  `FinishDate` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`works`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`works` ;

CREATE  TABLE IF NOT EXISTS `university`.`works` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Deadline` DATETIME NULL DEFAULT NULL ,
  `Perfomer` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Description` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `unique_no`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`organizational_events` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`academic_works`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`academic_works` ;

CREATE  TABLE IF NOT EXISTS `university`.`academic_works` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `List` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Literature` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `works`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`works` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`classes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`classes` ;

CREATE  TABLE IF NOT EXISTS `university`.`classes` (
  `Class_Int` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `Class_Name` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Class_Int`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`u_object`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`u_object` ;

CREATE  TABLE IF NOT EXISTS `university`.`u_object` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Name_` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Record_Date` DATETIME NULL DEFAULT NULL ,
  `Major` INT(11) NULL DEFAULT '0' ,
  `Class` SMALLINT(6) NULL DEFAULT '0' ,
  PRIMARY KEY (`Unique_No`) ,
  INDEX `classes_idx` (`Class` ASC) ,
  CONSTRAINT `classes`
    FOREIGN KEY (`Class` )
    REFERENCES `university`.`classes` (`Class_Int` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`persons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`persons` ;

CREATE  TABLE IF NOT EXISTS `university`.`persons` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Birthday` DATETIME NULL DEFAULT NULL ,
  `Address` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Gender` TINYINT(1) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `object`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`u_object` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`personnel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`personnel` ;

CREATE  TABLE IF NOT EXISTS `university`.`personnel` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Appointment` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Phone` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Email` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Work_Part` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Salary` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `persons`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`persons` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`sciense_degree`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`sciense_degree` ;

CREATE  TABLE IF NOT EXISTS `university`.`sciense_degree` (
  `Sciense_Degree` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `Sciense_DName` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Sciense_Degree`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`units`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`units` ;

CREATE  TABLE IF NOT EXISTS `university`.`units` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Chief` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Creation_Date` DATETIME NULL DEFAULT NULL ,
  `Quantity` INT(11) NULL DEFAULT '0' ,
  `Address` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Phone` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Symbols` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `object`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`u_object` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`faculties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`faculties` ;

CREATE  TABLE IF NOT EXISTS `university`.`faculties` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Number_Of_Departments` SMALLINT(6) NULL DEFAULT '0' ,
  `Description` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `units`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`units` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`departments` ;

CREATE  TABLE IF NOT EXISTS `university`.`departments` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Number_Of_Professors` SMALLINT(6) NULL DEFAULT '0' ,
  `Number_Of_Docents` SMALLINT(6) NULL DEFAULT '0' ,
  `Number_Of_Graduates` SMALLINT(6) NULL DEFAULT '0' ,
  `Faculty` INT(11) NULL DEFAULT NULL ,
  `Achievments` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  INDEX `faculty_idx` (`Faculty` ASC) ,
  CONSTRAINT `units`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`units` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `faculty`
    FOREIGN KEY (`Faculty` )
    REFERENCES `university`.`faculties` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`academics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`academics` ;

CREATE  TABLE IF NOT EXISTS `university`.`academics` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Science_Degree` SMALLINT(6) NULL DEFAULT NULL ,
  `Thesis_Title` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Supervisor` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Department` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  INDEX `degree_idx` (`Science_Degree` ASC) ,
  INDEX `department_idx` (`Department` ASC) ,
  CONSTRAINT `personel`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`personnel` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `degree`
    FOREIGN KEY (`Science_Degree` )
    REFERENCES `university`.`sciense_degree` (`Sciense_Degree` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `department`
    FOREIGN KEY (`Department` )
    REFERENCES `university`.`departments` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`papers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`papers` ;

CREATE  TABLE IF NOT EXISTS `university`.`papers` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Look_Type` SMALLINT(6) NULL DEFAULT NULL ,
  `CreationDate` DATETIME NULL DEFAULT NULL ,
  `Author` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  INDEX `PapersLook_Type` (`Look_Type` ASC) ,
  CONSTRAINT `object`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`u_object` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`accounted`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`accounted` ;

CREATE  TABLE IF NOT EXISTS `university`.`accounted` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Document_Number` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `paper`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`papers` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`education`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`education` ;

CREATE  TABLE IF NOT EXISTS `university`.`education` (
  `Education` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `Education_Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Education`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`administration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`administration` ;

CREATE  TABLE IF NOT EXISTS `university`.`administration` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Education` SMALLINT(6) NULL DEFAULT NULL ,
  `Experience` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  INDEX `AdministrationEducation` (`Education` ASC) ,
  CONSTRAINT `personel`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`personnel` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `education`
    FOREIGN KEY (`Education` )
    REFERENCES `university`.`education` (`Education` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`materials`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`materials` ;

CREATE  TABLE IF NOT EXISTS `university`.`materials` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Date_` DATETIME NULL DEFAULT NULL ,
  `Price` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `object`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`u_object` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`immobility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`immobility` ;

CREATE  TABLE IF NOT EXISTS `university`.`immobility` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Square` INT(11) NULL DEFAULT NULL ,
  `Architect` INT(11) NULL DEFAULT NULL ,
  `Address` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `material`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`materials` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`building`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`building` ;

CREATE  TABLE IF NOT EXISTS `university`.`building` (
  `UniqueNo` INT(11) NOT NULL DEFAULT '0' ,
  `FloorsNumber` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`UniqueNo`) ,
  CONSTRAINT `immobile`
    FOREIGN KEY (`UniqueNo` )
    REFERENCES `university`.`immobility` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`auditories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`auditories` ;

CREATE  TABLE IF NOT EXISTS `university`.`auditories` (
  `UniqueNo` INT(11) NOT NULL DEFAULT '0' ,
  `SitsNumber` INT(11) NULL DEFAULT NULL ,
  `Number` INT(11) NULL DEFAULT NULL ,
  `Type` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`UniqueNo`) ,
  CONSTRAINT `building`
    FOREIGN KEY ()
    REFERENCES `university`.`building` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`avalible`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`avalible` ;

CREATE  TABLE IF NOT EXISTS `university`.`avalible` (
  `Cls_Int` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `Avalible_Clases` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Cls_Int`) ,
  CONSTRAINT `classes`
    FOREIGN KEY (`Cls_Int` )
    REFERENCES `university`.`classes` (`Class_Int` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`documents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`documents` ;

CREATE  TABLE IF NOT EXISTS `university`.`documents` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `IssuedWith` INT(11) NULL DEFAULT NULL ,
  `Topic` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  INDEX `issued_idx` (`IssuedWith` ASC) ,
  CONSTRAINT `accounted`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`accounted` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `issued`
    FOREIGN KEY (`IssuedWith` )
    REFERENCES `university`.`u_object` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`events_`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`events_` ;

CREATE  TABLE IF NOT EXISTS `university`.`events_` (
  `Unique_No` INT(11) NULL DEFAULT '0' ,
  `Venue` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Day_Of_Event` DATETIME NULL DEFAULT NULL ,
  INDEX `event_idx` (`Unique_No` ASC) ,
  CONSTRAINT `event`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`organizational_events` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`entertainment_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`entertainment_events` ;

CREATE  TABLE IF NOT EXISTS `university`.`entertainment_events` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Occasion` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `event`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`organizational_events` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `event2`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`events_` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`learners`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`learners` ;

CREATE  TABLE IF NOT EXISTS `university`.`learners` (
  `Unigue_No` INT(11) NOT NULL DEFAULT '0' ,
  `Studies_Type` SMALLINT(6) NULL DEFAULT NULL ,
  `TuitionFee` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unigue_No`) ,
  INDEX `LearnersStudies_Type` (`Studies_Type` ASC) ,
  CONSTRAINT `persons`
    FOREIGN KEY (`Unigue_No` )
    REFERENCES `university`.`persons` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`entrants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`entrants` ;

CREATE  TABLE IF NOT EXISTS `university`.`entrants` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `GPA` DECIMAL(5,0) NULL DEFAULT '0' ,
  `External_Evaluation` DECIMAL(5,0) NULL DEFAULT '0' ,
  `Secondary_School` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `learners`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`learners` (`Unigue_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`moveables`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`moveables` ;

CREATE  TABLE IF NOT EXISTS `university`.`moveables` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Function` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `material`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`materials` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`furniture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`furniture` ;

CREATE  TABLE IF NOT EXISTS `university`.`furniture` (
  `UniqueNo` INT(11) NOT NULL DEFAULT '0' ,
  `Destination` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Weight` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`UniqueNo`) ,
  CONSTRAINT `moveable`
    FOREIGN KEY (`UniqueNo` )
    REFERENCES `university`.`moveables` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`groups` ;

CREATE  TABLE IF NOT EXISTS `university`.`groups` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Dues` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Description` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `units`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`units` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`guests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`guests` ;

CREATE  TABLE IF NOT EXISTS `university`.`guests` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Occupation` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Work_Place` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `persons`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`persons` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`household_works`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`household_works` ;

CREATE  TABLE IF NOT EXISTS `university`.`household_works` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Place` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `works`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`works` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`livingrooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`livingrooms` ;

CREATE  TABLE IF NOT EXISTS `university`.`livingrooms` (
  `UniqueNo` INT(11) NOT NULL DEFAULT '0' ,
  `BedNumber` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`UniqueNo`) ,
  CONSTRAINT `building`
    FOREIGN KEY (`UniqueNo` )
    REFERENCES `university`.`building` (`UniqueNo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`look_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`look_type` ;

CREATE  TABLE IF NOT EXISTS `university`.`look_type` (
  `Look_Type` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `Look_Name` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Look_Type`) ,
  CONSTRAINT `paper`
    FOREIGN KEY (`Look_Type` )
    REFERENCES `university`.`papers` (`Look_Type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`pensioners`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`pensioners` ;

CREATE  TABLE IF NOT EXISTS `university`.`pensioners` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Previous_Job` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `personel`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`personnel` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`postgraduates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`postgraduates` ;

CREATE  TABLE IF NOT EXISTS `university`.`postgraduates` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Thesis_Title` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Supervisor` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Work_Part` DECIMAL(5,0) NULL DEFAULT '0' ,
  `Salary` DECIMAL(5,0) NULL DEFAULT '0' ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `learners`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`learners` (`Unigue_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`scientific_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`scientific_events` ;

CREATE  TABLE IF NOT EXISTS `university`.`scientific_events` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Themes_List` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `event`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`organizational_events` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `event2`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`events_` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`scientific_publications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`scientific_publications` ;

CREATE  TABLE IF NOT EXISTS `university`.`scientific_publications` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Publisher` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Periodicy` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `accounted`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`accounted` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`sport_events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`sport_events` ;

CREATE  TABLE IF NOT EXISTS `university`.`sport_events` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Status` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Referee` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `event`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`organizational_events` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `event2`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`events_` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`students` ;

CREATE  TABLE IF NOT EXISTS `university`.`students` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `GPA` DECIMAL(5,0) NULL DEFAULT '0' ,
  `EntranceYear` INT(11) NULL DEFAULT NULL ,
  `IsGraduated` DATETIME NULL DEFAULT NULL ,
  `Department` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  INDEX `department_idx` (`Department` ASC) ,
  CONSTRAINT `learners`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`learners` (`Unigue_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `department`
    FOREIGN KEY (`Department` )
    REFERENCES `university`.`departments` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`studies_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`studies_types` ;

CREATE  TABLE IF NOT EXISTS `university`.`studies_types` (
  `Studies_Type` SMALLINT(6) NOT NULL DEFAULT '0' ,
  `Studies_TName` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Studies_Type`) ,
  CONSTRAINT `learners`
    FOREIGN KEY (`Studies_Type` )
    REFERENCES `university`.`learners` (`Studies_Type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`unmaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`unmaterial` ;

CREATE  TABLE IF NOT EXISTS `university`.`unmaterial` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Responsible_Person` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `unmaterial`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`organizational_events` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `object`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`u_object` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`studying`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`studying` ;

CREATE  TABLE IF NOT EXISTS `university`.`studying` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `unmaterial`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`unmaterial` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`stuffrooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`stuffrooms` ;

CREATE  TABLE IF NOT EXISTS `university`.`stuffrooms` (
  `UniqueNo` INT(11) NOT NULL DEFAULT '0' ,
  `Destination` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`UniqueNo`) ,
  CONSTRAINT `building`
    FOREIGN KEY (`UniqueNo` )
    REFERENCES `university`.`building` (`UniqueNo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`subjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`subjects` ;

CREATE  TABLE IF NOT EXISTS `university`.`subjects` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Courses` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Faculty` INT(11) NULL DEFAULT NULL ,
  `TypeOfStudy` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `unmaterial`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`unmaterial` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`territory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`territory` ;

CREATE  TABLE IF NOT EXISTS `university`.`territory` (
  `UniqueNo` INT(11) NOT NULL DEFAULT '0' ,
  `Role` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`UniqueNo`) ,
  CONSTRAINT `immobile`
    FOREIGN KEY (`UniqueNo` )
    REFERENCES `university`.`immobility` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`transport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`transport` ;

CREATE  TABLE IF NOT EXISTS `university`.`transport` (
  `UniqueNo` INT(11) NOT NULL DEFAULT '0' ,
  `SitsNumber` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `EngineVolume` DOUBLE NULL DEFAULT NULL ,
  PRIMARY KEY (`UniqueNo`) ,
  CONSTRAINT `moveable`
    FOREIGN KEY (`UniqueNo` )
    REFERENCES `university`.`moveables` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`uncounted`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`uncounted` ;

CREATE  TABLE IF NOT EXISTS `university`.`uncounted` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Theme` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  `Description` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `paper`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`papers` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `university`.`university_achievements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`university_achievements` ;

CREATE  TABLE IF NOT EXISTS `university`.`university_achievements` (
  `Unique_No` INT(11) NOT NULL DEFAULT '0' ,
  `Value` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL ,
  PRIMARY KEY (`Unique_No`) ,
  CONSTRAINT `unmaterial`
    FOREIGN KEY (`Unique_No` )
    REFERENCES `university`.`unmaterial` (`Unique_No` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

USE `university` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
