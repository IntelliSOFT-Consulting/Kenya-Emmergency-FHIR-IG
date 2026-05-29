Instance: KenyaEmergencyPatientExample
InstanceOf: KenyaEmergencyPatient
Description: "Example patient for ambulance dispatch, scene assessment, and facility handover workflows."

* identifier[0].system = "https://ilm-hie.dha.go.ke/fhir/NamingSystem/national-id"
* identifier[0].value = "33445566"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-patient"
* name[0].family = "Atieno"
* name[0].given[0] = "Amina"
* telecom[0].system = #phone
* telecom[0].value = "+254700000001"
* gender = #female
* birthDate = "1992-05-16"
* address[0].city = "Nairobi"

Instance: EmergencyPractitionerExample
InstanceOf: Practitioner
Usage: #example
Title: "Practitioner - Ambulance Clinician"
Description: "Example clinician involved in ambulance response and emergency handover."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Practitioner Sarah Njoroge</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-practitioner"


* name[0].family = "Njoroge"
* name[0].given[0] = "Sarah"
* telecom[0].system = #phone
* telecom[0].value = "+254700100200"

Instance: EmergencyOrganizationExample
InstanceOf: Organization
Usage: #example
Title: "Organization - Nairobi County EMS"
Description: "Example emergency services provider organization."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-organization"


* name = "Nairobi County Emergency Medical Services"

Instance: EmergencyLocationExample
InstanceOf: Location
Usage: #example
Title: "Location - Mbagathi Road Pickup Point"
Description: "Example scene location used in emergency transport workflows."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


* name = "Mbagathi Road Pickup Point"
* managingOrganization = Reference(EmergencyOrganizationExample)
* address.city = "Nairobi"
* address.country = "KE"

Instance: KenyaAmbulanceEpisodeExample
InstanceOf: KenyaAmbulanceEpisodeOfCare
Usage: #example
Title: "EpisodeOfCare - Road Traffic Trauma Case"
Description: "Example ambulance episode of care for an emergency trauma response."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"
* meta.profile[+] = "https://nshr-uat.sha.go.ke/fhir/StructureDefinition/ke-episode-of-care"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-EOC-0001"
* status = #active
* type[0].text = "Road traffic trauma response"
* patient = Reference(KenyaEmergencyPatientExample)
* managingOrganization = Reference(EmergencyOrganizationExample)
* period.start = "2026-05-29T08:10:00+03:00"

Instance: KenyaAmbulanceEncounterExample
InstanceOf: KenyaAmbulanceEncounter
Usage: #example
Title: "Encounter - Ambulance Transport"
Description: "Example ambulance encounter covering scene response and transport."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"
* meta.profile[+] = "https://nshr-uat.sha.go.ke/fhir/StructureDefinition/ke-encounter"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-ENC-0001"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#EMER "emergency"
* subject = Reference(KenyaEmergencyPatientExample)
* episodeOfCare[0] = Reference(KenyaAmbulanceEpisodeExample)
* participant[0].individual = Reference(EmergencyPractitionerExample)
* period.start = "2026-05-29T08:15:00+03:00"
* period.end = "2026-05-29T09:05:00+03:00"
* serviceProvider = Reference(EmergencyOrganizationExample)
* location[0].location = Reference(EmergencyLocationExample)

Instance: KenyaConditionExample
InstanceOf: KenyaCondition
Usage: #example
Title: "Condition - Chest Trauma"
Description: "Example emergency condition recorded during ambulance assessment."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-condition"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-COND-0001"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"
* category[0] = http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis "Encounter Diagnosis"
* code.text = "Blunt chest trauma"
* subject = Reference(KenyaEmergencyPatientExample)
* encounter = Reference(KenyaAmbulanceEncounterExample)
* recordedDate = "2026-05-29T08:25:00+03:00"


Instance: KenyaAllergyExample
InstanceOf: KenyaAllergyIntolerance
Title: "AllergyIntolerance - Domiphen Allergy VALID"
Description: "Example AllergyIntolerance record documenting a confirmed severe allergy to Domiphen, resulting in anaphylaxis, recorded during an emergency care encounter."

Usage: #example
* meta.profile = "https://nshr-uat.sha.go.ke/fhir/StructureDefinition/ke-allergy-intolerance"
* identifier.system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier.value = "EMS-ALG-0001"
* type = #allergy
* category = #food
* criticality = #high
* clinicalStatus = $allergyintolerance-clinical#active "Active"
* verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
* code = $active-components-cs#AC10008 "Domiphen"
* patient = Reference(Patient/KenyaEmergencyPatientExample)
* encounter = Reference(Encounter/KenyaAmbulanceEncounterExample)
* recordedDate = "2026-05-29T08:26:00+03:00"
* recorder = Reference(Practitioner/EmergencyPractitionerExample)
* asserter = Reference(Patient/KenyaEmergencyPatientExample)
* reaction.severity = #severe
* reaction.manifestation = $manifestation-cs#ANAPHYLAXIS "Anaphylaxis"
* reaction.substance = $active-components-cs#AC10008 "Domiphen"


Instance: KenyaAllergyExampleInvalid
InstanceOf: KenyaAllergyIntolerance
Title: "AllergyIntolerance - Domiphen Allergy INVALID"
Description: "Example AllergyIntolerance record documenting a confirmed severe allergy to Domiphen, resulting in anaphylaxis, recorded during an emergency care encounter."

Usage: #example
* meta.profile = "https://nshr-uat.sha.go.ke/fhir/StructureDefinition/ke-allergy-intolerance"
* identifier.system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier.value = "EMS-ALG-0001"
* type = #allergy
* category = #food
* criticality = #high
* clinicalStatus = $allergyintolerance-clinical#active "Active"
* verificationStatus = $allergyintolerance-verification#confirmed "Confirmed"
* code = $active-components-cs#AC10008 "Domiphen Invalid"
* patient = Reference(Patient/KenyaEmergencyPatientExample)
* encounter = Reference(Encounter/KenyaAmbulanceEncounterExample)
* recordedDate = "2026-05-29T08:26:00+03:00"
* recorder = Reference(Practitioner/EmergencyPractitionerExample)
* asserter = Reference(Patient/KenyaEmergencyPatientExample)
* reaction.severity = #severe
* reaction.manifestation = $manifestation-cs#ANAPHYLAXIS "Anaphylaxis"
* reaction.substance = $active-components-cs#AC10008 "Domiphen"

Instance: KenyaVitalSignsExample
InstanceOf: KenyaVitalSignsObservation
Usage: #example
Title: "Observation - Heart Rate"
Description: "Example vital signs observation taken during ambulance response."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-VS-0001"
* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#8867-4 "Heart rate"
* subject = Reference(KenyaEmergencyPatientExample)
* encounter = Reference(KenyaAmbulanceEncounterExample)
* performer[0] = Reference(EmergencyPractitionerExample)
* effectiveDateTime = "2026-05-29T08:22:00+03:00"
* valueQuantity.value = 112
* valueQuantity.unit = "beats/minute"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #/min
* interpretation[0] = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation#H "High"

Instance: KenyaCaseAssessmentExample
InstanceOf: KenyaCaseAssessment
Usage: #example
Title: "Observation - Chest Assessment"
Description: "Example structured case assessment completed by the ambulance crew."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-ASSMT-0001"
* status = #final
* code = AssessmentTypesCS#CHEST "Chest"
* subject = Reference(KenyaEmergencyPatientExample)
* encounter = Reference(KenyaAmbulanceEncounterExample)
* performer[0] = Reference(EmergencyPractitionerExample)
* effectiveDateTime = "2026-05-29T08:24:00+03:00"
* component[0].code = AssessmentTypesCS#CHEST "Chest"
* component[0].valueString = "Tenderness and reduced expansion on the left chest wall"

Instance: KenyaEmergencyGcsQuestionnaire
InstanceOf: Questionnaire
Usage: #example
Title: "Questionnaire - Glasgow Coma Scale"
Description: "Example questionnaire definition used to capture Glasgow Coma Scale findings in emergency care."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


* id = "kenya-emergency-gcs-questionnaire"
* url = "https://fhir.dha.go.ke/emergency/Questionnaire/kenya-emergency-gcs-questionnaire"
* status = #active
* subjectType[0] = #Patient
* item[0].linkId = "gcs-total"
* item[0].text = "Glasgow Coma Scale total"
* item[0].type = #integer

Instance: KenyaProcedureExample
InstanceOf: KenyaProcedure
Usage: #example
Title: "Procedure - Airway Stabilization"
Description: "Example emergency procedure performed before transport."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-PROC-0001"
* status = #completed
* code.text = "Airway stabilization"
* subject = Reference(KenyaEmergencyPatientExample)
* encounter = Reference(KenyaAmbulanceEncounterExample)
* performedDateTime = "2026-05-29T08:28:00+03:00"
* reasonReference[0] = Reference(KenyaConditionExample)
* outcome.text = "Airway maintained during transport"
* performer[0].actor = Reference(EmergencyPractitionerExample)

Instance: KenyaMedicationAdministrationExample
InstanceOf: KenyaMedicationAdministration
Usage: #example
Title: "MedicationAdministration - IV Fluids"
Description: "Example medication administration recorded during transport."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"
* meta.profile[+] = "https://nshr-uat.sha.go.ke/fhir/StructureDefinition/ke-medication"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-MEDADM-0001"
* status = #completed
* medicationCodeableConcept.text = "Normal saline"
* subject = Reference(KenyaEmergencyPatientExample)
* context = Reference(KenyaAmbulanceEncounterExample)
* effectiveDateTime = "2026-05-29T08:35:00+03:00"
* reasonReference[0] = Reference(KenyaConditionExample)
* performer[0].actor = Reference(EmergencyPractitionerExample)
* dosage.route = MedicationAdministrationRouteCS#INTRAVENOUS-IV "Intravenous (IV)"
* dosage.dose.value = 500
* dosage.dose.unit = "Milliliter (mL)"
* dosage.dose.system = "https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/CodeSystem/DOSE-UNITS"
* dosage.dose.code = #MILLILITER-ML

Instance: KenyaDiagnosticReportExample
InstanceOf: KenyaDiagnosticReport
Usage: #example
Title: "DiagnosticReport - Trauma Imaging Request Result"
Description: "Example diagnostic report used during emergency handover."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-diagnosticreport"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-DR-0001"
* status = #final
* code = https://loinc.org#100018-1 "Hospital care Note"
// * code = InvestigationsCS#INV-00001847 "X-Ray Unspecified" 
* subject = Reference(KenyaEmergencyPatientExample)
* encounter = Reference(KenyaAmbulanceEncounterExample)
* effectiveDateTime = "2026-05-29T09:10:00+03:00"
* performer[0] = Reference(EmergencyPractitionerExample)
* conclusion = "Portable imaging requested following chest trauma."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


Instance: KenyaDocumentReferenceExample
InstanceOf: KenyaDocumentReference
Usage: #example
Title: "DocumentReference - Handover Note"
Description: "Example emergency handover note attached to the patient record."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "EMS-DOC-0001"
* status = #current
* type.text = "Emergency handover note"
* subject = Reference(KenyaEmergencyPatientExample)
* date = "2026-05-29T09:05:00+03:00"
* author[0] = Reference(EmergencyPractitionerExample)
* content[0].attachment.contentType = #text/plain
* content[0].attachment.title = "Scene handover summary"
* content[0].attachment.data = "U2NlbmUgaGFuZG92ZXIgc3VtbWFyeS4="
* context.encounter[0] = Reference(KenyaAmbulanceEncounterExample)

Instance: KenyaQuestionnaireResponseExample
InstanceOf: KenyaQuestionnaireResponse
Usage: #example
Title: "QuestionnaireResponse - Glasgow Coma Scale"
Description: "Example questionnaire response recorded as part of the emergency assessment."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


* status = #completed
* questionnaire = "https://fhir.dha.go.ke/emergency/Questionnaire/kenya-emergency-gcs-questionnaire"
* subject = Reference(KenyaEmergencyPatientExample)
* encounter = Reference(KenyaAmbulanceEncounterExample)
* authored = "2026-05-29T08:27:00+03:00"
* author = Reference(EmergencyPractitionerExample)
* item[0].linkId = "gcs-total"
* item[0].text = "Glasgow Coma Scale total"
* item[0].answer[0].valueInteger = 14

Instance: KenyaCompositionExample
InstanceOf: KenyaComposition
Usage: #example
Title: "Composition - Emergency Handover Summary"
Description: "Example handover summary sent with the patient at facility arrival."
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient has a penicillin allergy.</div>"


* status = #final
* type.text = "Emergency handover summary"
* subject = Reference(KenyaEmergencyPatientExample)
* date = "2026-05-29T09:06:00+03:00"
* author[0] = Reference(EmergencyPractitionerExample)
* title = "Ambulance Emergency Handover Summary"
* section[0].title = "Clinical summary"
* section[0].entry[0] = Reference(KenyaConditionExample)
* section[0].entry[1] = Reference(KenyaVitalSignsExample)


// ======== Invalid Examples ===========
Instance: InvalidPractitionerExample
InstanceOf: Practitioner
Usage: #example
Title: "Invalid Practitioner Example"
Description: "Invalid practitioner example demonstrating a missing required name."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid practitioner example.</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-practitioner"

* telecom[0].system = #phone
* telecom[0].value = "+254700100200"


Instance: InvalidOrganizationExample
InstanceOf: Organization
Usage: #example
Title: "Invalid Organization Example"
Description: "Invalid organization example demonstrating a missing required name."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid organization example.</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-organization"
* active = true

Instance: InvalidLocationExample
InstanceOf: Location
Usage: #example
Title: "Invalid Location Example"
Description: "Invalid location example demonstrating a missing required name."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid location example.</div>"

* address.city = "Nairobi"
* address.country = "KE"

Instance: InvalidEpisodeOfCareExample
InstanceOf: KenyaAmbulanceEpisodeOfCare
Usage: #example
Title: "Invalid EpisodeOfCare Example"
Description: "Invalid episode of care example demonstrating a missing patient reference."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid episode of care example.</div>"
* meta.profile[+] = "https://nshr-uat.sha.go.ke/fhir/StructureDefinition/ke-episode-of-care"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-EOC-0001"
* type[0].text = "Road traffic trauma response"
* status = #active
* period.start = "2026-05-29T08:10:00+03:00"
* patient = Reference(KenyaEmergencyPatientExample)

Instance: InvalidEncounterExample
InstanceOf: KenyaAmbulanceEncounter
Usage: #example
Title: "Invalid Encounter Example"
Description: "Invalid encounter example demonstrating an end date occurring before the start date."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid encounter example.</div>"
* meta.profile[+] = "https://nshr-uat.sha.go.ke/fhir/StructureDefinition/ke-encounter"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-EOC-0001"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#EMER "emergency"
* subject = Reference(KenyaEmergencyPatientExample)
* location[0].location = Reference(EmergencyLocationExample)
* episodeOfCare[0] = Reference(KenyaAmbulanceEpisodeExample)
* period.start = "2026-05-29T09:05:00+03:00"
* period.end = "2026-05-29T08:15:00+03:00"


Instance: InvalidConditionExample
InstanceOf: KenyaCondition
Usage: #example
Title: "Invalid Condition Example"
Description: "Invalid condition example demonstrating a missing subject reference."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid condition example.</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-condition"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-EOC-0001"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active" 
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"

* code.text = "Blunt chest trauma"
* verificationStatus
* subject = Reference(KenyaEmergencyPatientExample)

 

Instance: InvalidVitalSignsExample
InstanceOf: KenyaVitalSignsObservation
Usage: #example
Title: "Invalid Vital Signs Example"
Description: "Invalid vital signs example demonstrating a missing observation value."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid vital signs example.</div>"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-EOC-0001"
* status = #final
* category[0] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#8867-4 "Heart rate"
* subject = Reference(KenyaEmergencyPatientExample)
* effectiveDateTime = "2026-05-29T08:22:00+03:00"

Instance: InvalidCaseAssessmentExample
InstanceOf: KenyaCaseAssessment
Usage: #example
Title: "Invalid Case Assessment Example"
Description: "Invalid case assessment example demonstrating a missing assessment result."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid case assessment example.</div>"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-EOC-0001"
* status = #final
* code = AssessmentTypesCS#CHEST "Chest"
* subject = Reference(KenyaEmergencyPatientExample)
* effectiveDateTime = "2026-05-29T08:22:00+03:00"

Instance: InvalidQuestionnaireExample
InstanceOf: Questionnaire
Usage: #example
Title: "Invalid Questionnaire Example"
Description: "Invalid questionnaire example demonstrating a missing item type."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid questionnaire example.</div>"

* id = "invalid-questionnaire"
* status = #active
* item[0].linkId = "gcs-total"
* item[0].text = "Glasgow Coma Scale total"
* item[0].type = #integer

Instance: InvalidProcedureExample
InstanceOf: KenyaProcedure
Usage: #example
Title: "Invalid Procedure Example"
Description: "Invalid procedure example demonstrating a missing status."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid procedure example.</div>"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-EOC-0001"
* code.text = "Airway stabilization"
* status = #completed
* subject = Reference(KenyaEmergencyPatientExample)

Instance: InvalidMedicationAdministrationExample
InstanceOf: KenyaMedicationAdministration
Usage: #example
Title: "Invalid MedicationAdministration Example"
Description: "Invalid medication administration example demonstrating a missing medication."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid medication administration example.</div>"
* meta.profile[+] = "https://nshr-uat.sha.go.ke/fhir/StructureDefinition/ke-medication"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-EOC-0001"
* status = #completed
* subject = Reference(KenyaEmergencyPatientExample)
* medicationCodeableConcept.text = "Normal saline"
* effectiveDateTime = "2026-05-29T08:22:00+03:00"

Instance: InvalidDiagnosticReportExample
InstanceOf: KenyaDiagnosticReport
Usage: #example
Title: "Invalid DiagnosticReport Example"
Description: "Invalid diagnostic report example demonstrating a missing code."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid diagnostic report example.</div>"
* meta.profile[+] = "https://fhir.dha.go.ke/eclaims/StructureDefinition/ke-eclaims-diagnosticreport"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-DR-0001"
* status = #final 
* subject = Reference(KenyaEmergencyPatientExample)
* code = https://loinc.org#100018-1 "Hospital care Note"

Instance: InvalidDocumentReferenceExample
InstanceOf: KenyaDocumentReference
Usage: #example
Title: "Invalid DocumentReference Example"
Description: "Invalid document reference example demonstrating a missing attachment."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid document reference example.</div>"
* identifier[0].system = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* identifier[0].value = "INVALID-EMS-DR-0001"
* status = #current
* content[0].attachment.contentType = #text/plain
* content[0].attachment.title = "Scene handover summary"
* content[0].attachment.data = "U2NlbmUgaGFuZG92ZXIgc3VtbWFyeS4="
* subject = Reference(KenyaEmergencyPatientExample)

Instance: InvalidQuestionnaireResponseExample
InstanceOf: KenyaQuestionnaireResponse
Usage: #example
Title: "Invalid QuestionnaireResponse Example"
Description: "Invalid questionnaire response example demonstrating a datatype mismatch."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid questionnaire response example.</div>"

* status = #completed
* questionnaire = "https://fhir.dha.go.ke/emergency/Questionnaire/kenya-emergency-gcs-questionnaire"
* subject = Reference(KenyaEmergencyPatientExample)
* item[0].linkId = "gcs-total"
* item[0].answer[0].valueString = "Fourteen"

Instance: InvalidCompositionExample
InstanceOf: KenyaComposition
Usage: #example
Title: "Invalid Composition Example"
Description: "Invalid composition example demonstrating a missing status."

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Invalid composition example.</div>"
* status = #final
* type.text = "Emergency handover summary"
* date = "2026-05-29T09:06:00+03:00"
* author[0] = Reference(EmergencyPractitionerExample)
* subject = Reference(KenyaEmergencyPatientExample)
* title = "Ambulance Emergency Handover Summary"
