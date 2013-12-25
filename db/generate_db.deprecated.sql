-- DBWScript v3.10
-- Database: C:\Users\stym\Desktop\Vovk\Documents\NewUniversity.mdb

CREATE TABLE [Academic_Works] (
	[Unique_No] LONG,
	[List] TEXT(255) WITH COMPRESSION,
	[Literature] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Academic_Works] ALLOW ZERO LENGTH [List];
ALTER TABLE [Academic_Works] ALLOW ZERO LENGTH [Literature];
CREATE TABLE [Academics] (
	[Unique_No] LONG DEFAULT 0,
	[Science_Degree] TEXT(255) WITH COMPRESSION,
	[Thesis_Title] TEXT(50) WITH COMPRESSION,
	[Supervisor] TEXT(50) WITH COMPRESSION,
	[Department] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Academics] ALLOW ZERO LENGTH [Science_Degree];
ALTER TABLE [Academics] ALLOW ZERO LENGTH [Thesis_Title];
ALTER TABLE [Academics] ALLOW ZERO LENGTH [Supervisor];
CREATE TABLE [Accounted] (
	[Unique_No] LONG,
	[Document_Number] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
CREATE TABLE [Administration] (
	[Unique_No] LONG DEFAULT 0,
	[Education] TEXT(255) WITH COMPRESSION,
	[Experience] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Administration] ALLOW ZERO LENGTH [Education];
ALTER TABLE [Administration] ALLOW ZERO LENGTH [Experience];
CREATE TABLE [Auditories] (
	[UniqueNo] LONG,
	[SitsNumber] LONG,
	[Number] LONG,
	[Type] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([UniqueNo])
);
ALTER TABLE [Auditories] ALLOW ZERO LENGTH [Type];
CREATE TABLE [Avalible] (
	[Cls_Int] SMALLINT,
	[Avalible_Clases] TEXT(50) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Cls_Int])
);
ALTER TABLE [Avalible] ALLOW ZERO LENGTH [Avalible_Clases];
CREATE TABLE [Building] (
	[UniqueNo] LONG,
	[FloorsNumber] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([UniqueNo])
);
CREATE TABLE [Classes] (
	[Class_Int] LONG,
	[Class_Name] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Class_Int])
);
ALTER TABLE [Classes] ALLOW ZERO LENGTH [Class_Name];
CREATE TABLE [Departments] (
	[Unique_No] LONG DEFAULT 0,
	[Number_Of_Professors] SMALLINT DEFAULT 0,
	[Number_Of_Docents] SMALLINT DEFAULT 0,
	[Number_Of_Graduates] SMALLINT DEFAULT 0,
	[Faculty] LONG,
	[Achievments] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Departments] ALLOW ZERO LENGTH [Achievments];
CREATE TABLE [Documents] (
	[Unique_No] LONG DEFAULT 0,
	[IssuedWith] LONG,
	[Topic] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Documents] ALLOW ZERO LENGTH [Topic];
CREATE TABLE [Education] (
	[Education] SMALLINT DEFAULT 0,
	[Education_Name] TEXT(50) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Education])
);
ALTER TABLE [Education] ALLOW ZERO LENGTH [Education_Name];
CREATE TABLE [Entertainment_Events] (
	[Unique_No] LONG DEFAULT 0,
	[Occasion] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Entertainment_Events] ALLOW ZERO LENGTH [Occasion];
CREATE TABLE [Entrants] (
	[Unique_No] LONG DEFAULT 0,
	[GPA] DECIMAL(5, 0) DEFAULT 0,
	[External_Evaluation] DECIMAL(5, 0) DEFAULT 0,
	[Secondary_School] TEXT(50) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Entrants] ALLOW ZERO LENGTH [Secondary_School];
CREATE TABLE [Events_] (
	[Unique_No] LONG DEFAULT 0,
	[Venue] TEXT(50) WITH COMPRESSION,
	[Day_Of_Event] DATETIME
);
ALTER TABLE [Events_] ALLOW ZERO LENGTH [Venue];
ALTER TABLE [Events_] FORMAT [Day_Of_Event] SET "Short Date";
CREATE TABLE [Faculties] (
	[Unique_No] LONG DEFAULT 0,
	[Number_Of_Departments] SMALLINT DEFAULT 0,
	[Description] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Faculties] ALLOW ZERO LENGTH [Description];
CREATE TABLE [Furniture] (
	[UniqueNo] LONG,
	[Destination] TEXT(255) WITH COMPRESSION,
	[Weight] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([UniqueNo])
);
ALTER TABLE [Furniture] ALLOW ZERO LENGTH [Destination];
CREATE TABLE [Groups] (
	[Unique_No] LONG DEFAULT 0,
	[Dues] TEXT(255) WITH COMPRESSION,
	[Description] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Groups] ALLOW ZERO LENGTH [Dues];
ALTER TABLE [Groups] ALLOW ZERO LENGTH [Description];
CREATE TABLE [Guests] (
	[Unique_No] LONG DEFAULT 0,
	[Occupation] TEXT(50) WITH COMPRESSION,
	[Work_Place] TEXT(50) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Guests] ALLOW ZERO LENGTH [Occupation];
ALTER TABLE [Guests] ALLOW ZERO LENGTH [Work_Place];
CREATE TABLE [Household_Works] (
	[Unique_No] LONG,
	[Place] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Household_Works] ALLOW ZERO LENGTH [Place];
CREATE TABLE [Immobility] (
	[Unique_No] LONG DEFAULT 0,
	[Square] LONG,
	[Architect] LONG,
	[Address] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Immobility] ALLOW ZERO LENGTH [Address];
CREATE TABLE [Learners] (
	[Unigue_No] LONG DEFAULT 0,
	[Studies_Type] TEXT(255) WITH COMPRESSION,
	[TuitionFee] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unigue_No])
);
ALTER TABLE [Learners] ALLOW ZERO LENGTH [Studies_Type];
ALTER TABLE [Learners] ALLOW ZERO LENGTH [TuitionFee];
CREATE TABLE [LivingRooms] (
	[UniqueNo] LONG,
	[BedNumber] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([UniqueNo])
);
CREATE TABLE [Look_Type] (
	[Look_Type] SMALLINT DEFAULT 0,
	[Look_Name] TEXT(50) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Look_Type])
);
ALTER TABLE [Look_Type] ALLOW ZERO LENGTH [Look_Name];
CREATE TABLE [Materials] (
	[Unique_No] LONG DEFAULT 0,
	[Date_] DATETIME,
	[Price] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Materials] ALLOW ZERO LENGTH [Price];
ALTER TABLE [Materials] FORMAT [Date_] SET "Short Date";
CREATE TABLE [Moveables] (
	[Unique_No] LONG DEFAULT 0,
	[Function] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Moveables] ALLOW ZERO LENGTH [Function];
CREATE TABLE [Organizational_Events] (
	[Unique_No] LONG DEFAULT 0,
	[Payment] LONG,
	[StartDate] DATETIME,
	[FinishDate] DATETIME,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
CREATE TABLE [Papers] (
	[Unique_No] LONG DEFAULT 0,
	[Look_Type] TEXT(255) WITH COMPRESSION,
	[CreationDate] DATETIME,
	[Author] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Papers] ALLOW ZERO LENGTH [Look_Type];
CREATE TABLE [Pensioners] (
	[Unique_No] LONG,
	[Previous_Job] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Pensioners] ALLOW ZERO LENGTH [Previous_Job];
CREATE TABLE [Personnel] (
	[Unique_No] LONG DEFAULT 0,
	[Appointment] TEXT(50) WITH COMPRESSION,
	[Phone] TEXT(50) WITH COMPRESSION,
	[Email] TEXT(50) WITH COMPRESSION,
	[Work_Part] TEXT(255) WITH COMPRESSION,
	[Salary] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Personnel] ALLOW ZERO LENGTH [Appointment];
ALTER TABLE [Personnel] ALLOW ZERO LENGTH [Phone];
ALTER TABLE [Personnel] ALLOW ZERO LENGTH [Email];
ALTER TABLE [Personnel] ALLOW ZERO LENGTH [Work_Part];
ALTER TABLE [Personnel] ALLOW ZERO LENGTH [Salary];
CREATE TABLE [Persons] (
	[Unique_No] LONG DEFAULT 0,
	[Birthday] DATETIME,
	[Address] TEXT(255) WITH COMPRESSION,
	[Gender] BIT NOT NULL DEFAULT 0,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Persons] ALLOW ZERO LENGTH [Address];
ALTER TABLE [Persons] FORMAT [Birthday] SET "Short Date";
ALTER TABLE [Persons] FORMAT [Gender] SET "Yes/No";
CREATE TABLE [Postgraduates] (
	[Unique_No] LONG DEFAULT 0,
	[Thesis_Title] TEXT(50) WITH COMPRESSION,
	[Supervisor] TEXT(50) WITH COMPRESSION,
	[Work_Part] DECIMAL(5, 0) DEFAULT 0,
	[Salary] DECIMAL(5, 0) DEFAULT 0,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Postgraduates] ALLOW ZERO LENGTH [Thesis_Title];
ALTER TABLE [Postgraduates] ALLOW ZERO LENGTH [Supervisor];
CREATE TABLE [Sciense_Degree] (
	[Sciense_Degree] SMALLINT DEFAULT 0,
	[Sciense_DName] TEXT(50) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Sciense_Degree])
);
ALTER TABLE [Sciense_Degree] ALLOW ZERO LENGTH [Sciense_DName];
CREATE TABLE [Scientific_Events] (
	[Unique_No] LONG DEFAULT 0,
	[Themes_List] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Scientific_Events] ALLOW ZERO LENGTH [Themes_List];
CREATE TABLE [Scientific_Publications] (
	[Unique_No] LONG DEFAULT 0,
	[Publisher] TEXT(50) WITH COMPRESSION,
	[Periodicy] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Scientific_Publications] ALLOW ZERO LENGTH [Publisher];
ALTER TABLE [Scientific_Publications] ALLOW ZERO LENGTH [Periodicy];
CREATE TABLE [Sport_Events] (
	[Unique_No] LONG,
	[Status] TEXT(255) WITH COMPRESSION,
	[Referee] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Sport_Events] ALLOW ZERO LENGTH [Status];
ALTER TABLE [Sport_Events] ALLOW ZERO LENGTH [Referee];
CREATE TABLE [Students] (
	[Unique_No] LONG DEFAULT 0,
	[GPA] DECIMAL(5, 0) DEFAULT 0,
	[EntranceYear] LONG,
	[IsGraduated] DATETIME,
	[Department] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
CREATE TABLE [Studies_Types] (
	[Studies_Type] SMALLINT DEFAULT 0,
	[Studies_TName] TEXT(50) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Studies_Type])
);
ALTER TABLE [Studies_Types] ALLOW ZERO LENGTH [Studies_TName];
CREATE TABLE [Studying] (
	[Unique_No] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
CREATE TABLE [StuffRooms] (
	[UniqueNo] LONG,
	[Destination] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([UniqueNo])
);
ALTER TABLE [StuffRooms] ALLOW ZERO LENGTH [Destination];
CREATE TABLE [Subjects] (
	[Unique_No] LONG,
	[Courses] TEXT(255) WITH COMPRESSION,
	[Faculty] LONG,
	[TypeOfStudy] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Subjects] ALLOW ZERO LENGTH [Courses];
ALTER TABLE [Subjects] ALLOW ZERO LENGTH [TypeOfStudy];
CREATE TABLE [Territory] (
	[UniqueNo] LONG,
	[Role] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([UniqueNo])
);
ALTER TABLE [Territory] ALLOW ZERO LENGTH [Role];
CREATE TABLE [Transport] (
	[UniqueNo] LONG,
	[SitsNumber] TEXT(255) WITH COMPRESSION,
	[EngineVolume] DOUBLE,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([UniqueNo])
);
ALTER TABLE [Transport] ALLOW ZERO LENGTH [SitsNumber];
CREATE TABLE [U_Object] (
	[Unique_No] LONG DEFAULT 0,
	[Name_] TEXT(50) WITH COMPRESSION,
	[Record_Date] DATETIME,
	[Major] LONG DEFAULT 0,
	[Class] SMALLINT DEFAULT 0,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [U_Object] ALLOW ZERO LENGTH [Name_];
ALTER TABLE [U_Object] FORMAT [Record_Date] SET "Short Date";
CREATE TABLE [Uncounted] (
	[Unique_No] LONG,
	[Theme] TEXT(255) WITH COMPRESSION,
	[Description] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Uncounted] ALLOW ZERO LENGTH [Theme];
ALTER TABLE [Uncounted] ALLOW ZERO LENGTH [Description];
CREATE TABLE [Units] (
	[Unique_No] LONG DEFAULT 0,
	[Chief] TEXT(255) WITH COMPRESSION,
	[Creation_Date] DATETIME,
	[Quantity] LONG DEFAULT 0,
	[Address] TEXT(50) WITH COMPRESSION,
	[Phone] TEXT(50) WITH COMPRESSION,
	[Symbols] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Units] ALLOW ZERO LENGTH [Chief];
ALTER TABLE [Units] ALLOW ZERO LENGTH [Address];
ALTER TABLE [Units] ALLOW ZERO LENGTH [Phone];
ALTER TABLE [Units] ALLOW ZERO LENGTH [Symbols];
ALTER TABLE [Units] FORMAT [Creation_Date] SET "Short Date";
CREATE TABLE [University_Achievements] (
	[Unique_No] LONG,
	[Value] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [University_Achievements] ALLOW ZERO LENGTH [Value];
CREATE TABLE [Unmaterial] (
	[Unique_No] LONG,
	[Responsible_Person] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Unmaterial] ALLOW ZERO LENGTH [Responsible_Person];
CREATE TABLE [Works] (
	[Unique_No] LONG,
	[Deadline] DATETIME,
	[Perfomer] TEXT(255) WITH COMPRESSION,
	[Description] TEXT(255) WITH COMPRESSION,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Unique_No])
);
ALTER TABLE [Works] ALLOW ZERO LENGTH [Perfomer];
ALTER TABLE [Works] ALLOW ZERO LENGTH [Description];
ALTER TABLE [Works] FORMAT [Deadline] SET "Short Date";
CREATE INDEX [AdministrationEducation]
	ON [Administration] ([Education]);
CREATE INDEX [LearnersStudies_Type]
	ON [Learners] ([Studies_Type]);
CREATE INDEX [PapersLook_Type]
	ON [Papers] ([Look_Type]);
ALTER TABLE [Academic_Works]
	ADD CONSTRAINT [WorksAcademic_Works]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Works] ([Unique_No]);
ALTER TABLE [Academics]
	ADD CONSTRAINT [DepartmentsAcademics]
	FOREIGN KEY NO INDEX ([Department]) REFERENCES
		[Departments] ([Unique_No]);
ALTER TABLE [Academics]
	ADD CONSTRAINT [PersonnelAcademics]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Personnel] ([Unique_No]);
ALTER TABLE [Academics]
	ADD CONSTRAINT [Sciense_DegreeAcademics]
	FOREIGN KEY NO INDEX ([Science_Degree]) REFERENCES
		[Sciense_Degree] ([Sciense_Degree]);
ALTER TABLE [Accounted]
	ADD CONSTRAINT [DocumentsAccounted]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Documents] ([Unique_No]);
ALTER TABLE [Accounted]
	ADD CONSTRAINT [PapersAccounted]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Papers] ([Unique_No]);
ALTER TABLE [Accounted]
	ADD CONSTRAINT [Scientific_PublicationsAccounted]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Scientific_Publications] ([Unique_No]);
ALTER TABLE [Administration]
	ADD CONSTRAINT [EducationAdministration]
	FOREIGN KEY NO INDEX ([Education]) REFERENCES
		[Education] ([Education]);
ALTER TABLE [Administration]
	ADD CONSTRAINT [PersonnelAdministration]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Personnel] ([Unique_No]);
ALTER TABLE [Building]
	ADD CONSTRAINT [AuditoriesBuilding]
	FOREIGN KEY NO INDEX ([UniqueNo]) REFERENCES
		[Auditories] ([UniqueNo]);
ALTER TABLE [Building]
	ADD CONSTRAINT [LivingRoomsBuilding]
	FOREIGN KEY NO INDEX ([UniqueNo]) REFERENCES
		[LivingRooms] ([UniqueNo]);
ALTER TABLE [Building]
	ADD CONSTRAINT [StuffRoomsBuilding]
	FOREIGN KEY NO INDEX ([UniqueNo]) REFERENCES
		[StuffRooms] ([UniqueNo]);
ALTER TABLE [Classes]
	ADD CONSTRAINT [AvalibleClasses]
	FOREIGN KEY NO INDEX ([Class_Int]) REFERENCES
		[Avalible] ([Cls_Int]);
ALTER TABLE [Departments]
	ADD CONSTRAINT [FacultiesDepartments]
	FOREIGN KEY NO INDEX ([Faculty]) REFERENCES
		[Faculties] ([Unique_No]);
ALTER TABLE [Departments]
	ADD CONSTRAINT [UnitsDepartments]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Units] ([Unique_No]);
ALTER TABLE [Documents]
	ADD CONSTRAINT [U_ObjectDocuments]
	FOREIGN KEY NO INDEX ([IssuedWith]) REFERENCES
		[U_Object] ([Unique_No]);
ALTER TABLE [Entertainment_Events]
	ADD CONSTRAINT [EventsEntertainment_Events]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Events_] ([Unique_No]);
ALTER TABLE [Entertainment_Events]
	ADD CONSTRAINT [Organizational_EventsEntertainment_Events]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Organizational_Events] ([Unique_No]);
ALTER TABLE [Entrants]
	ADD CONSTRAINT [LearnersEntrants]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Learners] ([Unigue_No]);
ALTER TABLE [Events_]
	ADD CONSTRAINT [Sport_EventsEvents]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Sport_Events] ([Unique_No]);
ALTER TABLE [Faculties]
	ADD CONSTRAINT [UnitsFaculties]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Units] ([Unique_No]);
ALTER TABLE [Groups]
	ADD CONSTRAINT [UnitsGroups]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Units] ([Unique_No]);
ALTER TABLE [Guests]
	ADD CONSTRAINT [PersonsGuests]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Persons] ([Unique_No]);
ALTER TABLE [Household_Works]
	ADD CONSTRAINT [WorksHousehold_Works]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Works] ([Unique_No]);
ALTER TABLE [Immobility]
	ADD CONSTRAINT [BuildingImmobility]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Building] ([UniqueNo]);
ALTER TABLE [Immobility]
	ADD CONSTRAINT [MaterialsReal_Estate]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Materials] ([Unique_No]);
ALTER TABLE [Immobility]
	ADD CONSTRAINT [PersonsImmobility]
	FOREIGN KEY NO INDEX ([Architect]) REFERENCES
		[Persons] ([Unique_No]);
ALTER TABLE [Immobility]
	ADD CONSTRAINT [TerritoryImmobility]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Territory] ([UniqueNo]);
ALTER TABLE [Learners]
	ADD CONSTRAINT [PersonsLearners]
	FOREIGN KEY NO INDEX ([Unigue_No]) REFERENCES
		[Persons] ([Unique_No]);
ALTER TABLE [Learners]
	ADD CONSTRAINT [Studies_TypesLearners]
	FOREIGN KEY NO INDEX ([Studies_Type]) REFERENCES
		[Studies_Types] ([Studies_Type]);
ALTER TABLE [Materials]
	ADD CONSTRAINT [UObjectMaterials]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[U_Object] ([Unique_No]);
ALTER TABLE [Moveables]
	ADD CONSTRAINT [FurnitureMoveables]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Furniture] ([UniqueNo]);
ALTER TABLE [Moveables]
	ADD CONSTRAINT [MaterialsMoveables]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Materials] ([Unique_No]);
ALTER TABLE [Moveables]
	ADD CONSTRAINT [TransportMoveables]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Transport] ([UniqueNo]);
ALTER TABLE [Organizational_Events]
	ADD CONSTRAINT [EventsOrganizational_Events]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Events_] ([Unique_No]);
ALTER TABLE [Organizational_Events]
	ADD CONSTRAINT [WorksOrganizational_Events]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Works] ([Unique_No]);
ALTER TABLE [Papers]
	ADD CONSTRAINT [Look_TypePapers]
	FOREIGN KEY NO INDEX ([Look_Type]) REFERENCES
		[Look_Type] ([Look_Type]);
ALTER TABLE [Personnel]
	ADD CONSTRAINT [FormersPersonnel]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Pensioners] ([Unique_No]);
ALTER TABLE [Personnel]
	ADD CONSTRAINT [PersonsPersonnel]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Persons] ([Unique_No]);
ALTER TABLE [Persons]
	ADD CONSTRAINT [UObjectPersons]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[U_Object] ([Unique_No]);
ALTER TABLE [Postgraduates]
	ADD CONSTRAINT [LearnersPostgraduates]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Learners] ([Unigue_No]);
ALTER TABLE [Scientific_Events]
	ADD CONSTRAINT [EventsScientific_Events]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Events_] ([Unique_No]);
ALTER TABLE [Scientific_Events]
	ADD CONSTRAINT [Organizational_EventsScientific_Events]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Organizational_Events] ([Unique_No]);
ALTER TABLE [Sport_Events]
	ADD CONSTRAINT [Organizational_EventsSport_Events]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Organizational_Events] ([Unique_No]);
ALTER TABLE [Students]
	ADD CONSTRAINT [DepartmentsStudents]
	FOREIGN KEY NO INDEX ([Department]) REFERENCES
		[Departments] ([Unique_No]);
ALTER TABLE [Students]
	ADD CONSTRAINT [LearnersStudents]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Learners] ([Unigue_No]);
ALTER TABLE [Studying]
	ADD CONSTRAINT [LifeStudying]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Unmaterial] ([Unique_No]);
ALTER TABLE [Subjects]
	ADD CONSTRAINT [LifeSubjects]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Unmaterial] ([Unique_No]);
ALTER TABLE [U_Object]
	ADD CONSTRAINT [ClassesU_Object]
	FOREIGN KEY NO INDEX ([Class]) REFERENCES
		[Classes] ([Class_Int]);
ALTER TABLE [U_Object]
	ADD CONSTRAINT [PapersU_Object]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Papers] ([Unique_No]);
ALTER TABLE [U_Object]
	ADD CONSTRAINT [UnitsU_Object]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Units] ([Unique_No]);
ALTER TABLE [Uncounted]
	ADD CONSTRAINT [PapersUncounted]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Papers] ([Unique_No]);
ALTER TABLE [Units]
	ADD CONSTRAINT [PersonsUnits]
	FOREIGN KEY NO INDEX ([Chief]) REFERENCES
		[Persons] ([Unique_No]);
ALTER TABLE [University_Achievements]
	ADD CONSTRAINT [UnmaterialUniversity_Achievements]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Unmaterial] ([Unique_No]);
ALTER TABLE [Unmaterial]
	ADD CONSTRAINT [EventsUnmaterial]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Events_] ([Unique_No]);
ALTER TABLE [Unmaterial]
	ADD CONSTRAINT [Organizational_EventsUnmaterial]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[Organizational_Events] ([Unique_No]);
ALTER TABLE [Unmaterial]
	ADD CONSTRAINT [UObjectLife]
	FOREIGN KEY NO INDEX ([Unique_No]) REFERENCES
		[U_Object] ([Unique_No]);
