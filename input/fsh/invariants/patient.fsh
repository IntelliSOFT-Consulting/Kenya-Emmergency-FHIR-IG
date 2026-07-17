Invariant: EMPatientIdentifierRequired
Description: """
The patient must have either an official national identifier or an emergency
temporary tracking number.
"""
Expression: """
identifier.where(
  system = 'http://hie.go.ke/fhir/identifier/national-id'
  or
  system = 'http://hie.go.ke/fhir/identifier/patient-temp-tracking'
).exists()
"""
Severity: #error

Invariant: EMPatientUnknownRequiresTemporaryIdentifier
Description: """
An unidentified patient must have an emergency temporary tracking number.
"""
Expression: """
extension.where(
  url = 'http://hie.go.ke/fhir/StructureDefinition/em-unidentified-patient'
).valueBoolean = true implies
identifier.where(
  system = 'http://hie.go.ke/fhir/identifier/patient-temp-tracking'
).exists()
"""
Severity: #error

Invariant: EMPatientVerifiedIdentityRequirements
Description: """
When identity verification is true, the patient must no longer be marked as
unidentified and must have an official identifier.
"""
Expression: """
extension.where(
  url = 'http://hie.go.ke/fhir/StructureDefinition/em-patient-identity-verified'
).valueBoolean = true implies (
  extension.where(
    url = 'http://hie.go.ke/fhir/StructureDefinition/em-unidentified-patient'
  ).valueBoolean = false
  and
  identifier.where(
    system = 'http://hie.go.ke/fhir/identifier/national-id'
  ).exists()
)
"""
Severity: #error

Invariant: EMPatientBirthDateOrApproximateAge
Description: """
The patient should not have both an exact birth date and an approximate age.
"""
Expression: """
birthDate.exists() implies
extension.where(
  url = 'http://hl7.org/fhir/StructureDefinition/patient-age'
).empty()
"""
Severity: #error

Invariant: EMPatientInactiveRequiresReplacement
Description: """
An inactive emergency Patient record must identify its replacement through
Patient.link using the replaced-by relationship.
"""
Expression: """
active = false implies
link.where(type = 'replaced-by').other.exists()
"""
Severity: #error