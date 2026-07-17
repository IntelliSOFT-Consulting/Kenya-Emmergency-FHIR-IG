
 
Extension: EMIncidentPriority
Id: em-incident-priority
Title: "Incident Priority"
Description: "Dispatcher-assigned priority at call intake. Maps to incident.priority_level. Represents the INITIAL priority only — do not overwrite with on-scene EMT triage acuity."
* ^context[0].type = #element
* ^context[0].expression = "EpisodeOfCare"
* value[x] only CodeableConcept
* valueCodeableConcept from EMPriorityLevelVS (required)
* valueCodeableConcept 1..1 MS

 
Extension: EMNumberOfPatients
Id: em-number-of-patients
Title: "Number of Patients"
Description: "Number of patients associated with this incident/dispatch. Maps to incident.number_of_patients. Kept at the EpisodeOfCare (incident) level, not duplicated on child Encounters. If >1, expect multiple EMEpisodeOfCare/Patient chains linked via identifier:groupIncidentId."
* ^context[0].type = #element
* ^context[0].expression = "EpisodeOfCare"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS