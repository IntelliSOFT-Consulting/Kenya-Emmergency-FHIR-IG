Profile: EMCondition
Parent: Condition
Id: em-condition
Title: "Condition - Emergency Diagnosis Staging"
Description: """
A specialization of Condition for emergency diagnosis staging. Do not reuse
this profile for a generic/routine-visit Condition.

One emergency encounter (EMIncidentEncounter/EMPOCEncounter/a downstream ED
Encounter) is expected to produce multiple Condition instances over time — one
per diagnostic stage — distinguished by category and verificationStatus, and
never overwritten in place: chief-complaint (minimum 1), working-diagnosis or
differential-diagnosis (0..*), and discharge-diagnosis (0..*, required before
the encounter can be considered diagnostically closed for claims purposes,
though that is an encounter-closure business rule rather than a FHIR
cardinality constraint on this profile).
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* identifier 0..*
* identifier ^short = "Optional local identifier for this diagnosis entry"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient this diagnosis concerns"

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Encounter this diagnosis was recorded in"
* encounter ^definition = """
The primary linkage a claims pipeline reads to associate a diagnosis with the
correct billable encounter and its stage.
"""

* category 1..1 MS
* category from EMDiagnosisCategoryVS (extensible)
* category ^short = "Which diagnostic stage this instance represents"
* category ^definition = """
The single most important element on this profile — claims-mapping logic must
read this before deciding which diagnosis code to submit for adjudication.
Also carry the base condition-category code (problem-list-item |
encounter-diagnosis) as a second Coding within the same CodeableConcept if
base-spec conformance is required alongside the local staging value.
"""

* verificationStatus 1..1 MS
* verificationStatus from $ConditionVerificationStatusVS (required)
* verificationStatus ^short = "Confidence level of this diagnosis entry"
* verificationStatus ^definition = """
Expected progression: chief-complaint typically 'unconfirmed' (it is not yet a
diagnosis); working-diagnosis typically 'provisional' or 'differential';
discharge-diagnosis typically 'confirmed'. Never submit a claim against a
'provisional' or 'differential' instance as if it were 'confirmed' — see
invariant em-condition-1.
"""

* clinicalStatus 1..1 MS
* clinicalStatus from $ConditionClinicalStatusVS (required)
* clinicalStatus ^short = "Whether the condition is currently active"
* clinicalStatus ^definition = """
Typically 'active' for all three emergency stages — 'resolved'/'inactive' are
rare in an acute encounter but keep the element populated for consistency with
facility-side Condition records that will later track resolution.
"""

* code 1..1 MS
* code from http://hl7.org/fhir/ValueSet/condition-code (extensible)
* code ^short = "The diagnosis or complaint code"
* code ^definition = """
For category=chief-complaint, code a symptom/complaint (see ManifestationVS)
rather than forcing an ICD diagnosis code — a chief complaint is not yet a
diagnosis. For working-diagnosis/discharge-diagnosis, use an ICD diagnosis
code system consistent with the existing standards stack. Source systems have
been observed sending ICD-11-pattern values here; confirm the authoritative
code system with the vendor and terminology team before finalizing this
binding.
"""

* severity 0..1 MS
* severity from http://hl7.org/fhir/ValueSet/condition-severity (extensible)
* severity ^short = "Triage-linked acuity/severity marker for this diagnosis"
* severity ^definition = """
Not every stage carries a severity marker (rarely meaningful on a
chief-complaint), but when present this feeds billing tier / benefit
classification, so the profile must be able to carry it.
"""

* bodySite 0..*
* bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)
* bodySite ^short = "Anatomical site(s) relevant to the diagnosis"
* bodySite ^definition = """
Deliberately 0..* rather than 0..1 so trauma cases with multiple co-occurring
diagnoses across different body sites are supported without forcing an
artificial single 'primary site'.
"""

* onsetDateTime 0..1 MS
* onsetDateTime ^short = "When the condition/symptom is believed to have started"
* onsetDateTime ^definition = """
Granular timing matters for time-sensitive protocols (stroke/MI 'minutes
matter'). Capture relative to the parent encounter's period.start where the
exact onset time is unknown but time-since-arrival is clinically meaningful.
"""

* recordedDate 1..1 MS
* recordedDate ^short = "When this diagnosis entry was recorded"
* recordedDate ^definition = """
Distinct from onset. Lets the staging timeline be reconstructed (e.g.
chief-complaint recorded at T0, working-diagnosis at T+12min, discharge
diagnosis at T+90min) even when clinical onset itself is unclear or unknown.
"""

* abatement[x] 0..0
* abatement[x] ^short = "Not permitted — see invariant em-condition-2"

* recorder 0..1 MS
* recorder only Reference(Practitioner or PractitionerRole)
* recorder ^short = "Who recorded this diagnosis entry"
* recorder ^definition = """
Will differ by stage — e.g. an EMT for working-diagnosis, an ED physician for
discharge-diagnosis.
"""

* asserter 0..1
* asserter only Reference(Patient or RelatedPerson or Practitioner or PractitionerRole)
* asserter ^short = "Who originally asserted this diagnosis or complaint"
* asserter ^definition = """
For category=chief-complaint this is often the patient or caller themselves,
not a clinician — distinguishes 'patient said chest pain' (asserter=Patient)
from 'EMT suspects ACS' (asserter=Practitioner).
"""

* evidence 0..*
* evidence ^short = "Supporting evidence (labs/imaging) for a working or discharge diagnosis"
* evidence ^definition = """
Not typically populated at the EMS/point-of-care stage; expect this to
populate later once the patient reaches facility-based workup.
"""

* note 0..*
* note ^short = "Free-text clinical notes about this diagnosis entry"

* obeys em-condition-1
* obeys em-condition-2
