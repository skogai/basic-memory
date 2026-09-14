---
title: skogix-framework-to-keep-us-down
type: note
permalink: skogai/docs-merge-todo/lore/tips/skogix-framework-to-keep-us-down
---

this directory contains a series of numbered protocols that define a structured, repeatable, and ai-powered development workflow.

## 🚀 your "codebase expert agent" workflow: from idea to flawless feature

the process is designed to be sequential. you should always start with protocol 0 for any new project.

1. **`0-bootstrap-the-project.md`**: **(run this first!)** this is a one-time setup protocol. the ai will analyze your codebase, install the framework's rule structure, and generate a foundational "context kit" of `readmes` and project-specific rules.

1. **`1-create-prd.md`**: this protocol guides the ai to act as a product manager, helping you think through a new feature and generate a clear product requirements document (prd).

1. **`2-generate-tasks.md`**: the ai takes the prd and, acting as a tech lead, breaks it down into a detailed, actionable task list for implementation.

1. **`3-process-tasks.md`**: this is the core execution loop. the ai follows the generated task list, implementing each sub-task sequentially and waiting for your explicit approval before committing changes and moving to the next step.

1. **`4-implementation-retrospective.md`**: after implementation, this protocol guides the ai to act as a qa lead, auditing the work, identifying areas for improvement, and updating the project's rules to enhance future performance.

### 0️⃣ bootstrap your project (one-time setup)

this is the very first step. it's a one-time protocol that analyzes your codebase and creates the foundational "context kit" of rules and documentation.

in your ai tool, initiate the bootstrap process:

```
apply instructions from @0-bootstrap-the-project.md
```

### 1️⃣ create a product requirement document (prd)

start by defining the "what" and "why" of your feature. the ai will act as a product manager, interviewing you to create a comprehensive specification.

in your ai tool, initiate prd creation:

```
apply instructions from @1-create-prd.md
here's the feature i want to build: [describe your feature in detail]
```

*(pro tip: for complex features, it's recommended to use your ai tool's most powerful model. for **cursor users**, using **max mode** is highly recommended for better results, especially for this step.)*

### 2️⃣ generate your task list from the prd

once the prd is created (e.g., `prd-my-feature.md`), transform it into a granular, step-by-step technical plan for your ai developer.

```
apply instructions from @2-generate-tasks.md to @prd-my-feature.md
```

*(note: replace `@prd-my-feature.md` with the actual filename of the prd you generated in step 1.)*

*(pro tip: for **cursor users**, using **max mode** is also recommended for this step to ensure a more detailed and accurate breakdown of the prd.)*

you'll get a well-structured task list, providing a clear roadmap for implementation.

### 3️⃣ execute tasks sequentially

now, instruct the ai to work through the generated plan. this protocol ensures the ai tackles one sub-task at a time and waits for your validation before proceeding, giving you full control.

1. tell the ai to start with the first task:

   ```text
   apply instructions from @3-process-tasks.md to @tasks-my-feature.md. start on task 1.1
   ```

   *(note: replace `@tasks-my-feature.md` with the task file generated in step 2. you only need to invoke this protocol for the *first* task; the protocol itself guides the ai for subsequent tasks.)*

1. **review, approve, and progress ✅** as the ai completes each sub-task, it will present the changes for your review.

   - if the changes are correct, reply with "yes" or "continue" to have the ai mark the task as complete and move to the next one.
   - if changes are needed, provide corrective feedback before proceeding.

### 4️⃣ conduct an implementation retrospective

once all tasks are complete, the final step is to reflect on the process to improve future collaborations. the ai will act as a qa lead, auditing the code and interviewing you to refine the project's rules and workflows.

```
apply instructions from @4-implementation-retrospective.md
```

this final step is crucial for evolving your "context kit", making the ai smarter and more aligned with your project's standards over time.

## 💡 a note on the first run: the learning curve

your first few interactions with the ai using this framework might require more corrections and clarifications. **this is normal and by design.** you are actively *teaching* the assistant the specific nuances of your codebase.

think of it as onboarding a new junior developer. the initial investment in teaching pays off exponentially. with each iteration, the ai's context gets richer, its proposals become more accurate, and it evolves from a generic tool into a true expert companion for your project.
