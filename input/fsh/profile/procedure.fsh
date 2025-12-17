Profile: KenyaProcedure
Parent: Procedure
Id: kenya-procedure
Title: "Procedure – Kenya Clinical Procedure"
Description: "Represents procedures performed during Kenya EMS and facility clinical workflows."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya procedure profile"

* insert IdentifierRequiredRule(identifier, 1..*)

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
