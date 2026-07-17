Profile: EMDestinationFacility
Parent: Location
Id: em-destination-facility
Title: "Location - Emergency Destination Facility"
Description: """
Represents the physical healthcare facility or emergency-care location intended
to receive, or that actually received, a patient transported by emergency
medical services.

The Location identifies the physical destination. The organization operating
the facility is referenced through Location.managingOrganization.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* extension contains
    EMFacilityLevel named facilityLevel 0..1 MS and
    EMEmergencyCentreCapability named emergencyCentreCapability 0..1 MS

* identifier 1..* MS

* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false

* identifier contains
    facilityId 1..1 MS

* identifier[facilityId].system 1..1 MS
* identifier[facilityId].system =
    $FacilityIdentifierSystem (exactly)

* identifier[facilityId].value 1..1 MS
* identifier[facilityId].use = #official

* identifier[facilityId] ^short =
    "National or source-system facility identifier"

* status 1..1 MS
* status from $LocationStatus (required)

* name 1..1 MS
* name ^short = "Official name of the receiving facility"

* alias 0..* MS

* description 0..1 MS

* mode 1..1 MS
* mode = #instance

* type 1..* MS
* type from EMDestinationFacilityTypeVS (required)

* physicalType 1..1 MS
* physicalType = $LocationPhysicalType#bu "Building"

* address 0..1 MS

* position 0..1 MS
* position.longitude 1..1 MS
* position.latitude 1..1 MS

* managingOrganization 1..1 MS
* managingOrganization only Reference(Organization)

* managingOrganization ^short =
    "Healthcare organization operating the destination facility"

* partOf 0..1 MS
* partOf only Reference(Location)