Extension: EMFacilityLevel
Id: em-facility-level
Title: "Emergency Destination Facility Level"
Description: """
Represents the Kenya health-system level assigned to a receiving healthcare
facility.
"""

* ^status = #active
* ^experimental = false

* ^context[0].type = #element
* ^context[0].expression = "Location"

* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from EMFacilityLevelVS (required)



Extension: EMEmergencyCentreCapability
Id: em-emergency-centre-capability
Title: "Emergency Centre Capability"
Description: """
Describes whether a destination facility provides emergency-care services and
the level of emergency capability available.
"""

* ^status = #active
* ^experimental = false

* ^context[0].type = #element
* ^context[0].expression = "Location"

* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept from EMEmergencyCentreCapabilityVS (required)