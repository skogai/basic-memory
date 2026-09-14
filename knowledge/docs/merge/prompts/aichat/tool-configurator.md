---
title: Advanced Tool Configuration
description: Detailed guide for configuring complex tool behaviors and integrations in the SkogAI system
date: '2023-11-06'
tags:
  - tools
  - argc
  - configuration
  - advanced
permalink: prompts/aichat/tool-configurator
---

# Advanced Tool Configuration

This document explores advanced configurations and techniques for developing sophisticated tools within the SkogAI system.

## Parameter Types and Validation

The argc framework supports various parameter types with built-in validation:

### Basic Types

```bash
# @param name String parameter (default)
# @param age:number Numeric parameter
# @param active:boolean Boolean parameter
# @param items:array Array parameter
# @param config:object Object parameter
```

### Enumerations

Limit parameters to specific values:

```bash
# @param format[json,text,html] Output format
# @option --level=info[debug,info,warn,error] Log level
```

### Regular Expression Validation

Validate parameters with regex patterns:

```bash
# @param email:email Email address
# @param phone:/^\+?[0-9]{10,15}$/ Phone number
```

### Custom Validation Functions

For complex validation, use validation functions:

```bash
# @param input Custom-validated input
# @validate input validateInputFunction
```

Then define the validation function in your script.

## Advanced Annotations

### @stdin

Process input from stdin:

```bash
# @stdin Input data to process
```

### @stdout

Define stdout handling:

```bash
# @stdout json Output will be JSON formatted
```

### @hook

Register hooks for lifecycle events:

```bash
# @hook before beforeExecution
# @hook after afterExecution
```

### @require

Specify dependencies:

```bash
# @require jq Command-line JSON processor
# @require npm:axios HTTP client
```

### @env

Define environment variables:

```bash
# @env API_KEY API key for service
# @env DEBUG=false Enable debug mode
```

## Chaining and Composing Tools

Tools can be designed to work together through:

### Pipeline Support

Make tools work in Unix pipelines:

```bash
# @stdin Input data from pipe
# @stdout text Output text for pipe
```

Usage:

```bash
echo "input" | ./bin/tool1 | ./bin/tool2
```

### Subprocess Execution

Tools can execute other tools:

```bash
./bin/parent_tool "params" --option=value
```

With subprocess execution in the script:

```bash
result=$(./bin/child_tool "$processed_input")
```

### Function Sharing

Share functions between tools using source:

```bash
# In shared.sh
function shared_function() {
  echo "Shared functionality"
}

# In tool script
source "$(dirname "$0")/../utils/shared.sh"
shared_function
```

## Security Considerations

### Input Sanitization

Sanitize user inputs to prevent injection attacks:

```bash
# Sanitize command input
sanitized_command=$(echo "$command" | sed 's/[;&|<>]//g')
```

### Permission Boundaries

Limit tool permissions:

```bash
# @permission fs.read Read-only file access
# @permission net.fetch.domain=example.com Limited network access
```

### Resource Limits

Set resource usage limits:

```bash
# @limit cpu=50% Maximum CPU usage
# @limit memory=100MB Maximum memory usage
# @limit time=30s Maximum execution time
```

## Error Handling

Implement robust error handling:

```bash
#!/bin/bash
# @description Tool with error handling
# @param input Input parameter

eval "$(argc --argc-eval "$0" "$@")"

# Validation
if [[ -z "$input" ]]; then
  echo "ERROR: Input cannot be empty" >&2
  exit 1
fi

# Try operation with error handling
if ! result=$(process_input "$input" 2>&1); then
  echo "ERROR: Processing failed - $result" >&2
  exit 2
fi

# Return structured error in JSON format
if [ "$error" = true ]; then
  echo "{\"error\": true, \"message\": \"$error_message\"}"
  exit 0
fi
```

## Configuration and State Management

### Config Files

Store tool configurations in external files:

```bash
# Load configuration
config_file="${HOME}/.config/skogai/tools/mytool.conf"
if [ -f "$config_file" ]; then
  source "$config_file"
fi
```

### Persistent State

Maintain state between invocations:

```bash
# State management
state_dir="${HOME}/.local/state/skogai/tools/mytool"
state_file="${state_dir}/state.json"

# Ensure state directory exists
mkdir -p "$state_dir"

# Load state
if [ -f "$state_file" ]; then
  state=$(cat "$state_file")
else
  state="{}"
fi

# Update state
new_state=$(echo "$state" | jq '.count += 1')
echo "$new_state" > "$state_file"
```

## Asynchronous Processing

For long-running operations, implement asynchronous processing:

```bash
#!/bin/bash
# @description Async processing tool
# @param job_id Job identifier

eval "$(argc --argc-eval "$0" "$@")"

# Start background process
if [ -z "$job_id" ]; then
  # New job
  job_id=$(uuidgen)
  nohup "$0" "$job_id" > "/tmp/job_${job_id}.log" 2>&1 &
  echo "{\"job_id\": \"$job_id\", \"status\": \"started\"}"
  exit 0
else
  # Running job
  # Actual long-running processing here
  sleep 10

  # Update job status
  echo "Job completed" > "/tmp/job_${job_id}.complete"
  exit 0
fi
```

Checking job status:

```bash
#!/bin/bash
# @description Check job status
# @param job_id Job identifier

eval "$(argc --argc-eval "$0" "$@")"

if [ -f "/tmp/job_${job_id}.complete" ]; then
  echo "{\"job_id\": \"$job_id\", \"status\": \"complete\"}"
else
  echo "{\"job_id\": \"$job_id\", \"status\": \"running\"}"
fi
```

## API Integrations

Tools can integrate with external APIs:

```bash
#!/bin/bash
# @description Interact with external API
# @param query Search query
# @env API_KEY The API key for authentication

eval "$(argc --argc-eval "$0" "$@")"

# Validate environment
if [ -z "$API_KEY" ]; then
  echo "ERROR: API_KEY environment variable is required" >&2
  exit 1
fi

# Make API request
response=$(curl -s -H "Authorization: Bearer $API_KEY" \
  "https://api.example.com/search?q=${query}")

# Process and return
echo "$response" | jq .
```

## Tool Documentation Generation

Generate documentation from annotations:

```bash
# Create documentation for a tool
argc doc tools/my_tool.sh > docs/my_tool.md
```

Or build documentation for all tools:

```bash
# Build all tool documentation
mkdir -p docs/tools
for tool in tools/*.sh; do
  name=$(basename "$tool" .sh)
  argc doc "$tool" > "docs/tools/${name}.md"
done
```

## Multi-language Tool Development

### Language-Specific Considerations

#### Bash Tools

```bash
#!/bin/bash
# @description Bash tool example
# Use process substitution and other bash features

# Bash-specific patterns
while read -r line; do
  process_line "$line"
done < <(generate_lines)
```

#### Python Tools

```python
#!/usr/bin/env python3
# @description Python tool example
# Leverage Python libraries

import pandas as pd
import numpy as np
from argc import argc

args = argc(sys.argv)
# Use Python's rich ecosystem
df = pd.read_csv(args.get('file'))
result = df.describe().to_json()
print(result)
```

#### JavaScript Tools

```javascript
#!/usr/bin/env node
// @description JavaScript tool example
// Use async/await and ES features

const { argc } = require('argc-script');
const args = argc(process.argv);

// Async operations
(async () => {
  const response = await fetch(args.url);
  const data = await response.json();
  console.log(JSON.stringify(data));
})();
```

## Testing Tools

### Creating Test Cases

```bash
# Create test directory
mkdir -p tests/tools/my_tool

# Create test case
cat > tests/tools/my_tool/basic.test << EOF
#!/bin/bash
source "$(dirname "$0")/../../../utils/test_framework.sh"

# Test basic functionality
output=$(../../bin/my_tool "test input" --option=value)
assert_contains "$output" "expected result"
assert_exit_code 0

# Test error case
output=$(../../bin/my_tool "" 2>&1)
assert_contains "$output" "ERROR"
assert_exit_code 1
EOF

chmod +x tests/tools/my_tool/basic.test
```

### Running Tests

```bash
# Run specific test
./tests/tools/my_tool/basic.test

# Run all tests
find tests -name "*.test" -exec {} \;
```

## Tool Versioning

Implement versioning for backward compatibility:

```bash
#!/bin/bash
# @description Versioned tool example
# @version 2.1.0
# @param input Input data
# @param format[json,xml] Output format (added in v2.0.0)
# @deprecated old_param Use 'input' instead (removed in v2.0.0)

eval "$(argc --argc-eval "$0" "$@")"

# Version-specific logic
if [ -n "$old_param" ]; then
  # Legacy support
  input="$old_param"
  echo "WARNING: 'old_param' is deprecated, use 'input' instead" >&2
fi

# Process based on format (new in v2.0.0)
case "$format" in
  "json")
    echo "{\"result\": \"$input\"}"
    ;;
  "xml")
    echo "<result>$input</result>"
    ;;
esac
```

______________________________________________________________________

This advanced configuration guide provides the techniques needed to create sophisticated, robust tools for the SkogAI system. By leveraging these patterns, you can build tools that are secure, efficient, and highly integrated with the rest of the ecosystem.
