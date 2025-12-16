Profile: KenyaProcedure
Parent: Procedure
Id: kenya-procedure
Title: "Procedure – Kenya Clinical Procedure"
Description: "Represents procedures performed during Kenya EMS and facility clinical workflows."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya procedure profile"

* identifier 0..* MS
* identifier ^short = "Identifiers associated with the procedure"

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
* status ^short = "Procedure status"

* code 1..1 MS
* code ^short = "Procedure code (OCL)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient on whom the procedure was performed"

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter"

* performedDateTime 0..1 MS
* performedDateTime ^short = "Date and time the procedure was performed"

* reasonReference 0..* MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Condition being treated"

* outcome 0..1 MS
* outcome ^short = "Procedure outcome"

* performer 0..* MS
* performer ^short = "Who performed the procedure"

* performer.actor 1..1 MS
* performer.actor only Reference(Practitioner)
* performer.actor ^short = "EMT or clinician who performed the procedure"
