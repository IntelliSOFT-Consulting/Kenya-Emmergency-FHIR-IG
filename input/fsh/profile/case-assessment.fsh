Profile: KenyaCaseAssessment
Parent: Observation
Id: kenya-case-assessment
Title: "Case Assessment - Kenya"
Description: "Kenya Case Assessment profile representing structured clinical assessments."

* meta 1..1 MS
* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya Case Assessment profile"

* insert IdentifierRequiredRule(identifier, 1..*)

* status 1..1 MS
* status ^short = "Observation status"
* status from http://hl7.org/fhir/ValueSet/observation-status (required)

* code 1..1 MS
* code ^short = "Assessment type"
* code from https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/sources/HIE-REF/concepts/ASSESSMENT_TYPES/ (required)

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient"

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When assessment was performed"


* component 0..* MS
* component ^short = "Assessment details per body system"

* component.code 1..1 MS
* component.code ^short = "Assessment detail type"
* component.code from https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/sources/HIE-REF/concepts/ASSESSMENT_DETAILS/ (required)

* component.value[x] 0..1 MS
* component.value[x] ^short = "Structured assessment finding"
