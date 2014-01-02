module.exports = {
    "fields" : {
        "group" : {
            "amount" : "Number",
            "curator" : "String"
        },
        "buildings" : {
            "rooms" : "Number"
        },
        "buildingsother" : {
            "desc" : "String"
        },
        "cathedra" : {
            "specialization" : "String",
            "employees" : "Number"
        },
        "chummery" : {
            "comendant" : "String",
            "faculty" : "String"
        },
        "classes" : {
            "Name" : "String",
            "Children" : "String"
        },
        "classes_func" : {
            "Name" : "String",
            "Children" : "String"
        },
        "classroom" : {
            "seats" : "Number"
        },
        "clinic" : {
            "amount_cabinets" : "Number",
            "doctors" : "String"
        },
        "collective" : {
            "activity" : "String",
            "amount" : "Number"
        },
        "deanery" : {
            "assistant" : "String"
        },
        "document" : {
            "author" : "String"
        },
        "documentgeneral" : {
            "doc_type" : "String"
        },
        "documentother" : {
            "desc" : "String"
        },
        "documentpersonal" : {
            "number" : "String"
        },
        "equipment" : {
            "status" : "String"
        },
        "eventcultural" : {
            "reason" : "String"
        },
        "events" : {
            "date_action" : "String",
            "place_action" : "String"
        },
        "eventscience" : {
            "theme" : "String"
        },
        "eventsport" : {
            "sport" : "String",
            "referee" : "String",
            "status" : "String"
        },
        "eventtest" : {
            "max_mark" : "Number"
        },
        "eventwork" : {
            "type_of_work" : "String"
        },
        "faculty" : {
            "amount_cathedr" : "Number",
            "amount_groups" : "Number"
        },
        "institution" : {
            "adress" : "String"
        },
        "institutionorg" : {
            "chief" : "String"
        },
        "institutionother" : {
            "desc" : "String"
        },
        "materialobject" : {
            "date_creation" : "String"
        },
        "nomaterialobjother" : {
            "desc" : "String"
        },
        "obj" : {
            "responsible_person" : "String"
        },
        "other" : {
            "desc" : "String"
        },
        "othermaterialobject" : {
            "desc" : "String"
        },
        "painting" : {
            "brush" : "String"
        },
        "person" : {
            "sex" : "String",
            "birthday" : "String"
        },
        "personentrants" : {
            "zno_points" : "Number"
        },
        "persongraduatestudent" : {
            "years" : "Number"
        },
        "personother" : {
            "benefit" : "String"
        },
        "personstudents" : {
            "studing_form" : "String",
            "entry_year" : "String"
        },
        "personstuding" : {
            "secondary_education" : "String"
        },
        "personteachers" : {
            "academic_degree" : "String"
        },
        "personteaching" : {
            "subject" : "String"
        },
        "personworkers" : {
            "post" : "String"
        },
        "personworking" : {
            "experience" : "String",
            "salary" : "String"
        },
        "process" : {
            "start" : "String",
            "end" : "String",
            "person_vyk" : "String"
        },
        "rectorat" : {
            "prorectors" : "String"
        },
        "remont" : {
            "materials" : "String",
            "suma" : "String"
        },
        "subject" : {
            "teachers" : "String"
        },
        "territory" : {
            "area" : "String"
        },
        "transport" : {
            "number" : "String",
            "type" : "String",
            "price" : "String"
        },
        "universities" : {
            "accredetation" : "String"
        },
        "uobject" : {
            "major" : "Number",
            "name" : "String",
            "class" : "Number"
        }
    },
    "references" : {
        "group" : {
            "id" : {
                "table" : "institutionorg",
                "reference" : "id"
            }
        },
        "buildings" : {
            "id" : {
                "table" : "institution",
                "reference" : "id"
            }
        },
        "buildingsother" : {
            "id" : {
                "table" : "buildings",
                "reference" : "id"
            }
        },
        "cathedra" : {
            "id" : {
                "table" : "institutionorg",
                "reference" : "id"
            }
        },
        "chummery" : {
            "id" : {
                "table" : "buildings",
                "reference" : "id"
            }
        },
        "classes" : {},
        "classes_func" : {},
        "classroom" : {
            "id" : {
                "table" : "institution",
                "reference" : "id"
            }
        },
        "clinic" : {
            "id" : {
                "table" : "buildings",
                "reference" : "id"
            }
        },
        "collective" : {
            "id" : {
                "table" : "institutionorg",
                "reference" : "id"
            }
        },
        "deanery" : {
            "id" : {
                "table" : "institutionorg",
                "reference" : "id"
            }
        },
        "document" : {
            "id" : {
                "table" : "materialobject",
                "reference" : "id"
            }
        },
        "documentgeneral" : {
            "id" : {
                "table" : "document",
                "reference" : "id"
            }
        },
        "documentother" : {
            "id" : {
                "table" : "document",
                "reference" : "id"
            }
        },
        "documentpersonal" : {
            "id" : {
                "table" : "document",
                "reference" : "id"
            }
        },
        "equipment" : {
            "id" : {
                "table" : "materialobject",
                "reference" : "id"
            }
        },
        "eventcultural" : {
            "id" : {
                "table" : "events",
                "reference" : "id"
            }
        },
        "events" : {
            "id" : {
                "table" : "obj",
                "reference" : "id"
            }
        },
        "eventscience" : {
            "id" : {
                "table" : "events",
                "reference" : "id"
            }
        },
        "eventsport" : {
            "id" : {
                "table" : "events",
                "reference" : "id"
            }
        },
        "eventtest" : {
            "id" : {
                "table" : "eventscience",
                "reference" : "id"
            }
        },
        "eventwork" : {
            "id" : {
                "table" : "events",
                "reference" : "id"
            }
        },
        "faculty" : {
            "id" : {
                "table" : "institutionorg",
                "reference" : "id"
            }
        },
        "institution" : {
            "id" : {
                "table" : "uobject",
                "reference" : "id"
            }
        },
        "institutionorg" : {
            "id" : {
                "table" : "institution",
                "reference" : "id"
            }
        },
        "institutionother" : {
            "id" : {
                "table" : "institutionorg",
                "reference" : "id"
            }
        },
        "materialobject" : {
            "id" : {
                "table" : "obj",
                "reference" : "id"
            }
        },
        "nomaterialobjother" : {
            "id" : {
                "table" : "obj",
                "reference" : "id"
            }
        },
        "obj" : {
            "id" : {
                "table" : "uobject",
                "reference" : "id"
            }
        },
        "other" : {
            "id" : {
                "table" : "uobject",
                "reference" : "id"
            }
        },
        "othermaterialobject" : {
            "id" : {
                "table" : "materialobject",
                "reference" : "id"
            }
        },
        "painting" : {
            "id" : {
                "table" : "process",
                "reference" : "id"
            }
        },
        "person" : {
            "id" : {
                "table" : "uobject",
                "reference" : "id"
            }
        },
        "personentrants" : {
            "id" : {
                "table" : "personstuding",
                "reference" : "id"
            }
        },
        "persongraduatestudent" : {
            "id" : {
                "table" : "personteaching",
                "reference" : "id"
            }
        },
        "personother" : {
            "id" : {
                "table" : "person",
                "reference" : "id"
            }
        },
        "personstudents" : {
            "id" : {
                "table" : "personstuding",
                "reference" : "id"
            }
        },
        "personstuding" : {
            "id" : {
                "table" : "person",
                "reference" : "id"
            }
        },
        "personteachers" : {
            "id" : {
                "table" : "personteaching",
                "reference" : "id"
            }
        },
        "personteaching" : {
            "id" : {
                "table" : "personworking",
                "reference" : "id"
            }
        },
        "personworkers" : {
            "id" : {
                "table" : "personworking",
                "reference" : "id"
            }
        },
        "personworking" : {
            "id" : {
                "table" : "person",
                "reference" : "id"
            }
        },
        "process" : {
            "id" : {
                "table" : "uobject",
                "reference" : "id"
            }
        },
        "rectorat" : {
            "id" : {
                "table" : "institutionorg",
                "reference" : "id"
            }
        },
        "remont" : {
            "id" : {
                "table" : "process",
                "reference" : "id"
            }
        },
        "subject" : {
            "id" : {
                "table" : "obj",
                "reference" : "id"
            }
        },
        "territory" : {
            "id" : {
                "table" : "institution",
                "reference" : "id"
            }
        },
        "transport" : {
            "id" : {
                "table" : "materialobject",
                "reference" : "id"
            }
        },
        "universities" : {
            "id" : {
                "table" : "institutionorg",
                "reference" : "id"
            }
        },
        "uobject" : {}
    },
    "fieldReferences" : {
        "group" : "curator",
        "institutionorg" : "chief"
    },
    "processesReferences" : {
        "remont" : function (recordId) {
            var queries = [
                "DELETE FROM `remont` WHERE id=" + recordId,
                "DELETE FROM `process` WHERE id=" + recordId,
                "DELETE FROM `uobject` WHERE id=" + recordId
            ];
            return queries;
        },
        "painting" : function (recordId) {
            var queries = [
                "DELETE FROM `painting` WHERE id=" + recordId,
                "DELETE FROM `process` WHERE id=" + recordId,
                "DELETE FROM `uobject` WHERE id=" + recordId
            ];
            return queries;
        }
    }
};