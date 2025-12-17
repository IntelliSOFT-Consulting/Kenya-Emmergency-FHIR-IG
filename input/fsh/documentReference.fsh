Profile: KenyaDocumentReference
Parent: DocumentReference
Id: kenya-documentreference
Title: "DocumentReference - Kenya"
Description: "Kenya DocumentReference profile for clinical and administrative documents."


* meta 1..1 MS
* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya DocumentReference profile"

* insert IdentifierRequiredRule(identifier, 1..*)

* status 1..1 MS
* status ^short = "Document status"

* type 0..1 MS
* type ^short = "Document type"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patient"

* date 0..1 MS
* date ^short = "Document creation date"

* author 0..* MS
* author only Reference(Practitioner)
* author ^short = "Document author"

// =======================
// Document Content
// =======================
* content 1..* MS
* content ^short = "Document content"

* content.attachment 1..1 MS
* content.attachment ^short = "Attached file"

* content.attachment.url 0..1 MS
* content.attachment.url ^short = "File URL"

* content.attachment.title 0..1 MS
* content.attachment.title ^short = "File title"

// =======================
// Document Context
// =======================
* context 0..1 MS
* context ^short = "Document context"

* context.encounter 0..* MS
* context.encounter only Reference(Encounter)
* context.encounter ^short = "Related encounter"

