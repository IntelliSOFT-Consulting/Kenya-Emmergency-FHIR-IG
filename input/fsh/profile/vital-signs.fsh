Profile: EMVitalSignsObservation
Parent: Observation
Id: em-vital-signs-observation
Title: "Observation - Emergency Vital Signs"
Description: """
Represents a single vital-sign measurement (heart rate, respiratory rate,
temperature, SpO2, blood pressure, or Glasgow Coma Scale) captured during
Kenya emergency medical services and point-of-care workflows.

Largely reuses the standard FHIR vital-signs pattern rather than inventing new
structure. One Observation instance is created per measurement, per reading
time, so trends across the episode (dispatch snapshot, on-scene, in-transit,
ED arrival) can be reconstructed.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* extension contains
    EMClinicalGuidanceMessage named clinicalGuidanceMessage 0..1 MS and
    EMQualitativeState named qualitativeState 0..1 MS and
    EMVitalAgeGroup named ageGroup 0..1 MS

* extension[clinicalGuidanceMessage] ^short =
    "Auto-generated clinical guidance tied to the severity flag"

* extension[qualitativeState] ^short =
    "Qualitative descriptor independent of the numeric value, e.g. pulse 'weak'"

* extension[ageGroup] ^short =
    "Age-group bucket used to select the applicable reference range"

* status 1..1 MS
* status from $ObservationStatus (required)
* status ^short = "Workflow status of the measurement"
* status ^definition = """
Field vitals are usually 'final' once entered — 'preliminary' is rare in this
workflow but keep it available.
"""

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* category ^short = "Fixed to 'vital-signs'"
* category ^definition = """
Use the standard category so any FHIR-native vitals viewer/chart in a
receiving facility renders these correctly without needing to know local
extensions.
"""

* code 1..1 MS
* code from VitalSignsVS (extensible)
* code ^short = "Which vital sign or score this instance represents"
* code ^definition = """
Reuse canonical LOINC codes rather than inventing local ones: HR 8867-4,
Respiratory Rate 9279-1, Temperature 8310-5, SpO2 59408-5, Blood Pressure
panel 85354-9 (components: systolic 8480-6, diastolic 8462-4), GCS total
9269-2 (components: eye-opening, verbal, motor).
"""

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient being measured"

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMPOCEncounter"
* encounter ^definition = """
Essential for trending vitals across the episode: dispatch snapshot vs
on-scene vs in-transit vs ED arrival.
"""

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "Exact time the measurement was taken"
* effectiveDateTime ^definition = """
Non-negotiable for emergency vitals — trending HR/BP/GCS over exact minutes is
often the whole clinical point, e.g. deteriorating GCS or worsening shock
index.
"""

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)
* performer ^short = "Who took the measurement"

* interpretation 0..1 MS
* interpretation from http://hl7.org/fhir/ValueSet/observation-interpretation (extensible)
* interpretation ^short = "High/low/critical flag relative to normal range"
* interpretation ^definition = """
Actively drives clinical alerting (e.g. SpO2 80% flagged 'critical'), not just
dashboard cosmetics. Map warning/critical from the source system onto FHIR
interpretation codes rather than carrying the source severity string as free
text.
"""

* referenceRange 0..*
* referenceRange ^short = "Normal range for this vital, if computed by the source system"

* value[x] only Quantity
* value[x] 0..1 MS
* value[x] ^short = "The numeric result with UCUM unit"
* value[x] ^definition = """
Required for single-value vitals (HR, RR, Temp, SpO2) and for the GCS total
when components are not separately captured. Not populated for a panel vital
(e.g. blood pressure) that is represented entirely through component — see
invariant em-vitals-1. Use UCUM units consistently — do not let vendor
free-text units leak through (e.g. 'bpm' vs '/min').
"""

* component 0..* MS
* component ^short = "Components for panel vitals such as blood pressure or GCS sub-scores"

* component ^slicing.discriminator[0].type = #pattern
* component ^slicing.discriminator[0].path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false

* component contains
    systolicBP 0..1 MS and
    diastolicBP 0..1 MS and
    gcsEye 0..1 MS and
    gcsVerbal 0..1 MS and
    gcsMotor 0..1 MS

* component[systolicBP].code = $LOINC#8480-6 "Systolic blood pressure"
* component[systolicBP].value[x] only Quantity
* component[systolicBP] ^short =
    "Systolic blood pressure — required when Observation.code is the BP panel"

* component[diastolicBP].code = $LOINC#8462-4 "Diastolic blood pressure"
* component[diastolicBP].value[x] only Quantity
* component[diastolicBP] ^short =
    "Diastolic blood pressure — required when Observation.code is the BP panel"

* component[gcsEye].code = $LOINC#9267-6 "Glasgow coma score eye opening"
* component[gcsEye].value[x] only Quantity
* component[gcsEye] ^short =
    "GCS eye-opening sub-score, if captured separately from the total"

* component[gcsVerbal].code = $LOINC#9270-0 "Glasgow coma score verbal"
* component[gcsVerbal].value[x] only Quantity
* component[gcsVerbal] ^short =
    "GCS verbal-response sub-score, if captured separately from the total"

* component[gcsMotor].code = $LOINC#9268-4 "Glasgow coma score motor"
* component[gcsMotor].value[x] only Quantity
* component[gcsMotor] ^short =
    "GCS motor-response sub-score, if captured separately from the total"

* obeys em-vitals-1


// ============================================================================
// Triage Acuity — distinct, trendable Observation
// ============================================================================

Profile: EMTriageAcuityObservation
Parent: Observation
Id: em-triage-acuity-observation
Title: "Observation - Emergency Triage Acuity"
Description: """
A standalone, trendable triage acuity record, separate from
EMIncidentEncounter.priority (dispatch) and EMPOCEncounter.priority
(on-scene).

Only create this Observation when the workflow needs acuity trending as
discrete timestamped events; if a single current-priority value per encounter
is sufficient, Encounter.priority alone is enough and this Observation is
unnecessary.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status from $ObservationStatus (required)

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#survey
* category ^short = "Fixed to 'survey'"

* code 1..1 MS
* code ^short = "Identifies this Observation as a triage acuity assessment"

* subject 1..1 MS
* subject only Reference(Patient)

* encounter 1..1 MS
* encounter only Reference(Encounter)

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When this acuity reassessment was performed"

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)

* value[x] only CodeableConcept
* value[x] 1..1 MS
* valueCodeableConcept from EMPriorityLevelVS (required)
* valueCodeableConcept ^short = "The acuity level itself"
* valueCodeableConcept ^definition = """
Reuses the same priority-level value set already defined for
EMEpisodeOfCare/EMIncidentEncounter/EMPOCEncounter rather than defining a
second, parallel acuity scale.
"""
