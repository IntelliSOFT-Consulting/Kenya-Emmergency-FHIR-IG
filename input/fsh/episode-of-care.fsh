Profile: KenyaAmbulanceEpisodeOfCare
Parent: EpisodeOfCare
Id: kenya-ambulance-episodeofcare
Title: "EpisodeOfCare – Kenya Ambulance Case"
Description: "Represents an ambulance case episode in the Kenya Emergency Medical Services workflow."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya ambulance case profile"

* status 1..1 MS
* status ^short = "Episode status"

* identifier 1..* MS
* identifier ^short = "Case identifiers such as case number, dispatch ID, SHR ID"

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains
    caseNumber 1..1 MS and
    dispatchCaseId 1..1 MS and
    shrId 0..1 MS

* identifier[caseNumber].system 1..1
* identifier[caseNumber].system = "http://example.org/identifier/case-number"
* identifier[caseNumber].value 1..1
* identifier[caseNumber] ^short = "Unique ambulance case number"

* identifier[dispatchCaseId].system 1..1
* identifier[dispatchCaseId].system = "http://example.org/identifier/dispatch-case-id"
* identifier[dispatchCaseId].value 1..1
* identifier[dispatchCaseId] ^short = "External dispatch system case ID"

* identifier[shrId].system 1..1
* identifier[shrId].system = "http://example.org/identifier/shr-id"
* identifier[shrId].value 1..1
* identifier[shrId] ^short = "Shared Health Record ID"

* type 1..* MS
* type ^short = "Case classification, category, or type"

* patient 1..1 MS
* patient only Reference(Patient)
* patient ^short = "Patient involved in the ambulance case"

* managingOrganization 0..1 MS
* managingOrganization only Reference(Organization)
* managingOrganization ^short = "Organization managing the case"

* period 0..1 MS
* period ^short = "Case timeframe"

* referralRequest 0..* MS
* referralRequest only Reference(ServiceRequest)
* referralRequest ^short = "Related service requests"
