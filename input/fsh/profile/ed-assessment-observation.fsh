// ============================================================================
// Emergency Department Patient Record — assessment Observation profiles
// ============================================================================
// EMABCDEAssessmentObservation, EMHighRiskSignsObservation,
// EMReviewOfSystemsObservation, EMPhysicalExamObservation, EMPOCUSObservation,
// EMUrinalysisObservation.
// ============================================================================


// ----------------------------------------------------------------------------
// ABCDE resuscitation assessment
// ----------------------------------------------------------------------------

Profile: EMABCDEAssessmentObservation
Parent: Observation
Id: em-abcde-assessment-observation
Title: "Observation - Emergency ABCDE Assessment"
Description: """
Represents the provider's structured resuscitation assessment of a single
ABCDE letter (Airway, Breathing, Circulation, Disability, or Exposure) — one
Observation instance per letter, not one Observation for the whole ABCDE
assessment, mirroring the one-instance-per-region pattern already used by
EMSecondarySurveyObservation.

Reuses the same explicit "NML" (no findings) idiom as
EMSecondarySurveyObservation via the EMNoFindingsOnExam extension. Which
component slices are populated depends on Observation.code: airway,
breathing, and exposure typically populate only a few of the fields below,
while circulation and disability are the most component-heavy. Airway,
breathing, and circulation interventions performed (repositioning, suction,
OPA/NPA/BVM/LMA/ETT, chest tube, IV line placement) are recorded as
EMProcedure instances referenced separately, not duplicated here; medications
and blood products given are recorded as EMMedicationAdministration.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* extension contains
    EMNoFindingsOnExam named noFindingsOnExam 1..1 MS

* extension[noFindingsOnExam] ^short =
    "Explicit flag confirming this ABCDE letter was assessed and nothing abnormal was found"

* status 1..1 MS
* status from $ObservationStatus (required)
* status ^short = "Workflow status of the ABCDE finding"

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* category ^short = "Fixed to 'exam'"

* code 1..1 MS
* code from EMABCDEComponentVS (required)
* code ^short = "Which ABCDE letter this instance represents"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient assessed"

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMEDEncounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When this ABCDE letter was assessed"

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)
* performer ^short = "Who performed the assessment"

* hasMember 0..* MS
* hasMember only Reference(Observation)
* hasMember ^short = "Related Observations for this assessment, e.g. the GCS or respiratory-rate EMVitalSignsObservation"

* value[x] only CodeableConcept
* value[x] 0..1 MS
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* valueCodeableConcept ^short = "The primary abnormal finding for this ABCDE letter"

* component 0..* MS
* component ^short = "Structured findings specific to this ABCDE letter"

* component ^slicing.discriminator[0].type = #pattern
* component ^slicing.discriminator[0].path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false

* component contains
    airwayObstructionCause 0..1 MS and
    chestRisePattern 0..1 MS and
    tracheaPosition 0..1 MS and
    breathSoundsLeft 0..1 MS and
    breathSoundsRight 0..1 MS and
    capillaryRefillSeconds 0..1 MS and
    skinFindings 0..1 MS and
    jvd 0..1 MS and
    pulses 0..1 MS and
    fluidsGivenVolume 0..1 MS and
    fluidsType 0..1 MS and
    bloodOrdered 0..1 MS and
    ecgDone 0..1 MS and
    avpu 0..1 MS and
    pupilSizeLeft 0..1 MS and
    pupilSizeRight 0..1 MS and
    pupilReactivityLeft 0..1 MS and
    pupilReactivityRight 0..1 MS and
    movesExtremities 0..* MS and
    fullyExposed 0..1 MS

* component[airwayObstructionCause].code = EMABCDEFieldCS#airway-obstruction-cause
* component[airwayObstructionCause].value[x] only CodeableConcept
* component[airwayObstructionCause].valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* component[airwayObstructionCause] ^short = "Airway — cause of obstruction, angioedema, stridor, voice change, or burns"

* component[chestRisePattern].code = EMABCDEFieldCS#chest-rise-pattern
* component[chestRisePattern].value[x] only CodeableConcept
* component[chestRisePattern].valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* component[chestRisePattern] ^short = "Breathing — shallow, retractions, or paradoxical chest rise"

* component[tracheaPosition].code = EMABCDEFieldCS#trachea-position
* component[tracheaPosition].value[x] only CodeableConcept
* component[tracheaPosition].valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* component[tracheaPosition] ^short = "Breathing — midline or deviated, and to which side"

* component[breathSoundsLeft].code = EMABCDEFieldCS#breath-sounds-left
* component[breathSoundsLeft].value[x] only string
* component[breathSoundsLeft] ^short = "Breathing — left-sided breath sounds"

* component[breathSoundsRight].code = EMABCDEFieldCS#breath-sounds-right
* component[breathSoundsRight].value[x] only string
* component[breathSoundsRight] ^short = "Breathing — right-sided breath sounds"

* component[capillaryRefillSeconds].code = EMABCDEFieldCS#capillary-refill-seconds
* component[capillaryRefillSeconds].value[x] only Quantity
* component[capillaryRefillSeconds] ^short = "Circulation — capillary refill time in seconds"

* component[skinFindings].code = EMABCDEFieldCS#skin-findings
* component[skinFindings].value[x] only CodeableConcept
* component[skinFindings].valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* component[skinFindings] ^short = "Circulation — warm/dry/pale/cyanotic/moist/cool skin findings"

* component[jvd].code = EMABCDEFieldCS#jvd
* component[jvd].value[x] only boolean
* component[jvd] ^short = "Circulation — jugular venous distension present"

* component[pulses].code = EMABCDEFieldCS#pulses
* component[pulses].value[x] only CodeableConcept
* component[pulses].valueCodeableConcept from EMVitalQualitativeStateVS (extensible)
* component[pulses] ^short = "Circulation — pulse quality; use .note on the Observation for asymmetry/laterality detail"

* component[fluidsGivenVolume].code = EMABCDEFieldCS#fluids-given-volume
* component[fluidsGivenVolume].value[x] only Quantity
* component[fluidsGivenVolume] ^short = "Circulation — volume of IV fluids given"

* component[fluidsType].code = EMABCDEFieldCS#fluids-type
* component[fluidsType].value[x] only CodeableConcept
* component[fluidsType] ^short = "Circulation — type of IV fluid given, e.g. normal saline, lactated Ringer's"

* component[bloodOrdered].code = EMABCDEFieldCS#blood-ordered
* component[bloodOrdered].value[x] only boolean
* component[bloodOrdered] ^short = "Circulation — whether blood was ordered"

* component[ecgDone].code = EMABCDEFieldCS#ecg-done
* component[ecgDone].value[x] only boolean
* component[ecgDone] ^short = "Circulation — whether an ECG was done; the result itself is an EMDiagnosticReport"

* component[avpu].code = EMABCDEFieldCS#avpu
* component[avpu].value[x] only CodeableConcept
* component[avpu].valueCodeableConcept from EMAVPUScaleVS (required)
* component[avpu] ^short = "Disability — AVPU responsiveness"

* component[pupilSizeLeft].code = EMABCDEFieldCS#pupil-size-left
* component[pupilSizeLeft].value[x] only Quantity
* component[pupilSizeLeft] ^short = "Disability — left pupil size in mm"

* component[pupilSizeRight].code = EMABCDEFieldCS#pupil-size-right
* component[pupilSizeRight].value[x] only Quantity
* component[pupilSizeRight] ^short = "Disability — right pupil size in mm"

* component[pupilReactivityLeft].code = EMABCDEFieldCS#pupil-reactivity-left
* component[pupilReactivityLeft].value[x] only CodeableConcept
* component[pupilReactivityLeft].valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* component[pupilReactivityLeft] ^short = "Disability — left pupil reactivity"

* component[pupilReactivityRight].code = EMABCDEFieldCS#pupil-reactivity-right
* component[pupilReactivityRight].value[x] only CodeableConcept
* component[pupilReactivityRight].valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* component[pupilReactivityRight] ^short = "Disability — right pupil reactivity"

* component[movesExtremities].code = EMABCDEFieldCS#moves-extremities
* component[movesExtremities].value[x] only CodeableConcept
* component[movesExtremities].valueCodeableConcept from http://hl7.org/fhir/ValueSet/body-site (extensible)
* component[movesExtremities] ^short = "Disability — limb(s) moved spontaneously (LUE/RUE/LLE/RLE); repeat the slice per limb"

* component[fullyExposed].code = EMABCDEFieldCS#fully-exposed
* component[fullyExposed].value[x] only boolean
* component[fullyExposed] ^short = "Exposure — whether the patient was fully exposed"

* note 0..*
* note ^short = "Free-text notes, e.g. intervention sizes/depths not captured structurally"

* obeys em-exam-1
* obeys em-exam-2


// ----------------------------------------------------------------------------
// High-risk signs
// ----------------------------------------------------------------------------

Profile: EMHighRiskSignsObservation
Parent: Observation
Id: em-high-risk-signs-observation
Title: "Observation - Emergency High-Risk Signs"
Description: """
Represents the WHO Emergency Unit high-risk-signs checklist performed at
triage: a single Observation per triage event carrying one boolean component
per high-risk sign, plus a top-level summary flag for whether any sign is
present.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status from $ObservationStatus (required)

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#survey
* category ^short = "Fixed to 'survey'"

* code 1..1 MS
* code = EMObservationCodeCS#high-risk-signs-assessment
* code ^short = "Fixed to the high-risk-signs assessment code"

* subject 1..1 MS
* subject only Reference(Patient)

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMEDEncounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When the high-risk-signs check was performed"

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)

* value[x] only boolean
* value[x] 1..1 MS
* valueBoolean ^short = "Whether any high-risk sign is present"
* valueBoolean ^definition = """
Must equal true if and only if at least one component below is true — see
invariant em-highrisk-1.
"""

* component 0..* MS

* component ^slicing.discriminator[0].type = #pattern
* component ^slicing.discriminator[0].path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false

* component contains
    abnormalHeartRate 0..1 MS and
    abnormalRespiratoryRate 0..1 MS and
    lowSpo2 0..1 MS and
    notAlert 0..1 MS and
    stridorOrSwallowDifficulty 0..1 MS and
    respiratoryDistress 0..1 MS and
    poorPerfusion 0..1 MS and
    cannotEatOrDrink 0..1 MS

* component[abnormalHeartRate].code = EMHighRiskSignCS#abnormal-heart-rate
* component[abnormalHeartRate].value[x] only boolean

* component[abnormalRespiratoryRate].code = EMHighRiskSignCS#abnormal-respiratory-rate
* component[abnormalRespiratoryRate].value[x] only boolean

* component[lowSpo2].code = EMHighRiskSignCS#low-spo2
* component[lowSpo2].value[x] only boolean

* component[notAlert].code = EMHighRiskSignCS#not-alert
* component[notAlert].value[x] only boolean

* component[stridorOrSwallowDifficulty].code = EMHighRiskSignCS#stridor-or-swallow-difficulty
* component[stridorOrSwallowDifficulty].value[x] only boolean

* component[respiratoryDistress].code = EMHighRiskSignCS#respiratory-distress
* component[respiratoryDistress].value[x] only boolean

* component[poorPerfusion].code = EMHighRiskSignCS#poor-perfusion
* component[poorPerfusion].value[x] only boolean

* component[cannotEatOrDrink].code = EMHighRiskSignCS#cannot-eat-or-drink
* component[cannotEatOrDrink].value[x] only boolean

* obeys em-highrisk-1


// ----------------------------------------------------------------------------
// Review of Systems
// ----------------------------------------------------------------------------

Profile: EMReviewOfSystemsObservation
Parent: Observation
Id: em-review-of-systems-observation
Title: "Observation - Emergency Review of Systems"
Description: """
Represents the review of a single body system during the ED provider
assessment — one Observation instance per system, not one Observation for
the whole review of systems. Reuses the same explicit "NML" idiom as
EMSecondarySurveyObservation and EMABCDEAssessmentObservation via the
EMNoFindingsOnExam extension.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* extension contains
    EMNoFindingsOnExam named noFindingsOnExam 1..1 MS

* extension[noFindingsOnExam] ^short =
    "Explicit flag confirming this system was reviewed and nothing abnormal was found"

* status 1..1 MS
* status from $ObservationStatus (required)

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#survey
* category ^short = "Fixed to 'survey'"

* code 1..1 MS
* code from EMReviewOfSystemsBodySystemVS (required)
* code ^short = "Which body system this review covers"

* subject 1..1 MS
* subject only Reference(Patient)

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMEDEncounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When this system was reviewed"

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)

* value[x] only CodeableConcept
* value[x] 0..1 MS
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* valueCodeableConcept ^short = "The abnormal finding reported for this system"

* note 0..*
* note ^short = "Free-text notes for this system"

* obeys em-exam-1
* obeys em-exam-2


// ----------------------------------------------------------------------------
// Physical Exam
// ----------------------------------------------------------------------------

Profile: EMPhysicalExamObservation
Parent: Observation
Id: em-physical-exam-observation
Title: "Observation - Emergency Physical Exam"
Description: """
Represents the ED provider's physical examination of a single body
system/region — one Observation instance per system, not one Observation for
the whole exam. Distinct from EMSecondarySurveyObservation, which represents
the pre-hospital secondary survey (a different clinical event, performed
earlier, organized by EMS body region rather than by ED exam system); kept as
a separate profile rather than widening EMSecondarySurveyObservation's region
value set. Reuses the same explicit "NML" idiom via EMNoFindingsOnExam.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* extension contains
    EMNoFindingsOnExam named noFindingsOnExam 1..1 MS

* extension[noFindingsOnExam] ^short =
    "Explicit flag confirming this system/region was examined and nothing abnormal was found"

* status 1..1 MS
* status from $ObservationStatus (required)

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* category ^short = "Fixed to 'exam'"

* code 1..1 MS
* code from EMExamSystemVS (required)
* code ^short = "Which body system/region this exam covers"

* bodySite 0..1 MS
* bodySite from EMExamSystemVS (extensible)
* bodySite ^short = "Anatomical detail, if more specific than the system-level code"

* subject 1..1 MS
* subject only Reference(Patient)

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMEDEncounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When this system/region was examined"

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)

* value[x] only CodeableConcept
* value[x] 0..1 MS
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)
* valueCodeableConcept ^short = "The abnormal finding for this system/region"

* component 0..* MS
* component ^short = "Discrete findings when more than one applies to the same system/region"

* component.code 1..1 MS
* component.code from http://hl7.org/fhir/ValueSet/clinical-findings (extensible)

* note 0..*
* note ^short = """
Free-text notes, including the form's 'Detail Area of Abnormality/Injury'
diagram annotation, which is not represented structurally
"""

* obeys em-exam-1
* obeys em-exam-2


// ----------------------------------------------------------------------------
// POCUS
// ----------------------------------------------------------------------------

Profile: EMPOCUSObservation
Parent: Observation
Id: em-pocus-observation
Title: "Observation - Emergency POCUS"
Description: """
Represents a single point-of-care ultrasound view (abdomen/FAST, chest, or
cardiac) performed during the ED assessment — one Observation instance per
view. The trace/clip image itself, if transmitted, belongs on the referencing
EMDiagnosticReport.presentedForm rather than on this Observation.
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status from $ObservationStatus (required)

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* category ^short = "Fixed to 'exam'"

* code 1..1 MS
* code from EMPOCUSViewVS (required)
* code ^short = "Which POCUS view this instance represents"

* subject 1..1 MS
* subject only Reference(Patient)

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMEDEncounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When this POCUS view was performed"

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)

* value[x] only CodeableConcept
* value[x] 0..1 MS
* valueCodeableConcept from EMPOCUSFindingVS (extensible)
* valueCodeableConcept ^short = "Overall NML/N/A/abnormal read for this view"

* component 0..* MS
* component ^short = "Structured findings specific to this POCUS view"

* component ^slicing.discriminator[0].type = #pattern
* component ^slicing.discriminator[0].path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false

* component contains
    abdomenFinding 0..1 MS and
    chestFinding 0..1 MS and
    pericardialEffusion 0..1 MS and
    cardiacActivity 0..1 MS and
    rvFunction 0..1 MS

* component[abdomenFinding].code = EMPOCUSFieldCS#abdomen-finding
* component[abdomenFinding].value[x] only CodeableConcept
* component[abdomenFinding].valueCodeableConcept from EMPOCUSFindingVS (extensible)
* component[abdomenFinding] ^short = "Abdomen view — negative/indeterminate/free-fluid/RUQ/LUQ/pelvis"

* component[chestFinding].code = EMPOCUSFieldCS#chest-finding
* component[chestFinding].value[x] only CodeableConcept
* component[chestFinding].valueCodeableConcept from EMPOCUSFindingVS (extensible)
* component[chestFinding] ^short = "Chest view — negative/indeterminate/pneumothorax/pleural fluid"

* component[pericardialEffusion].code = EMPOCUSFieldCS#pericardial-effusion
* component[pericardialEffusion].value[x] only boolean
* component[pericardialEffusion] ^short = "Cardiac view — pericardial effusion present"

* component[cardiacActivity].code = EMPOCUSFieldCS#cardiac-activity
* component[cardiacActivity].value[x] only CodeableConcept
* component[cardiacActivity].valueCodeableConcept from EMCardiacActivityVS (required)
* component[cardiacActivity] ^short = "Cardiac view — cardiac activity present or absent"

* component[rvFunction].code = EMPOCUSFieldCS#rv-function
* component[rvFunction].value[x] only CodeableConcept
* component[rvFunction].valueCodeableConcept from EMRVFunctionVS (required)
* component[rvFunction] ^short = "Cardiac view — right ventricular function"

* obeys em-pocus-1


// ----------------------------------------------------------------------------
// Urinalysis
// ----------------------------------------------------------------------------

Profile: EMUrinalysisObservation
Parent: Observation
Id: em-urinalysis-observation
Title: "Observation - Emergency Urinalysis Dipstick"
Description: """
Represents a urine dipstick panel performed during the ED assessment, one
component per analyte (glucose, ketones, blood, nitrite, leukocytes,
protein).
"""

* ^status = #active
* ^experimental = false
* ^abstract = false
* ^publisher = "Kenya Health Information Exchange"

* status 1..1 MS
* status from $ObservationStatus (required)

* category 1..1 MS
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category ^short = "Fixed to 'laboratory'"

* code 1..1 MS
* code = EMObservationCodeCS#urinalysis-dipstick
* code ^short = "Fixed to the urinalysis dipstick panel code"

* subject 1..1 MS
* subject only Reference(Patient)

* encounter 1..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter, typically EMEDEncounter"

* effectiveDateTime 1..1 MS
* effectiveDateTime ^short = "When the dipstick was performed"

* performer 0..1 MS
* performer only Reference(Practitioner or PractitionerRole)

* component 1..* MS
* component ^short = "One entry per dipstick analyte tested"

* component ^slicing.discriminator[0].type = #pattern
* component ^slicing.discriminator[0].path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false

* component contains
    glucose 0..1 MS and
    ketones 0..1 MS and
    blood 0..1 MS and
    nitrite 0..1 MS and
    leukocytes 0..1 MS and
    protein 0..1 MS

* component[glucose].code = EMUrinalysisAnalyteCS#glucose
* component[glucose].value[x] only CodeableConcept
* component[glucose].valueCodeableConcept from EMUrinalysisResultVS (required)

* component[ketones].code = EMUrinalysisAnalyteCS#ketones
* component[ketones].value[x] only CodeableConcept
* component[ketones].valueCodeableConcept from EMUrinalysisResultVS (required)

* component[blood].code = EMUrinalysisAnalyteCS#blood
* component[blood].value[x] only CodeableConcept
* component[blood].valueCodeableConcept from EMUrinalysisResultVS (required)

* component[nitrite].code = EMUrinalysisAnalyteCS#nitrite
* component[nitrite].value[x] only CodeableConcept
* component[nitrite].valueCodeableConcept from EMUrinalysisResultVS (required)

* component[leukocytes].code = EMUrinalysisAnalyteCS#leukocytes
* component[leukocytes].value[x] only CodeableConcept
* component[leukocytes].valueCodeableConcept from EMUrinalysisResultVS (required)

* component[protein].code = EMUrinalysisAnalyteCS#protein
* component[protein].value[x] only CodeableConcept
* component[protein].valueCodeableConcept from EMUrinalysisResultVS (required)
