Profile: EMMedicationAdministration
Parent: MedicationAdministration
Id: em-medication-administration
Title: "MedicationAdministration - Emergency Medication Administration"
Description: """
Represents a medication administered to a patient during Kenya emergency
medical services and facility clinical workflows.

Used instead of MedicationRequest because emergency care is
administration-heavy — drugs are given in real time, not merely prescribed.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* extension contains
    EMAdministrationAttempts named administrationAttempts 0..1 MS

* extension[administrationAttempts] ^short =
    "Number of attempts made to administer this medication"

* status 1..1 MS
* status from $MedicationAdminStatus (required)
* status ^short = "Workflow status of the administration"
* status ^definition = """
'not-done' matters — capture an attempted-but-withheld administration (e.g. an
allergy caught just in time), not just successful ones.
"""

* medicationCodeableConcept 1..1 MS
* medicationCodeableConcept from ActiveComponentsVS (extensible)

* medicationCodeableConcept ^short = "The drug administered"
* medicationCodeableConcept ^definition = """
Use medicationCodeableConcept rather than medicationReference(Medication)
unless a Medication resource catalog is already maintained — simpler for a
field EMT application.
"""

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient who received the medication"

* context 1..1 MS
* context only Reference(Encounter)
* context ^short = "Encounter the administration occurred in, typically EMPOCEncounter"
* context ^definition = """
Tightened from the base spec's optional binding, since every emergency drug
administration must be traceable to a specific encounter for both clinical and
claims purposes.
"""

* effective[x] 1..1 MS
* effective[x] only dateTime or Period
* effective[x] ^short = "Exact time the drug was given, or start/end for an infusion"
* effective[x] ^definition = """
The core real-time administration record; exact timing matters for
drug-interaction windows and protocol timing, e.g. epinephrine redosing
intervals in resuscitation.
"""

* performer 0..* MS
* performer ^short = "Who administered the medication"

* performer.actor 1..1 MS
* performer.actor only Reference(Practitioner or PractitionerRole)
* performer.actor ^short = "EMT or clinician who gave the drug"

* reasonCode 0..1
* reasonCode from http://hl7.org/fhir/ValueSet/condition-code (extensible)
* reasonCode ^short = "Why the medication was given"

* reasonReference 0..* MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Condition being treated"

* dosage 0..1 MS
* dosage ^short = "Dose, route, and rate of administration"
* dosage ^definition = """
Strongly recommended given the clinical/legal weight of dosing accuracy, but
not forced to 1..1 to avoid rejecting a record if a field app fails to capture
structured dosage in a chaotic scene.
"""

* dosage.dose 0..1 MS
* dosage.dose from DoseUnitsVS (extensible)
* dosage.dose ^short = "The amount given, e.g. 1 mg, 0.3 mg"

* dosage.route 0..1 MS
* dosage.route from MedicationAdministrationRouteVS (extensible)
* dosage.route ^short = "Route of administration, e.g. IV, IM, IO, inhaled"
* dosage.route ^definition = """
Route materially changes onset/effect and is frequently reviewed in case
audits; populate whenever the dosage element itself is used.
"""

* dosage.rate[x] 0..1
* dosage.rate[x] ^short = "Infusion rate, if given as a continuous infusion rather than a bolus"

* note 0..*
* note ^short = "Free-text notes about the administration"
