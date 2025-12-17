Profile: KenyaComposition
Parent: Composition
Id: kenya-composition
Title: "Composition - Kenya"
Description: "Kenya Composition profile representing a clinical or administrative entry composition."

// =======================
// Metadata
// =======================
* meta 1..1 MS
* meta.profile 1..* MS
* meta.profile ^short = "Enforces conformance to the Kenya Composition profile"

* insert IdentifierRequiredRule(identifier, 0..1)

* status 1..1 MS
* status ^short = "Composition status"

* type 1..1 MS
* type ^short = "Composition type"

* subject 0..1 MS
* subject only Reference(Patient)
* subject ^short = "Subject patient"

* date 1..1 MS
* date ^short = "Composition date"

* author 1..* MS
* author only Reference(Practitioner)
* author ^short = "Author(s)"

* title 1..1 MS
* title ^short = "Composition title"


* section 0..* MS
* section ^short = "Composition sections"

* section.entry 0..* MS
* section.entry ^short = "Entry objects referenced by the section"
