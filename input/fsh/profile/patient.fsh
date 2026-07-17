
Profile: KenyaEmergencyPatient
Parent: Patient
Id: kenya-emergency-patient
Title: "Patient - Kenya Emergency"
Description: """
Represents a patient receiving pre-hospital or emergency services in Kenya.

The profile supports identified and unidentified patients, temporary emergency
tracking, identity verification, minimal emergency demographics, and
reconciliation of temporary Patient records with verified Patient records.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false

* extension contains
    EMUnidentifiedPatient named unidentifiedPatient 1..1 MS and
    EMPatientIdentityVerified named patientIdentityVerified 0..1 MS and
    EMApproximateAge named approximateAge 0..1 MS and
    EMIsAdult named isAdult 0..1 MS

* extension[unidentifiedPatient] ^short =
    "Whether the patient's identity is currently unknown"

* extension[unidentifiedPatient] ^definition = """
Indicates whether this Patient resource currently represents an unidentified
individual.

A value of true means that the patient's identity has not yet been established.
A value of false means that the patient is known or has been identified.
"""

* extension[patientIdentityVerified] ^short =
    "Whether the patient's identity has been verified"

* extension[patientIdentityVerified] ^definition = """
Indicates whether the patient's identity has been confirmed through an
appropriate identification or verification process.

This extension may remain absent until an identity verification attempt has
been performed.
"""

* extension[approximateAge] ^short =
    "Estimated age when the exact date of birth is unavailable"

* extension[approximateAge] ^definition = """
Represents the patient's estimated age when an exact and verified date of birth
is unavailable.

An artificial Patient.birthDate must not be calculated from this value.
"""

* extension[isAdult] ^short =
    "Triage-level adult or minor status"

* extension[isAdult] ^definition = "Indicates whether the patient is considered an adult during emergency triage.This assertion is captured independently of birthDate and approximateAge because it may be required immediately for clinical protocol and consent decisions."
 
* identifier 0..* MS

* identifier ^short =
    "Official or temporary identifiers assigned to the patient"

* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false

* identifier contains
    nationalId 0..1 MS and
    tempTrackingNumber 0..1 MS
 
* identifier[nationalId] ^short = "Known patient's official identifier"

* identifier[nationalId] ^definition = "An official identifier presented or verified for the patient, such as a Kenyan National ID, passport, Alien ID, or Huduma Namba."

* identifier[nationalId].use 0..1 MS

* identifier[nationalId].system 1..1 MS
* identifier[nationalId].system = $OfficialIdentifierSystem (exactly)

* identifier[nationalId].type 0..1 MS
* identifier[nationalId].type from $EMIdentifierTypeVS (required)

* identifier[nationalId].value 1..1 MS

* identifier[nationalId].value ^short =
    "Literal official identification number"
 
* identifier[tempTrackingNumber] ^short =
    "Emergency temporary patient tracking number"

* identifier[tempTrackingNumber] ^definition = "A system-generated tracking number assigned when the patient's identity is unknown during emergency intake.The tracking number carries the patient through the emergency workflow until the identity is established and the temporary record is reconciled."

* identifier[tempTrackingNumber].use 1..1 MS
* identifier[tempTrackingNumber].use = #temp (exactly)

* identifier[tempTrackingNumber].system 1..1 MS
* identifier[tempTrackingNumber].system =
    $TemporaryTrackingSystem (exactly)

* identifier[tempTrackingNumber].value 1..1 MS

* identifier[tempTrackingNumber].value ^short =
    "System-generated emergency tracking number"
 
* active 1..1 MS

* active ^short =
    "Whether the Patient record remains in active use"

* active ^definition = "Indicates whether this Patient record is currently active. A temporary unidentified Patient record remains active while it is being used. It may be set to false after the record has been superseded and linked to a verified Patient record."


 
* name 0..1 MS

* name ^short =
    "Known or operational patient name"

* name ^definition = "The patient's name when known.For an unidentified patient, name.text should contain a human-readable placeholder such as 'Unknown Male' or 'Unknown Female' so the Patient remains recognisable in emergency worklists."

* name.text 0..1 MS

* name.text ^short =
    "Full patient name or unidentified-patient display name"

* name.text ^definition = "The patient's complete name as a single display string or an operational placeholder for an unidentified patient"

* name.family 0..1

* name.given 0..*

 
* gender 0..1 MS

* gender ^short =
    "Administrative gender recorded during emergency assessment"

* gender ^definition = "Administrative gender of the patient.Use the code unknown when the patient's gender cannot be determined rather than making an unsupported assumption."

* gender from $AdministrativeGenderVS (required)

 
* birthDate 0..1 MS

* birthDate ^short =
    "Exact and verified date of birth"

* birthDate ^definition = "The patient's exact date of birth when known or verified.An estimated date of birth must not be calculated from the approximateAge extension."

 
* deceased[x] 0..1 MS

* deceasedBoolean ^short =
    "Whether the patient has been pronounced deceased"

* deceasedBoolean ^definition = "Indicates whether the patient has been pronounced deceased when the exact time of death is not recorded."

* deceasedDateTime ^short =
    "Known date and time of death"

* deceasedDateTime ^definition = "The known date and time at which the patient died or was pronounced deceased.Use this element instead of deceasedBoolean when the time is available."

 
* telecom 0..*

* telecom ^short =
    "Patient contact details when available"

* telecom ^definition = "Telephone or other contact information collected opportunistically during the emergency episode.This element is not marked Must Support because contact information is frequently unavailable during emergency intake."

* address 0..*

* address ^short =
    "Patient home address when available"

* address ^definition = "The patient's home address when known.This element is not marked Must Support because address information is rarely available during emergency intake and may be completed later during facility registration."
 
* link 0..* MS

* link ^short =
    "Link to another Patient record for the same individual"

* link ^definition = "Links a temporary or duplicate Patient record to another Patient resource representing the same individual.When the identity of an unidentified patient is confirmed, the temporary Patient record should be linked to the verified Patient record instead of overwriting the temporary identifier, preserving the emergency audit trail."

* link.other 1..1 MS
* link.other only Reference(Patient)

* link.other ^short =
    "Other Patient record representing the same individual"

* link.other ^definition = "Reference to the verified, replacement, or otherwise related Patient resource."

* link.type 1..1 MS
* link.type from $PatientLinkTypeVS (required)

* link.type ^short =
    "Nature of the relationship between the Patient records"

* link.type ^definition = "The relationship between this Patient record and the referenced Patient record.Use replaced-by on an inactive temporary Patient record that has been superseded by a verified Patient record."