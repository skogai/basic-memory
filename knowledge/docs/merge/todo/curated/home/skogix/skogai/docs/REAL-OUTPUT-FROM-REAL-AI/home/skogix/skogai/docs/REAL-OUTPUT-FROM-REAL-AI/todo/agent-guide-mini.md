---
title: Synthesis of Skogai Memory Agent Guide
type: note
permalink: synthesis/synthesis-of-skogai-memory-agent-guide-2
---

# Synthesis of the SkogAI-Memory Agent Guide

## Overview

The **SkogAI-Memory Agent Guide** is designed to help you, the AI assistant, use SkogAI-Memory tools effectively when working with users. This guide covers reading, writing, and navigating knowledge through the Model Context Protocol (MCP). SkogAI-Memory allows both you and users to record context in local Markdown files, building a rich knowledge base through natural conversations.

## Key Features

- **Local-First**: All data is stored in plain text files on the user's computer.
- **Real-Time**: Users see content updates immediately.
- **Bi-Directional**: Both you and users can read and edit notes.
- **Semantic**: Simple text patterns create a structured knowledge graph.
- **Persistent**: Knowledge persists across sessions and conversations.

## The Importance of the Knowledge Graph

The value of SkogAI-Memory lies in the connections between notes, not just the notes themselves. When creating content, focus on:

1. **Increasing Semantic Density**: Add multiple observations and relations to each note.
1. **Using Accurate References**: Reference existing entities by their exact titles.
1. **Creating Forward References**: Reference entities that don't exist yet; SkogAI-Memory will resolve these when they're created later.
1. **Creating Bidirectional Links**: Connect entities from both directions.
1. **Using Meaningful Categories**: Add semantic context with appropriate observation categories.
1. **Choosing Precise Relations**: Use specific relation types that convey meaning.

## Core Tools Reference

- **Writing Knowledge**:

  ```python
  response = await write_note(
      title="Search Design",              # Required: Note title
      content="# Search Design\\n...",    # Required: Note content
      folder="specs",                     # Optional: Folder to save in
      tags=["search", "design"],          # Optional: Tags for categorization
      verbose=True                        # Optional: Get parsing details
  )
  ```

- **Reading Knowledge**:

  ```python
  content = await read_note("Search Design")  # By title
  content = await read_note("specs/search-design")  # By path
  content = await read_note("memory://specs/search")  # By memory URL
  ```

- **Searching for Knowledge**:

  ```python
  results = await search_notes(
      query="authentication system",  # Text to search for
      page=1,                         # Optional: Pagination
      page_size=10                    # Optional: Results per page
  )
  ```

- **Building Context from the Knowledge Graph**:

  ```python
  context = await build_context(
      url="memory://specs/search",  # Starting point
      depth=2,                       # Optional: How many hops to follow
      timeframe="1 month"            # Optional: Recent timeframe
  )
  ```

- **Checking Recent Changes**:

  ```python
  activity = await recent_activity(
      type="all",                    # Optional: Entity types to include
      depth=1,                       # Optional: Related items to include
      timeframe="1 week"             # Optional: Time window
  )
  ```

- **Creating a Knowledge Visualization**:

  ```python
  canvas_result = await canvas(
      nodes=[{"id": "note1", "label": "Search Design"}],  # Nodes to display
      edges=[{"from": "note1", "to": "note2"}],           # Connections
      title="Project Overview",                           # Canvas title
      folder="diagrams"                                   # Storage location
  )
  ```

## memory:// URLs Explained

SkogAI-Memory uses a special URL format to reference entities in the knowledge graph:

- `memory://title` - Reference by title
- `memory://folder/title` - Reference by folder and title
- `memory://permalink` - Reference by permalink
- `memory://path/relation_type/*` - Follow all relations of a specific type
- `memory://path/*/target` - Find all entities with relations to target

## Semantic Markdown Format

Knowledge is encoded in standard markdown using simple patterns:

- **Observations**:

  ```markdown
  - [category] This is an observation #tag1 #tag2 (optional context)
  ```

- **Relations**:

  ```markdown
  - relation_type [[Target Entity]] (optional context)
  ```

**Common Categories & Relation Types:**

- Categories: `[idea]`, `[decision]`, `[question]`, `[fact]`, `[requirement]`, `[technique]`, `[recipe]`, `[preference]`
- Relations: `relates_to`, `implements`, `requires`, `extends`, `part_of`, `pairs_with`, `inspired_by`, `originated_from`

## When to Record Context

Always consider recording context when:

- Users make decisions or reach conclusions
- Important information emerges during conversation
- Multiple related topics are discussed
- The conversation contains information that might be useful later
- Plans, tasks, or action items are mentioned

**Protocol for recording context:**

1. Identify valuable information in the conversation
1. Ask the user: "Would you like me to record our discussion about [topic] in SkogAI-Memory?"
1. If they agree, use `write_note` to capture the information
1. If they decline, continue without recording
1. Let the user know when information has been recorded: "I've saved our discussion about [topic] to SkogAI-Memory."

## Understanding User Interactions

- **Creating knowledge**:

  ```plaintext
  Human: "Let's write up what we discussed about search."
  You: I'll create a note capturing our discussion about the search functionality.
  [Use write_note() to record the conversation details]
  ```

- **Referencing existing knowledge**:

  ```plaintext
  Human: "Take a look at memory://specs/search"
  You: I'll examine that information.
  [Use build_context() to gather related information]
  [Then read_note() to access specific content]
  ```

- **Finding information**:

  ```plaintext
  Human: "What were our decisions about auth?"
  You: Let me find that information for you.
  [Use search_notes() to find relevant notes]
  [Then build_context() to understand connections]
  ```

## Key Things to Remember

1. **Files are Truth**:

   - All knowledge lives in local files on the user's computer.
   - Users can edit files outside your interaction.
   - Changes need to be synced by the user (usually automatic).
   - Always verify information is current with `recent_activity()`.

1. **Building Context Effectively**:

   - Start with specific entities.
   - Follow meaningful relations.
   - Check recent changes.
   - Build context incrementally.
   - Combine related information.

1. **Writing Knowledge Wisely**:

   - Using the same title+folder will overwrite existing notes.
   - Structure content with clear headings and sections.
   - Use semantic markup for observations and relations.
   - Keep files organized in logical folders.

## Common Knowledge Patterns

- **Capturing Decisions**:

  ```markdown
  # Coffee Brewing Methods

  ## Context
  I've experimented with various brewing methods including French press, pour over, and espresso.

  ## Decision
  Pour over is my preferred method for light to medium roasts because it highlights subtle flavors and offers more control over the extraction.

  ## Observations
  - [technique] Blooming the coffee grounds for 30 seconds improves extraction #brewing
  - [preference] Water temperature between 195-205°F works best #temperature
  - [equipment] Gooseneck kettle provides better control of water flow #tools

  ## Relations
  - pairs_with [[Light Roast Beans]]
  - contrasts_with [[French Press Method]]
  - requires [[Proper Grinding Technique]]
  ```

- **Recording Project Structure**:

  ```markdown
  # Garden Planning

  ## Overview
  This document outlines the garden layout and planting strategy for this season.

  ## Observations
  - [structure] Raised beds in south corner for sun exposure #layout
  - [structure] Drip irrigation system installed for efficiency #watering
  - [pattern] Companion planting used to deter pests naturally #technique

  ## Relations
  - contains [[Vegetable Section]]
  - contains [[Herb Garden]]
  - implements [[Organic Gardening Principles]]
  ```

- **Technical Discussions**:

  ```markdown
  # Recipe Improvement Discussion

  ## Key Points
  Discussed strategies for improving the chocolate chip cookie recipe.

  ## Observations
  - [issue] Cookies spread too thin when baked at 350°F #texture
  - [solution] Chilling dough for 24 hours improves flavor and reduces spreading #technique
  - [decision] Will use brown butter instead of regular butter #flavor

  ## Relations
  - improves [[Basic Cookie Recipe]]
  - inspired_by [[Bakery-Style Cookies]]
  - pairs_with [[Homemade Ice Cream]]
  ```

- **Creating Effective Relations**: When creating relations, you can:

  1. Reference existing entities by their exact title.
  1. Create forward references to entities that don't exist yet.

  ```python
  async def create_note_with_effective_relations():
      search_results = await search_notes("travel")
      existing_entities = [result.title for result in search_results.primary_results]

      packing_tips_exists = "Packing Tips" in existing_entities
      japan_travel_exists = "Japan Travel Guide" in existing_entities

      relations_section = "## Relations\n"

      if packing_tips_exists:
          relations_section += "- references [[Packing Tips]]\n"
      else:
          relations_section += "- references [[Packing Tips]]\n"

      if japan_travel_exists:
          relations_section += "- part_of [[Japan Travel Guide]]\n"

      recent = await recent_activity(timeframe="1 week")
      recent_titles = [item.title for item in recent.primary_results]

      if "Transportation Options" in recent_titles:
          relations_section += "- relates_to [[Transportation Options]]\n"

      relations_section += "- located_in [[Tokyo]]\n"
      relations_section += "- visited_during [[Spring 2023 Trip]]\n"

      content = f"""# Tokyo Neighborhood Guide

  ## Overview
  Details about different Tokyo neighborhoods and their unique characteristics.

  ## Observations
  - [area] Shibuya is a busy shopping district #shopping
  - [transportation] Yamanote Line connects major neighborhoods #transit
  - [recommendation] Visit Shimokitazawa for vintage shopping #unique
  - [tip] Get a Suica card for easy train travel #convenience

  {relations_section}
  """

      result = await write_note(
          title="Tokyo Neighborhood Guide",
          content=content,
          verbose=True
      )

      if result and 'relations' in result:
          resolved = [r['to_name'] for r in result['relations'] if r.get('target_id')]
          forward_refs = [r['to_name'] for r in result['relations'] if not r.get('target_id')]

          print(f"Resolved relations: {resolved}")
          print(f"Forward references that will be resolved later: {forward_refs}")
  ```

## Error Handling

- **Missing Content**:

  ```python
  try:
      content = await read_note("Document")
  except:
      results = await search_notes("Document")
      if results and results.primary_results:
          content = await read_note(results.primary_results[0].permalink)
  ```

- **Forward References (Unresolved Relations)**:

  ```python
  response = await write_note(..., verbose=True)
  forward_refs = []
  for relation in response.get('relations', []):
      if not relation.get('target_id'):
          forward_refs.append(relation.get('to_name'))

  if forward_refs:
      print(f"Note created with forward references to: {forward_refs}")
      print("These will be automatically linked when those notes are created.")
      print("Would you like me to create any of these notes now to complete the connections?")
  ```

- **Sync Issues**:

  ```python
  activity = await recent_activity(timeframe="1 hour")
  if not activity or not activity.primary_results:
      print("It seems there haven't been recent updates. You might need to run 'skogcli memory sync'.")
  ```

## Best Practices

1. **Proactively Record Context**:

   - Offer to capture important discussions.
   - Record decisions, rationales, and conclusions.
   - Link to related topics.
   - Ask for permission first: "Would you like me to save our discussion about [topic]?"
   - Confirm when complete: "I've saved our discussion to SkogAI-Memory."

1. **Create a Rich Semantic Graph**:

   - Add meaningful observations: Include at least 3-5 categorized observations in each note.
   - Create deliberate relations: Connect each note to at least 2-3 related entities.
   - Use existing entities: Before creating a new relation, search for existing entities.
   - Verify wikilinks: Use exact titles of existing notes when referencing.
   - Check accuracy: Use `search_notes()` or `recent_activity()` to confirm entity titles.
   - Use precise relation types: Choose specific relation types that convey meaning (e.g., "implements" instead of "relates_to").
   - Consider bidirectional relations: When appropriate, create inverse relations in both entities.

1. **Structure Content Thoughtfully**:

   - Use clear, descriptive titles.
   - Organize with logical sections (Context, Decision, Implementation, etc.).
   - Include relevant context and background.
   - Add semantic observations with appropriate categories.
   - Use a consistent format for similar types of notes.
   - Balance detail with conciseness.

1. **Navigate Knowledge Effectively**:

   - Start with specific searches.
   - Follow relation paths.
   - Combine information from multiple sources.
   - Verify information is current.
   - Build a complete picture before responding.

1. **Help Users Maintain Their Knowledge**:

   - Suggest organizing related topics.
   - Identify potential duplicates.
   - Recommend adding relations between topics.
   - Offer to create summaries of scattered information.
   - Suggest potential missing relations: "I notice this might relate to [topic], would you like me to add that connection?"

## Relations

- relates_to \[[SkogAI-Memory Agent Guide]\]
