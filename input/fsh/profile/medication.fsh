Profile: KenyaMedicationAdministration
Parent: MedicationAdministration
Id: kenya-medication-administration
Title: "MedicationAdministration – Kenya Medication Administration"
Description: "Represents medications administered to a patient in Kenya EMS and facility clinical workflows."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya medication administration profile"

* insert IdentifierRequiredRule(identifier, 1..*)

* status 1..1 MS
* status ^short = "Medication administration status"

* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept ^short = "Medication code (OCL)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient receiving the medication"

* context 0..1 MS
* context only Reference(Encounter)
* context ^short = "Encounter context"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "Date and time the medication was administered"

* reasonReference 0..* MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Condition being treated"

* performer 0..* MS
* performer ^short = "Who administered the medication"

* performer.actor 1..1 MS
* performer.actor only Reference(Practitioner)
* performer.actor ^short = "EMT or clinician who administered the medication"

* dosage 0..1 MS
* dosage ^short = "Dosage details"

* dosage.route 0..1 MS
* dosage.route from MedicationAdministrationRouteVS (required)
* dosage.route ^short = "Route of administration"

* dosage.dose 0..1 MS
* dosage.dose from DoseUnitsVS (required)
* dosage.dose ^short = "Dose quantity with unit"

