---
prompt: todo
permalink: skogai/todo/prompts/todo
---

[$prompt:todo]

# TODO

Todo items in SkogAI follow a simple, tag-based syntax for easy parsing and organization:

```
[!@todo:description]
[!@todo:subcategory:description]
```

## Basic Usage

Each todo item appears on its own line with the following structure:

- `[!@todo:` - Opening tag that identifies a todo item
- `description]` - Description of the task to complete
- Optional `subcategory:` between the opening and description for better organization

## Examples

```
[!@todo:Add documentation for the coder tool]
[!@todo:ui:Improve display of function call results]
[!@todo:security:Implement rate limiting for API requests]
[!@todo:Refactor argc-tool script to improve error handling]
[!@todo:docs:Create guides for all available tools]
```

[/$prompt:todo]

[$todo:items] [@todo:The llm-functions integration process] [@todo:The process of linking tools to AIChat] [@todo:Details about the argc-tool usage] [@todo:Information about the specific tools you mentioned (coder, demo, json-viewer, sql, todo)] [@todo:How exactly are these prompt files combined into a complete prompt system?] [@todo:next-session:Activate tools for SkogAI environment] [@todo:next-session:Create additional prompt files for core tools and processes] [@todo:next-session:Document llm-functions integration with AIChat] [@todo:next-session:Build a comprehensive tool documentation system] [/$todo:items]
