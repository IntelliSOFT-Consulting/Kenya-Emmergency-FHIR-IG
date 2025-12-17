Profile: KenyaVitalSignsObservation
Parent: Observation
Id: kenya-vital-signs-observation
Title: "Observation – Kenya Vital Signs"
Description: "Represents vital signs observations captured in the Kenya EMS and clinical workflows."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya vital signs profile"

* insert IdentifierRequiredRule(identifier, 1..*)

* status 1..1 MS
* status ^short = "Observation status"

* category 1..* MS
* category ^short = "Observation category"

* code 1..1 MS
* code ^short = "Type of vital sign measured"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient whose vital signs were measured"

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "Date and time the vital sign was measured"

* valueQuantity 0..1 MS
* valueQuantity ^short = "Numeric value with unit"

* valueString 0..1 MS
* valueString ^short = "String value for non-numeric vitals"

* interpretation 0..* MS
* interpretation ^short = "Clinical interpretation of the result"

* component 0..* MS
* component ^short = "Components for composite observations such as blood pressure"
