Profile: EMIncidentEncounter
Parent: Encounter
Id: em-incident-encounter
Title: "Encounter - Emergency Medical Incident"
Description: """
Represents the complete emergency medical services incident from dispatch
initiation through handover at the receiving facility.

This Encounter is the root encounter for an EMS episode. It captures dispatch
information, the reporting caller, the dispatcher, responding units,
participating emergency agencies, scene information, and the destination
facility.

Clinical care performed by the responding emergency team should be represented
using a separate point-of-care Encounter whose partOf element references this
Encounter.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"
* ^purpose = """
To provide a consistent representation of an emergency incident across
dispatch, ambulance, emergency medical services, and receiving-facility
systems in Kenya.
"""

// --------------------------------------------------------------------------
// Extensions
// --------------------------------------------------------------------------

* extension contains
    EMIncidentCaller named caller 1..1 MS and
    EMSupportingAgency named supportingAgency 0..* MS and
    EMRespondingUnit named respondingUnit 0..* MS

* extension[caller] ^short =
    "Person who reported the emergency incident"

* extension[supportingAgency] ^short =
    "Other emergency-response agency participating in the incident"

* extension[respondingUnit] ^short =
    "Ambulance or emergency-response vehicle assigned to the incident"


// --------------------------------------------------------------------------
// Identifiers
// --------------------------------------------------------------------------

* identifier 2..* MS

* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false

* identifier contains
    dispatchId 1..1 MS and
    incidentId 1..1 MS

* identifier[dispatchId].system 1..1 MS
* identifier[dispatchId].system = $DispatchIdentifierSystem (exactly)
* identifier[dispatchId].value 1..1 MS
* identifier[dispatchId].use = #official
* identifier[dispatchId] ^short =
    "Identifier assigned by the dispatch or CAD system"
* identifier[dispatchId] ^definition = """
Business identifier assigned by the dispatch or computer-aided dispatch
system. Maps to incident.dispatch_id in the source system.
"""

* identifier[incidentId].system 1..1 MS
* identifier[incidentId].system = $IncidentIdentifierSystem (exactly)
* identifier[incidentId].value 1..1 MS
* identifier[incidentId].use = #official
* identifier[incidentId] ^short =
    "Shared identifier for the complete emergency incident"
* identifier[incidentId] ^definition = """
Shared business identifier used to associate the incident Encounter with its
parent EpisodeOfCare and related emergency-care resources.
"""


// --------------------------------------------------------------------------
// Status, class, type and priority
// --------------------------------------------------------------------------

* status 1..1 MS
* status from $EncounterStatus (required)
* status ^short = "Current workflow status of the emergency incident"

* class 1..1 MS
* class = EMEncounterClassCS#FLD "Emergency medical services field response"
* class ^short = "Emergency medical services field response"
* class ^definition = """
Indicates that this Encounter represents an EMS field response rather than a
facility-based emergency department encounter.
"""

* type 1..1 MS
* type from EMIncidentTypeVS (required)
* type ^short = "Nature or category of the emergency incident"
* type ^definition = """
Coded category of the emergency incident. This value should be consistent with
the corresponding EpisodeOfCare.type.
"""

* priority 1..1 MS
* priority from EMDigitalDispatchPriorityVS (required)
* priority ^short = "Priority assigned by the dispatcher"
* priority ^definition = """
Priority assigned during call intake and dispatch. This is distinct from the
clinical acuity or triage category assigned by an emergency medical
professional after patient assessment.
"""


// --------------------------------------------------------------------------
// Patient and episode linkage
// --------------------------------------------------------------------------

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient associated with the emergency incident"
* subject ^definition = """
References either a verified Patient or a temporary unidentified Patient
record created for emergency tracking.
"""

* episodeOfCare 1..1 MS
* episodeOfCare only Reference(KenyaAmbulanceEpisodeOfCare)
* episodeOfCare ^short = "Emergency episode containing this incident"
* episodeOfCare ^definition = """
FHIR-native structural link to the emergency EpisodeOfCare. The shared incident
identifier remains available as a business-level correlation and verification
key.
"""

* partOf 0..0
* partOf ^short = "Not permitted on the root incident Encounter"
* partOf ^definition = """
This profile represents the root Encounter for the EMS incident. A subordinate
point-of-care Encounter should reference this Encounter through its own partOf
element.
"""


// --------------------------------------------------------------------------
// Dispatcher participant
// --------------------------------------------------------------------------
//
// R4/R4B Encounter.participant.individual cannot reference Patient, Person or
// Organization. Therefore:
//   - the caller is represented by the caller extension;
//   - supporting agencies are represented by supportingAgency extensions;
//   - participant is used for the dispatcher, which can validly reference a
//     Practitioner or PractitionerRole.
// --------------------------------------------------------------------------

* participant 0..1 MS

* participant.type 1..1 MS
* participant.type = EMParticipantRoleCS#dispatcher
* participant.type ^short = "Dispatcher or call-handler role"

* participant.period 0..1 MS

* participant.individual 1..1 MS
* participant.individual only Reference(Practitioner or PractitionerRole)
* participant.individual ^short =
    "Dispatcher or call-handler who processed the emergency call"


// --------------------------------------------------------------------------
// Encounter period
// --------------------------------------------------------------------------

* period 1..1 MS

* period.start 1..1 MS
* period.start ^short = "Time the emergency call or incident was opened"
* period.start ^definition = """
Date and time at which the emergency incident was received or created in the
dispatch system.
"""

* period.end 1..1 MS
* period.end ^short = "Time handover at the receiving facility was completed"
* period.end ^definition = """
Date and time at which responsibility for the patient was transferred to the
receiving facility.
"""


// --------------------------------------------------------------------------
// Reason for the emergency call
// --------------------------------------------------------------------------

* reasonCode 0..1 MS
* reasonCode ^short = "Caller-reported reason or chief complaint"
* reasonCode ^definition = """
Caller- or dispatcher-reported description of the emergency, captured before
clinical assessment by the responding emergency team.

The element may contain coded incident information, free text, or both.
"""


// --------------------------------------------------------------------------
// Scene location
// --------------------------------------------------------------------------

* location 0..1 MS

* location.location 1..1 MS
* location.location only Reference(EMSceneLocation)
* location.location ^short = "Scene of the emergency incident"

* location.status 0..1 MS

* location.period 0..1 MS


// --------------------------------------------------------------------------
// EMS service provider
// --------------------------------------------------------------------------

* serviceProvider 0..1 MS
* serviceProvider only Reference(Organization)
* serviceProvider ^short =
    "EMS or dispatch organization responsible for the incident"


// --------------------------------------------------------------------------
// Destination facility
// --------------------------------------------------------------------------
//
// Encounter.hospitalization.destination is Reference(Location) in R4/R4B.
// The destination Location can identify its owning facility organization
// through Location.managingOrganization.
// --------------------------------------------------------------------------

* hospitalization 0..1 MS

* hospitalization.destination 0..1 MS
* hospitalization.destination only Reference(EMDestinationFacility)
* hospitalization.destination ^short =
    "Receiving health facility location"
* hospitalization.destination ^definition = """
The intended or actual health facility receiving the patient.

The referenced Location should use Location.managingOrganization to reference
the corresponding healthcare Organization.
"""


// --------------------------------------------------------------------------
// Invariants
// --------------------------------------------------------------------------

* obeys em-incident-1
* obeys em-incident-2
* obeys em-incident-3



Profile: EMResponderUnit
Parent: Device
Id: em-responder-unit
Title: "Device - Emergency Responder Unit"
Description: """
Represents an ambulance or another mobile emergency-response unit assigned to
an emergency incident.

The Device represents the operational vehicle or response unit. Crew members
assigned to the unit are represented using the responderCrew extension.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"
* ^purpose = """
To provide a consistent representation of ambulances and other mobile
emergency-response units participating in an emergency incident.
"""

// --------------------------------------------------------------------------
// Extensions
// --------------------------------------------------------------------------

* extension contains
    EMResponderCrewMember named responderCrew 0..* MS and
    EMOwnershipType named ownershipType 0..1 MS and
    EMTelematicsDeviceId named telematicsDeviceId 0..1 and
    EMRelieved named relieved 0..1 MS

* extension[responderCrew] ^short =
    "Emergency-response personnel assigned to the unit"

* extension[ownershipType] ^short =
    "Ownership category of the organization operating the unit, e.g. government, private, NGO"

* extension[telematicsDeviceId] ^short =
    "Onboard telematics/tracking device identifier, if present"

* extension[relieved] ^short =
    "Whether this unit has been stood down/replaced by another during the incident"


// --------------------------------------------------------------------------
// Identifiers
// --------------------------------------------------------------------------

* identifier 1..* MS

* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false

* identifier contains
    responderUnitId 1..1 MS and
    vehicleRegistration 0..1 MS

* identifier[responderUnitId].system 1..1 MS
* identifier[responderUnitId].system =
    $ResponderUnitIdentifierSystem (exactly)

* identifier[responderUnitId].value 1..1 MS
* identifier[responderUnitId].use = #official
* identifier[responderUnitId] ^short =
    "Operational identifier assigned to the response unit"

* identifier[vehicleRegistration].system 1..1 MS
* identifier[vehicleRegistration].system =
    $VehicleRegistrationIdentifierSystem (exactly)

* identifier[vehicleRegistration].value 1..1 MS
* identifier[vehicleRegistration].use = #official
* identifier[vehicleRegistration] ^short =
    "Vehicle registration or number plate"


// --------------------------------------------------------------------------
// Device status and type
// --------------------------------------------------------------------------

* status 1..1 MS
* status from $DeviceStatus (required)

* status ^short = "Operational status of the responder unit"

* type 1..1 MS
* type from EMResponderUnitTypeVS (required)
* type ^short = "Type of emergency-response vehicle or unit"


// --------------------------------------------------------------------------
// Unit details
// --------------------------------------------------------------------------

* deviceName 1..* MS

* deviceName.name 1..1 MS
* deviceName.type 1..1 MS

* deviceName ^short =
    "Operational name, call sign, or fleet name of the responder unit"

* manufacturer 0..1 MS
* manufacturer ^short = "Vehicle manufacturer"

* modelNumber 0..1 MS
* modelNumber ^short = "Vehicle model"

* serialNumber 0..1 MS
* serialNumber ^short =
    "Vehicle chassis, VIN, or other serial identifier"

* owner 1..1 MS
* owner only Reference(Organization)
* owner ^short =
    "Organization responsible for operating the responder unit"

* contact 0..1 MS
* contact ^short =
    "Phone number for the unit"

* location 0..1 MS
* location only Reference(EMResponderUnitLocation)
* location ^short =
    "Current real-time position, dispatch location, or last known unit location"

* patient 0..0
* patient ^short =
    "Not used because the responder unit is not patient-specific"

* note 0..* MS



// ============================================================================
// Responder Unit Real-Time Position
// ============================================================================

Profile: EMResponderUnitLocation
Parent: Location
Id: em-responder-unit-location
Title: "Location - Emergency Responder Unit Position"
Description: """
Represents the real-time geographic position and response status of an
emergency responder unit, referenced from EMResponderUnit.location.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* extension contains
    EMLastLocationUpdatedAt named lastLocationUpdatedAt 0..1 MS and
    EMUnitResponseStatus named responseStatus 0..1 MS

* extension[lastLocationUpdatedAt] ^short =
    "When the position was last refreshed"

* extension[responseStatus] ^short =
    "The unit's current response state, e.g. dispatched, en-route, on-scene"

* status 1..1 MS
* status from $LocationStatus (required)

* mode 1..1 MS
* mode = #instance

* position 0..1 MS

* position.longitude 1..1 MS
* position.longitude ^short = "Longitude of the unit's current position"

* position.latitude 1..1 MS
* position.latitude ^short = "Latitude of the unit's current position"

* managingOrganization 0..1 MS
* managingOrganization only Reference(Organization)