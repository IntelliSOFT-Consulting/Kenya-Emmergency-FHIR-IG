# Background

Emergency care data moves quickly across dispatch centers, ambulance teams,
emergency departments, laboratories, and referral facilities. Without a common
exchange model, information about the patient, the event, the assessment, and
the handover can become fragmented across paper notes, radio calls, messaging
apps, and disconnected clinical systems.

This implementation guide provides a shared FHIR R4 approach for representing
those high-priority emergency workflows in a structured and reusable way.

## Operational Context

The guide is intended to support emergency and ambulance use cases such as:

- call intake and triage
- ambulance dispatch and scene response
- clinical assessment during transport
- emergency department handover
- referral and supporting documentation exchange

## Why a Dedicated Emergency IG

Emergency workflows need faster information exchange than many routine care
processes. Systems must be able to communicate:

- who the patient is
- where the emergency event is happening
- what the immediate clinical findings are
- which interventions were performed
- where the patient was transported
- what documentation or investigations must follow the patient

## Relationship to Other Kenya IGs

This guide complements other Kenya FHIR implementation guides by handling the
time-critical emergency care segment of the patient journey. Emergency data can
feed downstream workflows such as patient summaries, inpatient treatment,
public-sector referrals, and reimbursement or reporting processes.
