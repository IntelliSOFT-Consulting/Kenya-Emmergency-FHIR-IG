ValueSet: CasePriorityVS
Id: case-priority-vs
Title: "Case Priority"
Description: "ValueSet for prioritizing cases."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system CasePriorityCS


ValueSet: AmbulanceCaseStatusVS
Id: ambulance-case-status-vs
Title: "Ambulance Case Status"
Description: "ValueSet for ambulance case status."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system AmbulanceCaseStatusCS

ValueSet: AmbulanceCaseRejectionReasonVS
Id: ambulance-case-rejection-reason-vs
Title: "Ambulance Case Rejection Reason"
Description: "ValueSet for ambulance case rejection reasons."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system AmbulanceCaseRejectionReasonCS

ValueSet: PulseStateClassificationVS
Id: pulse-state-classification-vs
Title: "Pulse State Classification"
Description: "ValueSet for pulse state classification."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system PulseStateClassificationCS

ValueSet: BreathingStateClassificationVS
Id: breathing-state-classification-vs
Title: "Breathing State Classification"
Description: "ValueSet for breathing state classification."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system BreathingStateClassificationCS

ValueSet: ConditionStatusesVS
Id: condition-statuses-vs
Title: "Condition Statuses"
Description: "ValueSet for condition severity statuses."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system ConditionStatusesCS

ValueSet: AllergyReporterVS
Id: allergy-reporter-vs
Title: "Allergy Reporter"
Description: "ValueSet identifying who reported an allergy."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system AllergyReporterCS

ValueSet: CodingSystemSourceVS
Id: coding-system-source-vs
Title: "Coding System Source"
Description: "ValueSet identifying the source coding system."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system CodingSystemSourceCS

ValueSet: MedicationAdministrationRouteVS
Id: medication-administration-route-vs
Title: "Medication Administration Route"
Description: "ValueSet for routes of medication administration."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system MedicationAdministrationRouteCS


ValueSet: DoseUnitsVS
Id: dose-units-vs
Title: "Dose Units"
Description: "ValueSet for units used in medication dosing."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system DoseUnitsCS

ValueSet: QuestionnaireCategoryVS
Id: questionnaire-category-vs
Title: "Questionnaire Category"
Description: "ValueSet for classifying types of questionnaires."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system QuestionnaireCategoryCS

ValueSet: EntryTypesVS
Id: entry-types-vs
Title: "Entry Types"
Description: "ValueSet for types of clinical entries in the health record."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system EntryTypesCS

ValueSet: AssessmentTypesVS
Id: assessment-types-vs
Title: "Assessment Types"
Description: "ValueSet for types of clinical assessments."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

* include codes from system AssessmentTypesCS

ValueSet: InvestigationsVS
Id: investigations-vs
Title: "Investigation Codes ValueSet"
Description: "ValueSet containing investigation codes for procedures."
* insert ShareableValueSetMetadata
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"

// Include all codes from the CodeSystem
* include codes from system InvestigationsCS
