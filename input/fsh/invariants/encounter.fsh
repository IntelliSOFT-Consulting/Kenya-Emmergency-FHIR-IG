Invariant: em-incident-1
Description: """
The Encounter period end must not occur before the Encounter period start.
"""
Severity: #error
Expression: """
period.end.empty() or period.start.empty() or period.end >= period.start
"""

Invariant: em-incident-2
Description: """
The incident identifier must match the incident identifier on the referenced
EpisodeOfCare when the EpisodeOfCare can be resolved by the validator.
"""
Severity: #error
Expression: """
episodeOfCare.resolve().exists() implies
(
  episodeOfCare.resolve().identifier
    .where(system = 'http://hie.go.ke/fhir/identifier/incident-id')
    .value
  =
  identifier
    .where(system = 'http://hie.go.ke/fhir/identifier/incident-id')
    .value
)
"""

Invariant: em-incident-3
Description: """
The caller cannot be identified as the patient unless the caller reference
resolves to the same Patient referenced by Encounter.subject.
"""
Severity: #error
Expression: """
extension
  .where(url = 'http://hie.go.ke/fhir/StructureDefinition/em-incident-caller')
  .extension
  .where(url = 'isPatient')
  .valueBoolean = true
implies
extension
  .where(url = 'http://hie.go.ke/fhir/StructureDefinition/em-incident-caller')
  .extension
  .where(url = 'individual')
  .valueReference.reference = subject.reference
"""


Invariant: em-eoc-1
Description: """
The EpisodeOfCare period end must not occur before the period start.
"""
Severity: #error
Expression: """
period.end.empty() or period.end >= period.start
"""


Invariant: em-poc-1
Description: """
The point-of-care Encounter period end must not occur before its period start.
"""
Severity: #error
Expression: """
period.end.empty() or period.start.empty() or period.end >= period.start
"""

Invariant: em-ed-1
Description: """
The emergency department Encounter period end must not occur before its
period start.
"""
Severity: #error
Expression: """
period.end.empty() or period.start.empty() or period.end >= period.start
"""

Invariant: em-scene-1
Description: """
The scene Location must contain at least a name, alias, description, address,
or geographic position.
"""
Severity: #error
Expression: """
name.exists() or alias.exists() or description.exists() or
address.exists() or position.exists()
"""