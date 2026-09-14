---
title: initial-implementation
type: note
permalink: skogai/docs-merge-todo/technical/memory-system/memory-extraction-epistemic-framework/guides/plans/initial-implementation
---

# Claude Introspection - Initial Implementation Plan

## Overview

This plan implements a memory system that learns from historical Claude Code conversations to improve future sessions. The system extracts insights from JSONL session files, stores them as searchable memories, and injects relevant context into active coding sessions.

## Prerequisites

### Required Knowledge

- TypeScript/Node.js development
- Working with JSON/JSONL files
- Basic understanding of vector embeddings and semantic search
- Command-line tool development
- Git workflow and frequent commits

### Required Tools

- Node.js 18+ and npm
- TypeScript compiler
- Git
- Claude Code SDK API key (will be provided)
- A text editor (VS Code recommended)

### Project Setup

```bash
# Clone the repository
git clone [repo-url]
cd claude-introspection

# Install dependencies (after we create package.json)
npm install

# Set up environment variables
cp .env.example .env
# Edit .env and add your Claude API key
```

## Phase 1: Project Foundation (Day 1)

### Task 1.1: Initialize TypeScript Project

**Objective:** Set up TypeScript project with proper configuration

**Steps:**

1. Create `package.json` with dependencies
1. Create `tsconfig.json` for TypeScript configuration
1. Set up basic project structure
1. Create `.gitignore` file
1. Commit: "Initialize TypeScript project structure"

**Files to create:**

`package.json`:

```json
{
  "name": "claude-introspection",
  "version": "0.1.0",
  "description": "Memory system for Claude Code conversations",
  "main": "dist/index.js",
  "scripts": {
    "build": "tsc",
    "dev": "tsx watch src/cli.ts",
    "test": "jest",
    "test:watch": "jest --watch",
    "extract": "tsx src/cli.ts extract",
    "lint": "eslint src/**/*.ts",
    "typecheck": "tsc --noEmit"
  },
  "dependencies": {
    "@anthropic/claude-code-sdk": "latest",
    "better-sqlite3": "^9.0.0",
    "commander": "^11.0.0",
    "dotenv": "^16.3.1",
    "gray-matter": "^4.0.3",
    "lancedb": "^0.4.0",
    "transformers": "^3.0.0",
    "zod": "^3.22.0"
  },
  "devDependencies": {
    "@types/better-sqlite3": "^7.6.0",
    "@types/jest": "^29.5.0",
    "@types/node": "^20.0.0",
    "@typescript-eslint/eslint-plugin": "^6.0.0",
    "@typescript-eslint/parser": "^6.0.0",
    "eslint": "^8.50.0",
    "jest": "^29.7.0",
    "ts-jest": "^29.1.0",
    "tsx": "^4.0.0",
    "typescript": "^5.2.0"
  }
}
```

`tsconfig.json`:

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "commonjs",
    "lib": ["ES2022"],
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist", "**/*.test.ts", "**/*.spec.ts"]
}
```

`.gitignore`:

```
node_modules/
dist/
.env
.env.local
memories/
index/
*.log
.DS_Store
```

`.env.example`:

```
ANTHROPIC_API_KEY=your-api-key-here
CLAUDE_PROJECTS_DIR=~/.claude/projects
MEMORIES_DIR=./memories
INDEX_DIR=./index
```

**Directory structure to create:**

```
claude-introspection/
├── src/
│   ├── cli.ts               # CLI entry point
│   ├── types/               # TypeScript type definitions
│   ├── extraction/          # Memory extraction logic
│   ├── storage/             # Memory storage and indexing
│   ├── retrieval/           # Memory retrieval logic
│   └── utils/               # Shared utilities
├── tests/
│   ├── fixtures/            # Test data
│   └── unit/                # Unit tests
├── docs/
│   ├── plans/
│   └── initial-design.md
└── memories/                # Generated memory files (git-ignored)
```

**Testing:**

```bash
npm install
npm run typecheck  # Should pass with no files yet
```

### Task 1.2: Create Core Type Definitions

**Objective:** Define TypeScript interfaces for the entire system

**Files to create:**

`src/types/session.ts`:

```typescript
// ABOUTME: Type definitions for Claude Code session data structures
// ABOUTME: Represents JSONL message formats and session metadata

export interface SessionMessage {
  uuid: string;
  parentUuid: string | null;
  sessionId: string;
  timestamp: string;
  type: 'user' | 'assistant';
  userType?: 'external';
  isSidechain: boolean;
  cwd: string;
  gitBranch?: string;
  version: string;
  thinkingMetadata?: {
    level: 'none' | 'medium' | 'high';
    disabled: boolean;
    triggers: string[];
  };
  message: {
    role: 'user' | 'assistant';
    content: string | MessageContent[];
    usage?: TokenUsage;
  };
  requestId?: string;
}

export interface MessageContent {
  type: 'text' | 'tool_use' | 'tool_result';
  text?: string;
  name?: string;
  input?: Record<string, any>;
  tool_use_id?: string;
  content?: string;
}

export interface TokenUsage {
  input_tokens: number;
  output_tokens: number;
  cache_creation_input_tokens?: number;
  cache_read_input_tokens?: number;
}

export interface Session {
  id: string;
  projectPath: string;
  messages: SessionMessage[];
  startTime: Date;
  endTime: Date;
}
```

`src/types/memory.ts`:

```typescript
// ABOUTME: Type definitions for memory storage and metadata
// ABOUTME: Defines structure of extracted memories and their attributes

export interface Memory {
  id: string;
  created: Date;
  content: string;
  metadata: MemoryMetadata;
}

export interface MemoryMetadata {
  source_sessions: string[];
  projects: string[];
  languages: string[];
  tags: string[];
  confidence: number;
  usefulness_score: number;
  last_reinforced: Date;
  decay_next: Date;
  related_memories?: string[];
  reinforcement_history?: ReinforcementEntry[];
}

export interface ReinforcementEntry {
  date: Date;
  session: string;
  signal: 'explicit_citation' | 'implicit_reference' | 'no_correction' | 'user_correction' | 'contradiction';
  delta: number;
}

export interface ExtractedInsight {
  content: string;
  reasoning: string;
  context: string;
  type: 'rule' | 'preference' | 'pattern' | 'case_study' | 'constraint';
  confidence: number;
  source: {
    session_id: string;
    message_uuids: string[];
    timestamp: Date;
  };
}
```

`src/types/index.ts`:

```typescript
// ABOUTME: Central export point for all type definitions
// ABOUTME: Re-exports types from individual modules

export * from './session';
export * from './memory';
```

**Test file:** `tests/unit/types.test.ts`

```typescript
import { SessionMessage, Memory } from '../../src/types';

describe('Type Definitions', () => {
  it('should create valid SessionMessage', () => {
    const message: SessionMessage = {
      uuid: 'test-uuid',
      parentUuid: null,
      sessionId: 'session-123',
      timestamp: '2025-01-01T00:00:00Z',
      type: 'user',
      isSidechain: false,
      cwd: '/test/path',
      version: '1.0.0',
      message: {
        role: 'user',
        content: 'Test message'
      }
    };
    expect(message.uuid).toBe('test-uuid');
  });

  it('should create valid Memory', () => {
    const memory: Memory = {
      id: 'mem-2025-01-01-001',
      created: new Date('2025-01-01'),
      content: 'Test memory content',
      metadata: {
        source_sessions: ['session-123'],
        projects: ['test-project'],
        languages: ['typescript'],
        tags: ['test'],
        confidence: 0.9,
        usefulness_score: 1.0,
        last_reinforced: new Date('2025-01-01'),
        decay_next: new Date('2025-02-01')
      }
    };
    expect(memory.id).toBe('mem-2025-01-01-001');
  });
});
```

**Testing:**

```bash
npm test tests/unit/types.test.ts
```

**Commit:** "Add core type definitions"

## Phase 2: Session Data Parser (Day 1-2)

### Task 2.1: JSONL Parser Implementation

**Objective:** Parse JSONL session files into structured data

**File to create:** `src/extraction/parser.ts`

```typescript
// ABOUTME: JSONL parser for Claude Code session files
// ABOUTME: Reads and parses session transcripts from filesystem

import * as fs from 'fs';
import * as path from 'path';
import * as readline from 'readline';
import { SessionMessage, Session } from '../types';

export class SessionParser {
  constructor(private projectsDir: string) {
    if (!fs.existsSync(projectsDir)) {
      throw new Error(`Projects directory does not exist: ${projectsDir}`);
    }
  }

  async *readSessionFiles(): AsyncGenerator<string> {
    // Walk directory tree and yield JSONL file paths
    const walk = async function* (dir: string): AsyncGenerator<string> {
      const entries = await fs.promises.readdir(dir, { withFileTypes: true });

      for (const entry of entries) {
        const fullPath = path.join(dir, entry.name);
        if (entry.isDirectory()) {
          yield* walk(fullPath);
        } else if (entry.name.endsWith('.jsonl')) {
          yield fullPath;
        }
      }
    };

    yield* walk(this.projectsDir);
  }

  async parseSession(filePath: string): Promise<Session> {
    const messages: SessionMessage[] = [];
    const fileStream = fs.createReadStream(filePath);
    const rl = readline.createInterface({
      input: fileStream,
      crlfDelay: Infinity
    });

    for await (const line of rl) {
      if (line.trim()) {
        try {
          const message = JSON.parse(line) as SessionMessage;
          messages.push(message);
        } catch (e) {
          console.error(`Failed to parse line in ${filePath}:`, e);
        }
      }
    }

    if (messages.length === 0) {
      throw new Error(`No valid messages found in ${filePath}`);
    }

    // Extract session metadata
    const firstMessage = messages[0];
    const lastMessage = messages[messages.length - 1];

    return {
      id: firstMessage.sessionId,
      projectPath: firstMessage.cwd,
      messages,
      startTime: new Date(firstMessage.timestamp),
      endTime: new Date(lastMessage.timestamp)
    };
  }

  async *readSessions(since?: Date): AsyncGenerator<Session> {
    for await (const filePath of this.readSessionFiles()) {
      // Check file modification time if 'since' is provided
      if (since) {
        const stats = await fs.promises.stat(filePath);
        if (stats.mtime < since) {
          continue;
        }
      }

      try {
        const session = await this.parseSession(filePath);
        yield session;
      } catch (e) {
        console.error(`Failed to parse session ${filePath}:`, e);
      }
    }
  }
}
```

**Test file:** `tests/unit/parser.test.ts`

```typescript
import * as fs from 'fs';
import * as path from 'path';
import { SessionParser } from '../../src/extraction/parser';

describe('SessionParser', () => {
  const fixturesDir = path.join(__dirname, '../fixtures');
  const testSessionPath = path.join(fixturesDir, 'test-session.jsonl');

  beforeAll(() => {
    // Create test fixture
    fs.mkdirSync(fixturesDir, { recursive: true });

    const testMessages = [
      {
        uuid: 'msg-1',
        parentUuid: null,
        sessionId: 'session-test',
        timestamp: '2025-01-01T10:00:00Z',
        type: 'user',
        isSidechain: false,
        cwd: '/test/project',
        version: '1.0.0',
        message: { role: 'user', content: 'Test message 1' }
      },
      {
        uuid: 'msg-2',
        parentUuid: 'msg-1',
        sessionId: 'session-test',
        timestamp: '2025-01-01T10:01:00Z',
        type: 'assistant',
        isSidechain: false,
        cwd: '/test/project',
        version: '1.0.0',
        message: { role: 'assistant', content: 'Test response' }
      }
    ];

    fs.writeFileSync(
      testSessionPath,
      testMessages.map(m => JSON.stringify(m)).join('\n')
    );
  });

  afterAll(() => {
    // Clean up
    fs.rmSync(fixturesDir, { recursive: true, force: true });
  });

  it('should parse a session file', async () => {
    const parser = new SessionParser(fixturesDir);
    const session = await parser.parseSession(testSessionPath);

    expect(session.id).toBe('session-test');
    expect(session.messages).toHaveLength(2);
    expect(session.messages[0].message.content).toBe('Test message 1');
    expect(session.projectPath).toBe('/test/project');
  });

  it('should iterate over sessions', async () => {
    const parser = new SessionParser(fixturesDir);
    const sessions: any[] = [];

    for await (const session of parser.readSessions()) {
      sessions.push(session);
    }

    expect(sessions).toHaveLength(1);
    expect(sessions[0].id).toBe('session-test');
  });

  it('should filter sessions by date', async () => {
    const parser = new SessionParser(fixturesDir);
    const futureDate = new Date('2030-01-01');
    const sessions: any[] = [];

    for await (const session of parser.readSessions(futureDate)) {
      sessions.push(session);
    }

    expect(sessions).toHaveLength(0);
  });
});
```

**Testing:**

```bash
npm test tests/unit/parser.test.ts
```

**Commit:** "Implement JSONL session parser"

### Task 2.2: Session Chunker

**Objective:** Break sessions into coherent conversation chunks

**File to create:** `src/extraction/chunker.ts`

```typescript
// ABOUTME: Breaks sessions into coherent conversation chunks for analysis
// ABOUTME: Groups related messages into extractable units

import { SessionMessage, Session } from '../types';

export interface ConversationChunk {
  messages: SessionMessage[];
  startIndex: number;
  endIndex: number;
  hasUserCorrection: boolean;
  hasToolUse: boolean;
  topicShift: boolean;
}

export class SessionChunker {
  private readonly CHUNK_SIZE_TARGET = 10; // Target messages per chunk
  private readonly MAX_CHUNK_SIZE = 20;

  chunkSession(session: Session): ConversationChunk[] {
    const chunks: ConversationChunk[] = [];
    let currentChunk: SessionMessage[] = [];
    let startIndex = 0;

    for (let i = 0; i < session.messages.length; i++) {
      const message = session.messages[i];
      currentChunk.push(message);

      // Check for natural breakpoints
      const isTopicShift = this.detectTopicShift(currentChunk, session.messages[i + 1]);
      const hasCorrection = this.detectUserCorrection(currentChunk);
      const reachedSizeLimit = currentChunk.length >= this.CHUNK_SIZE_TARGET;

      if (isTopicShift || reachedSizeLimit || i === session.messages.length - 1) {
        chunks.push({
          messages: [...currentChunk],
          startIndex,
          endIndex: i,
          hasUserCorrection: hasCorrection,
          hasToolUse: this.hasToolUse(currentChunk),
          topicShift: isTopicShift
        });

        currentChunk = [];
        startIndex = i + 1;
      }

      // Force break at max size
      if (currentChunk.length >= this.MAX_CHUNK_SIZE) {
        chunks.push({
          messages: [...currentChunk],
          startIndex,
          endIndex: i,
          hasUserCorrection: hasCorrection,
          hasToolUse: this.hasToolUse(currentChunk),
          topicShift: false
        });

        currentChunk = [];
        startIndex = i + 1;
      }
    }

    return chunks;
  }

  private detectTopicShift(currentChunk: SessionMessage[], nextMessage?: SessionMessage): boolean {
    if (!nextMessage) return false;

    // Simple heuristics for topic shift
    const lastUserMessage = this.getLastUserMessage(currentChunk);
    if (!lastUserMessage) return false;

    const content = this.getMessageContent(lastUserMessage);

    // Look for explicit topic markers
    const topicMarkers = [
      /^(now|next|also|another|different|separate)/i,
      /^(okay|ok|alright|good|great|perfect|thanks).*now/i,
      /^(let's|lets|can you|could you|please)/i,
      /^##+ /,  // Markdown headers
    ];

    return topicMarkers.some(marker => marker.test(content));
  }

  private detectUserCorrection(messages: SessionMessage[]): boolean {
    const correctionPatterns = [
      /\b(no|wrong|incorrect|actually|wait|stop|don't|never|always)\b/i,
      /\b(that's not|that is not|you're wrong|you are wrong)\b/i,
      /\b(fix|correct|undo|revert)\b/i,
    ];

    return messages.some(msg => {
      if (msg.type !== 'user') return false;
      const content = this.getMessageContent(msg);
      return correctionPatterns.some(pattern => pattern.test(content));
    });
  }

  private hasToolUse(messages: SessionMessage[]): boolean {
    return messages.some(msg => {
      if (msg.type !== 'assistant') return false;
      if (typeof msg.message.content === 'string') return false;

      return msg.message.content.some(block => block.type === 'tool_use');
    });
  }

  private getLastUserMessage(messages: SessionMessage[]): SessionMessage | undefined {
    for (let i = messages.length - 1; i >= 0; i--) {
      if (messages[i].type === 'user') {
        return messages[i];
      }
    }
    return undefined;
  }

  private getMessageContent(message: SessionMessage): string {
    if (typeof message.message.content === 'string') {
      return message.message.content;
    }

    return message.message.content
      .filter(block => block.type === 'text')
      .map(block => block.text || '')
      .join(' ');
  }
}
```

**Test file:** `tests/unit/chunker.test.ts`

```typescript
import { SessionChunker } from '../../src/extraction/chunker';
import { Session, SessionMessage } from '../../src/types';

describe('SessionChunker', () => {
  const createMessage = (
    type: 'user' | 'assistant',
    content: string,
    index: number
  ): SessionMessage => ({
    uuid: `msg-${index}`,
    parentUuid: index > 0 ? `msg-${index - 1}` : null,
    sessionId: 'test-session',
    timestamp: new Date(2025, 0, 1, 10, index).toISOString(),
    type,
    isSidechain: false,
    cwd: '/test',
    version: '1.0.0',
    message: { role: type, content }
  });

  it('should chunk a simple session', () => {
    const session: Session = {
      id: 'test-session',
      projectPath: '/test',
      startTime: new Date(2025, 0, 1),
      endTime: new Date(2025, 0, 2),
      messages: [
        createMessage('user', 'How do I implement feature X?', 0),
        createMessage('assistant', 'Here is how you implement X...', 1),
        createMessage('user', 'Thanks. Now, how about feature Y?', 2),
        createMessage('assistant', 'For feature Y, you should...', 3),
      ]
    };

    const chunker = new SessionChunker();
    const chunks = chunker.chunkSession(session);

    expect(chunks).toHaveLength(2);
    expect(chunks[0].messages).toHaveLength(2);
    expect(chunks[1].messages).toHaveLength(2);
    expect(chunks[1].topicShift).toBe(true);
  });

  it('should detect user corrections', () => {
    const session: Session = {
      id: 'test-session',
      projectPath: '/test',
      startTime: new Date(2025, 0, 1),
      endTime: new Date(2025, 0, 2),
      messages: [
        createMessage('user', 'Add a new function', 0),
        createMessage('assistant', 'I added the function', 1),
        createMessage('user', 'No, that\'s wrong. Never inline imports.', 2),
        createMessage('assistant', 'You\'re right, let me fix that', 3),
      ]
    };

    const chunker = new SessionChunker();
    const chunks = chunker.chunkSession(session);

    expect(chunks[0].hasUserCorrection).toBe(true);
  });

  it('should respect chunk size limits', () => {
    const messages: SessionMessage[] = [];
    for (let i = 0; i < 30; i++) {
      const type = i % 2 === 0 ? 'user' : 'assistant';
      messages.push(createMessage(type as any, `Message ${i}`, i));
    }

    const session: Session = {
      id: 'test-session',
      projectPath: '/test',
      startTime: new Date(2025, 0, 1),
      endTime: new Date(2025, 0, 2),
      messages
    };

    const chunker = new SessionChunker();
    const chunks = chunker.chunkSession(session);

    expect(chunks.length).toBeGreaterThan(1);
    chunks.forEach(chunk => {
      expect(chunk.messages.length).toBeLessThanOrEqual(20);
    });
  });
});
```

**Testing:**

```bash
npm test tests/unit/chunker.test.ts
```

**Commit:** "Implement session chunker"

## Phase 3: LLM-Based Extraction (Day 2-3)

### Task 3.1: Claude SDK Integration

**Objective:** Set up Claude Code SDK for LLM calls

**File to create:** `src/extraction/llm-client.ts`

```typescript
// ABOUTME: Claude Code SDK client wrapper for memory extraction
// ABOUTME: Handles LLM calls for screening and extracting insights

import { query } from '@anthropic/claude-code-sdk';
import { ConversationChunk } from './chunker';
import { ExtractedInsight } from '../types';

export interface ScreeningResult {
  hasValue: boolean;
  reason: string;
  confidence: number;
}

export class LLMClient {
  constructor(private apiKey: string) {
    if (!apiKey) {
      throw new Error('API key is required');
    }
    process.env.ANTHROPIC_API_KEY = apiKey;
  }

  async screenChunk(chunk: ConversationChunk): Promise<ScreeningResult> {
    const messages = chunk.messages
      .map(m => `${m.type.toUpperCase()}: ${this.getContent(m.message.content)}`)
      .join('\n\n');

    const prompt = `Analyze this conversation chunk and determine if it contains anything worth remembering.

Look for:
- Explicit rules, preferences, or constraints stated by the user
- Design decisions with reasoning
- Problem-solving patterns (what worked/didn't work)
- User corrections or feedback about behavior
- Architectural insights or patterns
- Domain-specific knowledge or constraints
- Successful approaches or anti-patterns

Conversation:
${messages}

Respond in JSON format:
{
  "hasValue": true/false,
  "reason": "Brief explanation of what valuable content was found or why nothing was valuable",
  "confidence": 0.0-1.0
}`;

    const result = await query({
      prompt,
      options: {
        model: 'claude-3-haiku-20240307',
        maxTurns: 1
      }
    });

    let response = '';
    for await (const message of result) {
      if (message.type === 'assistant' && typeof message.message.content === 'string') {
        response += message.message.content;
      }
    }

    try {
      const parsed = JSON.parse(response);
      return {
        hasValue: parsed.hasValue === true,
        reason: parsed.reason || '',
        confidence: parsed.confidence || 0.5
      };
    } catch (e) {
      console.error('Failed to parse screening response:', e);
      return { hasValue: false, reason: 'Parse error', confidence: 0 };
    }
  }

  async extractInsights(chunk: ConversationChunk, sessionId: string): Promise<ExtractedInsight[]> {
    const messages = chunk.messages
      .map(m => `${m.type.toUpperCase()} [${m.uuid}]: ${this.getContent(m.message.content)}`)
      .join('\n\n');

    const prompt = `Extract specific, actionable insights from this conversation.

For each insight, identify:
1. The core rule/preference/pattern
2. The reasoning or context behind it
3. Whether it's a general principle or project-specific
4. The type (rule, preference, pattern, case_study, constraint)
5. Confidence level (0.0-1.0)

Focus on:
- User corrections ("never do X", "always do Y")
- Design decisions with explanations
- Problem resolutions (what worked after failures)
- Process preferences
- Domain constraints

Conversation:
${messages}

Project: ${chunk.messages[0].cwd}

Respond with a JSON array of insights:
[
  {
    "content": "The specific rule or insight (e.g., 'Never inline imports')",
    "reasoning": "Why this matters or the context",
    "context": "When/where this applies",
    "type": "rule|preference|pattern|case_study|constraint",
    "confidence": 0.0-1.0,
    "message_uuids": ["uuid1", "uuid2"]
  }
]

If no clear insights, return an empty array: []`;

    const result = await query({
      prompt,
      options: {
        model: 'claude-3-haiku-20240307',
        maxTurns: 1
      }
    });

    let response = '';
    for await (const message of result) {
      if (message.type === 'assistant' && typeof message.message.content === 'string') {
        response += message.message.content;
      }
    }

    try {
      const parsed = JSON.parse(response);
      if (!Array.isArray(parsed)) return [];

      return parsed.map(item => ({
        content: item.content || '',
        reasoning: item.reasoning || '',
        context: item.context || '',
        type: item.type || 'pattern',
        confidence: item.confidence || 0.5,
        source: {
          session_id: sessionId,
          message_uuids: item.message_uuids || [],
          timestamp: new Date(chunk.messages[0].timestamp)
        }
      }));
    } catch (e) {
      console.error('Failed to parse extraction response:', e);
      return [];
    }
  }

  async synthesizeInsights(insights: ExtractedInsight[]): Promise<ExtractedInsight[]> {
    if (insights.length === 0) return [];

    const insightsJson = JSON.stringify(insights, null, 2);

    const prompt = `Review and synthesize these extracted insights.

Tasks:
1. Identify and merge duplicate insights (same rule expressed differently)
2. Flag contradictions for review
3. Group related insights that form a larger pattern
4. Improve clarity and consistency of phrasing
5. Adjust confidence scores based on frequency and consistency

Insights to synthesize:
${insightsJson}

Respond with the synthesized insights in the same JSON format, with duplicates merged and contradictions flagged in the reasoning field.`;

    const result = await query({
      prompt,
      options: {
        model: 'claude-3-5-sonnet-20241022',
        maxTurns: 1
      }
    });

    let response = '';
    for await (const message of result) {
      if (message.type === 'assistant' && typeof message.message.content === 'string') {
        response += message.message.content;
      }
    }

    try {
      const parsed = JSON.parse(response);
      if (!Array.isArray(parsed)) return insights;
      return parsed;
    } catch (e) {
      console.error('Failed to parse synthesis response:', e);
      return insights;
    }
  }

  private getContent(content: string | any[]): string {
    if (typeof content === 'string') return content;

    return content
      .filter((block: any) => block.type === 'text')
      .map((block: any) => block.text || '')
      .join(' ');
  }
}
```

**Test file:** `tests/unit/llm-client.test.ts`

```typescript
import { LLMClient } from '../../src/extraction/llm-client';
import { ConversationChunk } from '../../src/extraction/chunker';

// Mock the Claude SDK
jest.mock('@anthropic/claude-code-sdk', () => ({
  query: jest.fn()
}));

describe('LLMClient', () => {
  let client: LLMClient;

  beforeEach(() => {
    client = new LLMClient('test-api-key');
  });

  it('should screen a chunk for valuable content', async () => {
    const { query } = require('@anthropic/claude-code-sdk');

    // Mock the response
    query.mockImplementation(async function* () {
      yield {
        type: 'assistant',
        message: {
          content: JSON.stringify({
            hasValue: true,
            reason: 'Contains explicit coding rule',
            confidence: 0.9
          })
        }
      };
    });

    const chunk: ConversationChunk = {
      messages: [
        {
          uuid: 'msg-1',
          type: 'user',
          message: { role: 'user', content: 'Never inline imports' }
        } as any
      ],
      startIndex: 0,
      endIndex: 0,
      hasUserCorrection: true,
      hasToolUse: false,
      topicShift: false
    };

    const result = await client.screenChunk(chunk);

    expect(result.hasValue).toBe(true);
    expect(result.confidence).toBe(0.9);
    expect(result.reason).toContain('explicit coding rule');
  });

  it('should extract insights from a chunk', async () => {
    const { query } = require('@anthropic/claude-code-sdk');

    query.mockImplementation(async function* () {
      yield {
        type: 'assistant',
        message: {
          content: JSON.stringify([
            {
              content: 'Never inline imports',
              reasoning: 'Keeps code organized',
              context: 'All TypeScript files',
              type: 'rule',
              confidence: 0.95,
              message_uuids: ['msg-1']
            }
          ])
        }
      };
    });

    const chunk: ConversationChunk = {
      messages: [
        {
          uuid: 'msg-1',
          type: 'user',
          cwd: '/test/project',
          timestamp: '2025-01-01T10:00:00Z',
          message: { role: 'user', content: 'Never inline imports' }
        } as any
      ],
      startIndex: 0,
      endIndex: 0,
      hasUserCorrection: true,
      hasToolUse: false,
      topicShift: false
    };

    const insights = await client.extractInsights(chunk, 'session-123');

    expect(insights).toHaveLength(1);
    expect(insights[0].content).toBe('Never inline imports');
    expect(insights[0].type).toBe('rule');
    expect(insights[0].confidence).toBe(0.95);
  });
});
```

**Testing:**

```bash
npm test tests/unit/llm-client.test.ts
```

**Commit:** "Add Claude SDK integration for extraction"

## Phase 4: Memory Storage (Day 3-4)

### Task 4.1: Memory File Writer

**Objective:** Write memories to markdown files with frontmatter

**File to create:** `src/storage/memory-writer.ts`

```typescript
// ABOUTME: Writes extracted memories to markdown files with YAML frontmatter
// ABOUTME: Organizes memories by date and generates unique IDs

import * as fs from 'fs';
import * as path from 'path';
import * as matter from 'gray-matter';
import { Memory, MemoryMetadata, ExtractedInsight } from '../types';

export class MemoryWriter {
  constructor(private memoriesDir: string) {
    // Ensure memories directory exists
    fs.mkdirSync(memoriesDir, { recursive: true });
  }

  async writeMemory(insight: ExtractedInsight, metadata: Partial<MemoryMetadata>): Promise<Memory> {
    const memory = this.createMemory(insight, metadata);
    const filePath = this.getMemoryFilePath(memory);

    // Ensure directory exists
    const dir = path.dirname(filePath);
    await fs.promises.mkdir(dir, { recursive: true });

    // Create markdown content with frontmatter
    const fileContent = matter.stringify(memory.content, memory.metadata);

    // Write to file
    await fs.promises.writeFile(filePath, fileContent);

    return memory;
  }

  async updateMemory(memoryId: string, updates: Partial<MemoryMetadata>): Promise<void> {
    const filePath = await this.findMemoryFile(memoryId);
    if (!filePath) {
      throw new Error(`Memory not found: ${memoryId}`);
    }

    const content = await fs.promises.readFile(filePath, 'utf-8');
    const parsed = matter(content);

    // Update metadata
    Object.assign(parsed.data, updates);

    // Write back
    const updated = matter.stringify(parsed.content, parsed.data);
    await fs.promises.writeFile(filePath, updated);
  }

  async readMemory(memoryId: string): Promise<Memory | null> {
    const filePath = await this.findMemoryFile(memoryId);
    if (!filePath) return null;

    const content = await fs.promises.readFile(filePath, 'utf-8');
    const parsed = matter(content);

    return {
      id: memoryId,
      created: new Date(parsed.data.created),
      content: parsed.content,
      metadata: parsed.data as MemoryMetadata
    };
  }

  async *readAllMemories(): AsyncGenerator<Memory> {
    for await (const filePath of this.walkMemoryFiles()) {
      const content = await fs.promises.readFile(filePath, 'utf-8');
      const parsed = matter(content);

      if (parsed.data.id) {
        yield {
          id: parsed.data.id,
          created: new Date(parsed.data.created),
          content: parsed.content,
          metadata: parsed.data as MemoryMetadata
        };
      }
    }
  }

  private createMemory(insight: ExtractedInsight, metadata: Partial<MemoryMetadata>): Memory {
    const now = new Date();
    const id = this.generateMemoryId(now);

    // Build full metadata
    const fullMetadata: MemoryMetadata = {
      source_sessions: metadata.source_sessions || [insight.source.session_id],
      projects: metadata.projects || [],
      languages: metadata.languages || [],
      tags: metadata.tags || this.extractTags(insight),
      confidence: insight.confidence,
      usefulness_score: 1.0,
      last_reinforced: now,
      decay_next: new Date(now.getTime() + 30 * 24 * 60 * 60 * 1000), // 30 days
      ...metadata
    };

    // Format content
    const content = this.formatMemoryContent(insight);

    return {
      id,
      created: now,
      content,
      metadata: fullMetadata
    };
  }

  private generateMemoryId(date: Date): string {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const timestamp = Date.now();

    return `mem-${year}-${month}-${day}-${timestamp}`;
  }

  private getMemoryFilePath(memory: Memory): string {
    const date = memory.created;
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');

    const slug = this.createSlug(memory.content);
    const filename = `${year}-${month}-${day}-${Date.now()}-${slug}.md`;

    return path.join(
      this.memoriesDir,
      String(year),
      month,
      day,
      filename
    );
  }

  private createSlug(content: string): string {
    // Take first line or first 50 chars
    const firstLine = content.split('\n')[0];
    const text = firstLine.length > 50 ? firstLine.substring(0, 50) : firstLine;

    return text
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '')
      .substring(0, 50);
  }

  private formatMemoryContent(insight: ExtractedInsight): string {
    let content = `# ${insight.content}\n\n`;

    if (insight.reasoning) {
      content += `${insight.reasoning}\n\n`;
    }

    if (insight.context) {
      content += `## Context\n\n${insight.context}\n\n`;
    }

    return content;
  }

  private extractTags(insight: ExtractedInsight): string[] {
    const tags: string[] = [insight.type];

    // Add tags based on content patterns
    if (insight.content.toLowerCase().includes('never')) tags.push('rule');
    if (insight.content.toLowerCase().includes('always')) tags.push('rule');
    if (insight.content.toLowerCase().includes('import')) tags.push('imports');
    if (insight.content.toLowerCase().includes('test')) tags.push('testing');
    if (insight.content.toLowerCase().includes('commit')) tags.push('git');

    return [...new Set(tags)];
  }

  private async findMemoryFile(memoryId: string): Promise<string | null> {
    // Extract date from memory ID format: mem-YYYY-MM-DD-timestamp
    const match = memoryId.match(/mem-(\d{4})-(\d{2})-(\d{2})-/);
    if (!match) return null;

    const [, year, month, day] = match;
    const dayDir = path.join(this.memoriesDir, year, month, day);

    if (!fs.existsSync(dayDir)) return null;

    const files = await fs.promises.readdir(dayDir);
    for (const file of files) {
      const filePath = path.join(dayDir, file);
      const content = await fs.promises.readFile(filePath, 'utf-8');
      const parsed = matter(content);

      if (parsed.data.id === memoryId) {
        return filePath;
      }
    }

    return null;
  }

  private async *walkMemoryFiles(): AsyncGenerator<string> {
    const walk = async function* (dir: string): AsyncGenerator<string> {
      if (!fs.existsSync(dir)) return;

      const entries = await fs.promises.readdir(dir, { withFileTypes: true });

      for (const entry of entries) {
        const fullPath = path.join(dir, entry.name);
        if (entry.isDirectory()) {
          yield* walk(fullPath);
        } else if (entry.name.endsWith('.md')) {
          yield fullPath;
        }
      }
    };

    yield* walk(this.memoriesDir);
  }
}
```

**Test file:** `tests/unit/memory-writer.test.ts`

```typescript
import * as fs from 'fs';
import * as path from 'path';
import * as matter from 'gray-matter';
import { MemoryWriter } from '../../src/storage/memory-writer';
import { ExtractedInsight } from '../../src/types';

describe('MemoryWriter', () => {
  const testDir = path.join(__dirname, '../test-memories');
  let writer: MemoryWriter;

  beforeEach(() => {
    fs.mkdirSync(testDir, { recursive: true });
    writer = new MemoryWriter(testDir);
  });

  afterEach(() => {
    fs.rmSync(testDir, { recursive: true, force: true });
  });

  it('should write a memory to file', async () => {
    const insight: ExtractedInsight = {
      content: 'Never inline imports',
      reasoning: 'Keeps code organized',
      context: 'TypeScript files',
      type: 'rule',
      confidence: 0.95,
      source: {
        session_id: 'session-123',
        message_uuids: ['msg-1'],
        timestamp: new Date()
      }
    };

    const memory = await writer.writeMemory(insight, {
      projects: ['test-project'],
      languages: ['typescript']
    });

    expect(memory.id).toMatch(/^mem-\d{4}-\d{2}-\d{2}-\d+$/);
    expect(memory.content).toContain('Never inline imports');
    expect(memory.metadata.confidence).toBe(0.95);
    expect(memory.metadata.projects).toContain('test-project');

    // Verify file was written
    const savedMemory = await writer.readMemory(memory.id);
    expect(savedMemory).not.toBeNull();
    expect(savedMemory?.content).toContain('Never inline imports');
  });

  it('should update memory metadata', async () => {
    const insight: ExtractedInsight = {
      content: 'Test memory',
      reasoning: '',
      context: '',
      type: 'rule',
      confidence: 0.5,
      source: {
        session_id: 'session-123',
        message_uuids: [],
        timestamp: new Date()
      }
    };

    const memory = await writer.writeMemory(insight, {});

    await writer.updateMemory(memory.id, {
      usefulness_score: 2.5,
      tags: ['updated', 'test']
    });

    const updated = await writer.readMemory(memory.id);
    expect(updated?.metadata.usefulness_score).toBe(2.5);
    expect(updated?.metadata.tags).toContain('updated');
  });

  it('should read all memories', async () => {
    // Write multiple memories
    const insights: ExtractedInsight[] = [
      {
        content: 'Memory 1',
        reasoning: '',
        context: '',
        type: 'rule',
        confidence: 0.8,
        source: {
          session_id: 'session-1',
          message_uuids: [],
          timestamp: new Date()
        }
      },
      {
        content: 'Memory 2',
        reasoning: '',
        context: '',
        type: 'pattern',
        confidence: 0.7,
        source: {
          session_id: 'session-2',
          message_uuids: [],
          timestamp: new Date()
        }
      }
    ];

    for (const insight of insights) {
      await writer.writeMemory(insight, {});
    }

    const memories: any[] = [];
    for await (const memory of writer.readAllMemories()) {
      memories.push(memory);
    }

    expect(memories).toHaveLength(2);
    expect(memories.map(m => m.content)).toContain(expect.stringContaining('Memory 1'));
    expect(memories.map(m => m.content)).toContain(expect.stringContaining('Memory 2'));
  });
});
```

**Testing:**

```bash
npm test tests/unit/memory-writer.test.ts
```

**Commit:** "Implement memory file writer"

### Task 4.2: Vector Database Setup with LanceDB

**Objective:** Set up LanceDB for vector storage and search

**File to create:** `src/storage/vector-store.ts`

```typescript
// ABOUTME: Vector database using LanceDB for semantic search
// ABOUTME: Stores embeddings and metadata for memory retrieval

import * as lancedb from 'lancedb';
import { Memory } from '../types';

export interface VectorSearchOptions {
  limit?: number;
  filter?: {
    projects?: string[];
    languages?: string[];
    tags?: string[];
    minConfidence?: number;
    minUsefulness?: number;
  };
}

export class VectorStore {
  private db: any;
  private table: any;

  constructor(private indexDir: string) {}

  async initialize(): Promise<void> {
    // Connect to LanceDB
    this.db = await lancedb.connect(this.indexDir);

    // Create or open table
    const tableNames = await this.db.tableNames();

    if (tableNames.includes('memories')) {
      this.table = await this.db.openTable('memories');
    } else {
      // Create table with schema
      this.table = await this.db.createTable('memories', [
        {
          id: 'mem-init',
          content: 'Initial memory',
          embedding: new Array(384).fill(0), // Placeholder embedding
          projects: [],
          languages: [],
          tags: [],
          confidence: 0,
          usefulness_score: 0,
          created: new Date().toISOString()
        }
      ]);

      // Delete the placeholder
      await this.deleteMemory('mem-init');
    }
  }

  async addMemory(memory: Memory, embedding: number[]): Promise<void> {
    const record = {
      id: memory.id,
      content: memory.content,
      embedding,
      projects: memory.metadata.projects,
      languages: memory.metadata.languages,
      tags: memory.metadata.tags,
      confidence: memory.metadata.confidence,
      usefulness_score: memory.metadata.usefulness_score,
      created: memory.created.toISOString()
    };

    await this.table.add([record]);
  }

  async updateMemory(memoryId: string, updates: Partial<any>): Promise<void> {
    // LanceDB doesn't have direct update, so we need to delete and re-add
    const existing = await this.getMemory(memoryId);
    if (!existing) return;

    await this.deleteMemory(memoryId);
    await this.table.add([{ ...existing, ...updates }]);
  }

  async deleteMemory(memoryId: string): Promise<void> {
    await this.table.delete(`id = '${memoryId}'`);
  }

  async searchSimilar(
    embedding: number[],
    options: VectorSearchOptions = {}
  ): Promise<Array<{ id: string; score: number; metadata: any }>> {
    let query = this.table.search(embedding);

    // Apply filters
    const filters: string[] = [];

    if (options.filter?.minConfidence !== undefined) {
      filters.push(`confidence >= ${options.filter.minConfidence}`);
    }

    if (options.filter?.minUsefulness !== undefined) {
      filters.push(`usefulness_score >= ${options.filter.minUsefulness}`);
    }

    if (filters.length > 0) {
      query = query.where(filters.join(' AND '));
    }

    // Apply limit
    query = query.limit(options.limit || 10);

    const results = await query.execute();

    return results.map((r: any) => ({
      id: r.id,
      score: r._distance || 0,
      metadata: {
        content: r.content,
        projects: r.projects,
        languages: r.languages,
        tags: r.tags,
        confidence: r.confidence,
        usefulness_score: r.usefulness_score,
        created: r.created
      }
    }));
  }

  async getMemory(memoryId: string): Promise<any | null> {
    const results = await this.table
      .search([])
      .where(`id = '${memoryId}'`)
      .limit(1)
      .execute();

    return results[0] || null;
  }

  async getAllMemoryIds(): Promise<string[]> {
    const results = await this.table
      .search([])
      .select(['id'])
      .execute();

    return results.map((r: any) => r.id);
  }

  async getStats(): Promise<{
    totalMemories: number;
    avgConfidence: number;
    avgUsefulness: number;
  }> {
    const all = await this.table.search([]).execute();

    if (all.length === 0) {
      return {
        totalMemories: 0,
        avgConfidence: 0,
        avgUsefulness: 0
      };
    }

    const totalConfidence = all.reduce((sum: number, m: any) => sum + m.confidence, 0);
    const totalUsefulness = all.reduce((sum: number, m: any) => sum + m.usefulness_score, 0);

    return {
      totalMemories: all.length,
      avgConfidence: totalConfidence / all.length,
      avgUsefulness: totalUsefulness / all.length
    };
  }
}
```

**Test file:** `tests/unit/vector-store.test.ts`

```typescript
import * as fs from 'fs';
import * as path from 'path';
import { VectorStore } from '../../src/storage/vector-store';
import { Memory } from '../../src/types';

describe('VectorStore', () => {
  const testIndexDir = path.join(__dirname, '../test-index');
  let store: VectorStore;

  beforeEach(async () => {
    fs.mkdirSync(testIndexDir, { recursive: true });
    store = new VectorStore(testIndexDir);
    await store.initialize();
  });

  afterEach(() => {
    fs.rmSync(testIndexDir, { recursive: true, force: true });
  });

  it('should add and retrieve a memory', async () => {
    const memory: Memory = {
      id: 'test-mem-1',
      created: new Date(),
      content: 'Test memory content',
      metadata: {
        source_sessions: ['session-1'],
        projects: ['project-1'],
        languages: ['typescript'],
        tags: ['test'],
        confidence: 0.9,
        usefulness_score: 1.5,
        last_reinforced: new Date(),
        decay_next: new Date()
      }
    };

    const embedding = new Array(384).fill(0.1);
    await store.addMemory(memory, embedding);

    const retrieved = await store.getMemory('test-mem-1');
    expect(retrieved).not.toBeNull();
    expect(retrieved.id).toBe('test-mem-1');
    expect(retrieved.confidence).toBe(0.9);
  });

  it('should search for similar memories', async () => {
    // Add test memories
    const memories = [
      {
        id: 'mem-1',
        created: new Date(),
        content: 'Memory 1',
        metadata: {
          source_sessions: [],
          projects: ['project-1'],
          languages: ['typescript'],
          tags: [],
          confidence: 0.9,
          usefulness_score: 2.0,
          last_reinforced: new Date(),
          decay_next: new Date()
        }
      },
      {
        id: 'mem-2',
        created: new Date(),
        content: 'Memory 2',
        metadata: {
          source_sessions: [],
          projects: ['project-2'],
          languages: ['python'],
          tags: [],
          confidence: 0.5,
          usefulness_score: 1.0,
          last_reinforced: new Date(),
          decay_next: new Date()
        }
      }
    ];

    for (const memory of memories) {
      const embedding = new Array(384).fill(Math.random());
      await store.addMemory(memory as Memory, embedding);
    }

    // Search with filters
    const queryEmbedding = new Array(384).fill(0.5);
    const results = await store.searchSimilar(queryEmbedding, {
      limit: 5,
      filter: {
        minConfidence: 0.7
      }
    });

    expect(results.length).toBeLessThanOrEqual(5);
    results.forEach(r => {
      expect(r.metadata.confidence).toBeGreaterThanOrEqual(0.7);
    });
  });

  it('should get statistics', async () => {
    const memory1: Memory = {
      id: 'stat-mem-1',
      created: new Date(),
      content: 'Memory for stats',
      metadata: {
        source_sessions: [],
        projects: [],
        languages: [],
        tags: [],
        confidence: 0.8,
        usefulness_score: 1.5,
        last_reinforced: new Date(),
        decay_next: new Date()
      }
    };

    const memory2: Memory = {
      id: 'stat-mem-2',
      created: new Date(),
      content: 'Another memory',
      metadata: {
        source_sessions: [],
        projects: [],
        languages: [],
        tags: [],
        confidence: 0.6,
        usefulness_score: 2.5,
        last_reinforced: new Date(),
        decay_next: new Date()
      }
    };

    await store.addMemory(memory1, new Array(384).fill(0));
    await store.addMemory(memory2, new Array(384).fill(0));

    const stats = await store.getStats();

    expect(stats.totalMemories).toBe(2);
    expect(stats.avgConfidence).toBeCloseTo(0.7, 1);
    expect(stats.avgUsefulness).toBeCloseTo(2.0, 1);
  });
});
```

**Testing:**

```bash
npm test tests/unit/vector-store.test.ts
```

**Commit:** "Add LanceDB vector store"

## Phase 5: CLI Application (Day 4)

### Task 5.1: Main CLI Entry Point

**Objective:** Create the command-line interface

**File to create:** `src/cli.ts`

```typescript
#!/usr/bin/env node
// ABOUTME: Main CLI entry point for memory extraction and management
// ABOUTME: Provides commands for extracting, searching, and managing memories

import { Command } from 'commander';
import * as dotenv from 'dotenv';
import * as path from 'path';
import * as fs from 'fs';
import { ExtractCommand } from './commands/extract';
import { SearchCommand } from './commands/search';
import { StatsCommand } from './commands/stats';

// Load environment variables
dotenv.config();

const program = new Command();

program
  .name('claude-memories')
  .description('Extract and manage memories from Claude Code conversations')
  .version('0.1.0');

// Extract command
program
  .command('extract')
  .description('Extract memories from Claude Code sessions')
  .option('-s, --since <date>', 'Only process sessions after this date')
  .option('-p, --projects-dir <dir>', 'Claude projects directory', process.env.CLAUDE_PROJECTS_DIR)
  .option('-m, --memories-dir <dir>', 'Memories output directory', process.env.MEMORIES_DIR || './memories')
  .option('-i, --index-dir <dir>', 'Vector index directory', process.env.INDEX_DIR || './index')
  .option('--dry-run', 'Preview what would be extracted without writing')
  .action(async (options) => {
    const command = new ExtractCommand(options);
    await command.execute();
  });

// Search command
program
  .command('search <query>')
  .description('Search memories using semantic search')
  .option('-n, --limit <number>', 'Maximum results to return', '10')
  .option('-p, --project <name>', 'Filter by project')
  .option('-l, --language <name>', 'Filter by language')
  .option('-c, --min-confidence <number>', 'Minimum confidence score')
  .action(async (query, options) => {
    const command = new SearchCommand({
      query,
      ...options,
      indexDir: process.env.INDEX_DIR || './index'
    });
    await command.execute();
  });

// Stats command
program
  .command('stats')
  .description('Show memory database statistics')
  .option('-i, --index-dir <dir>', 'Vector index directory', process.env.INDEX_DIR || './index')
  .action(async (options) => {
    const command = new StatsCommand(options);
    await command.execute();
  });

// Parse arguments
program.parse(process.argv);

// Show help if no command provided
if (!process.argv.slice(2).length) {
  program.outputHelp();
}
```

**File to create:** `src/commands/extract.ts`

```typescript
// ABOUTME: Extract command implementation for processing sessions
// ABOUTME: Orchestrates the full extraction pipeline

import * as fs from 'fs';
import * as path from 'path';
import { SessionParser } from '../extraction/parser';
import { SessionChunker } from '../extraction/chunker';
import { LLMClient } from '../extraction/llm-client';
import { MemoryWriter } from '../storage/memory-writer';
import { VectorStore } from '../storage/vector-store';
import { EmbeddingGenerator } from '../utils/embeddings';
import { ExtractedInsight } from '../types';

export interface ExtractOptions {
  since?: string;
  projectsDir: string;
  memoriesDir: string;
  indexDir: string;
  dryRun?: boolean;
}

export class ExtractCommand {
  private lastExtractionFile: string;

  constructor(private options: ExtractOptions) {
    this.lastExtractionFile = path.join(options.indexDir, 'last-extraction.json');
  }

  async execute(): Promise<void> {
    console.log('🚀 Starting memory extraction...\n');

    // Validate directories
    if (!this.options.projectsDir) {
      console.error('❌ Projects directory not specified. Set CLAUDE_PROJECTS_DIR or use --projects-dir');
      process.exit(1);
    }

    if (!fs.existsSync(this.options.projectsDir)) {
      console.error(`❌ Projects directory not found: ${this.options.projectsDir}`);
      process.exit(1);
    }

    // Initialize components
    const parser = new SessionParser(this.options.projectsDir);
    const chunker = new SessionChunker();
    const llmClient = new LLMClient(process.env.ANTHROPIC_API_KEY || '');
    const writer = new MemoryWriter(this.options.memoriesDir);
    const vectorStore = new VectorStore(this.options.indexDir);
    const embeddings = new EmbeddingGenerator();

    await vectorStore.initialize();

    // Determine since date
    const sinceDate = await this.getSinceDate();
    if (sinceDate) {
      console.log(`📅 Processing sessions since: ${sinceDate.toISOString()}\n`);
    }

    // Process sessions
    let sessionCount = 0;
    let chunkCount = 0;
    let insightCount = 0;
    const allInsights: ExtractedInsight[] = [];

    for await (const session of parser.readSessions(sinceDate)) {
      sessionCount++;
      console.log(`\n📂 Processing session ${sessionCount}: ${session.id}`);
      console.log(`   Project: ${session.projectPath}`);
      console.log(`   Messages: ${session.messages.length}`);

      // Chunk the session
      const chunks = chunker.chunkSession(session);
      console.log(`   Chunks: ${chunks.length}`);

      // Process each chunk
      for (const chunk of chunks) {
        chunkCount++;

        // Screen chunk for value
        const screening = await llmClient.screenChunk(chunk);

        if (!screening.hasValue) {
          process.stdout.write('.');
          continue;
        }

        process.stdout.write('✓');

        // Extract insights
        const insights = await llmClient.extractInsights(chunk, session.id);

        if (insights.length > 0) {
          console.log(`\n   ✨ Found ${insights.length} insights`);
          allInsights.push(...insights);
          insightCount += insights.length;
        }
      }
    }

    console.log(`\n\n📊 Extraction complete:`);
    console.log(`   Sessions processed: ${sessionCount}`);
    console.log(`   Chunks analyzed: ${chunkCount}`);
    console.log(`   Insights extracted: ${insightCount}\n`);

    if (allInsights.length === 0) {
      console.log('No insights found to process.');
      return;
    }

    // Synthesis phase
    console.log('🔄 Synthesizing insights with Sonnet...');
    const synthesized = await llmClient.synthesizeInsights(allInsights);
    console.log(`   Synthesized to: ${synthesized.length} unique insights\n`);

    if (this.options.dryRun) {
      console.log('🔍 Dry run - would write the following memories:\n');
      synthesized.forEach((insight, i) => {
        console.log(`${i + 1}. ${insight.content}`);
        console.log(`   Type: ${insight.type}, Confidence: ${insight.confidence}`);
        console.log(`   ${insight.reasoning}\n`);
      });
      return;
    }

    // Write memories and index
    console.log('💾 Writing memories and building index...');

    for (const insight of synthesized) {
      // Detect project and language from source
      const projects = this.detectProjects(insight);
      const languages = this.detectLanguages(insight);

      // Write memory file
      const memory = await writer.writeMemory(insight, {
        projects,
        languages
      });

      // Generate embedding
      const embedding = await embeddings.generate(insight.content + ' ' + insight.reasoning);

      // Add to vector store
      await vectorStore.addMemory(memory, embedding);

      process.stdout.write('.');
    }

    console.log('\n\n✅ Memory extraction complete!');
    console.log(`   Memories written: ${synthesized.length}`);
    console.log(`   Index updated: ${this.options.indexDir}`);

    // Update last extraction timestamp
    await this.updateLastExtraction();
  }

  private async getSinceDate(): Promise<Date | undefined> {
    // Check command line option first
    if (this.options.since) {
      return new Date(this.options.since);
    }

    // Check last extraction file
    if (fs.existsSync(this.lastExtractionFile)) {
      try {
        const data = JSON.parse(fs.readFileSync(this.lastExtractionFile, 'utf-8'));
        return new Date(data.timestamp);
      } catch (e) {
        console.warn('⚠️  Could not read last extraction timestamp');
      }
    }

    return undefined;
  }

  private async updateLastExtraction(): Promise<void> {
    const data = {
      timestamp: new Date().toISOString(),
      version: '0.1.0'
    };

    fs.mkdirSync(path.dirname(this.lastExtractionFile), { recursive: true });
    fs.writeFileSync(this.lastExtractionFile, JSON.stringify(data, null, 2));
  }

  private detectProjects(insight: ExtractedInsight): string[] {
    // Extract project name from source path
    const projects = new Set<string>();

    if (insight.context && insight.context.includes('/')) {
      const match = insight.context.match(/\/([^\/]+)$/);
      if (match) {
        projects.add(match[1]);
      }
    }

    return Array.from(projects);
  }

  private detectLanguages(insight: ExtractedInsight): string[] {
    const languages = new Set<string>();

    const languagePatterns = [
      { pattern: /typescript|\.ts|\.tsx/i, language: 'typescript' },
      { pattern: /javascript|\.js|\.jsx/i, language: 'javascript' },
      { pattern: /python|\.py/i, language: 'python' },
      { pattern: /rust|\.rs|cargo/i, language: 'rust' },
      { pattern: /go|\.go|golang/i, language: 'go' },
    ];

    const text = insight.content + ' ' + insight.context;

    for (const { pattern, language } of languagePatterns) {
      if (pattern.test(text)) {
        languages.add(language);
      }
    }

    return Array.from(languages);
  }
}
```

**File to create:** `src/utils/embeddings.ts`

```typescript
// ABOUTME: Generate embeddings using local model (transformers.js)
// ABOUTME: Converts text to vector representations for semantic search

export class EmbeddingGenerator {
  // Simplified stub - replace with actual transformers.js implementation
  async generate(text: string): Promise<number[]> {
    // In real implementation, use transformers.js
    // For now, return dummy embedding
    const embedding = new Array(384);
    for (let i = 0; i < 384; i++) {
      // Simple hash-based pseudo-random for testing
      const hash = text.split('').reduce((a, b) => {
        a = ((a << 5) - a) + b.charCodeAt(0);
        return a & a;
      }, 0);
      embedding[i] = Math.sin(hash + i) * 0.5 + 0.5;
    }
    return embedding;
  }
}
```

**Testing the CLI:**

```bash
# Make executable
chmod +x src/cli.ts

# Test help
npm run extract -- --help

# Test dry run
npm run extract -- --dry-run

# Test with real extraction (requires API key)
ANTHROPIC_API_KEY=your-key npm run extract
```

**Commit:** "Implement CLI with extraction command"

## Phase 6: Testing Strategy (Day 5)

### Test Structure

```
tests/
├── fixtures/           # Test data
│   ├── sessions/      # Sample JSONL files
│   └── memories/      # Sample memory files
├── unit/              # Unit tests (already created)
├── integration/       # Integration tests
└── e2e/              # End-to-end tests
```

### Running Tests

```bash
# Run all tests
npm test

# Run with coverage
npm test -- --coverage

# Run specific test file
npm test tests/unit/parser.test.ts

# Run in watch mode
npm test -- --watch
```

### Test Coverage Goals

- Unit tests: 80%+ coverage
- Integration tests: Key workflows
- E2E tests: Full extraction pipeline

## Phase 7: Documentation (Day 5)

### Task 7.1: Create README

**File:** `README.md`

````markdown
# Claude Introspection

Memory system for Claude Code that learns from conversation history to improve future sessions.

## Installation

```bash
npm install
npm run build
````

## Configuration

Create a `.env` file:

```bash
ANTHROPIC_API_KEY=your-api-key
CLAUDE_PROJECTS_DIR=~/.claude/projects
MEMORIES_DIR=./memories
INDEX_DIR=./index
```

## Usage

### Extract memories from sessions

```bash
# Extract all sessions
npm run extract

# Extract since specific date
npm run extract -- --since 2025-01-01

# Dry run to preview
npm run extract -- --dry-run
```

### Search memories

```bash
# Semantic search
npx claude-memories search "import rules"

# With filters
npx claude-memories search "testing" --project lace --min-confidence 0.8
```

### View statistics

```bash
npx claude-memories stats
```

## How It Works

1. **Extraction**: Reads JSONL session files, chunks conversations, uses LLM to extract insights
1. **Storage**: Saves memories as markdown with frontmatter, indexes with LanceDB
1. **Retrieval**: Claude Code hooks query memories and inject relevant context
1. **Reinforcement**: Tracks memory usefulness through conversation patterns

## Development

```bash
# Run in dev mode
npm run dev

# Run tests
npm test

# Type check
npm run typecheck

# Lint
npm run lint
```

````

**Commit:** "Add documentation"

## Phase 8: Deployment & Monitoring

### Final Checklist

1. **Code Quality**
   - [ ] All tests passing
   - [ ] TypeScript compiles without errors
   - [ ] Linter passes
   - [ ] Test coverage > 80%

2. **Functionality**
   - [ ] Extraction works on sample data
   - [ ] Memories are written correctly
   - [ ] Vector search returns relevant results
   - [ ] CLI commands work as expected

3. **Documentation**
   - [ ] README is complete
   - [ ] Code has inline documentation
   - [ ] API is documented
   - [ ] Examples provided

4. **Git Workflow**
   - [ ] Frequent commits (after each task)
   - [ ] Meaningful commit messages
   - [ ] Branch protection if needed
   - [ ] Tagged releases

### Monitoring

Add logging for production:
- Extraction metrics (sessions processed, insights found)
- Search performance (query time, result relevance)
- Memory reinforcement (usefulness scores over time)
- Error tracking

## Common Issues & Solutions

### Issue: API Rate Limiting
**Solution:** Add rate limiting to LLM client, batch requests

### Issue: Large Session Files
**Solution:** Stream processing, chunk large files

### Issue: Memory Bloat
**Solution:** Periodic consolidation, archive old memories

### Issue: Poor Search Relevance
**Solution:** Tune embedding model, adjust search parameters

## Next Steps After Initial Implementation

1. **Hook Integration** - Implement Claude Code hooks for retrieval
2. **MCP Tool** - Create MCP tool for proactive memory search
3. **Reinforcement Loop** - Track memory citations and update scores
4. **UI Dashboard** - Web interface for browsing memories
5. **Performance Optimization** - Parallel processing, caching
6. **Advanced Features** - Memory consolidation, cross-user learning

## Success Criteria

- Extraction completes on 3GB corpus in < 1 hour
- Search returns relevant results in < 100ms
- Memory injection adds < 500ms to session start
- User reports 50%+ reduction in repeated corrections

---

This plan provides everything needed to implement the initial memory extraction system. Each phase builds on the previous one, with clear testing points and commit boundaries. Follow the TDD approach: write tests first, implement to pass, then refactor.```
````
