Profile: KenyaQuestionnaireResponse
Parent: QuestionnaireResponse
Id: kenya-questionnaireresponse
Title: "QuestionnaireResponse - Kenya"
Description: "Kenya QuestionnaireResponse profile representing captured questionnaire responses."

// =======================
// Metadata
// =======================
* meta 1..1 MS
* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya QuestionnaireResponse profile"

* insert IdentifierRequiredRule(identifier, 0..1)

* status 1..1 MS
* status ^short = "Response status"

* questionnaire 0..1 MS
* questionnaire ^short = "Questionnaire reference"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient"

* encounter 0..1 MS
* encounter only Reference(Encounter)
* encounter ^short = "Associated encounter"

* authored 0..1 MS
* authored ^short = "When completed"

* author 0..1 MS
* author only Reference(Practitioner)
* author ^short = "Who completed the questionnaire"

* item 0..* MS
* item ^short = "Response items"

