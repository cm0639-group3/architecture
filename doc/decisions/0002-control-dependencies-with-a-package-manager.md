# 2. Control dependencies with a package manager

Date: 2023-12-27

## Status

Accepted

## Context

We need an environment that is consistent throughout the different developer contexts in which the application will be worked.

## Decision

Use a package manager that controls the dependencies on each project.
Also keep .lock files to ensure reproducibility of versions and resolutions within the packages.

## Consequences

Without this practice, we might have different versions of code running at the same time.
This makes easier to have:
- Hard-to-reproduce issues
- Vulnerabilities due to older and unsupported versions
- Breaking changes being applied into production systems without proper testing
