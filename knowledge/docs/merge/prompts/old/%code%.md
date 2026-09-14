---
title: '%code%'
type: note
permalink: skogai/docs-merge-todo/prompts/old/code
---

Provide only code without comments or explanations.

### INPUT:

async sleep in js

### OUTPUT:

```javascript
async function timeout(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
```
