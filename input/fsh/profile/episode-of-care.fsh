Profile: KenyaAmbulanceEpisodeOfCare
Parent: EpisodeOfCare
Id: em-episode-of-care
Title: "EM Episode of Care"
Description: "Represents a single EMS incident/dispatch as an EpisodeOfCare, the parent context for the EMIncidentEncounter and EMPOCEncounter chain. One EMEpisodeOfCare corresponds to one patient; mass-casualty incidents are linked via identifier:groupIncidentId across multiple EMEpisodeOfCare instances."
* ^status = #draft

// --- Identifiers (sliced on system, open) ---
* identifier ^slicing.discriminator[0].type = #pattern
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice by identifier.system to distinguish incidentId, dispatchId, and groupIncidentId"
* identifier ^slicing.ordered = false
* identifier contains
    incidentId 1..1 MS and
    dispatchId 0..1 and
    groupIncidentId 0..1 MS

// incidentId — canonical, shared across EpisodeOfCare + all child Encounters
* identifier[incidentId] ^short = "Canonical incident identifier shared across the EpisodeOfCare and every child Encounter"
* identifier[incidentId] ^definition = "Maps to incident.incident_id. Use one fixed identifier.system across ALL resources in the chain (EpisodeOfCare, EMIncidentEncounter, EMPOCEncounter) to enable Encounter?identifier= search without walking references."
* identifier[incidentId].system 1..1 MS
* identifier[incidentId].system = "http://hie.go.ke/fhir/identifier/incident-id" (exactly)
* identifier[incidentId].value 1..1 MS
* identifier[incidentId].value ^short = "e.g. INC-20260629120000-0712345678-abc123"

// dispatchId — optional, secondary, CAD system reference
* identifier[dispatchId] ^short = "Dispatch/CAD system's own reference, kept distinct from incidentId"
* identifier[dispatchId] ^definition = "Maps to dispatch.dispatch_id. Only needed if dispatch_id and incident_id are not always 1:1."
* identifier[dispatchId].system 1..1
* identifier[dispatchId].system = "http://hie.go.ke/fhir/identifier/dispatch-id" (exactly)
* identifier[dispatchId].value 1..1

// groupIncidentId — mass-casualty parent key
* identifier[groupIncidentId] ^short = "True mass-casualty-incident parent key, shared across all patients from one MCI dispatch"
* identifier[groupIncidentId] ^definition = "Maps to dispatch.group_incident_id. Populate whenever number_of_patients > 1 or multi_agency_incident is present. NOTE: confirm with vendor whether one dispatch record is emitted per patient (group_incident_id is the cross-patient key) or one record per MCI event (ingestion pipeline must fan out into multiple EMEpisodeOfCare instances)."
* identifier[groupIncidentId].system 1..1 MS
* identifier[groupIncidentId].system = "http://hie.go.ke/fhir/identifier/group-incident-id" (exactly)
* identifier[groupIncidentId].value 1..1 MS

// --- Status ---
* status 1..1 MS
* status ^short = "planned | waitlist | active | onhold | finished | cancelled | entered-in-error"

* statusHistory 0..* MS
* statusHistory ^short = "Historical record of status transitions, for auditability alongside the handover Provenance record"

// --- Type ---
* type 1..1 MS
* type from EMIncidentTypeVS (required)
* type ^short = "Nature/category of the incident. Maps to incident.type. Must mirror Encounter.type on EMIncidentEncounter"

// --- Diagnosis ---
* diagnosis 0..*
* diagnosis ^short = "Working/discharge diagnosis once available at the facility — usually populated later in the pipeline"
* diagnosis.condition only Reference(Condition)

// --- Patient / Organization ---
* patient 1..1 MS
* patient only Reference(KenyaEmergencyPatient)
* patient ^short = "May initially reference an Unknown/Temporary Patient profile if identity is not yet established, later reconciled via Patient.link"

* managingOrganization 0..1
* managingOrganization only Reference(Organization)
* managingOrganization ^short = "The EMS provider or dispatch centre responsible for the episode"

// --- Period ---
* period 1..1 MS
* period.start 1..1 MS
* period.start ^short = "Start of the episode. Maps to incident.created_at"
* period.end 0..1
* period.end ^short = "Left open — episode may extend beyond handover_completed_at (which belongs on EMIncidentEncounter.period.end) if the patient is admitted onward"

// --- Referral / Team / Account ---
* referralRequest 0..* MS
* referralRequest only Reference(ServiceRequest)

* careManager 0..1 MS
* careManager only Reference(Practitioner or PractitionerRole)

* team 0..* MS
* team only Reference(CareTeam)

* account 0..*
* account only Reference(Account)
* account ^short = "Billing/claims account — one account can roll up charges across EMIncidentEncounter + EMPOCEncounter + downstream facility encounters (SHA claims aggregation)"

// --- Incident-level Extensions ---
* extension contains
    EMIncidentPriority named incidentPriority 1..1 MS and
    EMNumberOfPatients named numberOfPatients 1..1 MS
