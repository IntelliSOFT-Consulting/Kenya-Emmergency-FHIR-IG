ValueSet: EMBreathingStatusVS
Id: em-breathing-status
Title: "Emergency Breathing Status Value Set"
Description: """
Permitted breathing-status values.
"""
 

* ^status = #active
* ^experimental = false

* include codes from system EMBreathingStatusCS


ValueSet: EMAVPUScaleVS
Id: avpu-scale
Title: "AVPU Scale Value Set"
Description: """
Permitted AVPU responsiveness values.
"""
 

* ^status = #active
* ^experimental = false

* include codes from system EMAVPUScaleCS

ValueSet: EMClinicalAcuityVS
Id: em-clinical-acuity
Title: "Emergency Clinical Acuity Value Set"
 
* ^status = #active
* ^experimental = false

* include codes from system EMClinicalAcuityCS

ValueSet: EMPOCEncounterTypeVS
Id: em-poc-encounter-type
Title: "Emergency Point-of-Care Encounter Type Value Set"
 

* ^status = #active
* ^experimental = false

* include codes from system EMPOCEncounterTypeCS

ValueSet: EMDestinationFacilityTypeVS
Id: em-destination-facility-type
Title: "Emergency Destination Facility Type Value Set"
Description: """
Permitted facility types for an emergency transport destination.
"""
 

* ^status = #active
* ^experimental = false

* include codes from system EMDestinationFacilityTypeCS


ValueSet: EMEmergencyCentreCapabilityVS
Id: em-emergency-centre-capability
Title: "Emergency Centre Capability Value Set"
Description: """
Permitted emergency-care capability classifications for destination
facilities.
"""
 

* ^status = #active
* ^experimental = false

* include codes from system EMEmergencyCentreCapabilityCS

ValueSet: EMFacilityLevelVS
Id: em-facility-level
Title: "Kenya Health Facility Level Value Set"
Description: """
Permitted Kenya health-system facility levels.
"""
 

* ^status = #active
* ^experimental = false

* include codes from system EMFacilityLevelCS

ValueSet: EMSceneLocationTypeVS
Id: em-scene-location-type
Title: "Emergency Scene Location Type Value Set"
Description: """
Permitted classifications for emergency incident scene locations.
"""
 

* ^status = #active
* ^experimental = false

* include codes from system EMSceneLocationTypeCS



ValueSet: EMCrewRoleVS
Id: em-crew-role
Title: "Emergency Responder Crew Role Value Set"
Description: """
Permitted roles for personnel assigned to an emergency responder unit.
"""
 

* ^status = #active
* ^experimental = false

* include codes from system EMCrewRoleCS



ValueSet: EMResponderUnitTypeVS
Id: em-responder-unit-type
Title: "Emergency Responder Unit Type Value Set"
Description: """
Permitted types of vehicles and mobile units participating in an emergency
response.
"""
 

* ^status = #active
* ^experimental = false

* include codes from system EMResponderUnitTypeCS

ValueSet: EMDigitalDispatchPriorityVS
Id: em-dispatch-priority
Title: "Emergency Dispatch Priority Value Set"
Description: """
Permitted dispatch priorities assigned during emergency call intake.
"""
 
* ^status = #active
* ^experimental = false

* include codes from system EMDigitalDispatchPriorityCS


ValueSet: EMIncidentTypeVS
Id: em-incident-type
Title: "Emergency Incident Type Value Set"
Description: """
Permitted high-level classifications of emergency incidents.
"""
 
* ^status = #active
* ^experimental = false

* include codes from system EMIncidentTypeCS


ValueSet: EMCallerRelationshipVS
Id: em-caller-relationship
Title: "Emergency Caller Relationship Value Set"
Description: """
Permitted relationships between an emergency caller and the patient.
"""
 
* ^status = #active
* ^experimental = false

* include codes from system EMCallerRelationshipCS

ValueSet: EMAgencyTypeVS
Id: em-agency-type
Title: "Emergency Supporting Agency Type Value Set"
Description: """
Permitted types of emergency-response organizations participating in an
incident.
"""
 
* ^status = #active
* ^experimental = false

* include codes from system EMAgencyTypeCS


 


ValueSet: EMPriorityLevelVS
Id: em-priority-level-vs
Title: "EM Priority Level ValueSet"
Description: "Value set for the incidentPriority extension. Maps to incident.priority_level."
* ^status = #draft
* include codes from system EMPriorityLevelCS

ValueSet: EMIdentifierTypeVS
Id: em-id-type
Title: "Emergency Patient Identifier Type ValueSet"
Description: "Allowed official identifier types for an emergency patient in Kenya."
//* ^url = "http://hie.go.ke/fhir/ValueSet/em-id-type"
* ^status = #active
* ^experimental = false

* include codes from system EMIdentifierTypeCS

ValueSet: CasePriorityVS
Id: case-priority-vs
Title: "Case Priority"
Description: "ValueSet for prioritizing cases." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $case-priority-cs 


ValueSet: AmbulanceCaseStatusVS
Id: ambulance-case-status-vs
Title: "Ambulance Case Status"
Description: "ValueSet for ambulance case status." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $ambulance-case-status-cs

ValueSet: AmbulanceCaseRejectionReasonVS
Id: ambulance-case-rejection-reason-vs
Title: "Ambulance Case Rejection Reason"
Description: "ValueSet for ambulance case rejection reasons." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $ambulance-case-rejection-reason-cs

ValueSet: PulseStateClassificationVS
Id: pulse-state-classification-vs
Title: "Pulse State Classification"
Description: "ValueSet for pulse state classification." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $pulse-state-classification-cs

ValueSet: BreathingStateClassificationVS
Id: breathing-state-classification-vs
Title: "Breathing State Classification"
Description: "ValueSet for breathing state classification." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $breathing-state-classification-cs

ValueSet: ConditionStatusesVS
Id: condition-statuses-vs
Title: "Condition Statuses"
Description: "ValueSet for condition severity statuses." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $condition-statuses-cs

ValueSet: AllergyReporterVS
Id: allergy-reporter-vs
Title: "Allergy Reporter"
Description: "ValueSet identifying who reported an allergy." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $allergy-reporter-cs

ValueSet: CodingSystemSourceVS
Id: coding-system-source-vs
Title: "Coding System Source"
Description: "ValueSet identifying the source coding system." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $coding-system-source-cs

ValueSet: MedicationAdministrationRouteVS
Id: medication-administration-route-vs
Title: "Medication Administration Route"
Description: "ValueSet for routes of medication administration." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $medication-administration-route


ValueSet: DoseUnitsVS
Id: dose-units-vs
Title: "Dose Units"
Description: "ValueSet for units used in medication dosing." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $dose-units

ValueSet: QuestionnaireCategoryVS
Id: questionnaire-category-vs
Title: "Questionnaire Category"
Description: "ValueSet for classifying types of questionnaires." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $questionnaire-category-cs

ValueSet: EntryTypesVS
Id: entry-types-vs
Title: "Entry Types"
Description: "ValueSet for types of clinical entries in the health record." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $entry-types-cs

ValueSet: AssessmentTypesVS
Id: assessment-types-vs
Title: "Assessment Types"
Description: "ValueSet for types of clinical assessments." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system $assessment-types-cs

ValueSet: InvestigationsVS
Id: investigations-vs
Title: "Investigation Codes ValueSet"
Description: "ValueSet containing investigation codes for procedures." 
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya" 
* include codes from system $investigations-cs

ValueSet: ManifestationVS
Id: emergency-manifestation-vs
Title: "Manifestation or Symptom ValueSet"
Description: "Clinical manifestations and symptoms." 
* ^status = #active
* ^experimental = false
* include codes from system $manifestation-cs  


ValueSet: VitalSignsVS
Id: vital-signs-vs
Title: "Vital Signs ValueSet"
Description: "List of Vital Signs LOINC codes"
* ^status = #active
* ^experimental = false
* include codes from system $vital-signs-cs


// ============================================================================
// EMS Clinical Profile ValueSets
// ============================================================================

ValueSet: EMOwnershipTypeVS
Id: em-ownership-type
Title: "Emergency Responder Unit Ownership Type Value Set"
Description: "Permitted ownership categories for an emergency responder unit."
* ^status = #active
* ^experimental = false
* include codes from system EMOwnershipTypeCS

ValueSet: EMUnitResponseStatusVS
Id: em-unit-response-status
Title: "Emergency Responder Unit Response Status Value Set"
Description: "Permitted real-time response states for an emergency responder unit."
* ^status = #active
* ^experimental = false
* include codes from system EMUnitResponseStatusCS

ValueSet: EMDiagnosisCategoryVS
Id: em-diagnosis-category
Title: "Emergency Diagnosis Staging Category Value Set"
Description: "Permitted diagnostic stages for an emergency Condition instance."
* ^status = #active
* ^experimental = false
* include codes from system EMDiagnosisCategoryCS

ValueSet: EMSecondarySurveyRegionVS
Id: em-secondary-survey-region
Title: "Emergency Secondary Survey Region Value Set"
Description: "Permitted secondary-survey region examination codes."
* ^status = #active
* ^experimental = false
* include codes from system EMSecondarySurveyRegionCS

ValueSet: EMBodyRegionVS
Id: em-body-region
Title: "Emergency Body Region Value Set"
Description: "Permitted body regions examined during an emergency secondary survey."
* ^status = #active
* ^experimental = false
* include codes from system EMBodyRegionCS

ValueSet: EMVitalQualitativeStateVS
Id: em-vital-qualitative-state
Title: "Emergency Vital Sign Qualitative State Value Set"
Description: "Permitted qualitative descriptors for a vital-sign reading."
* ^status = #active
* ^experimental = false
* include codes from system EMVitalQualitativeStateCS

ValueSet: EMAgeGroupVS
Id: em-age-group
Title: "Emergency Age Group Value Set"
Description: "Permitted age-group buckets used to select a reference range."
* ^status = #active
* ^experimental = false
* include codes from system EMAgeGroupCS

ValueSet: ProcedureCodeVS
Id: procedure-code-vs
Title: "Procedure Code Value Set"
Description: "Local procedure code list, supplementing SNOMED CT procedure codes."
* ^status = #active
* ^experimental = false
* include codes from system ProcedureCodeCS

ValueSet: ActiveComponentsVS
Id: active-components-vs
Title: "Active Components Value Set"
Description: "Drug/allergen active-component codes used for allergen and medication coding."
* ^status = #active
* ^experimental = false
* include codes from system ActiveComponentsCS