USE university;

CREATE TABLE `Academic_Works` (
	`Unique_No` INT,
	`List` NVARCHAR(255),
	`Literature` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Academics` (
	`Unique_No` INT DEFAULT 0,
	`Science_Degree` NVARCHAR(255),
	`Thesis_Title` NVARCHAR(50),
	`Supervisor` NVARCHAR(50),
	`Department` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Accounted` (
	`Unique_No` INT,
	`Document_Number` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Administration` (
	`Unique_No` INT DEFAULT 0,
	`Education` NVARCHAR(255),
	`Experience` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Auditories` (
	`UniqueNo` INT,
	`SitsNumber` INT,
	`Number` INT,
	`Type` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`UniqueNo`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Avalible` (
	`Cls_Int` SMALLINT,
	`Avalible_Clases` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Cls_Int`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Building` (
	`UniqueNo` INT,
	`FloorsNumber` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`UniqueNo`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Classes` (
	`Class_Int` INT,
	`Class_Name` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Class_Int`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Departments` (
	`Unique_No` INT DEFAULT 0,
	`Number_Of_Professors` SMALLINT DEFAULT 0,
	`Number_Of_Docents` SMALLINT DEFAULT 0,
	`Number_Of_Graduates` SMALLINT DEFAULT 0,
	`Faculty` INT,
	`Achievments` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Documents` (
	`Unique_No` INT DEFAULT 0,
	`IssuedWith` INT,
	`Topic` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Education` (
	`Education` SMALLINT DEFAULT 0,
	`Education_Name` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Education`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Entertainment_Events` (
	`Unique_No` INT DEFAULT 0,
	`Occasion` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Entrants` (
	`Unique_No` INT DEFAULT 0,
	`GPA` DECIMAL(5, 0) DEFAULT 0,
	`External_Evaluation` DECIMAL(5, 0) DEFAULT 0,
	`Secondary_School` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Events_` (
	`Unique_No` INT DEFAULT 0,
	`Venue` NVARCHAR(50),
	`Day_Of_Event` DATETIME
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Faculties` (
	`Unique_No` INT DEFAULT 0,
	`Number_Of_Departments` SMALLINT DEFAULT 0,
	`Description` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Furniture` (
	`UniqueNo` INT,
	`Destination` NVARCHAR(255),
	`Weight` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`UniqueNo`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Groups` (
	`Unique_No` INT DEFAULT 0,
	`Dues` NVARCHAR(255),
	`Description` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Guests` (
	`Unique_No` INT DEFAULT 0,
	`Occupation` NVARCHAR(50),
	`Work_Place` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Household_Works` (
	`Unique_No` INT,
	`Place` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Immobility` (
	`Unique_No` INT DEFAULT 0,
	`Square` INT,
	`Architect` INT,
	`Address` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Learners` (
	`Unigue_No` INT DEFAULT 0,
	`Studies_Type` NVARCHAR(255),
	`TuitionFee` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unigue_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `LivingRooms` (
	`UniqueNo` INT,
	`BedNumber` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`UniqueNo`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Look_Type` (
	`Look_Type` SMALLINT DEFAULT 0,
	`Look_Name` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Look_Type`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Materials` (
	`Unique_No` INT DEFAULT 0,
	`Date_` DATETIME,
	`Price` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Moveables` (
	`Unique_No` INT DEFAULT 0,
	`Function` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Organizational_Events` (
	`Unique_No` INT DEFAULT 0,
	`Payment` INT,
	`StartDate` DATETIME,
	`FinishDate` DATETIME,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Papers` (
	`Unique_No` INT DEFAULT 0,
	`Look_Type` NVARCHAR(255),
	`CreationDate` DATETIME,
	`Author` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Pensioners` (
	`Unique_No` INT,
	`Previous_Job` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Personnel` (
	`Unique_No` INT DEFAULT 0,
	`Appointment` NVARCHAR(50),
	`Phone` NVARCHAR(50),
	`Email` NVARCHAR(50),
	`Work_Part` NVARCHAR(255),
	`Salary` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Persons` (
	`Unique_No` INT DEFAULT 0,
	`Birthday` DATETIME,
	`Address` NVARCHAR(255),
	`Gender` BOOL NOT NULL DEFAULT 0,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Postgraduates` (
	`Unique_No` INT DEFAULT 0,
	`Thesis_Title` NVARCHAR(50),
	`Supervisor` NVARCHAR(50),
	`Work_Part` DECIMAL(5, 0) DEFAULT 0,
	`Salary` DECIMAL(5, 0) DEFAULT 0,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Sciense_Degree` (
	`Sciense_Degree` SMALLINT DEFAULT 0,
	`Sciense_DName` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Sciense_Degree`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Scientific_Events` (
	`Unique_No` INT DEFAULT 0,
	`Themes_List` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Scientific_Publications` (
	`Unique_No` INT DEFAULT 0,
	`Publisher` NVARCHAR(50),
	`Periodicy` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Sport_Events` (
	`Unique_No` INT,
	`Status` NVARCHAR(255),
	`Referee` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Students` (
	`Unique_No` INT DEFAULT 0,
	`GPA` DECIMAL(5, 0) DEFAULT 0,
	`EntranceYear` INT,
	`IsGraduated` DATETIME,
	`Department` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Studies_Types` (
	`Studies_Type` SMALLINT DEFAULT 0,
	`Studies_TName` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Studies_Type`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Studying` (
	`Unique_No` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `StuffRooms` (
	`UniqueNo` INT,
	`Destination` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`UniqueNo`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Subjects` (
	`Unique_No` INT,
	`Courses` NVARCHAR(255),
	`Faculty` INT,
	`TypeOfStudy` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Territory` (
	`UniqueNo` INT,
	`Role` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`UniqueNo`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Transport` (
	`UniqueNo` INT,
	`SitsNumber` NVARCHAR(255),
	`EngineVolume` DOUBLE,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`UniqueNo`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `U_Object` (
	`Unique_No` INT DEFAULT 0,
	`Name_` NVARCHAR(50),
	`Record_Date` DATETIME,
	`Major` INT DEFAULT 0,
	`Class` SMALLINT DEFAULT 0,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Uncounted` (
	`Unique_No` INT,
	`Theme` NVARCHAR(255),
	`Description` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Units` (
	`Unique_No` INT DEFAULT 0,
	`Chief` NVARCHAR(255),
	`Creation_Date` DATETIME,
	`Quantity` INT DEFAULT 0,
	`Address` NVARCHAR(50),
	`Phone` NVARCHAR(50),
	`Symbols` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `University_Achievements` (
	`Unique_No` INT,
	`Value` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Unmaterial` (
	`Unique_No` INT,
	`Responsible_Person` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE TABLE `Works` (
	`Unique_No` INT,
	`Deadline` DATETIME,
	`Perfomer` NVARCHAR(255),
	`Description` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`Unique_No`)
)
COLLATE=utf8_unicode_ci
ENGINE=InnoDB;
CREATE INDEX `AdministrationEducation`
	ON `Administration` (`Education`);
CREATE INDEX `LearnersStudies_Type`
	ON `Learners` (`Studies_Type`);
CREATE INDEX `PapersLook_Type`
	ON `Papers` (`Look_Type`);
