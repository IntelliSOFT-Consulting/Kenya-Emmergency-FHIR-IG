Profile: EMSecondarySurveyObservation
Parent: Observation
Id: em-secondary-survey-observation
Title: "Observation - Emergency Secondary Survey"
Description: """
Represents the examination of a single body region during an emergency
secondary survey — one Observation instance per body region examined (head,
neck, chest, back-and-spine, abdomen, pelvis, upper-extremities,
lower-extremities), not one Observation for the whole secondary survey.

Mirrors the explicit-absence pattern used on EMAllergyIntolerance: a region
with nothing abnormal found must be recorded as an explicit "examined, no
findings" Observation, never left as a silently-missing resource. A full-body
exam is expected to produce exactly 8 Observation instances (fewer only if the
survey was genuinely partial, e.g. limited by scene safety) — that expectation
is a workflow-completeness rule, not a FHIR structural constraint on this
profile.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* extension contains
    EMNoFindingsOnExam named noFindingsOnExam 1..1 MS

* extension[noFindingsOnExam] ^short =
    "Explicit flag confirming this region was examined and nothing abnormal was found"

* status 1..1 MS
* status from $ObservationStatus (required)
* status ^short = "Workflow status of the exam finding"

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* category ^short = "Fixed to 'exam'"

* code 1..1 MS
* code from EMSecondarySurveyRegionVS (required)
* code ^short = "Identifies this as a secondary-survey examination of a specific region"

* bodySite 1..1 MS
* bodySite from EMBodyRegionVS (required)
* bodySite ^short = "The body region examined"
* bodySite ^definition = """
Tightened from the base spec's optional binding since the region IS the
identity of each instance.
"""

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient examined"

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMPOCEncounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When this region was examined"

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)
* performer ^short = "Who performed the exam"

* value[x] only CodeableConcept
* value[x] 0..1 MS
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* valueCodeableConcept ^short = "The abnormal finding for this region"

* component 0..* MS
* component ^short = "Discrete findings when more than one applies to the same region"
* component ^definition = """
Use when more than one discrete finding needs to be individually coded per
region (e.g. both 'laceration' and 'bruising' on the same limb) rather than
concatenating into one CodeableConcept.
"""

* component.code 1..1 MS
* component.code from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)

* note 0..*
* note ^short = "Free-text notes about the regional exam"

* obeys em-exam-1
* obeys em-exam-2
