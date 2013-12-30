
CREATE TABLE `Buildings` (
	`id` INT,
	`rooms` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `BuildingsOther` (
	`id` INT,
	`desc` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Cathedra` (
	`id` INT,
	`specialization` NVARCHAR(255),
	`employees` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Chummery` (
	`id` INT,
	`comendant` NVARCHAR(255),
	`faculty` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Classes` (
	`ID` INT(11) AUTO_INCREMENT NOT NULL,
	`Name` NVARCHAR(255),
	`Children` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`ID`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Classes_func` (
	`ID` INT(11) AUTO_INCREMENT NOT NULL,
	`Name` NVARCHAR(255),
	`Children` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`ID`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `ClassRoom` (
	`id` INT,
	`seats` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Clinic` (
	`id` INT,
	`amount_cabinets` INT,
	`doctors` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Collective` (
	`id` INT,
	`activity` NVARCHAR(255),
	`amount` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Deanery` (
	`id` INT,
	`assistant` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Document` (
	`id` INT,
	`author` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `DocumentGeneral` (
	`id` INT,
	`doc_type` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `DocumentOther` (
	`id` INT,
	`desc` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `DocumentPersonal` (
	`id` INT,
	`number` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Equipment` (
	`id` INT,
	`status` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `EventCultural` (
	`id` INT,
	`reason` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Events` (
	`id` INT,
	`date_action` NVARCHAR(255),
	`place_action` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `EventScience` (
	`id` INT,
	`theme` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `EventSport` (
	`id` INT,
	`sport` NVARCHAR(255),
	`referee` NVARCHAR(255),
	`status` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `EventTest` (
	`id` INT,
	`max_mark` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `EventWork` (
	`id` INT,
	`type_of_work` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Faculty` (
	`id` INT,
	`amount_cathedr` INT,
	`amount_groups` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Group` (
	`id` INT,
	`amount` INT,
	`curator` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Institution` (
	`id` INT,
	`adress` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `InstitutionOrg` (
	`id` INT,
	`chief` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `InstitutionOther` (
	`id` INT,
	`desc` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `MaterialObject` (
	`id` INT,
	`date_creation` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `NoMaterialObjOther` (
	`id` INT,
	`desc` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Obj` (
	`id` INT,
	`responsible_person` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Other` (
	`id` INT,
	`desc` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `OtherMaterialObject` (
	`id` INT,
	`desc` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Painting` (
	`id` INT,
	`brush` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Person` (
	`id` INT,
	`sex` NVARCHAR(255),
	`birthday` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonEntrants` (
	`id` INT,
	`zno_points` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonGraduateStudent` (
	`id` INT,
	`years` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonOther` (
	`id` INT,
	`benefit` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonStudents` (
	`id` INT,
	`studing_form` NVARCHAR(255),
	`entry_year` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonStuding` (
	`id` INT,
	`secondary_education` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonTeachers` (
	`id` INT,
	`academic_degree` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonTeaching` (
	`id` INT,
	`subject` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonWorkers` (
	`id` INT,
	`post` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `PersonWorking` (
	`id` INT,
	`experience` NVARCHAR(255),
	`salary` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Process` (
	`id` INT,
	`start` NVARCHAR(255),
	`end` NVARCHAR(255),
	`person_vyk` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Rectorat` (
	`id` INT,
	`prorectors` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Remont` (
	`id` INT,
	`materials` MEDIUMTEXT,
	`suma` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Subject` (
	`id` INT,
	`teachers` MEDIUMTEXT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Territory` (
	`id` INT,
	`area` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Transport` (
	`id` INT,
	`number` NVARCHAR(255),
	`type` NVARCHAR(255),
	`price` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `Universities` (
	`id` INT,
	`accredetation` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
CREATE TABLE `UObject` (
	`id` INT,
	`major` INT,
	`name` NVARCHAR(255),
	`class` INT,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=InnoDB;
ALTER TABLE `Buildings`
	ADD CONSTRAINT `InstitutionBuildings`
	FOREIGN KEY (`id`) REFERENCES
		`Institution` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `BuildingsOther`
	ADD CONSTRAINT `BuildingsBuildingsOther`
	FOREIGN KEY (`id`) REFERENCES
		`Buildings` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Cathedra`
	ADD CONSTRAINT `InstitutionOrgCathedra`
	FOREIGN KEY (`id`) REFERENCES
		`InstitutionOrg` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Chummery`
	ADD CONSTRAINT `BuildingsChummery`
	FOREIGN KEY (`id`) REFERENCES
		`Buildings` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `ClassRoom`
	ADD CONSTRAINT `InstitutionClassRoom`
	FOREIGN KEY (`id`) REFERENCES
		`Institution` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Clinic`
	ADD CONSTRAINT `BuildingsClinic`
	FOREIGN KEY (`id`) REFERENCES
		`Buildings` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Collective`
	ADD CONSTRAINT `InstitutionOrgCollective`
	FOREIGN KEY (`id`) REFERENCES
		`InstitutionOrg` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Deanery`
	ADD CONSTRAINT `InstitutionOrgDeanery`
	FOREIGN KEY (`id`) REFERENCES
		`InstitutionOrg` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Document`
	ADD CONSTRAINT `MaterialObjectDocument`
	FOREIGN KEY (`id`) REFERENCES
		`MaterialObject` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `DocumentGeneral`
	ADD CONSTRAINT `DocumentDocumentGeneral`
	FOREIGN KEY (`id`) REFERENCES
		`Document` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `DocumentOther`
	ADD CONSTRAINT `DocumentDocumentOther`
	FOREIGN KEY (`id`) REFERENCES
		`Document` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `DocumentPersonal`
	ADD CONSTRAINT `DocumentDocumentPersonal`
	FOREIGN KEY (`id`) REFERENCES
		`Document` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Equipment`
	ADD CONSTRAINT `MaterialObjectEquipment`
	FOREIGN KEY (`id`) REFERENCES
		`MaterialObject` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `EventCultural`
	ADD CONSTRAINT `EventsEventCultural`
	FOREIGN KEY (`id`) REFERENCES
		`Events` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Events`
	ADD CONSTRAINT `ObjEvents`
	FOREIGN KEY (`id`) REFERENCES
		`Obj` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `EventScience`
	ADD CONSTRAINT `EventsEventScience`
	FOREIGN KEY (`id`) REFERENCES
		`Events` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `EventSport`
	ADD CONSTRAINT `EventsEventSport`
	FOREIGN KEY (`id`) REFERENCES
		`Events` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `EventTest`
	ADD CONSTRAINT `EventScienceEventTest`
	FOREIGN KEY (`id`) REFERENCES
		`EventScience` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `EventWork`
	ADD CONSTRAINT `EventsEventWork`
	FOREIGN KEY (`id`) REFERENCES
		`Events` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Faculty`
	ADD CONSTRAINT `InstitutionOrgFaculty`
	FOREIGN KEY (`id`) REFERENCES
		`InstitutionOrg` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Group`
	ADD CONSTRAINT `InstitutionOrgGroup`
	FOREIGN KEY (`id`) REFERENCES
		`InstitutionOrg` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Institution`
	ADD CONSTRAINT `UObjectInstitution`
	FOREIGN KEY (`id`) REFERENCES
		`UObject` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `InstitutionOrg`
	ADD CONSTRAINT `InstitutionInstitutionOrg`
	FOREIGN KEY (`id`) REFERENCES
		`Institution` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `InstitutionOther`
	ADD CONSTRAINT `InstitutionOrgInstitutionOther`
	FOREIGN KEY (`id`) REFERENCES
		`InstitutionOrg` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `MaterialObject`
	ADD CONSTRAINT `ObjMaterialObject`
	FOREIGN KEY (`id`) REFERENCES
		`Obj` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `NoMaterialObjOther`
	ADD CONSTRAINT `ObjNoMaterialObjOther`
	FOREIGN KEY (`id`) REFERENCES
		`Obj` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Obj`
	ADD CONSTRAINT `UObjectObj`
	FOREIGN KEY (`id`) REFERENCES
		`UObject` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Other`
	ADD CONSTRAINT `UObjectOther`
	FOREIGN KEY (`id`) REFERENCES
		`UObject` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `OtherMaterialObject`
	ADD CONSTRAINT `MaterialObjectOtherMaterialObject`
	FOREIGN KEY (`id`) REFERENCES
		`MaterialObject` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Person`
	ADD CONSTRAINT `UObjectPerson`
	FOREIGN KEY (`id`) REFERENCES
		`UObject` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonEntrants`
	ADD CONSTRAINT `PersonStudingPersonEntrants`
	FOREIGN KEY (`id`) REFERENCES
		`PersonStuding` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonGraduateStudent`
	ADD CONSTRAINT `PersonTeachingPersonGraduateStudent`
	FOREIGN KEY (`id`) REFERENCES
		`PersonTeaching` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonOther`
	ADD CONSTRAINT `PersonPersonOther`
	FOREIGN KEY (`id`) REFERENCES
		`Person` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonStudents`
	ADD CONSTRAINT `PersonStudingPersonStudents`
	FOREIGN KEY (`id`) REFERENCES
		`PersonStuding` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonStuding`
	ADD CONSTRAINT `PersonPersonStuding`
	FOREIGN KEY (`id`) REFERENCES
		`Person` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonTeachers`
	ADD CONSTRAINT `PersonTeachingPersonTeachers`
	FOREIGN KEY (`id`) REFERENCES
		`PersonTeaching` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonTeaching`
	ADD CONSTRAINT `PersonWorkingPersonTeaching`
	FOREIGN KEY (`id`) REFERENCES
		`PersonWorking` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonWorkers`
	ADD CONSTRAINT `PersonWorkingPersonWorkers`
	FOREIGN KEY (`id`) REFERENCES
		`PersonWorking` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `PersonWorking`
	ADD CONSTRAINT `PersonPersonWorking`
	FOREIGN KEY (`id`) REFERENCES
		`Person` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Rectorat`
	ADD CONSTRAINT `InstitutionOrgRectorat`
	FOREIGN KEY (`id`) REFERENCES
		`InstitutionOrg` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Subject`
	ADD CONSTRAINT `ObjSubject`
	FOREIGN KEY (`id`) REFERENCES
		`Obj` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Territory`
	ADD CONSTRAINT `InstitutionTerritory`
	FOREIGN KEY (`id`) REFERENCES
		`Institution` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Transport`
	ADD CONSTRAINT `MaterialObjectTransport`
	FOREIGN KEY (`id`) REFERENCES
		`MaterialObject` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
ALTER TABLE `Universities`
	ADD CONSTRAINT `InstitutionOrgUniversities`
	FOREIGN KEY (`id`) REFERENCES
		`InstitutionOrg` (`id`)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
