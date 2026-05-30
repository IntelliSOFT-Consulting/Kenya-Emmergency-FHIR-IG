# Downloads & Validation

Build outputs for this implementation guide are generated into the repository's
`output/` directory whenever the IG publisher is run successfully.

## Typical Generated Artifacts

Implementers can use the generated output for:

- site preview and narrative pages
- packaged FHIR artifacts for validation
- generated JSON, XML, and Turtle resources
- QA and terminology validation reports

## Local Validation Example

Use the generated package to validate a resource locally:

```bash
java -jar validator_cli.jar \
  -ig output/package.tgz \
  -profile https://fhir.dha.go.ke/emergency/StructureDefinition/ke-ambulance-encounter \
  my-resource.json
```

## Build Review

During implementation, reviewers should pay special attention to:

- profile validation results in `output/qa.html`
- terminology binding behavior for emergency-specific value sets
- completeness of examples for the defined emergency profiles
