# Use Cases

This page summarizes the primary business and clinical workflows supported by
the Kenya Emergency and Ambulance Services FHIR Implementation Guide.

## UC-01: Emergency Call Intake and Dispatch

**Summary:** A dispatcher receives an emergency request, records the incident,
and assigns an ambulance response.

**Key resources:**

- `Patient`
- `EpisodeOfCare`
- `Encounter`

## UC-02: Scene Assessment and Stabilization

**Summary:** The ambulance team assesses the patient at the scene, records
vital signs and findings, and begins early interventions.

**Key resources:**

- `Observation` for vital signs
- `KenyaCaseAssessment`
- `Condition`
- `AllergyIntolerance`
- `MedicationAdministration`
- `Procedure`

## UC-03: Ambulance Transport and Ongoing Monitoring

**Summary:** The patient is transported while the crew continues monitoring,
documents changes, and updates the receiving facility on the transport status.

**Key resources:**

- `Encounter`
- `EpisodeOfCare`
- `Observation`
- `MedicationAdministration`
- `Procedure`

## UC-04: Facility Handover and Emergency Documentation

**Summary:** On arrival at the receiving facility, the care team hands over the
patient together with the emergency summary and supporting documents.

**Key resources:**

- `Composition`
- `DocumentReference`
- `DiagnosticReport`
- `QuestionnaireResponse`

## UC-05: Referral and Follow-Up Investigations

**Summary:** Where additional investigations or onward referral are required,
the emergency event data remains available for continuity of care.

**Key resources:**

- `DiagnosticReport`
- `DocumentReference`
- `Composition`
- `Condition`
