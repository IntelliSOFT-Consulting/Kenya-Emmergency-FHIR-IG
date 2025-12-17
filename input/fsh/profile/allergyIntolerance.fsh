Profile: KenyaAllergyIntolerance
Parent: AllergyIntolerance
Id: kenya-allergy-intolerance
Title: "AllergyIntolerance – Kenya Allergy Profile"
Description: "Represents patient allergies and intolerances recorded in Kenya EMS and facility workflows."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya allergy profile"

* insert IdentifierRequiredRule(identifier, 1..*)

* clinicalStatus 0..1 MS
* clinicalStatus ^short = "Clinical status of the allergy"

* verificationStatus 0..1 MS
* verificationStatus ^short = "Verification status of the allergy"

* code 1..1 MS
* code ^short = "Allergy code (OCL)"

* patient 1..1 MS
* patient only Reference(Patient)
* patient ^short = "Patient with the allergy"

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Encounter when the allergy was identified"

* recordedDate 0..1 MS
* recordedDate ^short = "Date when the allergy was recorded"

* recorder 0..1 MS
* recorder only Reference(Practitioner)
* recorder ^short = "Who recorded the allergy"

* asserter 0..1 MS
* asserter only Reference(Patient or Practitioner)
* asserter ^short = "Who reported the allergy"

* reaction 0..* MS
* reaction ^short = "Adverse reaction details"

* reaction.manifestation 1..* MS
* reaction.manifestation ^short = "Clinical manifestations of the reaction"

