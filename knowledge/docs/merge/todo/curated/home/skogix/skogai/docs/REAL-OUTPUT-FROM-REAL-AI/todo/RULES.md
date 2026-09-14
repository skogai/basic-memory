---
title: RULES
type: note
permalink: todo/rules-2
---

# rules for memory files

## file naming

- use lowercase for all filenames #naming #standards
- use hyphens for word separation (not spaces or underscores) #formatting
- keep names short and descriptive #clarity
- avoid redundancy with folder structure #organization
- example: `ci-workflow.md` not `SkogAI-Memory Continuous Integration Workflow.md` #example

## special files

- system files may use uppercase: README.md, TODO.md, RULES.md #convention
- these files serve as anchors and reference points #structure
- regular content files always use lowercase with hyphens #consistency
- documentation files follow their subject's capitalization when required #exception

## file location

- place files in appropriate folders that provide context #organization #structure
- let the folder structure convey hierarchy information #hierarchy
- don't repeat folder information in filenames #redundancy
- example: `skogai/memory/ci-workflow.md` not `skogai/memory/skogai-memory-workflow.md` #example

## content structure

- use lowercase for headings when possible #formatting
- maintain consistent heading hierarchy #structure
- include observations with proper category tags #semantics
- create meaningful relations to other documents #connections
- use wikilinks with exact matching titles #linking

## formatting best practices

- use code blocks for commands and code snippets #readability
- use bullet points for lists of related items #clarity
- include examples to illustrate key points #understanding
- maintain consistent formatting throughout #consistency
- limit line length for better readability #accessibility

## observations format

- use square brackets for categories: `[fact]`, `[decision]`, etc. #syntax
- add hashtags for relevant tags: `#naming #standards` #categorization
- 3-5 observations per document is ideal #quantity
- categories: fact, decision, principle, technique, requirement, question #types
- place observations in dedicated section #organization

## relations format

- create 2-3 meaningful relations per document #connections
- use specific relation types: `relates_to`, `part_of`, `implements` #specificity
- include brief context when helpful #clarity
- build bidirectional relations when appropriate #completeness
- place relations in dedicated section #organization

## automated enforcement

- files are automatically checked against these rules #automation
- enforce.sh script applies rules to memory files #tooling
- all changes must be documented in CHANGES.md #tracking
- entry format: "[YYYY-MM-DD] filename.md: description of changes" #format
- rule enforcement takes precedence over stylistic preferences #priorities

## enforcement prompt

```
analyze this file against RULES.md standards and automatically implement all necessary changes to make it compliant:

1. **File Naming**:
   - Fix any uppercase, spaces, or redundant information
   - Ensure lowercase with hyphen separators
   - Maintain consistency with folder naming conventions

2. **Content Structure**:
   - Convert headings to lowercase when possible
   - Implement consistent formatting throughout
   - Add missing sections if required

3. **Observations**:
   - Fix or add observations using proper format: [category] description #tags
   - Ensure 3-5 observations with appropriate categories exist
   - Add relevant hashtags for categorization

4. **Relations**:
   - Create or correct 2-3 meaningful relations
   - Use specific relation types (not just generic links)
   - Establish bidirectional connections where appropriate

5. **Implementation**:
   - Make all necessary changes directly to ensure compliance
   - Document every change made in ./CHANGES.md with the format:
     "[DATE] filename.md: description of changes made"
   - Do not make stylistic changes unless required by RULES.md

Return both the fully corrected version of the file and a list of all changes made.
```

## why this matters

- enables cli tools to work properly #tooling #automation
- supports automated processing #processing
- prevents escaping issues in terminals #compatibility
- allows consistent references across systems #interoperability
- improves searchability and organization #findability

## workflow

- start in `todo` folder with clean names #process #organization
- let automated systems suggest proper permanent locations #automation
- maintain consistent standards as content moves through system #consistency
- focus on content quality and connections, not perfect formatting #priorities
- use tags consistently to enable cross-reference discovery #discoverability

## observations

- [fact] lowercase hyphenated filenames work reliably across all systems #compatibility #standards
- [principle] folder structure should convey context so filenames can be simpler #organization #hierarchy
- [decision] file and directory names should never include spaces #standards #interoperability
- [technique] use folder paths for context and filenames for specific identity #naming #structure
- [requirement] special system files may use uppercase following conventions #convention #exception
- [requirement] all rule enforcement changes must be documented for traceability #accountability #tracking

## relations

- relates_to \[[ci-workflow]\] (provides standards for workflow documentation)
- implements \[[documentation-standards]\] (establishes consistent formatting rules)
- part_of \[[memory-system]\] (defines key organizational principles)
- relates_to \[[enforce]\] (contains prompt used for automated enforcement)
