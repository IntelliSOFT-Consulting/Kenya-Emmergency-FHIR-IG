Profile: KenyaDiagnosticReport
Parent: DiagnosticReport
Id: kenya-diagnosticreport
Title: "DiagnosticReport - Kenya"
Description: "Kenya DiagnosticReport profile for laboratory and investigation results."


* meta 1..1 MS
* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya DiagnosticReport profile"

* identifier 1..* MS
* identifier ^short = "Case identifiers such as case number, dispatch ID, SHR ID"

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
* status ^short = "Report status"

* code 1..1 MS
* code ^short = "Investigation code (OCL/LOINC)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient"

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter"

* effectiveDateTime 0..1 MS
* effectiveDateTime ^short = "When the investigation was performed"

* performer 0..* MS
* performer only Reference(Practitioner)
* performer ^short = "Who performed the investigation"

* conclusion 0..1 MS
* conclusion ^short = "Clinical findings or interpretation"
