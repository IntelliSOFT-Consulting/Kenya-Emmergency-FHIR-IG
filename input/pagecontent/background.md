### Background

#### Kenya's Emergency Care Burden

Road traffic injuries, acute cardiovascular events, obstetric emergencies, and trauma are
leading causes of preventable death in Kenya. Pre-hospital emergency medical services (EMS)
are expanding rapidly across county governments and private ambulance providers, but the
information generated during a response — dispatch details, on-scene assessment, vitals,
treatment given, and handover — has historically been captured on paper or in disconnected
systems, and is frequently lost by the time a patient reaches definitive care.

<div class="em-info-box">
  <strong>Why This Matters</strong>
  A structured, computable emergency record means a receiving facility clinician can see the
  patient's chief complaint, vital-sign trend, allergies, and field treatment the moment the
  ambulance arrives — instead of reconstructing it from a verbal handover under time pressure.
</div>

---

#### Emergency Medical Services in Kenya

EMS delivery in Kenya spans county-government ambulance services, the National Ambulance
Programme, private providers, and community first-responder networks, coordinated through
dispatch or computer-aided dispatch (CAD) systems. A single emergency episode typically moves
through several distinct stages that this IG models explicitly:

- **Dispatch and incident creation** — the call is received, triaged, and an ambulance or
  responder unit is assigned
- **Scene response and point-of-care assessment** — the responding team assesses and treats
  the patient at the scene and during transport
- **Facility handover** — responsibility for the patient transfers to the receiving facility

Each of these stages generates data that must remain linked and time-stamped across the whole
episode, even when the patient's identity is not yet known at the start of the call.

---

#### Digital Health Agency (DHA) Role

The **Digital Health Agency (DHA)**, established under the Kenya Health Policy 2014–2030 and
the Kenya Digital Health Act, is the statutory body responsible for coordinating digital
health infrastructure in Kenya. DHA's mandate includes:

- Developing and maintaining national health information systems
- Setting interoperability standards for health data exchange
- Managing the Kenya Health Information System (KHIS/DHIS2)
- Publishing and maintaining national FHIR Implementation Guides
- Operating the Kenya National Health Terminology Service (KNHTS)

This Emergency FHIR IG is one of a suite of DHA-published IGs that together form the
**Kenya National Health Information Interoperability Framework (NHIIF)**.

---

#### Policy and Legislative Context

| Policy / Act | Relevance |
|---|---|
| Kenya Health Policy 2014–2030 | Mandates a functional, coordinated emergency medical services system |
| Kenya Digital Health Act (2023) | Establishes DHA and mandates interoperability standards |
| Social Health Insurance Act (2023) | Establishes SHA as the universal health coverage insurer |
| National Emergency Medical Care policy framework | Guides pre-hospital and referral EMS standards |

---

#### Social Health Authority (SHA) Integration

The **Social Health Authority (SHA)** replaced the National Health Insurance Fund (NHIF) as
Kenya's universal health coverage insurer under the Social Health Insurance Act of 2023.
Emergency and ambulance services are a covered SHA benefit. Profiles in this IG — Encounter,
Condition, Procedure, and MedicationAdministration in particular — are designed so that a
single incident's data can be assembled into a claim without re-entry, using the diagnosis
staging pattern (chief complaint → working diagnosis → discharge diagnosis) to determine
which diagnosis is submitted for adjudication.

---

#### Relationship to International Standards

This IG aligns with and references the following international standards:

- **HL7 FHIR R4** — Base specification for all profiles
- **SNOMED CT** — Clinical terminology for conditions, procedures, findings, and body sites
- **LOINC** — Codes for vital signs, Glasgow Coma Scale components, and investigations
- **UCUM** — Units of measure for all quantitative observations and dosing

---

{% include dependency-table.xhtml %}

{% include cross-version-analysis.xhtml %}
