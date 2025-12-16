Profile: KenyaMedicationAdministration
Parent: MedicationAdministration
Id: kenya-medication-administration
Title: "MedicationAdministration – Kenya Medication Administration"
Description: "Represents medications administered to a patient in Kenya EMS and facility clinical workflows."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya medication administration profile"

* identifier 0..* MS
* identifier ^short = "Identifiers associated with the medication administration"

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains
    shrId 0..1 MS

* identifier[shrId].system 1..1
* identifier[shrId].system = "http://example.org/identifier/shr-id"
* identifier[shrId].value 1..1
* identifier[shrId] ^short = "Shared Health Record ID"

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
* dosage.route ^short = "Route of administration"

* dosage.dose 0..1 MS
* dosage.dose ^short = "Dose quantity with unit"

