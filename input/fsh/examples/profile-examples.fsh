Instance: KenyaEmergencyPatientValidExample
InstanceOf: KenyaEmergencyPatient
Usage: #example
Title: "Valid Unidentified Emergency Patient"
Description: """
A valid unidentified emergency patient with a temporary tracking number,
approximate age, and triage-level adult status.
"""

* active = true

* extension[unidentifiedPatient].valueBoolean = true
* extension[patientIdentityVerified].valueBoolean = false

* extension[approximateAge].valueAge.value = 34
* extension[approximateAge].valueAge.unit = "years"
* extension[approximateAge].valueAge.system = "http://unitsofmeasure.org"
* extension[approximateAge].valueAge.code = #a

* extension[isAdult].valueBoolean = true

* identifier[tempTrackingNumber].use = #temp
* identifier[tempTrackingNumber].system =
    "http://hie.go.ke/fhir/identifier/patient-temp-tracking"
* identifier[tempTrackingNumber].value = "EM-2026-000184"

* name.text = "Unknown Male"

* gender = #male



 Instance: KenyaEmergencyPatientInvalidExample
InstanceOf: Patient
Usage: #example
Title: "Invalid Kenya Emergency Patient"
Description: """
An intentionally non-conformant Patient instance used to demonstrate
validation errors against the Kenya Emergency Patient profile.
"""

// Tell the validator that this Patient claims conformance to the profile.
* meta.profile[0] = Canonical(KenyaEmergencyPatient)

* active = true

// Required unidentifiedPatient extension is deliberately omitted.

// Identity verification is present even though unidentified status is missing.
* extension[0].url = Canonical(EMPatientIdentityVerified)
* extension[0].valueBoolean = true

// Invalid temporary tracking identifier.
* identifier[0].use = #official
* identifier[0].system = "http://example.org/incorrect-tracking-system"
* identifier[0].value = "TEMP-001"

* name[0].text = "Unknown Male"
* gender = #male


// Instance: KenyaEmergencyPatientExample
// InstanceOf: KenyaEmergencyPatient
// Description: "Example patient for ambulance dispatch, scene assessment, and facility handover workflows."

// * identifier[0].system = "https://ilm-hie.dha.go.ke/fhir/NamingSystem/national-id"
// * identifier[0].value = "33445566" 
// * name[0].family = "Atieno"
// * name[0].given[0] = "Amina"
// * telecom[0].system = #phone
// * telecom[0].value = "+254700000001"
// * gender = #female
// * birthDate = "1992-05-16"
// * address[0].city = "Nairobi"
// * contact[0].relationship[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0131"
// * contact[0].relationship[0].coding[0].code = #N
// * contact[0].relationship[0].coding[0].display = "Next-of-Kin"

// * contact[0].name.family = "Otieno"
// * contact[0].name.given[0] = "Mary"

// * contact[0].telecom[0].system = #phone
// * contact[0].telecom[0].value = "+254712345678"
// * contact[0].telecom[0].use = #mobile


// Instance: KenyaEmergencyPatientExampleInvalid
// InstanceOf: KenyaEmergencyPatient
// Description: "Example patient with Invalid telecom use"

// * identifier[0].system = "https://ilm-hie.dha.go.ke/fhir/NamingSystem/national-id"
// * identifier[0].value = "33445566" 
// * name[0].family = "Atieno"
// * name[0].given[0] = "Amina"
// * telecom[0].system = #phone
// * telecom[0].value = "+254700000001"
// * gender = #female
// * birthDate = "1992-05-16"
// * address[0].city = "Nairobi"
// * contact[0].relationship[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v2-0131"
// * contact[0].relationship[0].coding[0].code = #N
// * contact[0].relationship[0].coding[0].display = "Next-of-Kin"

// * contact[0].name.family = "Otieno"
// * contact[0].name.given[0] = "Mary"

// * contact[0].telecom[0].system = #phone
// * contact[0].telecom[0].value = "+254712345678"
// * contact[0].telecom[0].use = #mobile

// Instance: EmergencyPractitionerExample
// InstanceOf: Practitioner
// Usage: #example
// Title: "Practitioner - Ambulance Clinician"
// Description: "Example clinician involved in ambulance response and emergency handover." 


// * name[0].family = "Njoroge"
// * name[0].given[0] = "Sarah"
// * telecom[0].system = #phone
// * telecom[0].value = "+254700100200"

// Instance: EmergencyOrganizationExample
// InstanceOf: Organization
// Usage: #example
// Title: "Organization - Nairobi County EMS"
// Description: "Example emergency services provider organization." 


// * name = "Nairobi County Emergency Medical Services"

// Instance: EmergencyLocationExample
// InstanceOf: Location
// Usage: #example
// Title: "Location - Mbagathi Road Pickup Point"
// Description: "Example scene location used in emergency transport workflows." 


// * name = "Mbagathi Road Pickup Point"
// * managingOrganization = Reference(EmergencyOrganizationExample)
// * address.city = "Nairobi"
// * address.country = "KE"

// Instance: KenyaAmbulanceEpisodeExample
// InstanceOf: KenyaAmbulanceEpisodeOfCare
// Usage: #example
// Title: "EpisodeOfCare - Road Traffic Trauma Case"
// Description: "Example ambulance episode of care for an emergency trauma response." 


// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-EOC-0001"
// * status = #active
// * type[0].text = "Road traffic trauma response"
// * patient = Reference(KenyaEmergencyPatientExample)
// * managingOrganization = Reference(EmergencyOrganizationExample)
// * period.start = "2026-05-29T08:10:00+03:00"

// Instance: KenyaAmbulanceEncounterExample
// InstanceOf: KenyaAmbulanceEncounter
// Usage: #example
// Title: "Encounter - Ambulance Transport"
// Description: "Example ambulance encounter covering scene response and transport." 


// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-ENC-0001"
// * status = #finished
// * class = http://terminology.hl7.org/CodeSystem/v3-ActCode#EMER "emergency"
// * subject = Reference(KenyaEmergencyPatientExample)
// * episodeOfCare[0] = Reference(KenyaAmbulanceEpisodeExample)
// * participant[0].individual = Reference(EmergencyPractitionerExample)
// * period.start = "2026-05-29T08:15:00+03:00"
// * period.end = "2026-05-29T09:05:00+03:00"
// * serviceProvider = Reference(EmergencyOrganizationExample)
// * location[0].location = Reference(EmergencyLocationExample)

// Instance: KenyaConditionExample
// InstanceOf: KenyaCondition
// Usage: #example
// Title: "Condition - Chest Trauma"
// Description: "Example emergency condition recorded during ambulance assessment." 


// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-COND-0001"
// * clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
// * verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"
// * category[0] = http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis "Encounter Diagnosis"
// * code.text = "Blunt chest trauma"
// * subject = Reference(KenyaEmergencyPatientExample)
// * encounter = Reference(KenyaAmbulanceEncounterExample)
// * recordedDate = "2026-05-29T08:25:00+03:00"


// Instance: KenyaAllergyExample
// InstanceOf: KenyaAllergyIntolerance
// Title: "AllergyIntolerance - Domiphen Allergy VALID"
// Description: "Example AllergyIntolerance record documenting a confirmed severe allergy to Domiphen, resulting in anaphylaxis, recorded during an emergency care encounter."

// Usage: #example 
// * identifier.system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier.value = "EMS-ALG-0001"
// * type = #allergy
// * category = #food
// * criticality = #high
// * clinicalStatus = $allergyintolerance-clinical#active "Active"
// * verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
// * code = $active-components-cs#AC10008 "Domiphen"
// * patient = Reference(Patient/KenyaEmergencyPatientExample)
// * encounter = Reference(Encounter/KenyaAmbulanceEncounterExample)
// * recordedDate = "2026-05-29T08:26:00+03:00"
// * recorder = Reference(Practitioner/EmergencyPractitionerExample)
// * asserter = Reference(Patient/KenyaEmergencyPatientExample)
// * reaction.severity = #severe
// * reaction.manifestation = $manifestation-cs#ANAPHYLAXIS "Anaphylaxis"
// * reaction.substance = $active-components-cs#AC10008 "Domiphen"


// Instance: KenyaAllergyExampleInvalid
// InstanceOf: KenyaAllergyIntolerance
// Title: "AllergyIntolerance - Domiphen Allergy INVALID"
// Description: "Example AllergyIntolerance record documenting a confirmed severe allergy to Domiphen, resulting in anaphylaxis, recorded during an emergency care encounter."

// Usage: #example 
// * identifier.system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier.value = "EMS-ALG-0001"
// * type = #allergy
// * category = #food
// * criticality = #high
// * clinicalStatus = $allergyintolerance-clinical#active "Active"
// * verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
// * code = $active-components-cs#AC10008 "Domiphen Invalid"
// * patient = Reference(Patient/KenyaEmergencyPatientExample)
// * encounter = Reference(Encounter/KenyaAmbulanceEncounterExample)
// * recordedDate = "2026-05-29T08:26:00+03:00"
// * recorder = Reference(Practitioner/EmergencyPractitionerExample)
// * asserter = Reference(Patient/KenyaEmergencyPatientExample)
// * reaction.severity = #severe
// * reaction.manifestation = $manifestation-cs#ANAPHYLAXIS "Anaphylaxis"
// * reaction.substance = $active-components-cs#AC10008 "Domiphen"

// Instance: KenyaVitalSignsExample
// InstanceOf: KenyaVitalSignsObservation
// Usage: #example
// Title: "Observation - Heart Rate"
// Description: "Example vital signs observation taken during ambulance response." 


// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-VS-0001"
// * status = #final
// * category[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
// * code = $vital-signs-cs#8867-4 "Heart rate"
// * subject = Reference(KenyaEmergencyPatientExample)
// * encounter = Reference(KenyaAmbulanceEncounterExample)
// * performer[0] = Reference(EmergencyPractitionerExample)
// * effectiveDateTime = "2026-05-29T08:22:00+03:00"
// * valueQuantity.value = 112
// * valueQuantity.unit = "beats/minute"
// * valueQuantity.system = "http://unitsofmeasure.org"
// * valueQuantity.code = #/min
// * interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H "High"

// Instance: KenyaCaseAssessmentExample
// InstanceOf: KenyaCaseAssessment
// Usage: #example
// Title: "Observation - Chest Assessment"
// Description: "Example structured case assessment completed by the ambulance crew." 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-ASSMT-0001"
// * status = #final
// * code = $assessment-types-cs#CHEST "Chest"
// * subject = Reference(KenyaEmergencyPatientExample)
// * encounter = Reference(KenyaAmbulanceEncounterExample)
// * performer[0] = Reference(EmergencyPractitionerExample)
// * effectiveDateTime = "2026-05-29T08:24:00+03:00"
// * component[0].code = $assessment-types-cs#CHEST "Chest"
// * component[0].valueString = "Tenderness and reduced expansion on the left chest wall"

// Instance: KenyaEmergencyGcsQuestionnaire
// InstanceOf: Questionnaire
// Usage: #example
// Title: "Questionnaire - Glasgow Coma Scale"
// Description: "Example questionnaire definition used to capture Glasgow Coma Scale findings in emergency care." 


// * id = "kenya-emergency-gcs-questionnaire" 
// * status = #active
// * subjectType[0] = #Patient
// * item[0].linkId = "gcs-total"
// * item[0].text = "Glasgow Coma Scale total"
// * item[0].type = #integer

// Instance: KenyaProcedureExample
// InstanceOf: KenyaProcedure
// Usage: #example
// Title: "Procedure - Airway Stabilization"
// Description: "Example emergency procedure performed before transport." 


// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-PROC-0001"
// * status = #completed
// * code.text = "Airway stabilization"
// * subject = Reference(KenyaEmergencyPatientExample)
// * encounter = Reference(KenyaAmbulanceEncounterExample)
// * performedDateTime = "2026-05-29T08:28:00+03:00"
// * reasonReference[0] = Reference(KenyaConditionExample)
// * outcome.text = "Airway maintained during transport"
// * performer[0].actor = Reference(EmergencyPractitionerExample)

// Instance: KenyaMedicationAdministrationExample
// InstanceOf: KenyaMedicationAdministration
// Usage: #example
// Title: "MedicationAdministration - IV Fluids"
// Description: "Example medication administration recorded during transport." 


// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-MEDADM-0001"
// * status = #completed
// * medicationCodeableConcept.text = "Normal saline"
// * subject = Reference(KenyaEmergencyPatientExample)
// * context = Reference(KenyaAmbulanceEncounterExample)
// * effectiveDateTime = "2026-05-29T08:35:00+03:00"
// * reasonReference[0] = Reference(KenyaConditionExample)
// * performer[0].actor = Reference(EmergencyPractitionerExample)
// * dosage.route = $medication-administration-route#INTRAVENOUS-IV "Intravenous (IV)"
// * dosage.dose.value = 500
// * dosage.dose.unit = "Milliliter (mL)"
// * dosage.dose.system = $dose-units
// * dosage.dose.code = #MILLILITER-ML

// Instance: KenyaDiagnosticReportExample
// InstanceOf: KenyaDiagnosticReport
// Usage: #example
// Title: "DiagnosticReport - Trauma Imaging Request Result"
// Description: "Example diagnostic report used during emergency handover." 


// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-DR-0001"
// * status = #final 
// * code = $investigations-cs#INV-00000664 "Reticulocytes count" 
// * subject = Reference(KenyaEmergencyPatientExample)
// * encounter = Reference(KenyaAmbulanceEncounterExample)
// * effectiveDateTime = "2026-05-29T09:10:00+03:00"
// * performer[0] = Reference(EmergencyPractitionerExample)
// * conclusion = "Portable imaging requested following chest trauma." 


// Instance: KenyaDocumentReferenceExample
// InstanceOf: KenyaDocumentReference
// Usage: #example
// Title: "DocumentReference - Handover Note"
// Description: "Example emergency handover note attached to the patient record." 


// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "EMS-DOC-0001"
// * status = #current
// * type.text = "Emergency handover note"
// * subject = Reference(KenyaEmergencyPatientExample)
// * date = "2026-05-29T09:05:00+03:00"
// * author[0] = Reference(EmergencyPractitionerExample)
// * content[0].attachment.contentType = #text/plain
// * content[0].attachment.title = "Scene handover summary"
// * content[0].attachment.data = "U2NlbmUgaGFuZG92ZXIgc3VtbWFyeS4="
// * context.encounter[0] = Reference(KenyaAmbulanceEncounterExample)

// Instance: KenyaQuestionnaireResponseExample
// InstanceOf: KenyaQuestionnaireResponse
// Usage: #example
// Title: "QuestionnaireResponse - Glasgow Coma Scale"
// Description: "Example questionnaire response recorded as part of the emergency assessment." 


// * status = #completed
// * questionnaire = $emergency-assessment-questionnaire
// * subject = Reference(KenyaEmergencyPatientExample)
// * encounter = Reference(KenyaAmbulanceEncounterExample)
// * authored = "2026-05-29T08:27:00+03:00"
// * author = Reference(EmergencyPractitionerExample)
// * item[0].linkId = "gcs-total"
// * item[0].text = "Glasgow Coma Scale total"
// * item[0].answer[0].valueInteger = 14

// Instance: KenyaCompositionExample
// InstanceOf: KenyaComposition
// Usage: #example
// Title: "Composition - Emergency Handover Summary"
// Description: "Example handover summary sent with the patient at facility arrival." 


// * status = #final
// * type.text = "Emergency handover summary"
// * subject = Reference(KenyaEmergencyPatientExample)
// * date = "2026-05-29T09:06:00+03:00"
// * author[0] = Reference(EmergencyPractitionerExample)
// * title = "Ambulance Emergency Handover Summary"
// * section[0].title = "Clinical summary"
// * section[0].entry[0] = Reference(KenyaConditionExample)
// * section[0].entry[1] = Reference(KenyaVitalSignsExample)


// // ======== Invalid Examples ===========
// Instance: InvalidPractitionerExample
// InstanceOf: Practitioner
// Usage: #example
// Title: "Invalid Practitioner Example"
// Description: "Invalid practitioner example demonstrating a missing required name." 

// * telecom[0].system = #phone
// * telecom[0].value = "+254700100200"


// Instance: InvalidOrganizationExample
// InstanceOf: Organization
// Usage: #example
// Title: "Invalid Organization Example"
// Description: "Invalid organization example demonstrating a missing required name."
 
// * active = true

// Instance: InvalidLocationExample
// InstanceOf: Location
// Usage: #example
// Title: "Invalid Location Example"
// Description: "Invalid location example demonstrating a missing required name."
 

// * address.city = "Nairobi"
// * address.country = "KE"

// Instance: InvalidEpisodeOfCareExample
// InstanceOf: KenyaAmbulanceEpisodeOfCare
// Usage: #example
// Title: "Invalid EpisodeOfCare Example"
// Description: "Invalid episode of care example demonstrating a missing patient reference."
 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-EOC-0001"
// * type[0].text = "Road traffic trauma response"
// * status = #active
// * period.start = "2026-05-29T08:10:00+03:00"
// * patient = Reference(KenyaEmergencyPatientExample)

// Instance: InvalidEncounterExample
// InstanceOf: KenyaAmbulanceEncounter
// Usage: #example
// Title: "Invalid Encounter Example"
// Description: "Invalid encounter example demonstrating an end date occurring before the start date." 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-EOC-0001"
// * status = #finished
// * class = http://terminology.hl7.org/CodeSystem/v3-ActCode#EMER "emergency"
// * subject = Reference(KenyaEmergencyPatientExample)
// * location[0].location = Reference(EmergencyLocationExample)
// * episodeOfCare[0] = Reference(KenyaAmbulanceEpisodeExample)
// * period.start = "2026-05-29T09:05:00+03:00"
// * period.end = "2026-05-29T08:15:00+03:00"


// Instance: InvalidConditionExample
// InstanceOf: KenyaCondition
// Usage: #example
// Title: "Invalid Condition Example"
// Description: "Invalid condition example demonstrating a unkown code in verification Status."
 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-EOC-0001"
// * clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active" 
// * verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmedinvalid "Confirmed"

// * code.text = "Blunt chest trauma"
// * verificationStatus
// * subject = Reference(KenyaEmergencyPatientExample)

 

// Instance: InvalidVitalSignsExample
// InstanceOf: KenyaVitalSignsObservation
// Usage: #example
// Title: "Invalid Vital Signs Example"
// Description: "Invalid vital signs example demonstrating a missing observation value." 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-EOC-0001"
// * status = #final
// * category[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
// * code = http://loinc.org#8867-4 "Heart rate"
// * subject = Reference(KenyaEmergencyPatientExample)
// * effectiveDateTime = "2026-05-29T08:22:00+03:00"

// Instance: InvalidCaseAssessmentExample
// InstanceOf: KenyaCaseAssessment
// Usage: #example
// Title: "Invalid Case Assessment Example"
// Description: "Invalid case assessment example demonstrating a missing assessment result." 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-EOC-0001"
// * status = #final
// * code = $assessment-types-cs#CHEST "Chest"
// * subject = Reference(KenyaEmergencyPatientExample)
// * effectiveDateTime = "2026-05-29T08:22:00+03:00"

// Instance: InvalidQuestionnaireExample
// InstanceOf: Questionnaire
// Usage: #example
// Title: "Invalid Questionnaire Example"
// Description: "Invalid questionnaire example demonstrating a missing item type." 

// * id = "invalid-questionnaire"
// * status = #active
// * item[0].linkId = "gcs-total"
// * item[0].text = "Glasgow Coma Scale total"
// * item[0].type = #integer

// Instance: InvalidProcedureExample
// InstanceOf: KenyaProcedure
// Usage: #example
// Title: "Invalid Procedure Example"
// Description: "Invalid procedure example demonstrating a missing status."
 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-EOC-0001"
// * code.text = "Airway stabilization"
// * status = #completed
// * subject = Reference(KenyaEmergencyPatientExample)

// Instance: InvalidMedicationAdministrationExample
// InstanceOf: KenyaMedicationAdministration
// Usage: #example
// Title: "Invalid MedicationAdministration Example"
// Description: "Invalid medication administration example demonstrating a wrong dosage units."
 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-EOC-0001"
// * status = #completed
// * subject = Reference(KenyaEmergencyPatientExample)
// * medicationCodeableConcept.text = "Normal saline"
// * effectiveDateTime = "2026-05-29T08:22:00+03:00"
// * dosage.dose.value = 50
// * dosage.dose.unit = "Milliliter (mL)"
// * dosage.dose.system = $dose-units
// * dosage.dose.code = #MILLILITER-

// Instance: InvalidDiagnosticReportExample
// InstanceOf: KenyaDiagnosticReport
// Usage: #example
// Title: "Invalid DiagnosticReport Example"
// Description: "Invalid diagnostic report example demonstrating a missing code." 

// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-DR-0001"
// * status = #final 
// * subject = Reference(KenyaEmergencyPatientExample)
// * code = https://loinc.org#100018-1 "Hospital care Note"

// Instance: InvalidDocumentReferenceExample
// InstanceOf: KenyaDocumentReference
// Usage: #example
// Title: "Invalid DocumentReference Example"
// Description: "Invalid document reference example demonstrating a missing attachment."
 
// * identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
// * identifier[0].value = "INVALID-EMS-DR-0001"
// * status = #current
// * content[0].attachment.contentType = #text/plain
// * content[0].attachment.title = "Scene handover summary"
// * content[0].attachment.data = "U2NlbmUgaGFuZG92ZXIgc3VtbWFyeS4="
// * subject = Reference(KenyaEmergencyPatientExample) 

// Instance: InvalidQuestionnaireResponseExample
// InstanceOf: KenyaQuestionnaireResponse
// Usage: #example
// Title: "Invalid QuestionnaireResponse Example"
// Description: "Invalid questionnaire response example demonstrating a datatype mismatch."
 

// * status = #completed
// * questionnaire = $emergency-assessment-questionnaire
// * subject = Reference(KenyaEmergencyPatientExample)
// * item[0].linkId = "gcs-total"
// * item[0].answer[0].valueString = "Fourteen"

// Instance: InvalidCompositionExample
// InstanceOf: KenyaComposition
// Usage: #example
// Title: "Invalid Composition Example"
// Description: "Invalid composition example demonstrating a missing status."

// * status = #final
// * type.text = "Emergency handover summary"
// * date = "2026-05-29T09:06:00+03:00"
// * author[0] = Reference(EmergencyPractitionerExample)
// * subject = Reference(KenyaEmergencyPatientExample)
// * title = "Ambulance Emergency Handover Summary"
