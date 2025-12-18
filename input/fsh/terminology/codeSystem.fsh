CodeSystem: CasePriorityCS
Id: case-priority
Title: "Case Priority"
Description: "Defines priority levels for cases."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/CASE-PRIORITY"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #CRITICAL "Critical" "Requires immediate attention."
* #HIGH "High" "Requires urgent attention."
* #MEDIUM "Medium" "Requires timely attention."
* #LOW "Low" "Requires routine attention."


CodeSystem: AmbulanceCaseStatusCS
Id: ambulance-case-status
Title: "Ambulance Case Status"
Description: "Defines the lifecycle statuses of an ambulance case."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/AMBULANCE-CASE-STATUS"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #RECEIVED "Received" "The ambulance case has been received."
* #DISPATCHED "Dispatched" "An ambulance has been dispatched."
* #ACCEPTED "Accepted" "The ambulance case has been accepted."
* #REJECTED "Rejected" "The ambulance case has been rejected."
* #LEAVING-SCENE "Leaving Scene" "The ambulance is leaving the scene."
* #IN-TRANSIT "In Transit" "The ambulance is transporting the patient."
* #ARRIVAL "Arrival" "The ambulance has arrived at the destination."
* #ON-HOLD "On Hold" "The ambulance case is temporarily on hold."
* #FACILITY-ARRIVAL "Facility Arrival" "The ambulance has arrived at the healthcare facility."
* #RESOLVED "Resolved" "The ambulance case has been resolved."
* #CLOSED "Closed" "The ambulance case has been closed."

CodeSystem: AmbulanceCaseRejectionReasonCS
Id: ambulance-case-rejection-reason
Title: "Ambulance Case Rejection Reason"
Description: "Defines reasons for rejecting an ambulance case."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/AMBULANCE-CASE-REJECTION-REASON"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #MECHANICAL-ISSUE "Mechanical Issue" "Ambulance is unavailable due to mechanical problems."
* #INSUFFICIENT-MEDICAL-EQUIPMENT "Insufficient Medical Equipment" "Required medical equipment is not available."
* #DEPLETED-MEDICAL-SUPPLIES "Depleted Medical Supplies" "Medical supplies are depleted."
* #HEAVY-TRAFFIC "Heavy Traffic" "Response is delayed or impossible due to traffic congestion."
* #WEATHER-CONDITIONS "Weather Conditions" "Adverse weather prevents safe operation."
* #ENVIRONMENTAL-HAZARDS "Environmental Hazards" "Environmental hazards make response unsafe."
* #SAFETY-CONCERNS "Safety Concerns" "Security or safety risks prevent response."
* #STAFFING-ISSUES "Staffing Issues" "Insufficient or unavailable staff."
* #OTHER "Other" "Other unspecified reason."

CodeSystem: PulseStateClassificationCS
Id: pulse-state-classification
Title: "Pulse State Classification"
Description: "Clinical classification of pulse rate states."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/PULSE-STATE-CLASSIFICATION"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #SEVERE-BRADYCARDIA "Severe Bradycardia" "Critically low pulse rate."
* #BRADYCARDIA "Bradycardia" "Lower than normal pulse rate."
* #NORMAL "Normal" "Pulse rate within the normal range."
* #MILD-TACHYCARDIA "Mild Tachycardia" "Slightly elevated pulse rate."
* #MODERATE-TACHYCARDIA "Moderate Tachycardia" "Moderately elevated pulse rate."
* #SEVERE-TACHYCARDIA "Severe Tachycardia" "Critically elevated pulse rate."


CodeSystem: BreathingStateClassificationCS
Id: breathing-state-classification
Title: "Breathing State Classification"
Description: "Clinical classification of breathing rate states."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/BREATHING-STATE-CLASSIFICATION"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #CRITICAL-BRADYPNEA "Critical Bradypnea" "Critically low respiratory rate."
* #MILD-BRADYPNEA "Mild Bradypnea" "Mildly reduced respiratory rate."
* #NORMAL "Normal" "Respiratory rate within the normal range."
* #MILD-TACHYPNEA "Mild Tachypnea" "Mildly elevated respiratory rate."
* #TACHYPNEA "Tachypnea" "Elevated respiratory rate."

CodeSystem: ConditionStatusesCS
Id: condition-statuses
Title: "Condition Statuses"
Description: "Clinical severity statuses for a patient condition."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/CONDITION-STATUSES"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #MODERATE "Moderate" "Condition is of moderate severity."
* #CRITICAL "Critical" "Condition is life-threatening and requires immediate intervention."

CodeSystem: AllergyReporterCS
Id: allergy-reporter
Title: "Allergy Reporter"
Description: "Identifies the source reporting an allergy."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/ALLERGY-REPORTER"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #PATIENT "Patient" "Allergy information reported directly by the patient."


CodeSystem: CodingSystemSourceCS
Id: coding-system-source
Title: "Coding System Source"
Description: "Identifies the terminology source from which a clinical code originates."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/CODING-SYSTEM-SOURCE"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #OCL-OPEN-CONCEPT-LAB "OCL (Open Concept Lab)" "Code sourced from Open Concept Lab."
* #ICD-11 "ICD-11" "Code sourced from ICD-11."
* #SNOMED-CT "SNOMED CT" "Code sourced from SNOMED CT."

CodeSystem: MedicationAdministrationRouteCS
Id: medication-administration-route
Title: "Medication Administration Route"
Description: "Specifies the route by which a medication is administered."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/MEDICATION-ADMINISTRATION-ROUTE"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #INTRAVENOUS-IV "Intravenous (IV)" "Medication administered directly into a vein."
* #ORAL "Oral" "Medication administered by mouth."
* #INHALED "Inhaled" "Medication administered through inhalation."

CodeSystem: DoseUnitsCS
Id: dose-units
Title: "Dose Units"
Description: "Units used to specify medication doses."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/DOSE-UNITS"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #MILLILITER-ML "Milliliter (mL)" "Dose measured in milliliters."
* #MILLIGRAM-MG "Milligram (mg)" "Dose measured in milligrams."

CodeSystem: QuestionnaireCategoryCS
Id: questionnaire-category
Title: "Questionnaire Category"
Description: "Categories used to classify questionnaires or assessments."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/QUESTIONNAIRE-CATEGORY"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #VITALS "Vitals" "Questionnaire category for vital signs assessment."
* #CLINICAL-NOTES "Clinical Notes" "Category for capturing general clinical notes."
* #GLASGOW-COMA-SCALE-ASSESSMENT "Glasgow Coma Scale Assessment" "Category for GCS evaluations."
* #PHYSICAL-ASSESSMENT "Physical Assessment" "Category for physical examination assessments."

CodeSystem: EntryTypesCS
Id: entry-types
Title: "Entry Types"
Description: "Defines the type of clinical entry recorded in the health record."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/ENTRY-TYPES"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #CONDITION "Condition" "Clinical condition or diagnosis entry."
* #PROCEDURE "Procedure" "Clinical procedure entry."
* #MEDICATION "Medication" "Medication-related entry."
* #INVESTIGATION "Investigation" "Investigation or laboratory test entry."
* #ALLERGY "Allergy" "Allergy or intolerance entry."


CodeSystem: AssessmentTypesCS
Id: assessment-types
Title: "Assessment Types"
Description: "Specifies types of clinical assessments for patient evaluation."
* ^url = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/ASSESSMENT-TYPES"
* ^version = "1.0"
* ^status = #active
* ^publisher = "Ministry of Health Kenya"
* ^content = #complete

* #GLASGOW-COMA-SCALE "Glasgow Coma Scale" "Assessment of level of consciousness using GCS."
* #HEAD "Head" "Assessment of the head region."
* #NECK "Neck" "Assessment of the neck region."
* #CHEST "Chest" "Assessment of the chest region."
* #BACK-AND-SPINE "Back and Spine" "Assessment of the back and spine region."
* #ABDOMEN "Abdomen" "Assessment of the abdominal region."
* #PELVIS "Pelvis" "Assessment of the pelvic region."
* #UPPER-EXTREMITIES "Upper Extremities" "Assessment of the upper limbs."
* #LOWER-EXTREMITIES "Lower Extremities" "Assessment of the lower limbs."