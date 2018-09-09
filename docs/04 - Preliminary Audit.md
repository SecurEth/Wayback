# Preliminary Audit

*Send this doc to the auditor before the meeting*

## Meeting Agenda
- Present System Description Document
- Present Development Plan
- Present Architecture
- Discuss and get inputs. The intent is to validate the plan as reasonable and achievable

## Meeting Notes

- Is the auditor a good fit for the team?
  - yes, it seems both parties have matching interests and experties
- SDD:
  - Eho are the privileged parties?
- Architecture:
  - Running a full node?  Is it exposed? (n/a)
  - Who does the key management?
    - Devs and Auditors. End users don't need to manage keys
  - Follow 721 pattern?
    - TODO: Investigate
- Development Plan:
  - Use Aragon for opt-in upgradability?
    - TODO: Investigate
  - Use [Interface] -> [Tests] -> [Contract] flow
    - TODO: Integrate in workflow
  - Use typescript for js tests
    - TODO: Integrate in workflow
