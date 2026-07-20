Extension: EMIncidentCaller
Id: em-incident-caller
Title: "Emergency Incident Caller"
Description: """
Captures the person who reported the emergency incident.

The caller may be the Patient, a person related to the Patient, or an unlinked
person such as a bystander. This extension is necessary because the base
Encounter.participant.individual element does not permit Patient or Person
references in FHIR R4/R4B.
"""

* ^status = #active
* ^experimental = false
* ^context[0].type = #element
* ^context[0].expression = "Encounter"

* extension contains
    individual 1..1 MS and
    relationship 0..1 MS and
    isPatient 1..1 MS

* extension[individual].url = "individual" (exactly)
* extension[individual].value[x] 1..1 MS
* extension[individual].value[x] only Reference(Patient or RelatedPerson or Person)
* extension[individual] ^short = "Person who reported the emergency"

* extension[relationship].url = "relationship" (exactly)
* extension[relationship].value[x] 1..1 MS
* extension[relationship].value[x] only CodeableConcept
* extension[relationship].valueCodeableConcept from EMCallerRelationshipVS (required)
* extension[relationship] ^short = "Caller's relationship to the patient"

* extension[isPatient].url = "isPatient" (exactly)
* extension[isPatient].value[x] 1..1 MS
* extension[isPatient].value[x] only boolean
* extension[isPatient] ^short = "Whether the caller is the patient"
 

* value[x] 0..0




Extension: EMSupportingAgency
Id: em-supporting-agency
Title: "Emergency Supporting Agency"
Description: """
References another emergency-response organization participating in the
incident, such as fire services, police, security services, or disaster
management services.
"""

* ^status = #active
* ^experimental = false
* ^context[0].type = #element
* ^context[0].expression = "Encounter"

* extension contains
    agencyType 1..1 MS and
    organization 1..1 MS

* extension[agencyType].url = "agencyType" (exactly)
* extension[agencyType].value[x] 1..1 MS
* extension[agencyType].value[x] only CodeableConcept
* extension[agencyType].valueCodeableConcept from EMAgencyTypeVS (required)

* extension[organization].url = "organization" (exactly)
* extension[organization].value[x] 1..1 MS
* extension[organization].value[x] only Reference(Organization) 

* value[x] 0..0

Extension: EMRespondingUnit
Id: em-responding-unit
Title: "Emergency Responding Unit"
Description: """
References an ambulance or other emergency-response vehicle assigned to the
incident.
"""

* ^status = #active
* ^experimental = false
* ^context[0].type = #element
* ^context[0].expression = "Encounter"

* value[x] 1..1 MS
* value[x] only Reference(Device)





Extension: EMResponderCrewMember
Id: em-responder-crew-member
Title: "Emergency Responder Crew Member"
Description: """
Represents a practitioner or practitioner role assigned to an emergency
responder unit.

The extension records both the assigned person or role and their operational
crew function.
"""

* ^status = #active
* ^experimental = false

* ^context[0].type = #element
* ^context[0].expression = "Device"

* extension contains
    member 1..1 MS and
    role 1..1 MS and
    period 0..1 MS

* extension[member].url = "member" (exactly)
* extension[member].value[x] 1..1 MS
* extension[member].value[x] only Reference(Practitioner or PractitionerRole)
* extension[member] ^short =
    "Practitioner or PractitionerRole assigned to the unit"

* extension[role].url = "role" (exactly)
* extension[role].value[x] 1..1 MS
* extension[role].value[x] only CodeableConcept
* extension[role].valueCodeableConcept from EMCrewRoleVS (required)
* extension[role] ^short =
    "Operational role performed by the crew member"

* extension[period].url = "period" (exactly)
* extension[period].value[x] 1..1 MS
* extension[period].value[x] only Period
* extension[period] ^short =
    "Period during which the crew member was assigned to the unit"
 

* value[x] 0..0