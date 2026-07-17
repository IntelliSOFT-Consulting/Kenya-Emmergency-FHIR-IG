Invariant: em-obs-1
Description: """
A caller-reported level-of-consciousness Observation cannot contain both a
value and a dataAbsentReason.
"""
Severity: #error
Expression: """
value.exists() implies dataAbsentReason.empty()
"""