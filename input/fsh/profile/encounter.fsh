Profile: KenyaAmbulanceEncounter
Parent: Encounter
Id: ke-ambulance-encounter
Title: "Kenya Ambulance Encounter"
Description: "Encounter profile for ambulance services in Kenya."

* meta 1..1
* meta.profile 1..*

* identifier 1..* MS

* status 1..1 MS
* status from AmbulanceCaseStatusVS (required)

* class 1..1 MS

* subject 1..1 MS
* subject only Reference(Patient)

* episodeOfCare 1..* MS
* episodeOfCare only Reference(EpisodeOfCare)

* participant 0..* MS
* participant.individual 1..1 MS
* participant.individual only Reference(Practitioner)

* period 0..1 MS
* serviceProvider 0..1 MS
* serviceProvider only Reference(Organization)

* location 1..* MS
* location.location 1..1 MS
* location.location only Reference(Location)