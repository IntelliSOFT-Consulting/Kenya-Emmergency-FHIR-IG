Profile: EMPOCEncounter
Parent: Encounter
Id: em-poc-encounter
Title: "Encounter - Emergency Point of Care"
Description: """
Represents the direct patient-care encounter performed by an emergency medical
team at the scene or during transport.

The point-of-care Encounter is subordinate to the root emergency incident
Encounter and references it through Encounter.partOf.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* identifier 1..* MS

* status 1..1 MS

* class 1..1 MS
* class = EMEncounterClassCS#FLD

* type 1..* MS
* type from EMPOCEncounterTypeVS (required)

* priority 1..1 MS
* priority from EMClinicalAcuityVS (required)

* priority ^short =
    "Clinical acuity assigned after assessment by the emergency team"

* subject 1..1 MS
* subject only Reference(Patient)

* episodeOfCare 1..1 MS
* episodeOfCare only Reference(EpisodeOfCare)

* partOf 1..1 MS
* partOf only Reference(EMIncidentEncounter)

* partOf ^short =
    "Root emergency incident Encounter"

* participant 1..* MS

* participant.individual 1..1 MS
* participant.individual only Reference(Practitioner or PractitionerRole)

* period 1..1 MS
* period.start 1..1 MS
* period.end 0..1 MS

* reasonCode 0..* MS

* diagnosis 0..* MS

* location 0..* MS
* location.location 1..1 MS
* location.location only Reference(EMSceneLocation or Location)

* serviceProvider 1..1 MS
* serviceProvider only Reference(Organization)

* hospitalization 0..1 MS
* hospitalization.destination 0..1 MS
* hospitalization.destination only Reference(EMDestinationFacility)

* obeys em-poc-1