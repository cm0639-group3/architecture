# 4. Implement dev side static code checks

Date: 2023-12-27

## Status

Accepted

## Context

Developer workspace should be a consistent environment were bootstrapping should be minimize the most possible to quickly onboard new members and start delivering value in applications.

## Decision

All projects should contain the needed dependencies or tools, related to the corresponding stack, to provide basic static code checking. Some examples would be: 
- Linter
- Code Formatter

These tools should be run automatically whenever there is a new change in the codebase.

## Consequences

Without these tools, onboarding new developers to work in a specific technology stack or project will become more complicated. 
Not having a configured environment, with code formatting tools or agreements on style, will result in new changes that break consistency and established best practices.

 These deviations could generate problems related to the stability of the project and introduce unexpected bugs to existing working codebases.
