Invariant: em-condition-1
Description: """
A discharge-diagnosis category Condition must have a confirmed
verificationStatus. A provisional or differential diagnosis must never be
submitted for claims adjudication as though it were confirmed.
"""
Severity: #error
Expression: """
category.coding.where(code = 'discharge-diagnosis').exists() implies
verificationStatus.coding.where(code = 'confirmed').exists()
"""

Invariant: em-condition-2
Description: """
Condition.abatementDateTime is not a meaningful concept for an acute emergency
diagnosis stage and must not be populated on this profile.
"""
Severity: #error
Expression: """
abatement.empty()
"""


Invariant: em-vitals-1
Description: """
A vital-signs Observation must carry either a top-level value (single-value
vitals such as HR, RR, Temp, SpO2, or a GCS total captured without
sub-scores) or at least one component (panel vitals such as blood pressure,
or a GCS captured as eye/verbal/motor sub-scores).
"""
Severity: #error
Expression: """
value.exists() or component.exists()
"""


Invariant: em-exam-1
Description: """
The noFindingsOnExam extension must agree with whether any finding was coded:
true only when no finding is present, false whenever a finding is coded.
"""
Severity: #error
Expression: """
(value.exists() or component.exists()) implies
extension.where(url = 'https://nshr-uat.sha.go.ke/fhir/StructureDefinition/em-no-findings-on-exam').value.ofType(boolean) = false
"""

Invariant: em-exam-2
Description: """
When no finding is coded, the noFindingsOnExam extension must be true.
"""
Severity: #error
Expression: """
(value.empty() and component.empty()) implies
extension.where(url = 'https://nshr-uat.sha.go.ke/fhir/StructureDefinition/em-no-findings-on-exam').value.ofType(boolean) = true
"""
