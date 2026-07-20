Profile: EMAllergyIntolerance
Parent: AllergyIntolerance
Id: em-allergy-intolerance
Title: "AllergyIntolerance - Emergency Allergy or Intolerance"
Description: """
Represents a patient's allergy or intolerance recorded during Kenya emergency
medical services and facility workflows.

Criticality and reaction detail are must-fetch on patient lookup and must
never be silently dropped. By the time the allergy-history section of an
assessment is marked complete, the patient must have either one or more
EMAllergyIntolerance instances with a real allergen code, or exactly one
EMNoKnownAllergy instance — never both, never neither.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* clinicalStatus 1..1 MS
* clinicalStatus from $AllergyIntoleranceClinicalVS (required)
* clinicalStatus ^short = "Whether the allergy/intolerance is currently active"

* verificationStatus 1..1 MS
* verificationStatus from $AllergyIntoleranceVerificationVS (required)
* verificationStatus ^short = "Confidence level in this allergy record"
* verificationStatus ^definition = """
Emergency intake often captures this as patient/caller self-report — expect
'unconfirmed' to be common. Downstream systems must still display it
prominently rather than treating unconfirmed as 'not present'.
"""

* type 0..1
* type ^short = "Allergy versus intolerance"

* category 0..* MS
* category from $AllergyIntoleranceCategory (required)
* category ^short = "food | medication | environment | biologic"
* category ^definition = """
Medication allergies specifically are safety-critical for any drug about to be
administered in the field; populate whenever known.
"""

* criticality 1..1 MS
* criticality from $AllergyIntoleranceCriticality (required)
* criticality ^short = "Overall potential clinical harm from a future reaction"
* criticality ^definition = """
This is the field that should drive a prominent alert/banner on patient
lookup, more so than criticality being buried only in prose notes.
"""

* code 1..1 MS
* code from ActiveComponentsVS (extensible)
* code ^short = "The substance/allergen itself"

* patient 1..1 MS
* patient only Reference(Patient)
* patient ^short = "Patient with the allergy"

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Encounter during which this record was captured or updated"
* encounter ^definition = """
An allergy list is usually patient-level rather than encounter-specific, but
link it to EMPOCEncounter when newly captured during this episode so
provenance is clear.
"""

* onset[x] 0..1
* onset[x] only dateTime or Age or string

* recordedDate 0..1 MS
* recordedDate ^short = "When this record was captured"

* recorder 0..1 MS
* recorder only Reference(Practitioner or PractitionerRole or Patient or RelatedPerson)
* recorder ^short = "Who captured this record"

* asserter 0..1 MS
* asserter only Reference(Patient or RelatedPerson or Practitioner or PractitionerRole)
* asserter ^short = "Who originally reported the allergy"
* asserter ^definition = """
Often the patient or caller themselves in an emergency, not a clinician.
Important to distinguish self-reported (asserter=Patient/RelatedPerson,
likely paired with verificationStatus=unconfirmed) from clinically confirmed
allergies.
"""

* reaction 0..* MS
* reaction ^short = "Details of the actual reaction(s) previously experienced"
* reaction ^definition = """
Populate whenever any detail beyond the bare allergen code is known; a
criticality flag without reaction detail is much less actionable for a
treating clinician deciding on an alternative drug.
"""

* reaction.manifestation 1..* MS
* reaction.manifestation from ManifestationVS (extensible)
* reaction.manifestation ^short = "What the reaction looked like"

* reaction.severity 0..1 MS
* reaction.severity from $ReactionEventSeverity (required)
* reaction.severity ^short = "Severity of that specific reaction"
* reaction.severity ^definition = """
A 'severe' reaction history is exactly the kind of detail that should surface
immediately alongside criticality on patient lookup.
"""


// ============================================================================
// Explicit "No Known Allergy" assertion
// ============================================================================

Profile: EMNoKnownAllergy
Parent: EMAllergyIntolerance
Id: em-no-known-allergy
Title: "AllergyIntolerance - No Known Allergy"
Description: """
An explicit record asserting that a full allergy history was taken and
nothing was found, distinct from simply having zero AllergyIntolerance
resources.

The absence of any AllergyIntolerance resource is ambiguous — it could mean
'confirmed none' or 'never asked' — and that ambiguity is exactly the kind of
gap that can lead to a contraindicated drug being administered.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* clinicalStatus = $allergyintolerance-clinical#active
* clinicalStatus ^short = "Fixed to active — this assertion is itself an active record"

* code = $SCT#716186003 "No known allergy (situation)"
* code ^short = "Fixed to the SNOMED CT 'No known allergy (situation)' concept"

* recordedDate 1..1 MS
* recordedDate ^short = "When the no-known-allergy assertion was made"
* recordedDate ^definition = """
Timestamps when the history was actually taken, so a stale 'no known allergy'
from an earlier, less-thorough intake can be distinguished from a fresh one.
"""


// ============================================================================
// Criticality alert Flag
// ============================================================================

Profile: EMAllergyCriticalityFlag
Parent: Flag
Id: em-allergy-criticality-flag
Title: "Flag - Emergency Allergy Criticality Alert"
Description: """
A prominent, must-see alert referencing a high-criticality
EMAllergyIntolerance record.

Reuses the base FHIR Flag resource, designed exactly for prominent alerts,
rather than requiring every consuming system to know a local convention on
AllergyIntolerance. Intended for use specifically with EMAllergyIntolerance
instances where criticality = high.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status = #active
* status ^short = "Fixed to active while the underlying allergy remains high-criticality"

* category 0..1 MS
* category ^short = "Category of alert, e.g. clinical/safety"

* code 1..1 MS
* code ^short = "Summary of the high-criticality allergy, e.g. allergen and reaction"
* code ^definition = """
Should be populated from the referenced AllergyIntolerance.code and
criticality so the alert is meaningful without resolving the reference.
"""

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient the alert applies to"
