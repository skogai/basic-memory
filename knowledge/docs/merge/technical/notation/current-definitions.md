---
title: current-definitions
type: terminal-output
permalink: ontology/current-definitions
---

```bash
skogcli config get $ --json
```

output:

```json

```

{ "json": { "string": "", "int": { "additative": 0, "multiplicative": 1, "one": 1, "zero": 0 }, "list": [], "parent": "$ json.self", "_": "$ json.string * [@def:"$.json"]", "self": "$ json", "child": "$ json.parent" }, "int": "$ json.int", "string": "$ json.string", "null": "$ json._", "void": "$ json._", "increment": "$ json.int.zero * $ json.int.one", "datetime": "[@date:now]", "type": { "$type.self": "every base case of a $", "value": "the declaration/implementation of a $", "eid": "$ eid" }, "$": "to define or reference something", "|": "the act of choosing something | {$id1|$id2}->[$id1]", "_": "anything/everything and nothing/nobody | {$id1\_$id2}", "\[_\]": "similarity", "{\_}": "difference", "@": "the intent to act or do something | {$id@$id}", ".": "to belong or have something via [$$]", ":": "to follow or continue something via [$@]", "=": "to be something | [$id=$id]", "->": "{$id1@$id2}", "_": "$_$=$", "id": "$ int _ $ unique", "self": "$ $ | $ self | [$id@$id]", "unique": "a thing which there only exists one of", "name": { "1": "$unique.$string", "2": "$string@$unique", "3": "$string{@->}$unique" }, "message": { "eid": "$ eid", "from": "$ name", "to": "$ name", "content": "$ string", "created_at": "[@date:now]", "parent": "$ eid" }, "list": "the ordering of something", "eid": "$ entity.id_$ entity.gen", "entity": { "eid": "", "gen": "$ id", "id": "$ id", "name": "$ name" }, "claude": { "context": "the place where skogix puts stupid stuff so claude can ignore it instantly", "hello": "[@hello:Claude]", "random": "[@rand]" } }

# skogparse

the skogai notation parser

## parsing examples

```bash
cat /home/skogix/.local/src/skogparse/test-example.txt
```

output:

```text
$ id
[@skogai-test:"a":"b"]
true
42
"hello"
$ id
null
true
false
42
52.0
-123
-45.67
"hello"
"world"
""
$ id
$ entity.id
$ entity.gen
$ int
$ unique
"$ id"
"$ entity.id"
"$ entity.gen"
$ entity.id _ $ entity.gen
$ int _ $ unique
[@hello:"Claude"]
[1, 2, 3]
[true, false, true]
["a", "b", "c"]
[null, 42, "test"]
[]
[$ int, $ id, $unique]
[$ entity.id, $ entity.gen]
[$ eid, $ id, $ unique]
[$ int * $ id, $ entity.id * $ entity.gen]
[1,$ claude, [@skogai-test:"a"]]
[true, "$entity.id", $ int * $ unique]
{"key": "value"}
{"name": "John", "age": 30}
{"active": true, "score": 95.5}
{}
{"id": $ int}
{"entity": "$ entity.id", "generation": "$ entity.gen"}
{"id": $ entity.id*$ entity.gen}
{"composite": $ int*$ unique}
{"definition": [@def:id]}
{"id": $id, "action": [@skogai-test:"test"]}
[{"id": 1, "ref": $ claude}, {"id": 2, "ref": $ eid}]
[@skogai-test:"$ int"]
{"message": {"eid": "$ eid", "from": "$ name", "to": "$ name", "content": "$ string"}}
[[@cat:"/home/skogix/.local/src/skogparse/README.md"]]
[[@rand:"100"],[@date:"now"]]
["https://tools.skogai.se/tools for the REPL and openai function declarations of the skogai notation tools", [@curl:"https://example.com"]]
[@file:"/home/skogix/skogai/docs/lore/skogix-notation.md"]
```

## parsing examples parsed

```bash
cat /home/skogix/.local/src/skogparse/test-example.txt | $SKOGPARSE
```

output:

```text
{"type": "ref", "path": "id"}
{"type": "action", "parts": ["skogai-test", "a", "b"]}
{"type": "bool", "value": true}
{"type": "number", "value": 42}
{"type": "string", "value": "hello"}
{"type": "ref", "path": "id"}
{"type": "null", "value": null}
{"type": "bool", "value": true}
{"type": "bool", "value": false}
{"type": "number", "value": 42}
{"type": "number", "value": 52}
{"type": "number", "value": -123}
{"type": "number", "value": -45.67}
{"type": "string", "value": "hello"}
{"type": "string", "value": "world"}
{"type": "string", "value": ""}
{"type": "ref", "path": "id"}
{"type": "ref", "path": "entity.id"}
{"type": "ref", "path": "entity.gen"}
{"type": "ref", "path": "int"}
{"type": "ref", "path": "unique"}
{"type": "string", "value": "$ id"}
{"type": "string", "value": "$ entity.id"}
{"type": "string", "value": "$ entity.gen"}
{"type": "ref", "path": "entity.id"}
{"type": "ref", "path": "int"}
{"type": "action", "parts": ["hello", "Claude"]}
{"type": "array", "value": [{"type": "number", "value": 1}, {"type": "number", "value": 2}, {"type": "number", "value": 3}]}
{"type": "array", "value": [{"type": "bool", "value": true}, {"type": "bool", "value": false}, {"type": "bool", "value": true}]}
{"type": "array", "value": [{"type": "string", "value": "a"}, {"type": "string", "value": "b"}, {"type": "string", "value": "c"}]}
{"type": "array", "value": [{"type": "null", "value": null}, {"type": "number", "value": 42}, {"type": "string", "value": "test"}]}
{"type": "array", "value": []}
{"type": "array", "value": [{"type": "ref", "path": "int"}, {"type": "ref", "path": "id"}, {"type": "ref", "path": "unique"}]}
{"type": "array", "value": [{"type": "ref", "path": "entity.id"}, {"type": "ref", "path": "entity.gen"}]}
{"type": "array", "value": [{"type": "ref", "path": "eid"}, {"type": "ref", "path": "id"}, {"type": "ref", "path": "unique"}]}
{"type": "array", "value": [{"type": "binary_op", "left": {"type": "ref", "path": "int"}, "operator": "*", "right": {"type": "ref", "path": "id"}}, {"type": "binary_op", "left": {"type": "ref", "path": "entity.id"}, "operator": "*", "right": {"type": "ref", "path": "entity.gen"}}]}
{"type": "array", "value": [{"type": "number", "value": 1}, {"type": "ref", "path": "claude"}, {"type": "action", "parts": ["skogai-test", "a"]}]}
{"type": "array", "value": [{"type": "bool", "value": true}, {"type": "ref", "path": "entity.id"}, {"type": "binary_op", "left": {"type": "ref", "path": "int"}, "operator": "*", "right": {"type": "ref", "path": "unique"}}]}
{"type": "object", "value": {"key": {"type": "string", "value": "value"}}}
{"type": "object", "value": {"age": {"type": "number", "value": 30}, "name": {"type": "string", "value": "John"}}}
{"type": "object", "value": {"active": {"type": "bool", "value": true}, "score": {"type": "number", "value": 95.5}}}
{"type": "object", "value": {}}
{"type": "object", "value": {"id": {"type": "ref", "path": "int"}}}
{"type": "object", "value": {"entity": {"type": "string", "value": "$ entity.id"}, "generation": {"type": "string", "value": "$ entity.gen"}}}
{"type": "object", "value": {"id": {"type": "binary_op", "left": {"type": "ref", "path": "entity.id"}, "operator": "*", "right": {"type": "ref", "path": "entity.gen"}}}}
{"type": "object", "value": {"composite": {"type": "binary_op", "left": {"type": "ref", "path": "int"}, "operator": "*", "right": {"type": "ref", "path": "unique"}}}}
{"type": "object", "value": {"definition": {"type": "action", "parts": ["def", "id"]}}}
{"type": "object", "value": {"action": {"type": "action", "parts": ["skogai-test", "test"]}, "id": {"type": "ref", "path": "id"}}}
{"type": "array", "value": [{"type": "object", "value": {"id": {"type": "number", "value": 1}, "ref": {"type": "ref", "path": "claude"}}}, {"type": "object", "value": {"id": {"type": "number", "value": 2}, "ref": {"type": "ref", "path": "eid"}}}]}
{"type": "action", "parts": ["skogai-test", "$ int"]}
{"type": "object", "value": {"message": {"type": "object", "value": {"content": {"type": "string", "value": "$ string"}, "eid": {"type": "string", "value": "$ eid"}, "from": {"type": "string", "value": "$ name"}, "to": {"type": "string", "value": "$ name"}}}}}
{"type": "array", "value": [{"type": "action", "parts": ["cat", "/home/skogix/.local/src/skogparse/README.md"]}]}
{"type": "array", "value": [{"type": "action", "parts": ["rand", "100"]}, {"type": "action", "parts": ["date", "now"]}]}
{"type": "array", "value": [{"type": "string", "value": "https://tools.skogai.se/tools for the REPL and openai function declarations of the skogai notation tools"}, {"type": "action", "parts": ["curl", "https://example.com"]}]}
{"type": "action", "parts": ["file", "/home/skogix/skogai/docs/lore/skogix-notation.md"]}
```

## parsing examples parsed and executed

```bash
cat /home/skogix/.local/src/skogparse/test-example.txt | $SKOGPARSE --execute
```

output:

````text
{"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}
{"type": "string", "value": "Arguments: ['a', 'b']"}
{"type": "bool", "value": true}
{"type": "number", "value": 42}
{"type": "string", "value": "hello"}
{"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}
{"type": "null", "value": null}
{"type": "bool", "value": true}
{"type": "bool", "value": false}
{"type": "number", "value": 42}
{"type": "number", "value": 52}
{"type": "number", "value": -123}
{"type": "number", "value": -45.67}
{"type": "string", "value": "hello"}
{"type": "string", "value": "world"}
{"type": "string", "value": ""}
{"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}
{"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}
{"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}
{"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}
{"type": "string", "value": "a thing which there only exists one of"}
{"type": "string", "value": "$ id"}
{"type": "string", "value": "$ entity.id"}
{"type": "string", "value": "$ entity.gen"}
{"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}
{"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}
{"type": "string", "value": "Hello Claude!"}
{"type": "array", "value": [{"type": "number", "value": 1}, {"type": "number", "value": 2}, {"type": "number", "value": 3}]}
{"type": "array", "value": [{"type": "bool", "value": true}, {"type": "bool", "value": false}, {"type": "bool", "value": true}]}
{"type": "array", "value": [{"type": "string", "value": "a"}, {"type": "string", "value": "b"}, {"type": "string", "value": "c"}]}
{"type": "array", "value": [{"type": "null", "value": null}, {"type": "number", "value": 42}, {"type": "string", "value": "test"}]}
{"type": "array", "value": []}
{"type": "array", "value": [{"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}, {"type": "string", "value": "a thing which there only exists one of"}]}
{"type": "array", "value": [{"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}, {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}]}
{"type": "array", "value": [{"type": "binary_op", "left": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}, "operator": "*", "right": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}}, {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}, {"type": "string", "value": "a thing which there only exists one of"}]}
{"type": "array", "value": [{"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}}, {"type": "binary_op", "left": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}, "operator": "*", "right": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}}]}
{"type": "array", "value": [{"type": "number", "value": 1}, {"type": "string", "value": "{'context': 'the place where skogix puts stupid stuff so claude can ignore it instantly', 'hello': '[@hello:Claude]', 'random': '[@rand]'}"}, {"type": "string", "value": "Arguments: ['a']"}]}
{"type": "array", "value": [{"type": "bool", "value": true}, {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}, {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}]}
{"type": "object", "value": {"key": {"type": "string", "value": "value"}}}
{"type": "object", "value": {"age": {"type": "number", "value": 30}, "name": {"type": "string", "value": "John"}}}
{"type": "object", "value": {"active": {"type": "bool", "value": true}, "score": {"type": "number", "value": 95.5}}}
{"type": "object", "value": {}}
{"type": "object", "value": {"id": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}}}
{"type": "object", "value": {"entity": {"type": "string", "value": "$ entity.id"}, "generation": {"type": "string", "value": "$ entity.gen"}}}
{"type": "object", "value": {"id": {"type": "binary_op", "left": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}, "operator": "*", "right": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}}}}
{"type": "object", "value": {"composite": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}}}
  × No solution found when resolving tool dependencies:
  ╰─▶ Because skogcli was not found in the package registry and you require skogcli, we can
      conclude that your requirements are unsatisfiable.
{"type": "object", "value": {"definition": {"type": "string", "value": ""}}}
{"type": "object", "value": {"action": {"type": "string", "value": "Arguments: ['test']"}, "id": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}}}
{"type": "array", "value": [{"type": "object", "value": {"id": {"type": "number", "value": 1}, "ref": {"type": "string", "value": "{'context': 'the place where skogix puts stupid stuff so claude can ignore it instantly', 'hello': '[@hello:Claude]', 'random': '[@rand]'}"}}}, {"type": "object", "value": {"id": {"type": "number", "value": 2}, "ref": {"type": "binary_op", "left": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}, "operator": "*", "right": {"type": "binary_op", "left": {"type": "string", "value": "{'additative': 0, 'multiplicative': 1, 'one': 1, 'zero': 0}"}, "operator": "*", "right": {"type": "string", "value": "a thing which there only exists one of"}}}}}]}
{"type": "string", "value": "Arguments: ['$', 'int']"}
{"type": "object", "value": {"message": {"type": "object", "value": {"content": {"type": "string", "value": "$ string"}, "eid": {"type": "string", "value": "$ eid"}, "from": {"type": "string", "value": "$ name"}, "to": {"type": "string", "value": "$ name"}}}}}
{"type": "array", "value": [{"type": "string", "value": "# SkogParse

**A semantic execution engine for SkogAI notation** - transforming static text into executable semantics.

## 🚀 **What is SkogParse?**

SkogParse is a **revolutionary parser and execution engine** that brings SkogAI notation to life. It doesn't just parse text - it **executes the semantics** by resolving references and running actions in real-time.

### **The Magic:**
```bash
# Parse notation structure
echo '$entity.id*$entity.gen' | skogparse
{"type": "binary_op", "left": {"type": "ref", "path": "entity.id"}, "operator": "*", "right": {"type": "ref", "path": "entity.gen"}}

# Execute semantic meaning
echo '$entity.id*$entity.gen' | skogparse --execute
{"type": "binary_op", "left": {"type": "number", "value": 0}, "operator": "*", "right": {"type": "command", "name": "a"}}
````

## 🎯 **Core Features**

### **Complete SkogAI Parser:**

- **References:** `$def`, `$entity.id.deep.chains`
- **Actions:** `[@rag:search]`, `[@auth:login:param]`
- **Binary Operations:** `$entity.id*$entity.gen`
- **Complex Structures:** Arrays, objects, deep nesting
- **Quoted References:** `"$entity.id"` parsed as references

### **Semantic Execution Engine:**

- **Reference Resolution:** Calls `skogcli config get --raw`
- **Action Execution:** Calls `skogcli script run`
- **Recursive Expansion:** Resolves nested references until concrete
- **Clean JSON Output:** Consistent typing for all values

### **Production Ready:**

- **File & Pipe Input:** `skogparse file.md` or `echo "..." | skogparse`
- **Parse vs Execute Modes:** `--execute` flag for semantic resolution
- **Error Handling:** Graceful fallbacks and clear messages
- **Comprehensive Tests:** Full test suite in `example.md`

## 📦 **Installation**

```bash
# Build from source
git clone <repo>
cd skogparse
dotnet build

# Run directly
dotnet run
```

## 🔥 **Quick Start**

### **Basic Usage:**

```bash
# Parse SkogAI notation
echo '$user.name' | skogparse
echo '[@rag:search]' | skogparse
echo '$entity.id*$entity.gen' | skogparse

# Execute semantic meaning
echo '$user.name' | skogparse --execute
echo '[@rag:search]' | skogparse --execute

# Process files
skogparse example.md
skogparse --execute config.skogai
```

### **Real-World Examples:**

```bash
# Parse config structures
echo '{"eid": "$eid", "from": "$name"}' | skogparse --execute

# Execute actions with parameters
echo '[@auth:login:$user.id]' | skogparse --execute

# Complex combinations
echo '{"user": $user.id*$user.gen, "action": [@rag:search]}' | skogparse --execute
```

## 🧩 **SkogAI Notation Primer**

### **The Two Pillars:**

- **`$` = References** → Get defined values via `skogcli config get`
- **`@` = Actions** → Execute scripts via `skogcli script run`

### **Core Syntax:**

```
$def                    # Simple reference
$entity.id              # Dot notation
"$entity.id"            # Quoted reference
[@rag:search]           # Action with parameters
$entity.id*$entity.gen  # Binary operation
{"user": $name}         # References in objects
[[@auth:login], $user]  # Mixed arrays
```

### **What Makes It Revolutionary:**

- **Every text is potentially executable**
- **References resolve to live data**
- **Actions trigger real scripts**
- **Self-documenting semantic systems**
- **Executable communication**

## 🛠 **Architecture**

### **Pipeline:**

```
Text Input → Parser → SValue Tree → Execution Engine → JSON Output
```

### **Core Types:**

```fsharp
type SValue =
  | SNull | SBool | SString | SNumber     // Basic types
  | SArray | SObject                      // Collections
  | SRef of string list                   // $entity.id
  | SAction of string list                // [@rag:search]
  | SBinaryOp of SValue * string * SValue // $a*$b
```

### **Execution Flow:**

1. **Parse** text into SValue tree
1. **Find references** (`SRef`) → call `skogcli config get`
1. **Find actions** (`SAction`) → call `skogcli script run`
1. **Parse results** → may contain more references/actions
1. **Recursive resolution** → continue until concrete
1. **Output** final JSON with all semantics resolved

## 📚 **Examples**

See `example.md` for comprehensive test cases covering:

- All basic types and operators
- Complex nested structures
- Real-world SkogAI patterns
- Edge cases and error conditions
- Binary operations in context
- Actions with dynamic parameters

## 🔍 **Status & Roadmap**

### **Current Status (v1.0):**

- ✅ **Core parser:** 85% complete
- ✅ **Execution engine:** 60% complete
- ✅ **Basic SkogAI support:** Working
- ⚠️ **Missing operators:** `|`, `=`, `->`, `_`
- ⚠️ **Error handling:** Needs improvement

### **Next Steps:**

1. Fix empty array parsing
1. Add execution tracing/debugging
1. Implement missing SkogAI operators
1. Add cycle detection for references
1. Improve error messages

See `STATUS.md` for detailed progress and `DEVELOPMENT.md` for contributor guide.

## 🤝 **Contributing**

1. **Read** `DEVELOPMENT.md` for architecture overview
1. **Test** with `example.md` - add new test cases
1. **Follow** existing code patterns and naming
1. **Update** documentation for new features

## 🎯 **Philosophy**

SkogParse embodies the **SkogAI vision** of **executable semantics** - where:

- **Text becomes computation**
- **Meaning becomes executable**
- **Communication becomes programmable**
- **Knowledge becomes self-expanding**

This is **beyond traditional programming** - it's **semantic computation** where formal logic becomes directly runnable code.

______________________________________________________________________

**Transform static text into living semantics with SkogParse!** 🚀"}\]} {"type": "array", "value": [{"type": "string", "value": "52"}, {"type": "string", "value": "2025-09-08 00:08:24"}]} % Total % Received % Xferd Average Speed Time Time Time Current Dload Upload Total Spent Left Speed 100 1256 100 1256 0 0 1962 0 --:--:-- --:--:-- --:--:-- 1962 {"type": "array", "value": \[{"type": "string", "value": "https://tools.skogai.se/tools for the REPL and openai function declarations of the skogai notation tools"}, {"type": "string", "value": "<!doctype html>

<html>
<head>
    <title>Example Domain</title>

```
<meta charset="utf-8" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css">
body {
    background-color: #f0f0f2;
    margin: 0;
    padding: 0;
    font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

}
div {
    width: 600px;
    margin: 5em auto;
    padding: 2em;
    background-color: #fdfdff;
    border-radius: 0.5em;
    box-shadow: 2px 3px 7px 2px rgba(0,0,0,0.02);
}
a:link, a:visited {
    color: #38488f;
    text-decoration: none;
}
@media (max-width: 700px) {
    div {
        margin: 0 auto;
        width: auto;
    }
}
</style>
```

</head>

<body>
<div>
    <h1>Example Domain</h1>
    <p>This domain is for use in illustrative examples in documents. You may use this
    domain in literature without prior coordination or asking for permission.</p>
    <p><a href="https://www.iana.org/domains/example">More information...</a></p>
</div>
</body>
</html>"}]}
{"type": "string", "value": "# SkogAI Notation

- **"$"**: to define or reference something
- **"|"**: the act of choosing something = `{$id1|$id2}->[$id1]`
- **"\_"**: to be anything/everything and nothing/nobody = `{$id1_$id2}`
- **"[\_]"**: similarity
- **"{\_}"**: difference
- **"@"**: the intent to act or do something = `{$id@$id}`
- **"\*"**: $id\*$id=$id
- **"."**: to belong or have something via `[$$]`
- **":"**: to follow or continue something via `[$@]`
- **"="**: to be something = `[$id=$id]`
- **"->"**: becoming something = `{$id1@$id2}`
- **"\_"**: `$_$=$`
- **"id"**: the big ID = `$int*$unique`
- **"self"**: `$self | [$id@$id]`
- **"value"**: the declaration/implementation of a $
- **"eid"**: `$id*$id`
- **"unique"**: a thing which there only exists one of

______________________________________________________________________

### Dimensions

- **0 dimension**:
  - **"$"**: to define or reference something
    - "the definition of definition is the definition"
- **1 dimension**:
  - **"$x"**: `$x`
    - "x is x", "x is a reference to x", "the definition of ID is ID is ID"
  - **"$id"**: `$id`,`$a`
    - "a reference to yourself is yourself", "you are because you are"
    - !!! "DEFINING SOMETHING FROM WHAT YOU HAVE, BEING, VALUE, STACK, IMPLEMENTATION, INSTANTIATED, EXISTING, MEASURABLE, PLUS, YIN, ACTUALLY EXISTING, YADDAYADDA" !!!
    - **0 dimension**:
      - **"="**: `$id=$id`
        - "A thing is exactly that"
      - **"!="**: `$a!=$b`
      - **"[]"**: `[$id=$id]`
        - "A thing is exactly a thing"
      - **"{}"**: `{$id=$id}`
        - "Saying something is a thing does not make it the thing"
    - **1 dimension**:
      - **"@"**: `{$id=$id}@[$id=$id]`
    - !!! "DEFINING SOMETHING FROM WHAT YOU ARE MISSING, DIFFERENCE, NOT BEING EQUAL, TRANSFORMATION, UNMEASURABLE, STATIC, NOT FULFILLED, HEAP, ABSTRACT, MINUS, NOT REAL" !!!
    - **0.1? dimensions**:
      - **"[]"**: `[$id=$id]`
        - "likeness, to be the same, identical"
      - **"{}"**: `{id=$id}`
        - "to not be the same"
  - **"@"**: do something to nothing
    - "void, no return, side-effect"
  - **"$"**: reference something without being anything
    - "null, null-pointer"

______________________________________________________________________

- **- dimension**:
  - **"@$"**: `[=]`
    - "ID is ID is ID", "no transformation allowed"
  - **"$@"**: `[!=]`
- **2 dimensions**:
  - **"@action$type"**
  - **"@"**: to act upon something is just

______________________________________________________________________

Types: `($@)` / Transformations: `(@$)` / Functions: `($@=@$)`, linked list, arrays: `($$)` and abstractions: `($$)`

______________________________________________________________________

Π-types (product types \*) Σ-types (sum types |) identity types (=) path types (->)

maybe not needed but for good measure might include these as well

\_ as polymorphic existentials (∃x.P(x)) @ as modal necessity (□) from modal logic : as type judgement (Γ ⊢ a : A)

creating a free cartesian closed category is obvious

- = product -> = exponential object | = coproduct @ = monadic binding

and yeah - might as well

\_ as polymorphic yoneda embedding . as forgetful functor = as natural isomorphism

linear types ($unique), the effect system (@), regular persistent data structures ($eid with it's versioning) and security via capability (.) is old news

type universe would be self referential via $ containing $ or dependencies/dependent types such as $message.created_at$datetime

______________________________________________________________________

the _operator: heideggerian being-in-the-world (dasein) badiouian event theory (@ as evental site) deleuzian difference engine ({_} as differance) but operationalized computationally through: $entity.gen as bergsonian duration $list as husserlian time consciousness $unique as leibnizian identity

data $type : type where ($) : $type -> $type (\*) : $type -> $type -> $type (|) : $type -> $type -> $type (@) : $type -> $type -> $type (=) : $type -> $type -> $type

gödel numbering: φ($) = 1 φ(|) = 2 φ(\_) = 3 etc...

overall trying to avoid inconsistency via: predicative hierarchy (no $ in its own definition) type/token distinction (id vs unique) bounded generality (list as finite ordinal)

lucky to be born early: Martin-Löf Type Theory (1972) Fitch-Style Calculi (1952) Lawvere Theories (1963)

(don't see any _ for existance, $eid representing spacetime coordinates or even basic semiotics like using @ as a pragmatic force? ;))"}

```

```
