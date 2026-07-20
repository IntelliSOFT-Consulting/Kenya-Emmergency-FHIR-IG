Instance: KenyaEmergencyPatientValidExample
InstanceOf: KenyaEmergencyPatient
Usage: #example
Title: "Valid Unidentified Emergency Patient"
Description: """
A valid unidentified emergency patient with a temporary tracking number,
approximate age, and triage-level adult status.
"""

* active = true

* extension[unidentifiedPatient].valueBoolean = true
* extension[patientIdentityVerified].valueBoolean = false

* extension[approximateAge].valueAge.value = 34
* extension[approximateAge].valueAge.unit = "years"
* extension[approximateAge].valueAge.system = "http://unitsofmeasure.org"
* extension[approximateAge].valueAge.code = #a

* extension[isAdult].valueBoolean = true

* identifier[tempTrackingNumber].use = #temp
* identifier[tempTrackingNumber].system =
    "http://hie.go.ke/fhir/identifier/patient-temp-tracking"
* identifier[tempTrackingNumber].value = "EM-2026-000184"

* name.text = "Unknown Male"

* gender = #male



Instance: KenyaEmergencyPatientInvalidExample
InstanceOf: Patient
Usage: #example
Title: "Invalid Kenya Emergency Patient"
Description: """
An intentionally non-conformant Patient instance used to demonstrate
validation errors against the Kenya Emergency Patient profile.
"""

// Tell the validator that this Patient claims conformance to the profile.
* meta.profile[0] = Canonical(KenyaEmergencyPatient)

* active = true

// Required unidentifiedPatient extension is deliberately omitted.

// Identity verification is present even though unidentified status is missing.
* extension[0].url = Canonical(EMPatientIdentityVerified)
* extension[0].valueBoolean = true

// Invalid temporary tracking identifier.
* identifier[0].use = #official
* identifier[0].system = "http://example.org/incorrect-tracking-system"
* identifier[0].value = "TEMP-001"

* name[0].text = "Unknown Male"
* gender = #male
