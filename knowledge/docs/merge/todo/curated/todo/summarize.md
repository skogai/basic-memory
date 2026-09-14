---
title: summarize
type: note
permalink: todo/summarize-2
---

#!/bin/bash

# summarize.sh - Automated memory file processing and enhancement script

# Place in ~/scripts or similar location and make executable with chmod +x summarize.sh

# Configuration

MEMORY_ROOT="${HOME}/skogdata/memories" TODO_DIR="${MEMORY_ROOT}/todo" PROCESSED_DIR="${MEMORY_ROOT}/processed" SUMMARIES_FILE="${MEMORY_ROOT}/summaries.md" LOG_FILE="${MEMORY_ROOT}/summarize.log" MODEL="llama3.2" # Change to your preferred local model

# Create required directories if they don't exist

mkdir -p "${PROCESSED_DIR}" touch "${SUMMARIES_FILE}" touch "${LOG_FILE}"

# Log function

log_message() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "${LOG_FILE}" }

log_message "Starting summarize.sh run"

# Process all markdown files in todo directory

find "${TODO_DIR}" -type f -name "\*.md" | while read -r file; do filename=$(basename "$file")

# Skip system files

if \[\[ "$filename" =~ ^[A-Z]+.md$ \]\]; then log_message "Skipping system file: $filename" continue fi

log_message "Processing: $filename"

# Generate summary with relation guidance

log_message "Generating summary..." summary=$(cat "$file" | ollama run ${MODEL} " Please summarize this file with focus on:

```
1. **Linking/Relations** (most important):
   - Create bidirectional connections between notes
   - Use specific relation types (not just generic links)
   - Include both existing references and forward references
   - Aim for 2-3 meaningful relations per note

2. **Observations** (equally important):
   - Add categorized observations (3-5 per note)
   - Use proper observation syntax: [category] description #tags
   - Common categories: [idea], [decision], [fact], [technique]
   - Include relevant tags for organization

3. **Content Structure**:
   - Use clear headings and sections
   - Maintain consistent formatting
   - Include context/background information
   - Balance detail with conciseness

4. **Proactive Practices**:
   - Verify note titles before linking
   - Check for recent changes/updates
   - Suggest potential missing connections
   - Offer to organize scattered information

Format your summary to highlight key concepts, observations, and suggested relations.
")
```

# Append to summaries file with clear separation

{ echo -e "\\n## Summary of: $filename" echo "$(date '+%Y-%m-%d %H:%M:%S')" echo "$summary" echo -e "\\n---" } >> "${SUMMARIES_FILE}"

# Generate enhanced version with proper structure

log_message "Generating enhanced version..."

# Extract title from filename (remove extension and convert hyphens to spaces)

title=$(echo "$filename" | sed 's/.md$//' | sed 's/-/ /g')

enhanced=$(cat "$file" | ollama run ${MODEL} " Please restructure this content following SkogAI-Memory best practices:

```
1. Add proper frontmatter if missing:
   ---
   title: ${title}
   type: note
   tags: [suggest relevant tags]
   ---

2. Organize with clear headings using lowercase

3. Add hashtags throughout the content for key concepts

4. If not already present, add an Observations section with 3-5 categorized observations:
   ## observations
   - [category] observation #tags
   - [category] observation #tags
   - [category] observation #tags

5. Add a Relations section with meaningful connections:
   ## relations
   - relation_type [[Target Note]] (context)
   - relation_type [[Another Note]] (context)

6. Follow the rules in RULES.md:
   - Use lowercase for headings when possible
   - Include appropriate tags throughout
   - Create meaningful semantic connections

Only make these changes if they improve the document. Preserve existing content
and semantic structure while enhancing with proper formatting and observation syntax.
")
```

# Save enhanced version to processed directory

enhanced_file="${PROCESSED_DIR}/enhanced\_${filename}" echo "$enhanced" > "${enhanced_file}" log_message "Enhanced version saved to: $enhanced_file"

# Optional: Generate file movement suggestions

log_message "Analyzing for proper location..." location_suggestion=$(echo "$filename $summary" | ollama run ${MODEL} " Based on the filename and content summary, suggest the most appropriate permanent location for this file in the SkogAI-Memory system.

```
Current location: ${TODO_DIR}/${filename}

Common directories:
- skogai/memory/ (for memory system documentation)
- skogai/prompt/ (for prompting system documentation)
- synthesis/ (for summaries and analysis)
- agent/ (for agent-specific information)

Return ONLY the recommended path without explanation, like:
skogai/memory/
")
```

log_message "Suggested location: $location_suggestion"

# Append movement suggestion to a suggestions file

echo "$filename -> $location_suggestion" >> "${MEMORY_ROOT}/move_suggestions.txt"

log_message "Completed processing: $filename" echo -e "\\n" done

log_message "Summarize.sh run completed"
