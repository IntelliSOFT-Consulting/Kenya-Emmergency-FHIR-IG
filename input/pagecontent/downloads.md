### Downloads

This page provides downloadable artefacts for implementers integrating with the Kenya
Emergency FHIR Implementation Guide.

---

#### FHIR Package

The FHIR NPM package contains all compiled profiles, extensions, value sets, code systems, and
example instances as FHIR R4 JSON resources, suitable for loading into any FHIR validator or
server.

| Resource | Format | Description |
|---|---|---|
| `fhir.kenyaEmergencyIG-0.1.0.tgz` | NPM Package (`.tgz`) | Full IG FHIR NPM package |
| `package.json` | JSON | Package manifest |

<div class="em-info-box">
  <strong>Package ID:</strong> <code>fhir.kenyaEmergencyIG</code><br/>
  <strong>Version:</strong> <code>0.1.0</code><br/>
  <strong>FHIR Version:</strong> <code>4.0.1</code><br/>
  <strong>Canonical:</strong> <code>https://nshr-uat.sha.go.ke/fhir</code>
</div>

---

#### Validation

To validate FHIR resources against this IG, use the HL7 FHIR Validator with this package loaded:

```
java -jar validator_cli.jar <resource.json> \
  -ig fhir.kenyaEmergencyIG#0.1.0 \
  -version 4.0.1
```

Alternatively, validate online at [validator.fhir.org](https://validator.fhir.org) by loading the
package from this IG.

---

#### Source Files

The FSH source files for this IG are organised into the following structure:

```
input/fsh/
  aliases.fsh                     — External ValueSet and identifier-system aliases
  rulesets/
    ruleSets.fsh                  — Shared FSH rule sets (identifier, reference, codeable-concept)
  terminology/
    codeSystem.fsh                — All local CodeSystem definitions
    valueSet.fsh                  — All local ValueSet definitions
  invariants/
    encounter.fsh                 — EMIncidentEncounter / EMPOCEncounter constraints
    patient.fsh                   — KenyaEmergencyPatient constraints
    observation.fsh               — Caller-reported observation constraints
    clinical-profiles.fsh         — Condition, exam, and vitals constraints
  extensions/
    encounter.fsh                 — Caller, supporting agency, responding unit, crew member
    patient.fsh                   — Unidentified/verified/approximate-age/is-adult
    facility.fsh                  — Facility level, emergency-centre capability
    episode-of-care.fsh           — Incident priority, number of patients
    clinical-profiles.fsh         — Vitals, exam, medication, responder-unit extensions
  profile/
    patient.fsh                   — KenyaEmergencyPatient
    episode-of-care.fsh           — EMEpisodeOfCare
    incident-encounter.fsh        — EMIncidentEncounter, EMResponderUnit, EMResponderUnitLocation
    poc-encounter.fsh             — EMPOCEncounter
    location.fsh                  — EMSceneLocation
    facility.fsh                  — EMDestinationFacility
    condition.fsh                 — EMCondition
    allergyIntolerance.fsh        — EMAllergyIntolerance, EMNoKnownAllergy, EMAllergyCriticalityFlag
    procedure.fsh                 — EMProcedure
    medication.fsh                — EMMedicationAdministration
    diagnosticReport.fsh          — EMDiagnosticReport
    vital-signs.fsh               — EMVitalSignsObservation, EMTriageAcuityObservation
    physical-exam.fsh             — EMSecondarySurveyObservation
    observation.fsh               — Caller-reported observation profiles
    composition.fsh, documentReference.fsh, questionnaire-response.fsh, case-assessment.fsh
  examples/
    episode-of-care.fsh, support-chain.fsh, clinical-profile-examples.fsh, profile-examples.fsh
```

---

#### External Terminology Dependencies

This IG references the following external terminology servers. Implementers must have access
to these servers for full terminology validation:

| Terminology | Server | Organisation |
|---|---|---|
| KNHTS Clinical Value Sets | `https://ilm-hie.dha.go.ke/ocl/` | Digital Health Agency (DHA) |
| PPB Generic Products | `https://ilm-hie.dha.go.ke/ocl/orgs/MOH-PPB/` | Pharmacy and Poisons Board (PPB) |
| SHA Interventions | `https://ilm-hie.dha.go.ke/ocl/orgs/MOH-KENYA/` | Social Health Authority (SHA) |
| SNOMED CT | `https://snomed.info/sct` | SNOMED International |
| LOINC | `https://loinc.org` | Regenstrief Institute |

---

#### Contact

For technical queries about implementation:

- **Email:** [info@dha.go.ke](mailto:info@dha.go.ke)
- **Website:** [https://dha.go.ke](https://dha.go.ke)
