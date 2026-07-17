ValueSet: EMIdentifierTypeVS
Id: em-id-type
Title: "Emergency Patient Identifier Type ValueSet"
Description: "Allowed official identifier types for an emergency patient in Kenya."
* ^url = "http://hie.go.ke/fhir/ValueSet/em-id-type"
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