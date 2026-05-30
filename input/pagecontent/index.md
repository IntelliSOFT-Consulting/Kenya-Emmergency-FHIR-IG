# Kenya Emergency and Ambulance Services FHIR IG

The Kenya Emergency and Ambulance Services FHIR Implementation Guide defines a
shared interoperability baseline for emergency dispatch, pre-hospital
assessment, ambulance transport, facility handover, and supporting emergency
documentation workflows across Kenya.

## Purpose

This guide helps implementers exchange emergency care data consistently by:

- profiling the core FHIR resources used during ambulance and emergency care workflows
- defining Kenya-specific terminology for case prioritization, ambulance case status, triage, assessment, and medication administration
- documenting conformance expectations for systems that create, receive, validate, and reuse emergency care data

## Scope

The current implementation focuses on:

- patient registration and identification for emergency events
- ambulance encounter and episode-of-care tracking
- vital signs, case assessment, and clinical condition capture
- diagnostic reporting, procedures, medications, allergies, and document handover
- structured terminology to support coordinated emergency response

## Key Artifacts

The IG currently includes profiles for `Patient`, `Encounter`, `EpisodeOfCare`,
`Condition`, `Observation`, `DiagnosticReport`, `Procedure`,
`MedicationAdministration`, `DocumentReference`, `QuestionnaireResponse`,
`Composition`, and `AllergyIntolerance`, together with supporting CodeSystems
and ValueSets for emergency workflows.

## Implementation Notes

This guide is intended to work alongside the broader Kenya interoperability
landscape, including Kenya core, patient summary, and claims-oriented
implementations where emergency data needs to be shared beyond the point of
care.

{% include ip-statements.xhtml %}

{% include cross-version-analysis.xhtml %}

{% include dependency-table.xhtml %}

{% include globals-table.xhtml %}
