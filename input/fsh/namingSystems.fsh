Instance: ns-national-id
InstanceOf: NamingSystem
Usage: #definition
Title: "NamingSystem - Kenya National ID"
Description: "Unique national identifier assigned to Kenyan citizens and residents."

* name = "KenyaNationalId"
* status = #active
* kind = #identifier
* date = "2026-01-01"
* publisher = "Digital Health Agency of Kenya"
* responsible = "Kenya National Registration Bureau"
* description = "Kenya National ID number used as a primary patient identifier in emergency workflows."
* jurisdiction = urn:iso:std:iso:3166#KE "Kenya"
* uniqueId[0].type = #uri
* uniqueId[0].value = "https://ilm-hie.dha.go.ke/fhir/NamingSystem/national-id"
* uniqueId[0].preferred = true

Instance: ns-emergency-record-identifier
InstanceOf: NamingSystem
Usage: #definition
Title: "NamingSystem - Kenya Emergency Record Identifier"
Description: "Identifier system for records created within the Kenya emergency and ambulance services workflow."

* name = "KenyaEmergencyRecordIdentifier"
* status = #active
* kind = #identifier
* date = "2026-01-01"
* publisher = "Digital Health Agency of Kenya"
* responsible = "Digital Health Agency of Kenya"
* description = "Shared identifier namespace for emergency workflow records in this implementation guide."
* jurisdiction = urn:iso:std:iso:3166#KE "Kenya"
* uniqueId[0].type = #uri
* uniqueId[0].value = "https://fhir.dha.go.ke/emergency/NamingSystem/emergency-record-identifier"
* uniqueId[0].preferred = true
