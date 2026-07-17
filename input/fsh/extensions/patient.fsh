// ==========================================================================
// Kenya Emergency Patient Extensions
// ==========================================================================


// --------------------------------------------------------------------------
// Unidentified Patient
// --------------------------------------------------------------------------

Extension: EMUnidentifiedPatient
Id: em-unidentified-patient
Title: "Emergency Unidentified Patient"
Description: """
Indicates whether the Patient resource represents an individual whose
identity has not yet been established.
"""
Context: Patient

* extension 0..0
* value[x] only boolean
* valueBoolean 1..1 MS

* valueBoolean ^short =
    "Whether the patient is currently unidentified"

* valueBoolean ^definition = """
A value of true indicates that the patient's identity has not yet been
established. A value of false indicates that the patient is known or has
subsequently been identified.
"""


// --------------------------------------------------------------------------
// Patient Identity Verified
// --------------------------------------------------------------------------

Extension: EMPatientIdentityVerified
Id: em-patient-identity-verified
Title: "Emergency Patient Identity Verified"
Description: """
Indicates whether the patient's identity has been verified through an
appropriate identification or verification process.
"""
Context: Patient

* extension 0..0
* value[x] only boolean
* valueBoolean 1..1 MS

* valueBoolean ^short =
    "Whether the patient's identity has been verified"

* valueBoolean ^definition = """
A value of true indicates that the patient's identity has been confirmed
using an appropriate identification document or verification process.
"""


// --------------------------------------------------------------------------
// Approximate Age
// --------------------------------------------------------------------------

Extension: EMApproximateAge
Id: em-approximate-age
Title: "Emergency Patient Approximate Age"
Description: """
Represents the patient's estimated age when the exact date of birth is
unknown or has not been verified.
"""
Context: Patient

* extension 0..0
* value[x] only Age
* valueAge 1..1 MS

* valueAge ^short =
    "Estimated age of the patient"

* valueAge ^definition = """
The estimated age of the patient when an exact and verified date of birth
is unavailable. This value must not be used to generate an artificial
Patient.birthDate.
"""

* valueAge.value 1..1 MS
* valueAge.value ^short =
    "Numeric approximate age"

* valueAge.unit 1..1 MS
* valueAge.unit ^short =
    "Human-readable age unit"

* valueAge.system 1..1 MS
* valueAge.system = "http://unitsofmeasure.org" (exactly)

* valueAge.code 1..1 MS
* valueAge.code ^short =
    "UCUM age unit code"


// --------------------------------------------------------------------------
// Adult Status
// --------------------------------------------------------------------------

Extension: EMIsAdult
Id: em-is-adult
Title: "Emergency Patient Adult Status"
Description: """
Indicates whether the patient is considered an adult during emergency
assessment or triage.
"""
Context: Patient

* extension 0..0
* value[x] only boolean
* valueBoolean 1..1 MS

* valueBoolean ^short =
    "Whether the patient is considered an adult"

* valueBoolean ^definition = """
A triage-level assertion indicating whether the patient is considered an
adult. This may be recorded when the exact date of birth or approximate age
is not yet available.
"""