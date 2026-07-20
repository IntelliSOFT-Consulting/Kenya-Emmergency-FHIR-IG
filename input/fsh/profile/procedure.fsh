Profile: EMProcedure
Parent: Procedure
Id: em-procedure
Title: "Procedure - Emergency Clinical Procedure"
Description: """
Represents a clinical procedure performed during Kenya emergency medical
services and point-of-care workflows, e.g. CPR, endotracheal intubation,
wound dressing, or splinting.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status from $EventStatus (required)
* status ^short = "Workflow status of the procedure"
* status ^definition = """
'stopped' and 'not-done' both matter in emergency care (e.g. resuscitation
stopped, intubation attempt failed) — do not default every procedure to
'completed'.
"""

* category 0..1 MS
* category from http://hl7.org/fhir/ValueSet/procedure-category (extensible)
* category ^short = "Broad category, e.g. emergency procedure"

* code 1..1 MS
* code from ProcedureCodeVS (extensible)
* code ^short = "The specific procedure performed"
* code ^definition = """
The specific procedure performed, e.g. CPR, endotracheal intubation, wound
dressing, or splinting. Source systems have been observed sending
LOINC Answer-code style values here rather than SNOMED CT procedure codes;
reconcile the intended code system with the source vendor before treating
this binding as final.
"""

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient on whom the procedure was performed"

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMPOCEncounter"

* performed[x] 1..1 MS
* performed[x] only dateTime or Period
* performed[x] ^short = "When the procedure was performed"
* performed[x] ^definition = """
Use performedPeriod for anything with a meaningful duration (e.g. ongoing
CPR), performedDateTime for a discrete moment (e.g. a single intubation
attempt). Timing precision matters as much here as it does for Condition
onset; a resuscitation timeline is frequently reviewed minute-by-minute
afterward.
"""

* performer 0..* MS
* performer ^short = "Who performed the procedure"

* performer.actor 1..1 MS
* performer.actor only Reference(Practitioner or PractitionerRole)
* performer.actor ^short = "EMT or clinician who performed the procedure"

* outcome 0..1 MS
* outcome from http://hl7.org/fhir/ValueSet/procedure-outcome (extensible)
* outcome ^short = "Result of the procedure"
* outcome ^definition = """
Recommended strongly for resuscitation and airway procedures specifically,
since the outcome carries real clinical and legal weight, e.g. ROSC achieved
or not achieved, successful or failed intubation attempt.
"""

* complication 0..*
* complication from http://hl7.org/fhir/ValueSet/condition-code (extensible)
* complication ^short = "Complications arising from the procedure"

* bodySite 0..*
* bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)
* bodySite ^short = "Anatomical site the procedure was performed on"

* reasonReference 0..* MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Condition being treated"

* note 0..*
* note ^short = "Free-text notes about the procedure"
