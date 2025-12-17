Profile: KenyaAmbulanceEpisodeOfCare
Parent: EpisodeOfCare
Id: kenya-ambulance-episodeofcare
Title: "EpisodeOfCare – Kenya Ambulance Case"
Description: "Represents an ambulance case episode in the Kenya Emergency Medical Services workflow."

* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya ambulance case profile"

* status 1..1 MS
* status ^short = "Episode status"

* insert IdentifierRequiredRule(identifier, 1..*)


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
