# Conformance Requirements

Systems claiming conformance to this guide should implement the profiles,
terminology bindings, and interoperability expectations defined here.

## Conformance Language

This guide uses standard requirement keywords:

- `SHALL` indicates an absolute requirement
- `SHOULD` indicates a strong recommendation
- `MAY` indicates an optional capability

## Must Support

Elements marked `Must Support` are important for emergency exchange. Sending
systems should populate these elements when the information is known and
captured. Receiving systems should be able to process, display, or otherwise
handle them in a meaningful way.

## Terminology

Implementers should use the CodeSystems and ValueSets defined or referenced by
this guide for emergency workflow concepts such as:

- case priority
- ambulance case lifecycle status
- assessment categories
- medication administration routes
- dose units
- investigation codes

## Validation

Implementations should validate generated resources against the published
profiles and terminology constraints as part of build, testing, and integration
workflows.

## Examples

This repository includes a starter example patient instance. Additional example
coverage should be expanded as the emergency workflow package matures.
