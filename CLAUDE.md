# Claude Code Development Guide

This document provides guidance for AI assistants (like Claude) working on this
project.

## Development Guidelines

### Commit Message Format

This project uses **Conventional Commits** specification. All commits must
follow this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### Types

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that don't affect code meaning (formatting, whitespace)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `perf`: Performance improvements
- `test`: Adding or correcting tests
- `build`: Changes to build system or dependencies
- `ci`: Changes to CI configuration files and scripts
- `chore`: Other changes that don't modify src or test files

#### Examples

```
feat(bins): add support for half-grid sized bins

fix(baseplate): correct hole positioning for 28mm grid

docs(readme): update installation instructions

refactor(core): simplify grid calculation logic

test(bins): add test cases for cylindrical compartments
```

#### Breaking Changes

If a commit introduces breaking changes, add `!` after the type or include
`BREAKING CHANGE:` in the footer:

```
feat!: change GRID_DIMENSIONS_MM from 42mm to 28mm

BREAKING CHANGE: All existing models will need to be regenerated
with the new 28mm grid size to match openGrid specification.
```
