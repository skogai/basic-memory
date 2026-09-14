---
title: scripts-overview
type: note
permalink: skogai/docs-merge-todo/prompts/topics/scripts-overview
---

# Scripts Overview - SkogAI Project

## Total: 62 scripts (48 .sh, 14 .py)

## 1. 🧠 **Core SkogAI System** (8 scripts)

### Main Services

- **skogai.sh** (15KB) - Main SkogAI interface and orchestrator
- **skogai-service.sh** (15KB) - Core service management daemon
- **skogai-admin.sh** - Administrative functions and system control
- **skogai-test.py** - Testing framework for SkogAI components

### Lore Management

- **lore.sh** (24KB) - Main lore system for tracking system evolution
- **manage-lore.sh** (11KB) - Administrative tools for lore database
- **amys-blog.sh** - Blog integration (possibly Amy's blog scraper/poster)
- **certainty.sh** (2.6KB) - Confidence/certainty calculations for AI responses

## 2. 🤖 **AI Integration** (7 scripts)

### Claude Integration

- **claude.sh** - Claude workspace management and integration
- **test-claude.py** - Claude API testing utilities

### RAG System

- **rag.sh** - RAG (Retrieval-Augmented Generation) main interface
- **rag-aichat.sh** - RAG integration with aichat tool

### Agents & Chat

- **aichat.sh** - AI chat interface wrapper
- **agent.sh** - Agent management and orchestration
- **librarian.sh** - Document and knowledge management agent

## 3. 🔧 **Development Tools** (11 scripts)

### Script Creation

- **create-script.sh** / **create-script.py** - Automated script generation
- **bootstrap.sh** - Project initialization and setup

### Testing

- **test-script.sh** - General testing utilities
- **vim-test.sh** - Vim integration testing
- **cli-demo.sh** (2KB) - CLI demonstration and examples

### Code Utilities

- **argc.sh** - Argc framework wrapper
- **type.sh** - Type checking and validation
- **token.sh** (1KB) - Token counting/management
- **def.sh** - Definition utilities
- **foo.sh** - Test/placeholder script

## 4. 📊 **Data Processing** (8 scripts)

### Text Processing

- **smol.py** (2KB) / **smolpy.py** (1KB) - Text minification
- **count-lines.py** - Line counting utilities
- **grep.sh** - Enhanced grep wrapper

### Data Transformation

- **json.sh** - JSON manipulation and parsing
- **base64.sh** - Base64 encoding/decoding
- **data-processor.sh** (1.2KB) - General data processing
- **pipe-processor.py** (1.4KB) - Pipeline data processing

## 5. 📁 **File System** (8 scripts)

### Basic Operations

- **cat.sh** / **cat-script.sh** - File display utilities
- **file.sh** - File operations wrapper
- **file-info.sh** - File information and metadata

### Directory Management

- **current-dir.sh** - Working directory utilities
- **size.sh** - File and directory size checking

### Git Integration

- **git.sh** - Git status and operations wrapper

### Math Operations

- **add.sh** / **subtract.sh** - Simple arithmetic operations

## 6. 🌐 **Network & Web** (7 scripts)

### HTTP/Web

- **curl.sh** - HTTP client wrapper
- **serve.sh** - Simple HTTP server
- **smolweb.sh** - Lightweight web utilities

### Network Utilities

- **ip.sh** - IP address utilities
- **ping.sh** - Network connectivity testing

### System

- **kill.sh** - Process management
- **get-env.sh** - Environment variable management

## 7. 🎯 **Demo & Examples** (8 scripts)

### Hello World Variants

- **hello.sh** / **hello.py** / **simple-hello.py** - Example scripts

### Fun & Games

- **fizz.sh** - FizzBuzz implementation

### Utilities

- **rand.sh** - Random value generation
- **date.sh** - Date/time utilities (already converted to argc!)

### Special

- **$.sh** - Special character handling (34 bytes)
- **notskogmux.sh** / **skogmux.py** - Terminal multiplexer utilities

## 8. 🔧 **Recently Added** (2 scripts)

- **smol2.sh** - Updated minification tool
- **or_free_helper.py** - Helper utilities (kept in root)

## Key Observations

### Large/Complex Scripts

1. **lore.sh** (24KB) - Most complex, handles system chronicle
1. **skogai-service.sh** (15KB) - Core service daemon
1. **skogai.sh** (15KB) - Main interface
1. **manage-lore.sh** (11KB) - Lore administration

### Script Patterns

- Many wrapper scripts around existing tools (git, curl, grep)
- Duplicate functionality (3 hello scripts, 2 smol variants)
- Mix of bash and Python for similar tasks
- Some test/placeholder scripts (foo.sh, def.sh)

### Migration Priority

1. **High**: Core utilities used frequently (git, curl, date, file operations)
1. **Medium**: SkogAI services that need better structure
1. **Low**: Demo scripts and duplicates

### Potential Consolidations

- Merge all hello scripts into one example tool
- Combine cat.sh and cat-script.sh
- Unify smol.py, smolpy.py, and smol2.sh
- Merge file operations into single file management tool

## Recommendations

1. **Immediate Actions**

   - Convert frequently-used utilities first (git, curl, grep)
   - Consolidate duplicate functionality
   - Archive test/demo scripts

1. **Architecture Improvements**

   - Group related scripts into single argc tools with subcommands
   - Standardize on JSON input/output
   - Add proper error handling and logging

1. **Documentation Needs**

   - Document what each SkogAI service script does
   - Create usage examples for complex scripts
   - Map dependencies between scripts
