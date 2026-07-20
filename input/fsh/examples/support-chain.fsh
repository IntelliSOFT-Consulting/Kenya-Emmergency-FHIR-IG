// ============================================================================
// Supporting example instances shared by the clinical-profile examples below
// (Procedure, DiagnosticReport, AllergyIntolerance, Condition,
// SecondarySurveyObservation, VitalSigns, MedicationAdministration,
// ResponderUnit).
//
// Also supplies Patient/pat-0712345678 and Organization/org-nairobi-ems-dispatch,
// which em-episode-of-care-example-valid (examples/episode-of-care.fsh) already
// references by id.
// ============================================================================

Instance: pat-0712345678
InstanceOf: KenyaEmergencyPatient
Usage: #example
Title: "Patient - Identified Emergency Patient"
Description: "An identified adult patient receiving emergency care, referenced across the supporting example chain."

* active = true

* extension[unidentifiedPatient].valueBoolean = false
* extension[patientIdentityVerified].valueBoolean = true
* extension[isAdult].valueBoolean = true

* identifier[nationalId].system = $OfficialIdentifierSystem
* identifier[nationalId].value = "33445566"

* name.text = "Amina Atieno"
* gender = #female
* birthDate = "1992-05-16"


Instance: org-nairobi-ems-dispatch
InstanceOf: Organization
Usage: #example
Title: "Organization - Nairobi County EMS"
Description: "Example emergency medical services provider and dispatch organization."

* active = true
* name = "Nairobi County Emergency Medical Services"


Instance: em-practitioner-example
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner - Ambulance Clinician"
Description: "Example paramedic involved in ambulance response and emergency handover."

* active = true
* name[0].family = "Njoroge"
* name[0].given[0] = "Sarah"
* telecom[0].system = #phone
* telecom[0].value = "+254700100200"


Instance: em-scene-location-example
InstanceOf: EMSceneLocation
Usage: #example
Title: "Location - Mbagathi Road Incident Scene"
Description: "Example emergency incident scene location."

* status = #active
* name = "Mbagathi Road Pickup Point"
* type = EMSceneLocationTypeCS#road "Road or highway"
* position.longitude = 36.8172
* position.latitude = -1.2921


Instance: em-destination-facility-example
InstanceOf: EMDestinationFacility
Usage: #example
Title: "Location - Kenyatta National Hospital Emergency Centre"
Description: "Example receiving facility for emergency transport."

* identifier[facilityId].system = $FacilityIdentifierSystem
* identifier[facilityId].value = "KNH-001"

* extension[facilityLevel].valueCodeableConcept = EMFacilityLevelCS#level-6 "Level 6"
* extension[emergencyCentreCapability].valueCodeableConcept = EMEmergencyCentreCapabilityCS#advanced "Advanced emergency capability"

* status = #active
* name = "Kenyatta National Hospital Emergency Centre"
* type = EMDestinationFacilityTypeCS#emergency-centre "Emergency centre"
* managingOrganization = Reference(Organization/org-nairobi-ems-dispatch)


Instance: em-incident-encounter-example
InstanceOf: EMIncidentEncounter
Usage: #example
Title: "Encounter - Emergency Incident"
Description: "Example root emergency incident Encounter for a road traffic trauma case."

* extension[caller].extension[individual].valueReference = Reference(Patient/pat-0712345678)
* extension[caller].extension[relationship].valueCodeableConcept = EMCallerRelationshipCS#self "Self"
* extension[caller].extension[isPatient].valueBoolean = true

* identifier[dispatchId].value = "DISP-20260629120000-9981"
* identifier[incidentId].value = "INC-20260629120000-0712345678-abc123"

* status = #finished
* type = EMIncidentTypeCS#road-traffic "Road traffic incident"
* priority = EMDigitalDispatchPriorityCS#P1 "Priority 1 – Immediate"

* subject = Reference(Patient/pat-0712345678)
* episodeOfCare = Reference(EpisodeOfCare/em-episode-of-care-example-valid)

* participant.type = EMParticipantRoleCS#dispatcher
* participant.individual = Reference(Practitioner/em-practitioner-example)

* period.start = "2026-06-29T12:00:00+03:00"
* period.end = "2026-06-29T12:40:00+03:00"

* reasonCode[0].text = "Road traffic collision, driver trapped"

* location.location = Reference(Location/em-scene-location-example)

* serviceProvider = Reference(Organization/org-nairobi-ems-dispatch)

* hospitalization.destination = Reference(Location/em-destination-facility-example)


Instance: em-poc-encounter-example
InstanceOf: EMPOCEncounter
Usage: #example
Title: "Encounter - Emergency Point of Care"
Description: "Example point-of-care Encounter for direct patient assessment and treatment during the incident above."

* identifier.system = $IncidentIdentifierSystem
* identifier.value = "INC-20260629120000-0712345678-abc123"

* status = #finished
* class = EMEncounterClassCS#FLD
* type = EMPOCEncounterTypeCS#scene-and-transport "Scene and transport care"
* priority = EMClinicalAcuityCS#orange "Orange - Very urgent"

* subject = Reference(Patient/pat-0712345678)
* episodeOfCare = Reference(EpisodeOfCare/em-episode-of-care-example-valid)
* partOf = Reference(Encounter/em-incident-encounter-example)

* participant.individual = Reference(Practitioner/em-practitioner-example)

* period.start = "2026-06-29T12:08:00+03:00"
* period.end = "2026-06-29T12:38:00+03:00"

* location.location = Reference(Location/em-scene-location-example)

* serviceProvider = Reference(Organization/org-nairobi-ems-dispatch)

* hospitalization.destination = Reference(Location/em-destination-facility-example)


Instance: em-responder-unit-location-example
InstanceOf: EMResponderUnitLocation
Usage: #example
Title: "Location - Responder Unit Real-Time Position"
Description: "Example real-time position of the ambulance responding to the incident."

* extension[lastLocationUpdatedAt].valueDateTime = "2026-06-29T12:15:00+03:00"
* extension[responseStatus].valueCodeableConcept = EMUnitResponseStatusCS#transporting "Transporting"

* status = #active
* mode = #instance
* position.longitude = 36.8172
* position.latitude = -1.2921
* managingOrganization = Reference(Organization/org-nairobi-ems-dispatch)


Instance: em-responder-unit-example
InstanceOf: EMResponderUnit
Usage: #example
Title: "Device - Ambulance Unit 12"
Description: "Example ambulance responder unit dispatched to the incident above."

* extension[responderCrew][0].extension[member].valueReference = Reference(Practitioner/em-practitioner-example)
* extension[responderCrew][0].extension[role].valueCodeableConcept = EMCrewRoleCS#paramedic "Paramedic"

* extension[ownershipType].valueCodeableConcept = EMOwnershipTypeCS#government "Government"
* extension[relieved].valueBoolean = false

* identifier[responderUnitId].value = "AMB-012"
* identifier[vehicleRegistration].value = "KDA 001A"

* status = #active
* type = EMResponderUnitTypeCS#advanced-life-support "Advanced life-support ambulance"

* deviceName.name = "Ambulance Unit 12"
* deviceName.type = #user-friendly-name

* owner = Reference(Organization/org-nairobi-ems-dispatch)

* contact.system = #phone
* contact.value = "+254700200300"

* location = Reference(Location/em-responder-unit-location-example)
