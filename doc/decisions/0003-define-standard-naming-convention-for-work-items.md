# 3. Define standard naming convention for work items

Date: 2023-12-27

## Status

Accepted

## Context

We need a way to communicate how each work item is related at a high-level with each project, module and line of work. Defining a unique ID to refer to a work item will make traceability easier when reporting progress and overall work progress in the project.

## Decision

Use a standard naming convention for all work items define in the project.
Proposal: 

- Work items should be named with acronyms, following the pattern: `<Project>-<Module>-<Sequence ID>`. For example, for a work item contained in the frontend project, related to the sign in module a work item could be identified by: `FE-AUTH-001`.

## Consequences

If we do not keep track of the work items we are performing it will be more difficult to provide high-level reports on progress and output of the project. 
Also, it will be harder to relate a set of acceptance criteria to a block of work, making it complicated to estimate resources allocation (time, developer effort, etc.)