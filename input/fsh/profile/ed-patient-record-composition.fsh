Profile: EMEDPatientRecordComposition
Parent: Composition
Id: em-ed-patient-record-composition
Title: "Composition - Emergency Department Patient Record"
Description: """
Represents the complete emergency department patient chart as a single
document, mirroring the WHO-adapted Emergency Department Patient Record
paper form: a fixed section list, each referencing the relevant clinical
resource instances captured during the encounter.

History of Present Illness, Trauma narrative, Management Plan, Final
Reassessment comment, Additional Notes, and Nursing Progress Notes are
captured as section narrative text (section.text) rather than as separate
resource types — these are free-text-only fields on the source form with no
checkbox/coded structure to model.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status ^short = "Composition workflow status"

* type 1..1 MS
* type = $LOINC#34111-5 "Emergency department Note"
* type ^short = "Fixed to the LOINC Emergency department Note document type"

* subject 1..1 MS
* subject only Reference(EMPatient)
* subject ^short = "Patient the chart belongs to"

* encounter 1..1 MS
* encounter only Reference(EMEDEncounter)
* encounter ^short = "The emergency department encounter this chart documents"

* date 1..1 MS
* date ^short = "When this document was composed or last updated"

* author 1..* MS
* author only Reference(Practitioner or PractitionerRole)
* author ^short = "Provider(s) and nurse(s) who authored the chart"

* title 1..1 MS
* title ^short = "Human-readable document title"


// --------------------------------------------------------------------------
// Sections
// --------------------------------------------------------------------------

* section 1..* MS

* section ^slicing.discriminator[0].type = #pattern
* section ^slicing.discriminator[0].path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false

* section contains
    registrationArrival 1..1 MS and
    triageVitals 1..1 MS and
    chiefComplaintReferral 1..1 MS and
    allergies 1..1 MS and
    pastMedicalHistory 0..1 MS and
    providerAssessmentAbcde 1..1 MS and
    historyOfPresentIllness 0..1 MS and
    trauma 0..1 MS and
    reviewOfSystems 0..1 MS and
    physicalExam 1..1 MS and
    diagnosticTests 0..1 MS and
    procedures 0..1 MS and
    medications 0..1 MS and
    diagnosisImpression 1..1 MS and
    managementPlan 0..1 MS and
    finalReassessment 0..1 MS and
    disposition 1..1 MS and
    additionalNotes 0..1 MS and
    nursingProgressNotes 0..1 MS

* section[registrationArrival].code = EMEDSectionCS#registration-arrival
* section[registrationArrival].entry 1..1 MS
* section[registrationArrival].entry only Reference(EMEDEncounter)

* section[triageVitals].code = EMEDSectionCS#triage-vitals
* section[triageVitals].entry 0..* MS
* section[triageVitals].entry only Reference(EMVitalSignsObservation or EMHighRiskSignsObservation)

* section[chiefComplaintReferral].code = EMEDSectionCS#chief-complaint-referral
* section[chiefComplaintReferral].text 0..1 MS
* section[chiefComplaintReferral].entry 1..* MS
* section[chiefComplaintReferral].entry only Reference(EMCondition)

* section[allergies].code = EMEDSectionCS#allergies
* section[allergies].entry 1..* MS
* section[allergies].entry only Reference(EMAllergyIntolerance)

* section[pastMedicalHistory].code = EMEDSectionCS#past-medical-history
* section[pastMedicalHistory].entry 0..* MS
* section[pastMedicalHistory].entry only Reference(EMCondition)

* section[providerAssessmentAbcde].code = EMEDSectionCS#provider-assessment-abcde
* section[providerAssessmentAbcde].entry 0..* MS
* section[providerAssessmentAbcde].entry only Reference(EMABCDEAssessmentObservation or EMProcedure or EMMedicationAdministration or EMVitalSignsObservation)

* section[historyOfPresentIllness].code = EMEDSectionCS#history-of-present-illness
* section[historyOfPresentIllness].text 1..1 MS
* section[historyOfPresentIllness].entry 0..0
* section[historyOfPresentIllness] ^short = "Free-text narrative only, no coded entries"

* section[trauma].code = EMEDSectionCS#trauma
* section[trauma].text 0..1 MS
* section[trauma].entry 0..0
* section[trauma] ^short = """
Free-text narrative only — structured trauma fields (mechanism, intent,
substance use) live on the EMTraumaDetails extension on the referenced
EMEDEncounter, not as a section entry
"""

* section[reviewOfSystems].code = EMEDSectionCS#review-of-systems
* section[reviewOfSystems].entry 0..* MS
* section[reviewOfSystems].entry only Reference(EMReviewOfSystemsObservation)

* section[physicalExam].code = EMEDSectionCS#physical-exam
* section[physicalExam].entry 1..* MS
* section[physicalExam].entry only Reference(EMPhysicalExamObservation)

* section[diagnosticTests].code = EMEDSectionCS#diagnostic-tests
* section[diagnosticTests].entry 0..* MS
* section[diagnosticTests].entry only Reference(EMDiagnosticReport or EMPOCUSObservation or EMUrinalysisObservation)

* section[procedures].code = EMEDSectionCS#procedures
* section[procedures].entry 0..* MS
* section[procedures].entry only Reference(EMProcedure)

* section[medications].code = EMEDSectionCS#medications
* section[medications].entry 0..* MS
* section[medications].entry only Reference(EMMedicationAdministration)

* section[diagnosisImpression].code = EMEDSectionCS#diagnosis-impression
* section[diagnosisImpression].text 0..1 MS
* section[diagnosisImpression].entry 1..* MS
* section[diagnosisImpression].entry only Reference(EMCondition)

* section[managementPlan].code = EMEDSectionCS#management-plan
* section[managementPlan].text 1..1 MS
* section[managementPlan].entry 0..0
* section[managementPlan] ^short = "Free-text narrative only, no coded entries"

* section[finalReassessment].code = EMEDSectionCS#final-reassessment
* section[finalReassessment].text 0..1 MS
* section[finalReassessment].entry 0..* MS
* section[finalReassessment].entry only Reference(EMVitalSignsObservation)

* section[disposition].code = EMEDSectionCS#disposition
* section[disposition].text 0..1 MS
* section[disposition].entry 0..1 MS
* section[disposition].entry only Reference(EMEDEncounter)
* section[disposition] ^short = """
Disposition detail lives on the referenced EMEDEncounter
(hospitalization.dischargeDisposition and the EMDispositionDetails
extension); this section links back to it and may add narrative comment
"""

* section[additionalNotes].code = EMEDSectionCS#additional-notes
* section[additionalNotes].text 1..1 MS
* section[additionalNotes].entry 0..0
* section[additionalNotes] ^short = "Free-text narrative only, no coded entries"

* section[nursingProgressNotes].code = EMEDSectionCS#nursing-progress-notes
* section[nursingProgressNotes].text 1..1 MS
* section[nursingProgressNotes].entry 0..0
* section[nursingProgressNotes] ^short = "Free-text narrative only, no coded entries"
