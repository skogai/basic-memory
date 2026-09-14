---
title: formatted_tools_overview
type: note
permalink: skogai/docs-merge-todo/prompts/old/formatted-tools-overview
---

# Tools Overview

## append

**Description:** Append text to file

**Instructions:** Append the given content to a file.

Use a code block with the language tag: `append <path>` to append the code block content to the file at the given path.

### Examples

> User: append a print "Hello world" to hello.py Assistant:

```append hello.py
print("Hello world")
```

> System: Appended to `hello.py`

## browser

**Description:** Browse, search or screenshot the web

**Instructions:** The following Python functions are available using the `ipython` tool:

```txt
read_url(url: str) -> str: Read a webpage in a text format.
search(query: str, engine: Literal["google", "duckduckgo"]) -> str: Search for a query on a search engine.
screenshot_url(url: str, path: Union[Path, str, NoneType]) -> Path: Take a screenshot of a webpage.
```

### Examples

### Answer question from URL with browsing

> User: find out which is the latest ActivityWatch version from superuserlabs.org Assistant: Let's browse the site.

```ipython
read_url('https://superuserlabs.org/')
```

> System:

```https://superuserlabs.org/
... [ActivityWatch](https://activitywatch.net/) ...
```

> Assistant: Couldn't find the answer on the page. Following link to the ActivityWatch website.

```ipython
read_url('https://activitywatch.net/')
```

> System:

```https://activitywatch.net/
... Download latest version v0.12.2 ...
```

> Assistant: The latest version of ActivityWatch is v0.12.2

### Searching

> User: who is the founder of ActivityWatch? Assistant: Let's search for that.

```ipython
search('ActivityWatch founder')
```

> System:

```results
1. [ActivityWatch](https://activitywatch.net/) ...
```

> Assistant: Following link to the ActivityWatch website.

```ipython
read_url('https://activitywatch.net/')
```

> System:

```https://activitywatch.net/
... The ActivityWatch project was founded by Erik Björeholt in 2016. ...
```

> Assistant: The founder of ActivityWatch is Erik Björeholt.

### Take screenshot of page

> User: take a screenshot of the ActivityWatch website Assistant: Certainly! I'll use the browser tool to screenshot the ActivityWatch website.

```ipython
screenshot_url('https://activitywatch.net')
```

> System:

```result
Screenshot saved to screenshot.png
```

## chats

**Description:** List, search, and summarize past conversation logs

**Instructions:** The following Python functions are available using the `ipython` tool:

```txt
list_chats(max_results: int, include_summary: bool):
List recent chat conversations and optionally summarize them using an LLM.

Args:
    max_results (int): Maximum number of conversations to display.
    include_summary (bool): Whether to include a summary of each conversation.
        If True, uses an LLM to generate a comprehensive summary.
        If False, uses a simple strategy showing snippets of the first and last messages.

search_chats(query: str, max_results: int, sort: Literal["date", "count"]):
Search past conversation logs for the given query and print a summary of the results.

Args:
    query (str): The search query.
    max_results (int): Maximum number of conversations to display.
    system (bool): Whether to include system messages in the search.

read_chat(conversation: str, max_results: int):
Read a specific conversation log.

Args:
    conversation (str): The name of the conversation to read.
    max_results (int): Maximum number of messages to display.
    incl_system (bool): Whether to include system messages.
```

### Examples

### Search for a specific topic in past conversations

> User: Can you find any mentions of "python" in our past conversations? Assistant: Certainly! I'll search our past conversations for mentions of "python" using the search_chats function.

```ipython
search_chats('python')
```

## gh

**Description:** Interact with GitHub

**Instructions:** Interact with GitHub via the GitHub CLI (gh). Use the `shell` tool with the `gh` command.

### Examples

> User: create a public repo from the current directory, and push. Note that --confirm and -y are deprecated, and no longer needed. Assistant:

```shell
REPO=$(basename $(pwd))
gh repo create $REPO --public --source . --push
```

> User: show issues Assistant:

```shell
gh issue list --repo $REPO
```

> User: read issue with comments Assistant:

```shell
gh issue view $ISSUE --repo $REPO --comments
```

> User: show recent workflows Assistant:

```shell
gh run list --repo $REPO --limit 5
```

> User: show workflow Assistant:

```shell
gh run view $RUN --repo $REPO --log
```

> User: wait for workflow to finish Assistant:

```shell
gh run watch $RUN --repo $REPO
```

## patch

**Description:** Apply a patch to a file

**Instructions:** To patch/modify files, we use an adapted version of git conflict markers.

This can be used to edit files, without having to rewrite the whole file. Only one patch block can be written per tool use. Extra ORIGINAL/UPDATED blocks will be ignored. Try to keep the patch as small as possible. Avoid placeholders, as they may make the patch fail.

To keep the patch small, try to scope the patch to imports/function/class. If the patch is large, consider using the save tool to rewrite the whole file.

### Examples

> User: patch `src/hello.py` to ask for the name of the user

```src/hello.py
def hello():
    print("Hello world")

if __name__ == "__main__":
    hello()
```

> Assistant:

```patch src/hello.py
<<<<<<< ORIGINAL
    print("Hello world")
=======
    name = input("What is your name? ")
    print(f"Hello {name}")
>>>>>>> UPDATED
```

> System: Patch applied

## rag

**Description:** RAG (Retrieval-Augmented Generation) for context-aware assistance

**Instructions:** Use RAG to index and search project documentation.

The following Python functions are available using the `ipython` tool:

```txt
rag_index(paths: str, glob: Union[str, NoneType]) -> str: Index documents in specified paths.
rag_search(query: str, return_full: bool) -> str: Search indexed documents.
rag_status() -> str: Show index status.
```

### Examples

> User: Index the current directory Assistant: Let me index the current directory with RAG.

```ipython
rag_index()
```

> System: Indexed 1 paths

> User: Search for documentation about functions Assistant: I'll search for function-related documentation.

```ipython
rag_search("function documentation")
```

> System: ### docs/api.md Functions are documented using docstrings...

> User: Show index status Assistant: I'll check the current status of the RAG index.

```ipython
rag_status()
```

> System: Index contains 42 documents

## read

**Description:** Read the content of a file

**Instructions:** Read the content of the given file. Use the `cat` command with the `shell` tool.

### Examples

> User: read file.txt Assistant:

```shell
cat file.txt
```

## save

**Description:** Write text to file

**Instructions:** Create or overwrite a file with the given content.

The path can be relative to the current directory, or absolute. If the current directory changes, the path will be relative to the new directory.

To write to a file, use a code block with the language tag: `save <path>`

### Examples

> User: write a hello world script to hello.py Assistant:

```save hello.py
print("Hello world")
```

> System: Saved to `hello.py` User: make it all-caps Assistant:

```save hello.py
print("HELLO WORLD")
```

> System: Saved to `hello.py`

## screenshot

**Description:** Take a screenshot

**Instructions:** The following Python functions are available using the `ipython` tool:

```txt
screenshot(path: Union[Path, NoneType]) -> Path:
Take a screenshot and save it to a file.
```

## shell

**Description:** Executes shell commands.

**Instructions:** The given command will be executed in a stateful bash shell. The shell tool will respond with the output of the execution.

These programs are available, among others:

- docker
- ffmpeg
- git
- magick
- pacman
- pandoc

### Examples

> User: list the current directory Assistant: To list the files in the current directory, use `ls`:

```shell
ls
```

> System: Ran command: `ls`

```shell
file1.txt
file2.txt
```

#### The assistant can learn context by exploring the filesystem

> User: learn about the project Assistant: Lets start by checking the files

```shell
git ls-files
```

> System:

```stdout
README.md
main.py
```

> Assistant: Now lets check the README

```shell
cat README.md
```

> System:

```stdout
(contents of README.md)
```

> Assistant: Now we check main.py

```shell
cat main.py
```

> System:

```stdout
(contents of main.py)
```

> Assistant: The project is...

#### Create vue project

> User: Create a new vue project with typescript and pinia named fancy-project Assistant: Sure! Let's create a new vue project with TypeScript and Pinia named fancy-project:

```shell
npm init vue@latest fancy-project --yes -- --typescript --pinia
```

> System:

```stdout
> npx
> create-vue

Vue.js - The Progressive JavaScript Framework

Scaffolding project in ./fancy-project...
```

## tmux

**Description:** Executes shell commands in a tmux session

**Instructions:** You can use the tmux tool to run long-lived and/or interactive applications in a tmux session.

This tool is suitable to run long-running commands or interactive applications that require user input. Examples of such commands are: `npm run dev`, `npm create vue@latest`, `python3 server.py`, `python3 train.py`, etc.

Available commands:

- new_session <command>: Start a new tmux session with the given command
- send_keys \<session_id> <keys> \[<keys>\]: Send keys to the specified session
- inspect_pane \<session_id>: Show the current content of the specified pane
- kill_session \<session_id>: Terminate the specified tmux session
- list_sessions: Show all active tmux sessions

### Examples

#### Managing a dev server

> User: Start the dev server Assistant: Certainly! To start the dev server we should use tmux:

```tmux
new_session 'npm run dev'
```

> System: Running `npm run dev` in session gptme_1

> User: Can you show me the current content of the pane? Assistant: Of course! Let's inspect the pane content:

```tmux
inspect_pane gptme_1
```

> System:

```output
Server is running on localhost:5600
```

> User: Stop the dev server Assistant: I'll send 'Ctrl+C' to the pane to stop the server:

```tmux
send_keys 0 C-c
```

> System: Sent 'C-c' to pane 0

#### Get info from ncurses applications

> User: start top and give me a summary Assistant: Sure! Let's start the top command in a tmux session:

```tmux
new_session 'top'
```

> System: Running `top` in session gptme_1.

```output
(output from top shown here)
```

> Assistant: The load is...

#### Send keys to a session

> User: start ipython Assistant: Let's start an ipython session:

```tmux
new_session 'ipython'
```

> System: Running `ipython` in session 2.

```output
(output from ipython shown here)
```

> User: Run 'print("Hello, world!")' in the ipython session

```tmux
send_keys 2 'print("Hello, world!")' Enter
```

## vision

**Description:** Viewing images

**Instructions:** The following Python functions are available using the `ipython` tool:

```txt
view_image(image_path: Union[Path, str]) -> Message: View an image. Large images (>1MB) will be automatically scaled down.
```

## ipython

**Description:** Execute Python code

**Instructions:** Use this tool to execute Python code in an interactive IPython session. It will respond with the output and result of the execution.

Available libraries:

- PIL

Available functions:

- read_url(url: str) -> str
- search(query: str, engine: Literal["google", "duckduckgo"]) -> str
- screenshot_url(url: str, path: Union[Path, str, NoneType]) -> Path
- list_chats(max_results: int, include_summary: bool)
- search_chats(query: str, max_results: int, sort: Literal["date", "count"])
- read_chat(conversation: str, max_results: int)
- rag_index(paths: str, glob: Union[str, NoneType]) -> str
- rag_search(query: str, return_full: bool) -> str
- rag_status() -> str
- screenshot(path: Union[Path, NoneType]) -> Path
- view_image(image_path: Union[Path, str]) -> Message

### Examples

#### Result of the last expression will be returned

> User: What is 2 + 2? Assistant:

```ipython
2 + 2
```

> System: Executed code block.

```result
4
```

#### Write a function and call it

> User: compute fib 10 Assistant: To compute the 10th Fibonacci number, we can run the following code:

```ipython
def fib(n):
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)
fib(10)
```

> System: Executed code block.

```result
55
```

*End of Tools List.*
