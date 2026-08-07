Profile: EMEDEncounter
Parent: Encounter
Id: em-ed-encounter
Title: "Encounter - Emergency Department"
Description: """
Represents the facility-based emergency department encounter, from
registration and triage through provider assessment, treatment, and
disposition.

Distinct from EMIncidentEncounter (dispatch/field response) and
EMPOCEncounter (pre-hospital point-of-care care): this profile represents the
receiving facility's own chart, adapted from the WHO Emergency Unit Patient
Record form. When the patient arrived by EMS, link back to the pre-hospital
chain through partOf rather than duplicating dispatch/field data here.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

// --------------------------------------------------------------------------
// Extensions
// --------------------------------------------------------------------------

* extension contains
    EMPaymentMethod named paymentMethod 0..1 MS and
    EMArrivalMode named arrivalMode 0..1 MS and
    EMMobilityStatus named mobilityStatus 0..1 MS and
    EMPresentationType named presentationType 0..1 MS and
    EMReferralInfo named referralInfo 0..1 MS and
    EMTraumaDetails named traumaDetails 0..1 MS and
    EMDispositionDetails named dispositionDetails 0..1 MS

* extension[paymentMethod] ^short = "Payment method recorded at registration"
* extension[arrivalMode] ^short = "How the patient arrived at the emergency department"
* extension[mobilityStatus] ^short = "Ambulatory or non-ambulatory at registration"
* extension[presentationType] ^short = "Acute or chronic presentation"
* extension[referralInfo] ^short = "Whether this presentation is a referral"
* extension[traumaDetails] ^short = "Mechanism, intent, timing, and substance use for a trauma presentation"
* extension[dispositionDetails] ^short = "Supplementary detail for the disposition"


// --------------------------------------------------------------------------
// Identifiers
// --------------------------------------------------------------------------

* identifier 1..* MS

* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false

* identifier contains
    hospitalRegistrationNumber 1..1 MS

* identifier[hospitalRegistrationNumber].system 1..1 MS
* identifier[hospitalRegistrationNumber].system = $HospitalRegistrationSystem (exactly)
* identifier[hospitalRegistrationNumber].value 1..1 MS
* identifier[hospitalRegistrationNumber].use = #official
* identifier[hospitalRegistrationNumber] ^short =
    "Hospital registration number recorded on the ED chart"


// --------------------------------------------------------------------------
// Status, class, priority
// --------------------------------------------------------------------------

* status 1..1 MS
* status from $EncounterStatus (required)
* status ^short = "Current workflow status of the emergency department encounter"

* class 1..1 MS
* class = $ActCode#EMER "emergency"
* class ^short = "Fixed to emergency"

* priority 1..1 MS
* priority from EMClinicalAcuityVS (required)
* priority ^short = "Triage category assigned after assessment (Red/Orange/Yellow/Green/Blue/Black)"
* priority ^definition = """
Reuses EMClinicalAcuityVS, the same acuity scale already bound to
EMPOCEncounter.priority, rather than introducing a second triage-category
terminology. The form's Emergency (Red)/Urgent (Yellow)/Routine (Green)
categories map onto the red/yellow/green codes in that value set.
"""


// --------------------------------------------------------------------------
// Patient and episode linkage
// --------------------------------------------------------------------------

* subject 1..1 MS
* subject only Reference(EMPatient)
* subject ^short = "Patient receiving emergency department care"

* episodeOfCare 0..1 MS
* episodeOfCare only Reference(EpisodeOfCare)
* episodeOfCare ^short = "Emergency episode this encounter belongs to, if one exists"

* partOf 0..1 MS
* partOf only Reference(EMIncidentEncounter or EMPOCEncounter)
* partOf ^short = "Prior pre-hospital encounter, if the patient arrived by EMS"


// --------------------------------------------------------------------------
// Participants
// --------------------------------------------------------------------------

* participant 0..* MS

* participant ^slicing.discriminator[0].type = #pattern
* participant ^slicing.discriminator[0].path = "type"
* participant ^slicing.rules = #open
* participant ^slicing.ordered = false

* participant contains
    triageStaff 0..1 MS and
    provider 0..1 MS and
    nurse 0..1 MS

* participant[triageStaff].type = EMParticipantRoleCS#triage-staff
* participant[triageStaff].individual 1..1 MS
* participant[triageStaff].individual only Reference(Practitioner or PractitionerRole)
* participant[triageStaff] ^short = "Staff member who performed triage"

* participant[provider].type = EMParticipantRoleCS#provider
* participant[provider].individual 1..1 MS
* participant[provider].individual only Reference(Practitioner or PractitionerRole)
* participant[provider] ^short = "Provider who performed the assessment and led care"

* participant[nurse].type = EMParticipantRoleCS#nurse
* participant[nurse].individual 1..1 MS
* participant[nurse].individual only Reference(Practitioner or PractitionerRole)
* participant[nurse] ^short = "Nurse responsible for the patient during the encounter"


// --------------------------------------------------------------------------
// Period
// --------------------------------------------------------------------------

* period 1..1 MS
* period.start 1..1 MS
* period.start ^short = "Time of arrival at the emergency department"
* period.end 0..1 MS
* period.end ^short = "Time of disposition"


// --------------------------------------------------------------------------
// Reason and diagnosis linkage
// --------------------------------------------------------------------------

* reasonCode 0..1
* reasonCode ^short = "Free-text reason for presentation, if not yet captured as a chief-complaint Condition"

* reasonReference 0..1 MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Chief-complaint Condition for this encounter"

* diagnosis 0..* MS
* diagnosis.condition 1..1 MS
* diagnosis.condition only Reference(Condition)
* diagnosis ^short = "Working, differential, and discharge diagnosis Condition instances"


// --------------------------------------------------------------------------
// Location and service provider
// --------------------------------------------------------------------------

* location 0..1 MS
* location.location 1..1 MS
* location.location only Reference(Location)

* serviceProvider 1..1 MS
* serviceProvider only Reference(Organization)
* serviceProvider ^short = "Facility operating the emergency department"


// --------------------------------------------------------------------------
// Disposition
// --------------------------------------------------------------------------

* hospitalization 0..1 MS

* hospitalization.dischargeDisposition 0..1 MS
* hospitalization.dischargeDisposition from EMDispositionVS (required)
* hospitalization.dischargeDisposition ^short = "Outcome of the emergency department encounter"

* hospitalization.destination 0..1 MS
* hospitalization.destination only Reference(EMDestinationFacility)
* hospitalization.destination ^short = "Receiving facility when disposition is transfer"


// --------------------------------------------------------------------------
// Invariants
// --------------------------------------------------------------------------

* obeys em-ed-1
