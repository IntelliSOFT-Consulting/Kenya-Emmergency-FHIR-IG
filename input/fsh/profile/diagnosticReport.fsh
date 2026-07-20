Profile: EMDiagnosticReport
Parent: DiagnosticReport
Id: em-diagnostic-report
Title: "DiagnosticReport - Emergency Investigation Result"
Description: """
Represents an emergency investigation result, e.g. a 12-lead ECG, laboratory
result, or imaging report, generated during pre-hospital or facility-based
emergency care.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status from $DiagnosticReportStatus (required)
* status ^short = "Workflow status of the report"
* status ^definition = """
Source systems have been observed sending a specimen-state value such as
'collected' here, which does not map cleanly to this element's workflow-status
codes. Map vendor 'collected' to 'registered' or 'partial', and reserve
'final' for when an actual conclusion or result is attached.
"""

* category 1..1 MS
* category from http://terminology.hl7.org/ValueSet/v2-0074 (extensible)
* category ^short = "Broad diagnostic service category, e.g. cardiology for an ECG"

* code 1..1 MS
* code from InvestigationsVS (extensible)
* code ^short = "The specific investigation performed"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient the investigation was performed on"

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMPOCEncounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When the investigation was performed or recorded"
* effectiveDateTime ^definition = """
As time-critical as vitals for protocols like STEMI, where door-to-ECG and
ECG-to-activation intervals are actively measured.
"""

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole or Organization)
* performer ^short = "Who performed or recorded the investigation"

* conclusion 0..1 MS
* conclusion ^short = "Free-text clinical interpretation"
* conclusion ^definition = """
This is frequently the single most clinically urgent field on the report, e.g.
'ST elevation in leads V1-V4; consistent with anterior STEMI'. Must never be
silently dropped or truncated during ingestion — preserve verbatim.
"""

* conclusionCode 0..* MS
* conclusionCode from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* conclusionCode ^short = "Coded equivalent of the free-text conclusion"
* conclusionCode ^definition = """
Strongly recommended alongside the free-text conclusion (not instead of it) so
downstream systems can query structurally rather than parsing free text — this
is what should trigger an automated alert (e.g. STEMI activation) rather than
relying on a human reading the narrative.
"""

* result 0..*
* result only Reference(Observation)
* result ^short = "Discrete measurements underlying the report, if captured separately"

* presentedForm 0..*
* presentedForm ^short = "The actual trace/waveform image or PDF, if transmitted"
