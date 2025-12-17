Profile: KenyaCondition
Parent: Condition
Id: kenya-condition
Title: "Condition – Kenya Clinical Condition"
Description: "Represents a clinical condition recorded in Kenya EMS and facility workflows."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya condition profile"

* insert IdentifierRequiredRule(identifier, 1..*)

* clinicalStatus 1..1 MS
* clinicalStatus ^short = "Clinical status of the condition"

* verificationStatus 1..1 MS
* verificationStatus ^short = "Verification status of the condition"

* category 0..* MS
* category ^short = "Condition category"

* code 1..1 MS
* code ^short = "Condition code (ICD-11 or OCL)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient with the condition"

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Encounter when the condition was identified"

* recordedDate 0..1 MS
* recordedDate ^short = "Date when the condition was recorded"
