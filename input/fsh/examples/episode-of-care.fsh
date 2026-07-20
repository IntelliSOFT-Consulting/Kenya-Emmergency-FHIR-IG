// // -----------------------------------------------------------------------------
// // VALID example — single-patient incident, fully conformant
// // -----------------------------------------------------------------------------
// Instance: em-episode-of-care-example-valid
// InstanceOf: KenyaAmbulanceEpisodeOfCare
// Usage: #example
// Title: "EM Episode of Care — Valid Example"
// Description: "A single-patient road traffic accident dispatch. Conforms fully to EMEpisodeOfCare: fixed identifier.system values, required type/status/priority present, numberOfPatients matches the (absence of a) groupIncidentId."

// * identifier[incidentId].system = "http://hie.go.ke/fhir/identifier/incident-id"
// * identifier[incidentId].value = "INC-20260629120000-0712345678-abc123"

// * identifier[dispatchId].system = "http://hie.go.ke/fhir/identifier/dispatch-id"
// * identifier[dispatchId].value = "DISP-20260629120000-9981"

// * status = #active
// * type = EMIncidentTypeCS#trauma "Trauma"

// * patient = Reference(Patient/pat-0712345678)
// * managingOrganization = Reference(Organization/org-nairobi-ems-dispatch)

// * period.start = "2026-06-29T12:00:00+03:00"

// * extension[incidentPriority].valueCodeableConcept = EMPriorityLevelCS#high "High"
// * extension[numberOfPatients].valuePositiveInt = 1

//  