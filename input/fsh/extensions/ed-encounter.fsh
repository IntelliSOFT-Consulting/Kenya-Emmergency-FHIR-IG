// ==========================================================================
// Extensions supporting EMEDEncounter.
// ==========================================================================

Extension: EMPaymentMethod
Id: em-payment-method
Title: "Emergency Department Payment Method"
Description: """
Payment method recorded at emergency department registration.
"""
Context: Encounter

* extension 0..0
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from EMPaymentMethodVS (required)
* valueCodeableConcept ^short = "How the encounter is expected to be paid for"


Extension: EMArrivalMode
Id: em-arrival-mode
Title: "Emergency Department Arrival Mode"
Description: """
How the patient arrived at the emergency department.
"""
Context: Encounter

* extension 0..0
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from EMArrivalModeVS (required)
* valueCodeableConcept ^short = "Mode of arrival at the emergency department"


Extension: EMMobilityStatus
Id: em-mobility-status
Title: "Emergency Department Mobility Status"
Description: """
Patient's mobility status recorded at emergency department registration,
independent of triage acuity.
"""
Context: Encounter

* extension 0..0
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from EMMobilityStatusVS (required)
* valueCodeableConcept ^short = "Ambulatory or non-ambulatory at registration"


Extension: EMPresentationType
Id: em-presentation-type
Title: "Emergency Department Presentation Type"
Description: """
Whether the presenting problem is acute or chronic, recorded at registration.
"""
Context: Encounter

* extension 0..0
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from EMPresentationTypeVS (required)
* valueCodeableConcept ^short = "Acute or chronic presentation"


Extension: EMReferralInfo
Id: em-referral-info
Title: "Emergency Department Referral Information"
Description: """
Whether the patient was referred to the emergency department, e.g. from
another facility or a clinic.
"""
Context: Encounter

* extension 0..0
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Whether this presentation is a referral"


// --------------------------------------------------------------------------
// Trauma details
// --------------------------------------------------------------------------

Extension: EMTraumaDetails
Id: em-trauma-details
Title: "Emergency Department Trauma Details"
Description: """
Mechanism, intent, timing, and recent substance use for a trauma
presentation.
"""
Context: Encounter

* extension contains
    isTrauma 1..1 MS and
    dateOfInjury 0..1 MS and
    mechanismOfInjury 0..1 MS and
    otherMechanism 0..1 MS and
    intent 0..1 MS and
    otherIntent 0..1 MS and
    substanceUsed 0..1 MS and
    substanceType 0..* MS

* extension[isTrauma].url = "isTrauma" (exactly)
* extension[isTrauma].value[x] 1..1 MS
* extension[isTrauma].value[x] only boolean
* extension[isTrauma] ^short = "Whether this presentation is trauma-related"

* extension[dateOfInjury].url = "dateOfInjury" (exactly)
* extension[dateOfInjury].value[x] 1..1 MS
* extension[dateOfInjury].value[x] only dateTime
* extension[dateOfInjury] ^short = "Date and time the injury occurred"

* extension[mechanismOfInjury].url = "mechanismOfInjury" (exactly)
* extension[mechanismOfInjury].value[x] 1..1 MS
* extension[mechanismOfInjury].value[x] only CodeableConcept
* extension[mechanismOfInjury].valueCodeableConcept from EMMechanismOfInjuryVS (required)
* extension[mechanismOfInjury] ^short = "Mechanism of injury"

* extension[otherMechanism].url = "otherMechanism" (exactly)
* extension[otherMechanism].value[x] 1..1 MS
* extension[otherMechanism].value[x] only string
* extension[otherMechanism] ^short = "Free-text mechanism, used when mechanismOfInjury is coded 'other'"

* extension[intent].url = "intent" (exactly)
* extension[intent].value[x] 1..1 MS
* extension[intent].value[x] only CodeableConcept
* extension[intent].valueCodeableConcept from EMInjuryIntentVS (required)
* extension[intent] ^short = "Intent behind the injury"

* extension[otherIntent].url = "otherIntent" (exactly)
* extension[otherIntent].value[x] 1..1 MS
* extension[otherIntent].value[x] only string
* extension[otherIntent] ^short = "Free-text intent, used when intent is coded 'other'"

* extension[substanceUsed].url = "substanceUsed" (exactly)
* extension[substanceUsed].value[x] 1..1 MS
* extension[substanceUsed].value[x] only boolean
* extension[substanceUsed] ^short = "Whether the patient used a substance in the last 6 hours"
* extension[substanceUsed] ^definition = """
Absence of this sub-extension means substance use was not asked about, not
that it was confirmed absent — do not treat a missing value as 'no'.
"""

* extension[substanceType].url = "substanceType" (exactly)
* extension[substanceType].value[x] 1..1 MS
* extension[substanceType].value[x] only CodeableConcept
* extension[substanceType].valueCodeableConcept from EMSubstanceUseTypeVS (required)
* extension[substanceType] ^short = "Type of substance used, if substanceUsed is true"

* value[x] 0..0


// --------------------------------------------------------------------------
// Disposition details
// --------------------------------------------------------------------------

Extension: EMDispositionDetails
Id: em-disposition-details
Title: "Emergency Department Disposition Details"
Description: """
Supplementary detail for the ED encounter disposition that does not fit
Encounter.hospitalization.dischargeDisposition alone — the discharge-plan
discussion flag, and the reason text for the leave-without-being-seen, death,
and transfer dispositions.
"""
Context: Encounter

* extension contains
    dischargePlanDiscussed 0..1 MS and
    leftWithoutBeingSeenReason 0..1 MS and
    deathCause 0..1 MS and
    transferReason 0..1 MS

* extension[dischargePlanDiscussed].url = "dischargePlanDiscussed" (exactly)
* extension[dischargePlanDiscussed].value[x] 1..1 MS
* extension[dischargePlanDiscussed].value[x] only boolean
* extension[dischargePlanDiscussed] ^short =
    "Whether the discharge plan was discussed with the patient — applies when disposition is discharge"

* extension[leftWithoutBeingSeenReason].url = "leftWithoutBeingSeenReason" (exactly)
* extension[leftWithoutBeingSeenReason].value[x] 1..1 MS
* extension[leftWithoutBeingSeenReason].value[x] only string
* extension[leftWithoutBeingSeenReason] ^short =
    "Reason recorded for leaving without being seen or before treatment was complete"

* extension[deathCause].url = "deathCause" (exactly)
* extension[deathCause].value[x] 1..1 MS
* extension[deathCause].value[x] only string
* extension[deathCause] ^short = "Cause of death recorded at disposition"

* extension[transferReason].url = "transferReason" (exactly)
* extension[transferReason].value[x] 1..1 MS
* extension[transferReason].value[x] only string
* extension[transferReason] ^short = "Reason recorded for transfer to another facility"

* value[x] 0..0
