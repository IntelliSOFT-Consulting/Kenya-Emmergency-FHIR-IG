<div class="em-hero">
  <span class="hero-badge">Draft · Version 0.1.0 · FHIR R4</span>
  <h1>Kenya Emergency FHIR Implementation Guide</h1>
  <p class="hero-subtitle">
    Standardizing emergency-care data exchange from <strong>dispatch and ambulance response</strong>
    through <strong>point-of-care treatment</strong> and <strong>facility handover</strong>, across
    Kenya's emergency medical services and the Social Health Authority (SHA) claims system.
  </p>
</div>

<div class="em-stats">
  <div class="em-stat-card">
    <span class="stat-number">27</span>
    <span class="stat-label">FHIR Profiles</span>
  </div>
  <div class="em-stat-card">
    <span class="stat-number">23</span>
    <span class="stat-label">Extensions</span>
  </div>
  <div class="em-stat-card">
    <span class="stat-number">41</span>
    <span class="stat-label">Value Sets</span>
  </div>
  <div class="em-stat-card">
    <span class="stat-number">141</span>
    <span class="stat-label">Code Systems</span>
  </div>
</div>

### About This Guide

This Implementation Guide (IG) defines the FHIR R4 data exchange specification for
**Kenya's Emergency Medical Services (EMS)**, published by the
**Digital Health Agency (DHA)** under the Ministry of Health, Republic of Kenya.

The Emergency IG enables interoperable, structured exchange of pre-hospital and point-of-care
data — including dispatch and incident information, responder units and crew, on-scene and
in-transit clinical assessment, allergies, diagnoses, procedures, medication administration,
investigations, and facility handover — across Kenya's ambulance, EMS, and receiving-facility
systems.

<div class="em-info-box">
  <strong>Current Status: Draft (CI Build)</strong>
  This Implementation Guide is under active development. Content is subject to change.
  Feedback and contributions are welcome via the
  <a href="https://dha.go.ke" no-external="true">Digital Health Agency</a>.
</div>

---

### Scope of This Guide

<div class="em-card-grid">

<div class="em-card">
  <h3>Dispatch and Incident</h3>
  The root emergency incident encounter, capturing dispatch information, the reporting caller,
  responding units, participating agencies, scene location, and destination facility.
</div>

<div class="em-card">
  <h3>Point-of-Care Encounter</h3>
  Direct patient-care encounters performed at the scene or during transport, linked to the
  root incident and carrying clinical acuity assigned after assessment.
</div>

<div class="em-card">
  <h3>Responder Units and Crew</h3>
  Ambulances and other mobile response units, their operational status, ownership, real-time
  position, response status, and assigned crew.
</div>

<div class="em-card">
  <h3>Clinical Assessment</h3>
  Vital signs (including panel vitals such as blood pressure and Glasgow Coma Scale), triage
  acuity, and a structured secondary-survey exam profile with an explicit no-findings pattern
  for every body region.
</div>

<div class="em-card">
  <h3>Diagnosis Staging</h3>
  A dedicated Condition profile that tracks the diagnosis lifecycle — chief complaint, working
  or differential diagnosis, and discharge diagnosis — as distinct, staged instances.
</div>

<div class="em-card">
  <h3>Allergies and Safety</h3>
  Allergy and intolerance records with an explicit "no known allergy" assertion, distinct from
  simply having none on file, plus a criticality alert Flag for must-see safety information.
</div>

<div class="em-card">
  <h3>Procedures and Medication</h3>
  Emergency procedures and real-time medication administration, including dosage, route, and
  administration attempts.
</div>

<div class="em-card">
  <h3>Investigations and Handover</h3>
  Diagnostic reports (e.g. 12-lead ECG), and the composition, document, and questionnaire
  structures used to hand the patient over to a receiving facility.
</div>

</div>

---

### Design Principles

This IG is built on the following principles aligned with Kenya's national digital health strategy:

- **FHIR R4 Compliance** — All profiles are valid FHIR R4 constraints that do not relax base
  resource cardinalities or override required terminology bindings.
- **Kenya-first Terminology** — Value sets and code systems reference the Kenya National Health
  Terminology Service (KNHTS) hosted at `ilm-hie.dha.go.ke`, the Kenya Pharmaceutical and
  Poisons Board (PPB), and local Ministry of Health code lists alongside SNOMED CT and LOINC.
- **Interoperability with KHIS/SHA** — Resources are designed for exchange with the Kenya Health
  Information System (KHIS) and the Social Health Authority (SHA) claims platform.
- **Never-ambiguous safety data** — Profiles such as the no-known-allergy assertion and the
  exam no-findings pattern exist specifically so that "not recorded" and "confirmed absent" can
  never be confused in a time-critical emergency record.
- **Extensibility** — Extensions follow FHIR best practices and are named, typed, and scoped
  to the resources they extend.

---

### Relationship to Other Kenya Health IGs

| Implementation Guide | Relationship |
|---|---|
| Kenya Core FHIR IG | This IG builds on Kenya Core Patient, Practitioner, and Organization profiles |
| Kenya NCCP FHIR IG | Sibling Digital Health Agency IG for the National Cancer Control Programme |
| SHA Claims IG | Encounter, Condition, Procedure, and MedicationAdministration profiles are designed to feed SHA claims adjudication workflows |

---

### How to Read This Guide

- **[Background](background.html)** — Policy context and the emergency-care handover problem
  this IG addresses
- **[Use Cases](use-cases.html)** — Supported clinical workflows and data exchange scenarios
- **[Artifacts](artifacts.html)** — All FHIR profiles, extensions, value sets, code systems, and
  example instances
- **[Downloads](downloads.html)** — Package downloads and integration resources

---

<div class="em-info-box green">
  <strong>Contact and Feedback</strong>
  For questions about this Implementation Guide, contact the Digital Health Agency FHIR Team
  at <a href="mailto:info@dha.go.ke">info@dha.go.ke</a> or visit
  <a href="https://dha.go.ke" no-external="true">dha.go.ke</a>.
</div>

---

{% include globals-table.xhtml %}

{% include ip-statements.xhtml %}
