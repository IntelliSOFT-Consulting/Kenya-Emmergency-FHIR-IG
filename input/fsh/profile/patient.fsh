Profile: KenyaEmergencyPatient
Parent: Patient
Id: kenya-emergency-patient
Title: "Patient - Kenya Emergency"
Description: "Represents a patient receiving pre-hospital or emergency services in Kenya."

* identifier 1..* MS
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* name 1..* MS
* telecom 0..* MS
* gender 0..1 MS
* birthDate 0..1 MS
* address 0..* MS


