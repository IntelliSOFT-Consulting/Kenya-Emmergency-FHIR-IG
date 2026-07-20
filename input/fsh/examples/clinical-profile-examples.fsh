// ============================================================================
// EMProcedure
// ============================================================================

Instance: em-procedure-example-valid
InstanceOf: EMProcedure
Usage: #example
Title: "Procedure - Endotracheal Intubation"
Description: "Example emergency airway procedure performed during transport."

* status = #completed
* code = ProcedureCodeCS#INTUBATION "Intubation"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* performedDateTime = "2026-06-29T12:18:00+03:00"
* outcome.text = "Successful first-pass intubation"
* performer[0].actor = Reference(Practitioner/em-practitioner-example)
* note[0].text = "Airway secured prior to transport"


Instance: em-procedure-example-invalid
InstanceOf: Procedure
Usage: #example
Title: "Procedure - Invalid Example"
Description: "Invalid procedure example demonstrating a missing required code, the specific procedure performed."

* meta.profile[0] = Canonical(EMProcedure)

* status = #completed
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* performedDateTime = "2026-06-29T12:18:00+03:00"


// ============================================================================
// EMDiagnosticReport
// ============================================================================

Instance: em-diagnostic-report-example-valid
InstanceOf: EMDiagnosticReport
Usage: #example
Title: "DiagnosticReport - 12-Lead ECG Showing STEMI"
Description: "Example ECG investigation result flagging an anterior STEMI."

* status = #final
* category = http://terminology.hl7.org/CodeSystem/v2-0074#EC "Electrocardiac (e.g., EKG,  EEC, Holter)"
* code = $investigations-cs#LOINC-11524-6 "12-Lead EKG panel"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* effectiveDateTime = "2026-06-29T12:20:00+03:00"
* performer[0] = Reference(Practitioner/em-practitioner-example)
* conclusion = "ST elevation in leads V1-V4; consistent with anterior STEMI"


Instance: em-diagnostic-report-example-invalid
InstanceOf: DiagnosticReport
Usage: #example
Title: "DiagnosticReport - Invalid Example"
Description: "Invalid diagnostic report example demonstrating a missing required category, tightened to 1..1 on this profile though optional in base DiagnosticReport."

* meta.profile[0] = Canonical(EMDiagnosticReport)

* status = #final
* code = $investigations-cs#LOINC-11524-6 "12-Lead EKG panel"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* effectiveDateTime = "2026-06-29T12:20:00+03:00"


// ============================================================================
// EMAllergyIntolerance / EMNoKnownAllergy / EMAllergyCriticalityFlag
// ============================================================================

Instance: em-allergy-example-valid
InstanceOf: EMAllergyIntolerance
Usage: #example
Title: "AllergyIntolerance - Domiphen Allergy"
Description: "Example confirmed severe allergy resulting in anaphylaxis."

* clinicalStatus = $allergyintolerance-clinical#active "Active"
* verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
* category = #medication
* criticality = #high
* code = ActiveComponentsCS#AC10008 "Domiphen"
* patient = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* recordedDate = "2026-06-29T12:10:00+03:00"
* recorder = Reference(Practitioner/em-practitioner-example)
* asserter = Reference(Patient/pat-0712345678)
* reaction[0].manifestation[0] = ManifestationCS#ANAPHYLAXIS "Anaphylaxis"
* reaction[0].severity = #severe


Instance: em-allergy-example-invalid
InstanceOf: AllergyIntolerance
Usage: #example
Title: "AllergyIntolerance - Invalid Example"
Description: "Invalid allergy example demonstrating a missing required criticality."

* meta.profile[0] = Canonical(EMAllergyIntolerance)

* clinicalStatus = $allergyintolerance-clinical#active "Active"
* verificationStatus = $allergyintolerance-verification#unconfirmed "Unconfirmed"
* code = ActiveComponentsCS#AC10008 "Domiphen"
* patient = Reference(Patient/pat-0712345678)


Instance: em-no-known-allergy-example-valid
InstanceOf: EMNoKnownAllergy
Usage: #example
Title: "AllergyIntolerance - No Known Allergy"
Description: "Example explicit no-known-allergy assertion recorded after a full allergy history was taken."

* verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
* criticality = #unable-to-assess
* patient = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* recordedDate = "2026-06-29T12:11:00+03:00"
* recorder = Reference(Practitioner/em-practitioner-example)


Instance: em-allergy-criticality-flag-example-valid
InstanceOf: EMAllergyCriticalityFlag
Usage: #example
Title: "Flag - High-Criticality Allergy Alert"
Description: "Example must-see alert referencing the high-criticality Domiphen allergy above."

* status = #active
* category.text = "Safety"
* code.text = "High-criticality allergy: Domiphen (anaphylaxis)"
* subject = Reference(Patient/pat-0712345678)


// ============================================================================
// EMCondition — diagnosis staging
// ============================================================================

Instance: em-condition-chief-complaint-example
InstanceOf: EMCondition
Usage: #example
Title: "Condition - Chief Complaint"
Description: "Example chief-complaint Condition captured from caller-reported information at T0."

* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-incident-encounter-example)
* category = EMDiagnosisCategoryCS#chief-complaint "Chief complaint"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed "Unconfirmed"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* code = ManifestationCS#CHEST-PAIN "Chest pain"
* recordedDate = "2026-06-29T12:00:00+03:00"
* asserter = Reference(Patient/pat-0712345678)


Instance: em-condition-working-diagnosis-example
InstanceOf: EMCondition
Usage: #example
Title: "Condition - Working Diagnosis"
Description: "Example working-diagnosis Condition recorded after on-scene assessment."

* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* category = EMDiagnosisCategoryCS#working-diagnosis "Working diagnosis"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional "Provisional"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* code.text = "Suspected anterior STEMI"
* severity = http://snomed.info/sct#24484000 "Severe"
* recordedDate = "2026-06-29T12:20:00+03:00"
* recorder = Reference(Practitioner/em-practitioner-example)


Instance: em-condition-discharge-diagnosis-example
InstanceOf: EMCondition
Usage: #example
Title: "Condition - Discharge Diagnosis"
Description: "Example confirmed discharge-diagnosis Condition recorded at facility handover."

* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* category = EMDiagnosisCategoryCS#discharge-diagnosis "Discharge diagnosis"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* code.text = "Anterior ST-elevation myocardial infarction"
* severity = http://snomed.info/sct#24484000 "Severe"
* recordedDate = "2026-06-29T12:38:00+03:00"
* recorder = Reference(Practitioner/em-practitioner-example)


Instance: em-condition-discharge-diagnosis-example-invalid
InstanceOf: EMCondition
Usage: #example
Title: "Condition - Invalid Example"
Description: "Invalid discharge-diagnosis example demonstrating verificationStatus left as 'provisional' instead of 'confirmed', violating invariant em-condition-1."

* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* category = EMDiagnosisCategoryCS#discharge-diagnosis "Discharge diagnosis"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional "Provisional"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* code.text = "Anterior ST-elevation myocardial infarction"
* recordedDate = "2026-06-29T12:38:00+03:00"


// ============================================================================
// EMSecondarySurveyObservation
// ============================================================================

Instance: em-exam-head-example
InstanceOf: EMSecondarySurveyObservation
Usage: #example
Title: "Observation - Secondary Survey, Head (No Findings)"
Description: "Example head examination with no abnormal findings, explicitly recorded."

* extension[noFindingsOnExam].valueBoolean = true

* status = #final
* code = EMSecondarySurveyRegionCS#secondary-survey-head "Secondary survey - head"
* bodySite = EMBodyRegionCS#head "Head"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* effectiveDateTime = "2026-06-29T12:22:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)


Instance: em-exam-upper-extremities-example
InstanceOf: EMSecondarySurveyObservation
Usage: #example
Title: "Observation - Secondary Survey, Upper Extremities (Finding Present)"
Description: "Example upper-extremities examination with a coded abnormal finding."

* extension[noFindingsOnExam].valueBoolean = false

* status = #final
* code = EMSecondarySurveyRegionCS#secondary-survey-upper-extremities "Secondary survey - upper extremities"
* bodySite = EMBodyRegionCS#upper-extremities "Upper extremities"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* effectiveDateTime = "2026-06-29T12:23:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)
* valueCodeableConcept.text = "Deformity and swelling, right forearm"


Instance: em-exam-example-invalid
InstanceOf: EMSecondarySurveyObservation
Usage: #example
Title: "Observation - Secondary Survey Invalid Example"
Description: "Invalid exam example: a finding is coded but noFindingsOnExam is left true, violating invariant em-exam-1."

* extension[noFindingsOnExam].valueBoolean = true

* status = #final
* code = EMSecondarySurveyRegionCS#secondary-survey-abdomen "Secondary survey - abdomen"
* bodySite = EMBodyRegionCS#abdomen "Abdomen"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* effectiveDateTime = "2026-06-29T12:24:00+03:00"
* valueCodeableConcept.text = "Tenderness, right upper quadrant"


// ============================================================================
// EMVitalSignsObservation / EMTriageAcuityObservation
// ============================================================================

Instance: em-vitals-hr-example
InstanceOf: EMVitalSignsObservation
Usage: #example
Title: "Observation - Heart Rate"
Description: "Example heart-rate vital sign showing a critical qualitative pulse state."

* extension[qualitativeState].valueCodeableConcept = EMVitalQualitativeStateCS#weak "Weak"
* extension[clinicalGuidanceMessage].valueString = "Weak, rapid pulse. Reassess perfusion and prepare for shock management."
* extension[ageGroup].valueCodeableConcept = EMAgeGroupCS#adult "Adult"

* status = #final
* code = $vital-signs-cs#8867-4 "Heart rate"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* performer = Reference(Practitioner/em-practitioner-example)
* effectiveDateTime = "2026-06-29T12:15:00+03:00"
* valueQuantity.value = 128
* valueQuantity.unit = "beats/minute"
* valueQuantity.system = $UCUM
* valueQuantity.code = #/min
* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H "High"


Instance: em-vitals-bp-example
InstanceOf: EMVitalSignsObservation
Usage: #example
Title: "Observation - Blood Pressure Panel"
Description: "Example blood-pressure panel with systolic and diastolic components."

* status = #final
* code = $vital-signs-cs#85354-9 "Blood pressure panel"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* performer = Reference(Practitioner/em-practitioner-example)
* effectiveDateTime = "2026-06-29T12:15:00+03:00"

* component[systolicBP].valueQuantity.value = 88
* component[systolicBP].valueQuantity.unit = "mmHg"
* component[systolicBP].valueQuantity.system = $UCUM
* component[systolicBP].valueQuantity.code = #mm[Hg]

* component[diastolicBP].valueQuantity.value = 54
* component[diastolicBP].valueQuantity.unit = "mmHg"
* component[diastolicBP].valueQuantity.system = $UCUM
* component[diastolicBP].valueQuantity.code = #mm[Hg]

* interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#L "Low"


Instance: em-vitals-gcs-example
InstanceOf: EMVitalSignsObservation
Usage: #example
Title: "Observation - Glasgow Coma Scale"
Description: "Example GCS total with eye/verbal/motor sub-scores captured separately."

* status = #final
* code = $vital-signs-cs#9269-2 "Glasgow coma score"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* performer = Reference(Practitioner/em-practitioner-example)
* effectiveDateTime = "2026-06-29T12:16:00+03:00"

* valueQuantity.value = 13
* valueQuantity.unit = "score"
* valueQuantity.system = $UCUM
* valueQuantity.code = #{score}

* component[gcsEye].valueQuantity.value = 3
* component[gcsEye].valueQuantity.unit = "score"
* component[gcsEye].valueQuantity.system = $UCUM
* component[gcsEye].valueQuantity.code = #{score}

* component[gcsVerbal].valueQuantity.value = 4
* component[gcsVerbal].valueQuantity.unit = "score"
* component[gcsVerbal].valueQuantity.system = $UCUM
* component[gcsVerbal].valueQuantity.code = #{score}

* component[gcsMotor].valueQuantity.value = 6
* component[gcsMotor].valueQuantity.unit = "score"
* component[gcsMotor].valueQuantity.system = $UCUM
* component[gcsMotor].valueQuantity.code = #{score}


Instance: em-vitals-example-invalid
InstanceOf: EMVitalSignsObservation
Usage: #example
Title: "Observation - Vital Signs Invalid Example"
Description: "Invalid vital signs example demonstrating a missing required value."

* status = #final
* code = $vital-signs-cs#8867-4 "Heart rate"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* effectiveDateTime = "2026-06-29T12:15:00+03:00"


Instance: em-triage-acuity-example
InstanceOf: EMTriageAcuityObservation
Usage: #example
Title: "Observation - Triage Acuity Reassessment"
Description: "Example standalone triage acuity reassessment, distinct from EMPOCEncounter.priority."

* status = #final
* code.text = "Triage acuity reassessment"
* subject = Reference(Patient/pat-0712345678)
* encounter = Reference(Encounter/em-poc-encounter-example)
* effectiveDateTime = "2026-06-29T12:30:00+03:00"
* performer = Reference(Practitioner/em-practitioner-example)
* valueCodeableConcept = EMPriorityLevelCS#critical "Critical"


// ============================================================================
// EMMedicationAdministration
// ============================================================================

Instance: em-medication-administration-example
InstanceOf: EMMedicationAdministration
Usage: #example
Title: "MedicationAdministration - Epinephrine"
Description: "Example emergency medication administration during resuscitation."

* extension[administrationAttempts].valuePositiveInt = 1

* status = #completed
* medicationCodeableConcept = ActiveComponentsCS#AC10001 "Metformin"
* medicationCodeableConcept.text = "Epinephrine 1mg/10mL IV"
* subject = Reference(Patient/pat-0712345678)
* context = Reference(Encounter/em-poc-encounter-example)
* effectiveDateTime = "2026-06-29T12:19:00+03:00"
* reasonReference[0] = Reference(Condition/em-condition-working-diagnosis-example)
* performer[0].actor = Reference(Practitioner/em-practitioner-example)
* dosage.route = MedAdminRouteCS#INTRAVENOUS-IV "Intravenous"
* dosage.dose.value = 1
* dosage.dose.unit = "Milligram (mg)"
* dosage.dose.system = $dose-units
* dosage.dose.code = #MILLIGRAM-MG


Instance: em-medication-administration-example-invalid
InstanceOf: MedicationAdministration
Usage: #example
Title: "MedicationAdministration - Invalid Example"
Description: "Invalid medication administration example demonstrating a missing encounter context, tightened to 1..1 on this profile though optional in base MedicationAdministration."

* meta.profile[0] = Canonical(EMMedicationAdministration)

* status = #completed
* medicationCodeableConcept.text = "Normal saline"
* subject = Reference(Patient/pat-0712345678)
* effectiveDateTime = "2026-06-29T12:35:00+03:00"


// ============================================================================
// EMResponderUnit — invalid example
// ============================================================================

Instance: em-responder-unit-example-invalid
InstanceOf: Device
Usage: #example
Title: "Device - Responder Unit Invalid Example"
Description: "Invalid responder unit example demonstrating a missing required type."

* meta.profile[0] = Canonical(EMResponderUnit)

* identifier[0].system = $ResponderUnitIdentifierSystem
* identifier[0].value = "AMB-099"
* status = #active
* deviceName.name = "Ambulance Unit 99"
* deviceName.type = #user-friendly-name
* owner = Reference(Organization/org-nairobi-ems-dispatch)
