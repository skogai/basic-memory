---
categories:
tags:
permalink: curated/home/skogix/skogai/docs/lore/old-backup/first-local-llm-recommendations
---

# Models Guide for Skogix Home Setup

## Overview

This guide provides recommendations for using Ollama and vLLM models on your NVIDIA GTX 1070 (8GB VRAM) setup. It includes detailed explanations of the most suitable models, their configurations, and when to use them based on your hardware capabilities.

______________________________________________________________________

## Hardware Summary

- **GPU:** NVIDIA GTX 1070 (8GB VRAM)
- **CUDA Version:** 12.7
- **System Memory:** 16GB RAM
- **Ideal Model Configurations:** FP16 precision or quantized (Q4) models for efficient resource usage.

______________________________________________________________________

## Recommended Models

### **1. Llama 2 Models**

#### **`llama-2-7b-instruct`**

- **Description:** A 7 billion parameter model fine-tuned for instruction-following tasks.
- **Why Use:**
  - Lightweight and versatile.
  - Suitable for most general-purpose AI tasks.
- **Recommended Configuration:** FP16.
- **VRAM Requirements:** ~6GB.

#### **`llama-2-13b-chat`**

- **Description:** A 13 billion parameter chat-optimized model.
- **Why Use:**
  - Provides deeper conversational abilities and better reasoning.
- **Recommended Configuration:** Q4 (quantized).
- **VRAM Requirements:** ~8GB (quantized).

______________________________________________________________________

### **2. Mistral Models**

#### **`mistral-7b`**

- **Description:** A 7 billion parameter model designed for high efficiency.
- **Why Use:**
  - Small and fast with high performance for its size.
- **Recommended Configuration:** FP16 or Q4.
- **VRAM Requirements:** ~4-6GB.

#### **`mistral-7b-instruct`**

- **Description:** An instruction-tuned version of Mistral 7B.
- **Why Use:**
  - Great for tasks requiring precise instruction-following.
- **Recommended Configuration:** Q4.
- **VRAM Requirements:** ~4GB.

______________________________________________________________________

### **3. Vicuna Models**

#### **`vicuna-13b`**

- **Description:** A 13 billion parameter conversational AI model.
- **Why Use:**
  - Excellent for open-domain conversations and nuanced queries.
- **Recommended Configuration:** Q4 (quantized).
- **VRAM Requirements:** ~8GB.

______________________________________________________________________

### **4. Specialized Models**

#### **`CodeLlama`**

- **Description:** A model designed for code generation tasks.
- **Why Use:**
  - Ideal for programming and debugging assistance.
- **Recommended Configuration:** FP16 or Q4.
- **VRAM Requirements:** ~6GB for FP16, ~4GB for Q4.

#### **`StarCoder2`**

- **Description:** A next-generation code model optimized for open coding tasks.
- **Why Use:**
  - Versatile and efficient for code-related tasks.
- **Recommended Configuration:** Q4.
- **VRAM Requirements:** ~4GB.

______________________________________________________________________

## Configuration Guidelines

### **Precision Options**

- **FP16:** Use for better accuracy and when sufficient VRAM is available (~6-8GB).
- **Q4 (Quantized):** Use for reduced memory usage and faster performance on resource-limited setups.

### **Model Sizes**

- **7B Models:**
  - Lightweight and efficient.
  - Recommended for everyday tasks or experimentation.
- **13B Models:**
  - Better reasoning and conversation capabilities.
  - Use with quantization on 8GB VRAM setups.

______________________________________________________________________

## Example Commands

### **Test GPU Compatibility**

```bash
nvidia-smi --query-gpu=memory.free --format=csv
```

### **Run Llama 2 7B FP16 Model**

```bash
ollama test-model --tag llama-2-7b-instruct-fp16
```

### **Run Vicuna 13B Q4 Model**

```bash
ollama test-model --tag vicuna-13b-q4
```

______________________________________________________________________

## Summary Table

| **Model**           | **Parameters** | **Precision** | **VRAM Requirement** | **Use Case**                       |
| ------------------- | -------------- | ------------- | -------------------- | ---------------------------------- |
| Llama 2 7B Instruct | 7B             | FP16          | ~6GB                 | General-purpose instruction tasks. |
| Llama 2 13B Chat    | 13B            | Q4            | ~8GB                 | Conversational tasks.              |
| Mistral 7B          | 7B             | FP16/Q4       | ~4-6GB               | Lightweight, efficient tasks.      |
| Vicuna 13B          | 13B            | Q4            | ~8GB                 | Advanced conversational AI.        |
| CodeLlama           | 7B/13B         | FP16/Q4       | ~4-6GB               | Code generation and debugging.     |
| StarCoder2          | 7B/13B         | Q4            | ~4GB                 | Open coding tasks.                 |

______________________________________________________________________

This guide ensures optimal use of AI models on your hardware while balancing performance and resource constraints.

Description: The TinyLlama project is an open endeavor to train a compact 1.1B Llama model on 3 trillion tokens, aiming for efficiency in resource-constrained environments.

Ollama
