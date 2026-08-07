// ============================================================================
// Emergency Department Patient Record — end-to-end example chain
// ============================================================================
// Exercises EMEDEncounter, EMABCDEAssessmentObservation,
// EMHighRiskSignsObservation, EMReviewOfSystemsObservation,
// EMPhysicalExamObservation, EMPOCUSObservation, EMUrinalysisObservation, and
// EMEDPatientRecordComposition at least once each, tied together into one
// document — reuses Patient/pat-0712345678 and Practitioner/em-practitioner-example
// from support-chain.fsh.
// ============================================================================

Instance: org-knh
InstanceOf: Organization
Usage: #example
Title: "Organization - Kenyatta National Hospital"
Description: "Example facility operating the emergency department."

* active = true
* name = "Kenyatta National Hospital"


Instance: em-ed-nurse-example
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner - Emergency Department Nurse"
Description: "Example nurse responsible for the patient during the ED encounter."

* active = true
* name[0].family = "Wanjiru"
* name[0].given[0] = "Grace"


Instance: em-ed-encounter-example
InstanceOf: EMEDEncounter
Usage: #example
Title: "Encounter - Emergency Department"
Description: "Example ED encounter following handover from the pre-hospital point-of-care Encounter."

* extension[paymentMethod].valueCodeableConcept = EMPaymentMethodCS#govt-insurance "Government insurance"
* extension[arrivalMode].valueCodeableConcept = EMArrivalModeCS#ambulance "Ambulance"
* extension[mobilityStatus].valueCodeableConcept = EMMobilityStatusCS#non-ambulatory "Non-ambulatory"
* extension[presentationType].valueCodeableConcept = EMPresentationTypeCS#acute "Acute"
* extension[referralInfo].valueBoolean = false

* extension[traumaDetails].extension[isTrauma].valueBoolean = true
* extension[traumaDetails].extension[dateOfInjury].valueDateTime = "2026-06-29T11:55:00+03:00"
* extension[traumaDetails].extension[mechanismOfInjury].valueCodeableConcept = EMMechanismOfInjuryCS#road-traffic-crash "Road traffic crash"
* extension[traumaDetails].extension[intent].valueCodeableConcept = EMInjuryIntentCS#unintentional "Unintentional"
* extension[traumaDetails].extension[substanceUsed].valueBoolean = false

* identifier[hospitalRegistrationNumber].value = "KNH-ED-2026-004417"

* status = #finished
* class = $ActCode#EMER "emergency"
* priority = EMClinicalAcuityCS#orange "Orange - Very urgent"

* subject = Reference(Patient/pat-0712345678)
* partOf = Reference(Encounter/em-poc-encounter-example)

* participant[triageStaff].individual = Reference(Practitioner/em-ed-nurse-example)
* participant[provider].individual = Reference(Practitioner/em-practitioner-example)
* participant[nurse].individual = Reference(Practitioner/em-ed-nurse-example)

* period.start = "2026-06-29T12:40:00+03:00"
* period.end = "2026-06-29T14:10:00+03:00"

* reasonReference = Reference(Condition/em-ed-condition-chief-complaint-example)
* diagnosis.condition = Reference(Condition/em-ed-condition-discharge-diagnosis-example)

* serviceProvider = Reference(Organization/org-knh)

* hospitalization.dischargeDisposition = EMDispositionCS#admit-icu "Admit - ICU"

* extension[dispositionDetails].extension[dischargePlanDiscussed].valueBoolean = false


// ----------------------------------------------------------------------------
// Conditions — chief complaint, past medical history, diagnosis
// ----------------------------------------------------------------------------

Instance: em-ed-condition-chief-complaint-example
InstanceOf: EMCondition
Usage: #example
Title: "Condition - ED Chief Complaint"
Description: "Example chief complaint recorded at ED registration."

* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* category = EMDiagnosisCategoryCS#chief-complaint "Chief complaint"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed "Unconfirmed"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* code.text = "Chest pain and shortness of breath following road traffic collision"
* recordedDate = "2026-06-29T12:41:00+03:00"
* asserter = Reference(Patient/pat-0712345678)


Instance: em-ed-condition-past-medical-history-example
InstanceOf: EMCondition
Usage: #example
Title: "Condition - Past Medical History, Hypertension"
Description: "Example pre-existing comorbidity captured from the ED intake checklist."

* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* category = EMDiagnosisCategoryCS#past-medical-history "Past medical/surgical history"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed "Unconfirmed"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* code = $SCT#38341003 "Hypertensive disorder"
* recordedDate = "2026-06-29T12:42:00+03:00"
* asserter = Reference(Patient/pat-0712345678)


Instance: em-ed-condition-discharge-diagnosis-example
InstanceOf: EMCondition
Usage: #example
Title: "Condition - ED Discharge Diagnosis"
Description: "Example confirmed discharge diagnosis recorded at ED disposition."

* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* category = EMDiagnosisCategoryCS#discharge-diagnosis "Discharge diagnosis"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* code.text = "Blunt chest trauma with suspected pneumothorax"
* severity = $SCT#24484000 "Severe"
* recordedDate = "2026-06-29T14:05:00+03:00"
* recorder = Reference(Practitioner/em-practitioner-example)


// ----------------------------------------------------------------------------
// Vital signs at arrival and final reassessment
// ----------------------------------------------------------------------------

Instance: em-ed-vitals-arrival-hr-example
InstanceOf: EMVitalSignsObservation
Usage: #example
Title: "Observation - ED Arrival Heart Rate"
Description: "Example heart rate recorded at ED arrival."

* status = #final
* code = $vital-signs-cs#8867-4 "Heart rate"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* performer = Reference(Practitioner/em-ed-nurse-example)
* effectiveDateTime = "2026-06-29T12:41:00+03:00"
* valueQuantity.value = 118
* valueQuantity.unit = "beats/minute"
* valueQuantity.system = $UCUM
* valueQuantity.code = #/min


Instance: em-ed-vitals-final-hr-example
InstanceOf: EMVitalSignsObservation
Usage: #example
Title: "Observation - ED Final Reassessment Heart Rate"
Description: "Example heart rate recorded at final reassessment prior to disposition."

* status = #final
* code = $vital-signs-cs#8867-4 "Heart rate"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* performer = Reference(Practitioner/em-ed-nurse-example)
* effectiveDateTime = "2026-06-29T14:00:00+03:00"
* valueQuantity.value = 92
* valueQuantity.unit = "beats/minute"
* valueQuantity.system = $UCUM
* valueQuantity.code = #/min


// ----------------------------------------------------------------------------
// High-risk signs
// ----------------------------------------------------------------------------

Instance: em-ed-high-risk-signs-example
InstanceOf: EMHighRiskSignsObservation
Usage: #example
Title: "Observation - High-Risk Signs at Triage"
Description: "Example high-risk-signs checklist showing poor perfusion present."

* status = #final
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T12:41:00+03:00"
* performer = Reference(Practitioner/em-ed-nurse-example)

* valueBoolean = true

* component[abnormalHeartRate].valueBoolean = false
* component[abnormalRespiratoryRate].valueBoolean = false
* component[lowSpo2].valueBoolean = false
* component[notAlert].valueBoolean = false
* component[stridorOrSwallowDifficulty].valueBoolean = false
* component[respiratoryDistress].valueBoolean = false
* component[poorPerfusion].valueBoolean = true
* component[cannotEatOrDrink].valueBoolean = false


// ----------------------------------------------------------------------------
// ABCDE assessment
// ----------------------------------------------------------------------------

Instance: em-ed-abcde-breathing-example
InstanceOf: EMABCDEAssessmentObservation
Usage: #example
Title: "Observation - ABCDE Breathing Assessment"
Description: "Example breathing assessment showing reduced right-sided breath sounds, consistent with the suspected pneumothorax."

* extension[noFindingsOnExam].valueBoolean = false

* status = #final
* code = EMABCDEComponentCS#breathing "Breathing"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T12:45:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)

* valueCodeableConcept.text = "Reduced air entry, right hemithorax"

* component[chestRisePattern].valueCodeableConcept.text = "Shallow"
* component[breathSoundsLeft].valueString = "Normal vesicular breath sounds"
* component[breathSoundsRight].valueString = "Markedly reduced"


Instance: em-ed-abcde-circulation-example
InstanceOf: EMABCDEAssessmentObservation
Usage: #example
Title: "Observation - ABCDE Circulation Assessment"
Description: "Example circulation assessment during initial resuscitation."

* extension[noFindingsOnExam].valueBoolean = false

* status = #final
* code = EMABCDEComponentCS#circulation "Circulation"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T12:46:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)

* valueCodeableConcept.text = "Delayed capillary refill, cool peripheries"

* component[capillaryRefillSeconds].valueQuantity.value = 4
* component[capillaryRefillSeconds].valueQuantity.unit = "seconds"
* component[capillaryRefillSeconds].valueQuantity.system = $UCUM
* component[capillaryRefillSeconds].valueQuantity.code = #s

* component[skinFindings].valueCodeableConcept.text = "Cool, pale"
* component[jvd].valueBoolean = false
* component[pulses].valueCodeableConcept = EMVitalQualitativeStateCS#weak "Weak"

* component[fluidsGivenVolume].valueQuantity.value = 500
* component[fluidsGivenVolume].valueQuantity.unit = "mL"
* component[fluidsGivenVolume].valueQuantity.system = $UCUM
* component[fluidsGivenVolume].valueQuantity.code = #mL
* component[fluidsType].valueCodeableConcept.text = "Normal saline"

* component[bloodOrdered].valueBoolean = true
* component[ecgDone].valueBoolean = true


// ----------------------------------------------------------------------------
// Review of Systems
// ----------------------------------------------------------------------------

Instance: em-ed-ros-respiratory-example
InstanceOf: EMReviewOfSystemsObservation
Usage: #example
Title: "Observation - Review of Systems, Respiratory"
Description: "Example respiratory review of systems with a positive finding."

* extension[noFindingsOnExam].valueBoolean = false

* status = #final
* code = EMReviewOfSystemsBodySystemCS#respiratory "Respiratory"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T12:50:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)
* valueCodeableConcept.text = "Shortness of breath, right-sided chest pain on inspiration"


Instance: em-ed-ros-gi-example
InstanceOf: EMReviewOfSystemsObservation
Usage: #example
Title: "Observation - Review of Systems, GI (No Findings)"
Description: "Example GI review of systems with no findings, explicitly recorded."

* extension[noFindingsOnExam].valueBoolean = true

* status = #final
* code = EMReviewOfSystemsBodySystemCS#gi "Gastrointestinal"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T12:50:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)


// ----------------------------------------------------------------------------
// Physical Exam
// ----------------------------------------------------------------------------

Instance: em-ed-physical-exam-respiratory-example
InstanceOf: EMPhysicalExamObservation
Usage: #example
Title: "Observation - Physical Exam, Respiratory"
Description: "Example respiratory exam finding correlating with the suspected pneumothorax."

* extension[noFindingsOnExam].valueBoolean = false

* status = #final
* code = EMExamSystemCS#respiratory "Respiratory"
* bodySite = EMExamSystemCS#respiratory "Respiratory"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T12:52:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)
* valueCodeableConcept.text = "Reduced breath sounds and hyper-resonance, right hemithorax"


Instance: em-ed-physical-exam-general-example
InstanceOf: EMPhysicalExamObservation
Usage: #example
Title: "Observation - Physical Exam, General (No Findings)"
Description: "Example general exam with no findings, explicitly recorded."

* extension[noFindingsOnExam].valueBoolean = true

* status = #final
* code = EMExamSystemCS#general "General"
* bodySite = EMExamSystemCS#general "General"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T12:52:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)


// ----------------------------------------------------------------------------
// Diagnostics: EMDiagnosticReport, EMPOCUSObservation, EMUrinalysisObservation
// ----------------------------------------------------------------------------

Instance: em-ed-diagnostic-report-cbc-example
InstanceOf: EMDiagnosticReport
Usage: #example
Title: "DiagnosticReport - Complete Blood Count"
Description: "Example CBC investigation result ordered during the ED assessment."

* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#HM "Hematology"
* code.text = "Complete blood count"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T13:05:00+03:00"
* performer = Reference(Organization/org-knh)
* conclusion = "Hemoglobin 9.8 g/dL, consistent with acute blood loss"


Instance: em-ed-pocus-chest-example
InstanceOf: EMPOCUSObservation
Usage: #example
Title: "Observation - POCUS Chest View"
Description: "Example POCUS chest view confirming a right pneumothorax."

* status = #final
* code = EMPOCUSViewCS#chest "Chest"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T12:55:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)

* valueCodeableConcept = EMPOCUSFindingCS#right-pneumothorax "Right pneumothorax"

* component[chestFinding].valueCodeableConcept = EMPOCUSFindingCS#right-pneumothorax "Right pneumothorax"


Instance: em-ed-urinalysis-example
InstanceOf: EMUrinalysisObservation
Usage: #example
Title: "Observation - Urinalysis Dipstick"
Description: "Example urinalysis dipstick panel."

* status = #final
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T13:10:00+03:00"
* performer = Reference(Practitioner/em-ed-nurse-example)

* component[glucose].valueCodeableConcept = EMUrinalysisResultCS#negative "Negative"
* component[ketones].valueCodeableConcept = EMUrinalysisResultCS#negative "Negative"
* component[blood].valueCodeableConcept = EMUrinalysisResultCS#plus-1 "1+"
* component[nitrite].valueCodeableConcept = EMUrinalysisResultCS#negative "Negative"
* component[leukocytes].valueCodeableConcept = EMUrinalysisResultCS#negative "Negative"
* component[protein].valueCodeableConcept = EMUrinalysisResultCS#negative "Negative"


// ----------------------------------------------------------------------------
// Procedures and medications
// ----------------------------------------------------------------------------

Instance: em-ed-procedure-chest-tube-example
InstanceOf: EMProcedure
Usage: #example
Title: "Procedure - Chest Tube Insertion"
Description: "Example chest tube insertion for the confirmed right pneumothorax."

* status = #completed
* code.text = "Chest tube insertion"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* performedDateTime = "2026-06-29T13:00:00+03:00"
* outcome.text = "Successful placement, immediate improvement in air entry"
* performer[0].actor = Reference(Practitioner/em-practitioner-example)
* note[0].text = "Right side, size 28F, secured at 10cm at the skin"


Instance: em-ed-medication-analgesia-example
InstanceOf: EMMedicationAdministration
Usage: #example
Title: "MedicationAdministration - Analgesia"
Description: "Example analgesia given after chest tube insertion."

* status = #completed
* medicationCodeableConcept.text = "Morphine 5mg IV"
* subject = Reference(Patient/pat-0712345678)
* context = Reference(Encounter/em-ed-encounter-example)
* effectiveDateTime = "2026-06-29T13:05:00+03:00"
* reasonReference[0] = Reference(Condition/em-ed-condition-discharge-diagnosis-example)
* performer[0].actor = Reference(Practitioner/em-practitioner-example)
* dosage.route = MedAdminRouteCS#INTRAVENOUS-IV "Intravenous"
* dosage.dose.value = 5
* dosage.dose.unit = "Milligram (mg)"
* dosage.dose.system = $dose-units
* dosage.dose.code = #MILLIGRAM-MG


// ----------------------------------------------------------------------------
// The composed document
// ----------------------------------------------------------------------------

Instance: em-ed-patient-record-composition-example
InstanceOf: EMEDPatientRecordComposition
Usage: #example
Title: "Composition - Emergency Department Patient Record"
Description: "Example composed ED chart tying together the resources above."

* status = #final
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-ed-encounter-example)
* date = "2026-06-29T14:10:00+03:00"
* author[0] = Reference(Practitioner/em-practitioner-example)
* author[1] = Reference(Practitioner/em-ed-nurse-example)
* title = "Emergency Department Patient Record - Amina Atieno - 2026-06-29"

* section[registrationArrival].entry = Reference(Encounter/em-ed-encounter-example)

* section[triageVitals].entry[0] = Reference(Observation/em-ed-vitals-arrival-hr-example)
* section[triageVitals].entry[1] = Reference(Observation/em-ed-high-risk-signs-example)

* section[chiefComplaintReferral].entry[0] = Reference(Condition/em-ed-condition-chief-complaint-example)

* section[allergies].entry[0] = Reference(AllergyIntolerance/em-allergy-example-valid)

* section[pastMedicalHistory].entry[0] = Reference(Condition/em-ed-condition-past-medical-history-example)

* section[providerAssessmentAbcde].entry[0] = Reference(Observation/em-ed-abcde-breathing-example)
* section[providerAssessmentAbcde].entry[1] = Reference(Observation/em-ed-abcde-circulation-example)
* section[providerAssessmentAbcde].entry[2] = Reference(Procedure/em-ed-procedure-chest-tube-example)
* section[providerAssessmentAbcde].entry[3] = Reference(MedicationAdministration/em-ed-medication-analgesia-example)

* section[historyOfPresentIllness].text.status = #generated
* section[historyOfPresentIllness].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient reports sudden onset right-sided chest pain and shortness of breath following a road traffic collision approximately 45 minutes prior to arrival.</div>"

* section[trauma].text.status = #generated
* section[trauma].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Road traffic crash, unintentional. See the traumaDetails extension on the referenced EMEDEncounter for coded mechanism/intent.</div>"

* section[reviewOfSystems].entry[0] = Reference(Observation/em-ed-ros-respiratory-example)
* section[reviewOfSystems].entry[1] = Reference(Observation/em-ed-ros-gi-example)

* section[physicalExam].entry[0] = Reference(Observation/em-ed-physical-exam-respiratory-example)
* section[physicalExam].entry[1] = Reference(Observation/em-ed-physical-exam-general-example)

* section[diagnosticTests].entry[0] = Reference(DiagnosticReport/em-ed-diagnostic-report-cbc-example)
* section[diagnosticTests].entry[1] = Reference(Observation/em-ed-pocus-chest-example)
* section[diagnosticTests].entry[2] = Reference(Observation/em-ed-urinalysis-example)

* section[procedures].entry[0] = Reference(Procedure/em-ed-procedure-chest-tube-example)

* section[medications].entry[0] = Reference(MedicationAdministration/em-ed-medication-analgesia-example)

* section[diagnosisImpression].entry[0] = Reference(Condition/em-ed-condition-discharge-diagnosis-example)

* section[managementPlan].text.status = #generated
* section[managementPlan].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Chest tube inserted for right pneumothorax; admit to ICU for observation; repeat chest X-ray in 4 hours.</div>"

* section[finalReassessment].entry[0] = Reference(Observation/em-ed-vitals-final-hr-example)
* section[finalReassessment].text.status = #generated
* section[finalReassessment].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Improved perfusion and reduced work of breathing following chest tube insertion.</div>"

* section[disposition].entry = Reference(Encounter/em-ed-encounter-example)
* section[disposition].text.status = #generated
* section[disposition].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Admitted to ICU for further management of traumatic pneumothorax.</div>"
