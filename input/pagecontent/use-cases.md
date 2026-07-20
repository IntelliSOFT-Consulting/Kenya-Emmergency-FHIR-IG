### Use Cases

This page describes the primary clinical and operational workflows supported by this
Implementation Guide. Each use case maps to one or more FHIR profiles defined in the
[Artifacts](artifacts.html) section.

---

#### UC-01: Emergency Dispatch and Incident Creation

**Actor:** Dispatcher / Call-handler at a dispatch or CAD system
**System:** Computer-Aided Dispatch (CAD) / Emergency Call Centre
**Trigger:** An emergency call is received

**Workflow:**

1. The dispatcher opens an **EMEpisodeOfCare** representing the emergency incident, carrying
   the shared incident identifier used across every downstream resource.
2. An **EMIncidentEncounter** is created as the root encounter, capturing the caller, dispatch
   priority, incident type, scene location, and any supporting agencies (fire, police).
3. If the patient's identity is not yet known, a temporary **KenyaEmergencyPatient** is created
   with a system-generated tracking number rather than blocking on identity resolution.
4. One or more **EMResponderUnit** instances (ambulances or other response vehicles) are
   assigned to the incident, each with its own real-time position via **EMResponderUnitLocation**.

**Key Profiles Used:**
[EMEpisodeOfCare](StructureDefinition-em-episode-of-care.html) ·
[EMIncidentEncounter](StructureDefinition-em-incident-encounter.html) ·
[KenyaEmergencyPatient](StructureDefinition-kenya-emergency-patient.html) ·
[EMResponderUnit](StructureDefinition-em-responder-unit.html) ·
[EMResponderUnitLocation](StructureDefinition-em-responder-unit-location.html)

---

#### UC-02: Scene Response and Point-of-Care Assessment

**Actor:** Paramedic / Emergency Medical Technician (EMT)
**System:** EMT field application (mobile)
**Trigger:** Responder unit arrives on scene

**Workflow:**

1. An **EMPOCEncounter** is opened, subordinate to the root **EMIncidentEncounter** via
   `partOf`, representing direct patient contact at the scene and during transport.
2. Vital signs (heart rate, respiratory rate, SpO2, blood pressure, Glasgow Coma Scale) are
   recorded as timestamped **EMVitalSignsObservation** instances, trended across the episode.
3. A structured secondary survey is recorded as one **EMSecondarySurveyObservation** per body
   region, each explicitly marked as having findings or confirmed as examined with none.
4. If acuity needs to be reassessed independently of the encounter-level priority, a
   standalone **EMTriageAcuityObservation** is recorded.

**Key Profiles Used:**
[EMPOCEncounter](StructureDefinition-em-poc-encounter.html) ·
[EMVitalSignsObservation](StructureDefinition-em-vital-signs-observation.html) ·
[EMSecondarySurveyObservation](StructureDefinition-em-secondary-survey-observation.html) ·
[EMTriageAcuityObservation](StructureDefinition-em-triage-acuity-observation.html)

---

#### UC-03: Diagnosis Staging Across the Episode

**Actor:** EMT (at scene), ED physician (at facility)
**System:** EMT field application, facility EMR
**Trigger:** A chief complaint, working diagnosis, or discharge diagnosis is recorded

**Workflow:**

1. At intake, the caller- or patient-reported reason for the emergency is recorded as an
   **EMCondition** with `category` = chief-complaint and `verificationStatus` = unconfirmed.
2. As assessment progresses, additional **EMCondition** instances are added with `category` =
   working-diagnosis or differential-diagnosis — never overwriting the chief complaint in place.
3. At facility handover or closure, a **EMCondition** with `category` = discharge-diagnosis and
   `verificationStatus` = confirmed is recorded; this is the instance a claims pipeline should
   read.

**Key Profiles Used:**
[EMCondition](StructureDefinition-em-condition.html)

---

#### UC-04: Allergy and Safety Check

**Actor:** EMT / Paramedic
**System:** EMT field application
**Trigger:** Allergy history is taken, or a drug is about to be administered

**Workflow:**

1. If the patient (or a caller/relative on their behalf) reports a known allergy, an
   **EMAllergyIntolerance** is recorded with the allergen code, criticality, and reaction detail.
2. If a full allergy history is taken and nothing is found, an explicit
   **EMNoKnownAllergy** instance is recorded instead — the absence of any AllergyIntolerance
   resource must never be read as "confirmed none."
3. For any criticality = high allergy, an **EMAllergyCriticalityFlag** provides a prominent,
   must-see alert at patient lookup.

**Key Profiles Used:**
[EMAllergyIntolerance](StructureDefinition-em-allergy-intolerance.html) ·
[EMNoKnownAllergy](StructureDefinition-em-no-known-allergy.html) ·
[EMAllergyCriticalityFlag](StructureDefinition-em-allergy-criticality-flag.html)

---

#### UC-05: Procedures and Medication Administration in the Field

**Actor:** Paramedic / Emergency physician
**System:** EMT field application
**Trigger:** A procedure is performed or a drug is administered

**Workflow:**

1. Procedures performed during the response (e.g. intubation, wound dressing, CPR) are
   recorded as **EMProcedure** instances with status, performer, and outcome.
2. Medications administered in real time (not merely prescribed) are recorded as
   **EMMedicationAdministration** instances, including dose, route, and administration attempts
   for difficult-access or repeated-dose scenarios.
3. Both may reference the relevant **EMCondition** as `reasonReference`, linking treatment to
   the diagnosis it addressed.

**Key Profiles Used:**
[EMProcedure](StructureDefinition-em-procedure.html) ·
[EMMedicationAdministration](StructureDefinition-em-medication-administration.html)

---

#### UC-06: Investigations and Facility Handover

**Actor:** Paramedic (recording), receiving facility clinician (receiving)
**System:** EMT field application, facility EMR
**Trigger:** An investigation is performed, or the patient arrives at the receiving facility

**Workflow:**

1. Investigations performed in the field or on arrival (e.g. a 12-lead ECG) are recorded as
   **EMDiagnosticReport** instances, with the coded and free-text conclusion preserved verbatim
   so time-critical findings are never lost in transcription.
2. On arrival, the destination facility referenced on **EMIncidentEncounter** and
   **EMPOCEncounter** confirms where responsibility for the patient transfers.
3. A handover summary may be assembled referencing the episode's Condition, Observation,
   Procedure, and MedicationAdministration instances for the receiving team.

**Key Profiles Used:**
[EMDiagnosticReport](StructureDefinition-em-diagnostic-report.html)

---

<div class="em-info-box green">
  <strong>Actor Definitions</strong>
  All actors referenced in these use cases are implementers (CAD/dispatch systems, EMT field
  applications, facility EMRs) or clinical/operational roles. No actor profiles are formally
  defined in this version of the IG.
</div>
