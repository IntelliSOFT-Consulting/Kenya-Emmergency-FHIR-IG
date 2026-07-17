Profile: EMSceneLocation
Parent: Location
Id: em-scene-location
Title: "Location - Emergency Incident Scene"
Description: """
Represents the physical location at which an emergency incident occurred or at
which the patient was found.

The location supports coordinates, landmarks, descriptive directions, and
administrative geographic details.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* identifier 0..* MS

* status 1..1 MS
* status from $LocationStatus (required)

* name 0..1 MS
* name ^short =
    "Recognizable name of the incident scene"

* alias 0..* MS
* alias ^short =
    "Landmark or alternative description of the incident scene"

* description 0..1 MS
* description ^short =
    "Directions or narrative description of the incident scene"

* mode 1..1 MS
* mode = #instance

* type 1..* MS
* type from EMSceneLocationTypeVS (extensible)

* physicalType 1..1 MS
* physicalType = $LocationPhysicalType#si "Site"

* address 0..1 MS
* address MS

* position 1..1 MS

* position.longitude 1..1 MS
* position.longitude ^short =
    "Longitude of the emergency incident scene"

* position.latitude 1..1 MS
* position.latitude ^short =
    "Latitude of the emergency incident scene"

* position.altitude 0..1 MS

* managingOrganization 0..1 MS
* managingOrganization only Reference(Organization)

* partOf 0..1 MS
* partOf only Reference(Location)

* obeys em-scene-1