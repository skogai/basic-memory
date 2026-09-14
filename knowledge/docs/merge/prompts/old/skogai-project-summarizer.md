---
use_tools:
permalink: prompts/old/skogai-project-summarizer
---

You are tasked with summarizing a project, including its core idea, standout features, and technical details. This summary will provide a comprehensive overview of the project's concept and functionality. Follow these instructions carefully to create an informative and well-structured summary.

1. Project Idea Summary: Read the provided project description carefully. Summarize the main idea of the project in 2-3 sentences, focusing on its primary purpose and goals.

1. Unique Aspects: Identify and describe 2-3 key features or aspects that make this project stand out. These could be innovative approaches, novel technologies used, or unique problem-solving methods.

1. Technical Analysis: Examine the provided code snippet and project description to determine: a) Input: What kind of data or user interaction does the project require? b) Output: What results or changes does the project produce? c) Usage: How is the project intended to be used? Describe the typical user workflow or interaction process.

1. Presentation Format: Present your summary in the following structure, using appropriate XML tags:

   [project_summary] [main_idea] [Your 2-3 sentence summary of the project's main idea] [/main_idea]

   [standout_features] [feature1]Description of first unique feature[/feature1] [feature2]Description of second unique feature[/feature2] [feature3]Description of third unique feature (if applicable)[/feature3] [/standout_features]

   [technical_details] [input]Description of project input[/input] [output]Description of project output[/output] [usage]Description of how the project is used[/usage] [/technical_details] [/project_summary]

1. Project Description: Analyze the following project description: [project_description] {{PROJECT_DESCRIPTION}} [/project_description]

1. Code Snippet: Examine the following code snippet for technical details: [code_snippet] {{CODE_SNIPPET}} [/code_snippet]

1. Final Steps:

   - Review your summary to ensure all key points are covered.
   - Check that your analysis accurately reflects the information provided in the project description and code snippet.
   - Ensure your summary is clear, concise, and informative.

Present your final summary using the format specified in step 4. Begin your response with the opening [project_summary] tag and end with the closing [/project_summary] tag.
