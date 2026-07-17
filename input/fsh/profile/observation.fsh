Profile: EMCallerReportedObservation
Parent: Observation
Id: em-caller-reported-observation
Title: "Observation - Caller Reported"
Description: """
Represents unverified clinical information reported by a caller or dispatcher
before physical patient assessment by an emergency medical practitioner.

Caller-reported observations must remain distinct from observations recorded
after direct clinical assessment.
"""

* ^status = #active
* ^experimental = false
* ^abstract = true
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status from $ObservationStatus (required)

* category 1..* MS

* category ^slicing.discriminator[0].type = #pattern
* category ^slicing.discriminator[0].path = "coding"
* category ^slicing.rules = #open
* category ^slicing.ordered = false

* category contains
    callerReported 1..1 MS

* category[callerReported] =
    EMObservationCategoryCS#caller-reported

* code 1..1 MS

* subject 1..1 MS
* subject only Reference(KenyaEmergencyPatient)

* encounter 1..1 MS
* encounter only Reference(EMIncidentEncounter)

* effective[x] 1..1 MS
* effective[x] only dateTime or Period

* issued 0..1 MS

* performer 0..* MS
* performer only Reference(
    Patient or
    RelatedPerson or
    Practitioner or
    PractitionerRole or
    Organization or
    CareTeam
)

* performer ^short =
    "Caller, dispatcher, or organization providing the reported information"

* note 0..* MS

* bodySite 0..0
* method 0..0
* specimen 0..0
* device 0..0
* referenceRange 0..0


Profile: EMCallerReportedLevelOfConsciousness
Parent: EMCallerReportedObservation
Id: em-caller-reported-level-of-consciousness
Title: "Observation - Caller-Reported Level of Consciousness"
Description: """
Represents the patient's apparent level of consciousness as reported by the
caller or dispatcher before direct clinical assessment.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false

* code = EMObservationCodeCS#caller-consciousness
* code ^short =
    "Caller-reported level of consciousness"

* value[x] 1..1 MS
* value[x] only CodeableConcept

* valueCodeableConcept from EMAVPUScaleVS (required)

* dataAbsentReason 0..1 MS

* obeys em-obs-1



Profile: EMCallerReportedBreathingStatus
Parent: EMCallerReportedObservation
Id: em-caller-reported-breathing-status
Title: "Observation - Caller-Reported Breathing Status"
Description: """
Represents the patient's apparent breathing status as reported by a caller or
dispatcher before direct clinical assessment.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false

* code = EMObservationCodeCS#caller-breathing
* code ^short =
    "Caller-reported breathing status"

* value[x] 1..1 MS
* value[x] only CodeableConcept

* valueCodeableConcept from EMBreathingStatusVS (required)

* dataAbsentReason 0..1 MS

* obeys em-obs-1



Profile: EMCallerReportedActiveBleeding
Parent: EMCallerReportedObservation
Id: em-caller-reported-active-bleeding
Title: "Observation - Caller-Reported Active Bleeding"
Description: """
Represents whether active bleeding was reported by the caller or dispatcher
before direct clinical assessment.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false

* code = EMObservationCodeCS#caller-active-bleeding
* code ^short =
    "Caller-reported active bleeding"

* value[x] 1..1 MS
* value[x] only boolean

* valueBoolean ^short =
    "Whether the caller reported that the patient was actively bleeding"

* dataAbsentReason 0..1 MS

* obeys em-obs-1