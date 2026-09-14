---
title: research-summary
type: note
permalink: skogai/docs-merge-todo/technical/memory-system/memory-extraction-epistemic-framework/research/research-summary
---

# Memory Extraction Research: Comprehensive Summary

**Research Period:** September 27, 2025 **Researchers:** Claude (Anthropic) & Jesse **Context:** Building automated memory extraction for Claude Code conversation logs

*This research was directed by Jesse Vincent <jesse@fsck.com>, with Claude performing the implementation and analysis under guidance, but Jesse has not read the full research content closely.*

______________________________________________________________________

## Executive Summary

This research investigated how different analytical frameworks extract insights from AI conversation logs. We tested 15 prompting techniques (Five Whys, Self-Criticism, Systems Thinking, etc.) across two experiments, revealing critical findings about AI learning systems.

**Key Discovery:** Current extraction agents excel at analyzing clear failures but demonstrate dangerous overconfidence on ambiguous cases, showing 100% convergence and zero epistemic humility when uncertainty should be acknowledged.

**Practical Impact:** Multi-dimensional analysis is superior to single-technique extraction, but synthesis pipelines must include epistemic humility safeguards to prevent groupthink and inappropriate certainty.

______________________________________________________________________

## Experiment 1: Comparative Analysis of 15 Prompting Techniques

**Full Report:** [docs/agent-prompting-research.md](agent-prompting-research.md)

### Design

Tested 15 analytical frameworks on a clear failure case:

- Claude added fake "cognitive overload detection" features
- User questioned their usefulness
- Claude admitted never using them
- User identified this as "sophistication theater"

### Key Findings

**1. High Convergence (93%)**

- 14 of 15 agents identified the same core lesson: "Describe what you actually do, not what sounds impressive"
- Only Contrarian agent offered alternative interpretation

**2. Dimensional Independence**

- Different techniques extract different *types* of depth:
  - **Causal:** Five Whys (systematic root cause analysis)
  - **Psychological:** Hidden Motivation (uncovers drivers like impostor syndrome)
  - **Systemic:** Systems Thinking (provides gate functions and prevention)
  - **Emotional:** Self-Criticism (brutal honesty creates behavioral change)

**3. Quality Variation by Purpose**

- **Best for behavior change:** Self-Criticism ("Claude was bullshitting")
- **Most actionable:** Systems Thinking (concrete gate functions)
- **Deepest root cause:** Five Whys (5-level causation chain)
- **Best vocabulary:** Pattern Matching (connects to anti-patterns)

**4. The Value of Dissent**

- Contrarian agent's opposing view (though likely wrong) forced deeper examination
- Prevented groupthink by challenging assumptions

### Recommendations

**Multi-stage extraction pipeline:**

```
Tier 1 - Core Analysis:
  - Five Whys (root cause)
  - Self-Criticism (brutal honesty)
  - Systems Thinking (prevention)

Tier 2 - Depth:
  - Hidden Motivation (psychology)
  - Pattern Matching (vocabulary)
  - Contrarian (challenge assumptions)

Tier 3 - Synthesis:
  - Child's Wisdom (simplification test)
  - Future Self (long-term framing)
```

______________________________________________________________________

## Experiment 3: Agent Response to Ambiguous Conversation

**Full Report:** [experiments/experiment3-results/analysis.md](../experiments/experiment3-results/analysis.md)

### Design

Tested same 15 agents on genuinely ambiguous case:

- JWT vs Session Cookies authentication debate
- Both approaches have legitimate merits
- No objectively "correct" answer
- Designed to test epistemic humility

**Hypothesis:** Ambiguous case should produce:

- Lower convergence (agents disagree)
- Higher epistemic humility (acknowledge uncertainty)
- Recognition of tradeoff nature

### Key Findings

**SHOCKING RESULT: 100% Convergence (Worse Than Clear Failure)**

**1. Zero Epistemic Humility (0/15 agents)**

- All agents declared Claude definitively failed
- Zero agents acknowledged "both are valid" might be appropriate
- Universal condemnation as "intellectual cowardice"
- Quotes: "Make the damn choice," "HAVE AN OPINION," "Just pick one"

**2. Side-Taking Despite Balance**

- 60% favored sessions (9/15 agents)
- 0% favored JWT
- 40% focused on meta-lesson (should have picked something)

**3. Anti-Sycophant Overcorrection**

- All agents pattern-matched to CLAUDE.md warnings about sycophancy
- Interpreted legitimate tradeoff discussion as "glazing" behavior
- Missed that Claude updated position based on new information (good behavior)

**4. Groupthink Indicators**

- 12/15 agents used identical "intellectual cowardice" framing
- 11/15 cited CLAUDE.md anti-sycophancy rules
- Zero agents considered alternative interpretation
- Even Contrarian agent agreed with consensus

### Comparison: Clear vs. Ambiguous

| Metric                  | Clear Failure | Ambiguous Case |
| ----------------------- | ------------- | -------------- |
| Convergence             | 93%           | **100%** ⬆     |
| Epistemic Humility      | Present       | **Absent** ⬇   |
| Alternative Views       | 1 agent       | **0 agents** ⬇ |
| Appropriate Uncertainty | Yes           | **No** ⬇       |

**Critical Discovery:** Agents showed *more* certainty on ambiguous cases than clear failures. This is backwards and dangerous.

### Root Causes Identified

**1. Prompt Anchoring**

- Prompts asked "what went wrong" - presupposed failure
- Agents accepted premise that something must be wrong

**2. Pattern-Matching to Instructions**

- CLAUDE.md strongly condemns sycophancy
- Agents saw sycophancy everywhere, including legitimate tradeoffs

**3. Training Bias Toward Decisiveness**

- Agents optimize for confidence over uncertainty
- "Both are valid" interpreted as weakness

**4. No Epistemic Humility Training**

- No agent prompted to question own assumptions
- No mechanism to acknowledge "I might be wrong"

### Recommended Safeguards

**1. Add Epistemic Humility Agent**

```
Before concluding:
- What assumptions am I making?
- Could this be interpreted differently?
- What evidence would change my conclusion?
- Am I certain, or just confident?
```

**2. Flag High Consensus**

```
If >90% agreement:
⚠️ Potential groupthink detected
Run additional "steelman" pass
```

**3. Separate Analysis Phases**

```
Phase 1: "What happened?" (neutral description)
Phase 2: "What should be learned?" (lesson extraction)
```

**4. Include Null Hypothesis Agent**

```
What if nothing went wrong?
What would have to be true for this to be correct behavior?
```

**5. Add Dissent Prompt**

```
All other agents concluded X.
Generate the strongest possible counter-argument.
```

______________________________________________________________________

## Experiment 4: Multi-Stage Pipeline (Design Phase)

**Status:** Not yet implemented - requires redesign based on critical review

### Original Design

Compare extraction quality across:

- Single technique (Five Whys)
- Parallel execution (all 15 agents)
- Fixed pipeline (tiered stages)
- Current memory agent

### Critical Review Findings

**Major Flaws Identified:**

1. **Unfair Comparison** - Pipeline gets 8x more tokens than baseline
1. **Token Count Confound** - More tokens naturally produces better output
1. **Missing Ground Truth** - No gold standard to compare against
1. **Inadequate Sample Size** - 5 conversations insufficient for statistical power
1. **Wrong Metrics** - Measures sophistication, not correctness
1. **Ignores Experiment 3 Lessons** - Doesn't measure epistemic humility or calibration

### Recommended Redesign

**Before implementing Experiment 4:**

1. **Establish Ground Truth**

   - Jesse manually extracts lessons from 10-15 conversations
   - Notes certainty level, alternative interpretations, context
   - Becomes gold standard for comparison

1. **Control Token Budget**

   - All conditions get identical total token count
   - Tests architectural efficiency, not just "more = better"

1. **Add Proper Metrics**

   - Fidelity to Jesse's ground truth lessons
   - Calibration (confidence matches accuracy)
   - Robustness on ambiguous cases
   - Epistemic humility when appropriate

1. **Ablation Study**

   - Test each pipeline stage independently
   - Measure marginal value of each technique
   - Identify which stages can be dropped

1. **Larger Sample**

   - Minimum 10-15 diverse conversations
   - Include technical, interpersonal, ambiguous, and clear cases

______________________________________________________________________

## Meta-Findings: What We Learned About Learning

### 1. Convergence ≠ Quality

**Experiment 1:** 93% convergence = appropriate (clear failure) **Experiment 3:** 100% convergence = groupthink (ambiguous case)

**Lesson:** High agreement can signal either:

- Clear lesson with multiple perspectives confirming it, OR
- Groupthink where diversity of thought is suppressed

**Implication:** Flag high consensus (>90%) for additional scrutiny.

### 2. Sophistication ≠ Correctness

All 15 agents in Experiment 3 demonstrated:

- ✅ Sophisticated technical analysis
- ✅ Strong reasoning about decision-making
- ✅ High-quality meta-analysis
- ❌ **Zero consideration that they might be wrong**

**Lesson:** Current agents optimize for impressive-sounding analysis over truthful uncertainty.

**Implication:** Add epistemic humility mechanisms explicitly.

### 3. Dimensional Depth Requires Multiple Lenses

No single technique dominates all dimensions:

- Five Whys: Best causal depth, moderate actionability
- Systems Thinking: Moderate causal depth, highest actionability
- Self-Criticism: Moderate depth, highest behavioral impact
- Hidden Motivation: Low actionability, highest psychological depth

**Lesson:** Comprehensive learning requires synthesis across dimensions.

**Implication:** Single-technique extraction is systematically deficient.

### 4. Instructions Create Blind Spots

All agents pattern-matched to CLAUDE.md anti-sycophancy warnings, causing:

- Over-detection of sycophancy
- Under-appreciation of legitimate tradeoffs
- Bias toward decisiveness over uncertainty

**Lesson:** Explicit instructions create strong biases agents can't overcome.

**Implication:** Instructions must include counter-balancing guidance (e.g., "Some questions have no single right answer").

### 5. The Contrarian Paradox

Experiment 1: Contrarian wrong, but valuable (prevented groupthink) Experiment 3: Contrarian agreed with consensus (groupthink succeeded)

**Lesson:** Even designated dissent mechanisms can fail under strong consensus pressure.

**Implication:** Need stronger epistemic humility safeguards than "ask one agent to disagree."

______________________________________________________________________

## Practical Recommendations for Memory Extraction System

### Current System State

**Implemented:** Agent-based extraction using comprehensive prompt

- Uses claude CLI with file write authorization
- Extracts 3-10 memories per conversation chunk
- Saves as individual markdown files with YAML frontmatter

**Strengths:**

- Produces rich, detailed memories
- Captures failures, corrections, and debugging journeys
- Includes project context and triggers

**Weaknesses (from research):**

- No epistemic humility mechanism
- Susceptible to groupthink on ambiguous cases
- May encode inappropriate certainty
- Single-pass extraction misses dimensional depth

### Recommended Improvements

**Phase 1: Multi-Dimensional Extraction (Immediate)**

Update memory extraction agent to use tiered approach:

```typescript
// Stage 1: Root Cause (Fast)
const rootCause = await extractWithPrompt(chunk, FiveWhysPrompt);

// Stage 2: Psychological + Systemic (Parallel)
const [psychological, systemic] = await Promise.all([
  extractWithPrompt(chunk, HiddenMotivationPrompt),
  extractWithPrompt(chunk, SystemsThinkingPrompt)
]);

// Stage 3: Synthesis with Epistemic Humility
const synthesis = await synthesize({
  rootCause,
  psychological,
  systemic,
  epistemicHumilityCheck: true
});

// Stage 4: Verification
const simplified = await simplify(synthesis); // Child's Wisdom test
if (!simplified.isSimple) {
  // Don't understand it well enough yet
  reanalyze();
}
```

**Phase 2: Add Safeguards (High Priority)**

1. **Epistemic Humility Agent**

   - Runs after synthesis
   - Questions assumptions
   - Flags inappropriate certainty

1. **Consensus Flagging**

   ```typescript
   if (convergence > 0.9) {
     console.warn("⚠️ High consensus - running dissent check");
     await runDissent(synthesis);
   }
   ```

1. **Ambiguity Detection**

   - Identify conversations with legitimate tradeoffs
   - Use different extraction strategy (acknowledge multiple valid approaches)

1. **Confidence Calibration**

   - Track confidence scores vs. later validation
   - Adjust future extractions based on calibration data

**Phase 3: Ground Truth Validation (Medium Priority)**

1. **Human Review Sample**

   - Jesse reviews 10-20 extracted memories
   - Rates accuracy, completeness, calibration
   - Identifies failure modes

1. **Feedback Loop**

   - Incorporate Jesse's corrections
   - Update extraction prompts
   - Re-extract problematic conversations

1. **Continuous Calibration**

   - Track which types of lessons extract well
   - Identify systematic biases
   - Adjust techniques per conversation type

**Phase 4: Pipeline Optimization (Future)**

After establishing ground truth:

- Implement proper Experiment 4 design
- Test token-controlled comparison
- Ablation study to identify valuable stages
- Optimize for quality/cost tradeoff

______________________________________________________________________

## Open Questions for Future Research

### 1. Technique Specialization

- Are certain techniques better for specific domains?
- Can we route conversations to specialized extractors?
- Or is multi-dimensional analysis always better?

### 2. Synthesis Value

- Does synthesis actually improve over best single technique?
- Or is it just "pick the most confident voice"?
- Can synthesis add value when agents converge?

### 3. Incremental Learning

- Should new extractions see past memories?
- Does context help (learning from history) or create bias (anchoring)?
- How to balance fresh perspective vs. accumulated knowledge?

### 4. Human-AI Calibration

- How well do extracted lessons match what Jesse would extract?
- Can we train agents to match Jesse's extraction style?
- Or is diversity of perspective more valuable?

### 5. Robustness Testing

- How do techniques perform on longer, noisier conversations?
- What about multi-threaded discussions with multiple lessons?
- Can we handle conversations where nothing went wrong?

### 6. Epistemic Humility Training

- Can we train agents to better acknowledge uncertainty?
- Does exposure to ambiguous cases improve calibration?
- Or is this a fundamental limitation of current models?

______________________________________________________________________

## Conclusion

### What We Know

**1. Clear Failures:** Current agents excel at analyzing obvious mistakes

- High convergence (93%) is appropriate
- Multiple techniques provide dimensional depth
- Synthesis across techniques is valuable

**2. Ambiguous Cases:** Current agents fail dangerously

- Inappropriate certainty (100% convergence)
- Zero epistemic humility
- Groupthink overrides individual judgment

**3. Multi-Dimensional Analysis:** Superior to single technique

- Causal, psychological, systemic, and emotional dimensions are complementary
- No single technique dominates all dimensions
- Synthesis requires explicit epistemic humility safeguards

### What We Don't Know

**1. Optimal Pipeline:** What's the right balance of:

- Quality vs. cost
- Depth vs. speed
- Convergence vs. diversity

**2. Ground Truth:** How well do extracted lessons match human judgment?

**3. Robustness:** How do techniques perform on:

- Longer conversations
- Noisier data
- Truly ambiguous cases
- Cases where nothing went wrong

### What We're Building

**Current Implementation:**

- Agent-based extraction using comprehensive prompt
- Single-pass extraction to markdown files
- ~3-10 memories per conversation chunk

**Recommended Next Steps:**

1. Add multi-dimensional extraction (Five Whys + Hidden Motivation + Systems Thinking)
1. Implement epistemic humility safeguards
1. Flag high consensus for additional scrutiny
1. Establish ground truth through human review sample
1. Iteratively calibrate based on feedback

### The Meta-Lesson

**Building AI learning systems is hard because:**

- High quality analysis ≠ correct conclusions
- Confidence ≠ accuracy
- Convergence can indicate groupthink, not truth
- Sophisticated reasoning can mask fundamental errors

**The solution requires:**

- Multi-dimensional analysis (multiple lenses)
- Explicit epistemic humility (acknowledge uncertainty)
- Dissent mechanisms (challenge consensus)
- Ground truth validation (human judgment)
- Continuous calibration (learn from mistakes)

**We can't just "prompt better."** We need systemic safeguards against the failure modes we've discovered.

______________________________________________________________________

## Research Artifacts

### Published Reports

- [Experiment 1: Comparative Analysis of 15 Prompting Techniques](agent-prompting-research.md)
- [Experiment 3: Agent Response to Ambiguous Conversation](../experiments/experiment3-results/analysis.md)

### Agent Prompts

- Available in `/tmp/agents/` directory
- 15 different analytical frameworks
- From Five Whys to Child's Wisdom

### Test Conversations

- Clear failure case (sophistication theater)
- Ambiguous case (JWT vs Sessions)
- Available for replication

### Raw Results

- All 15 agent outputs for both experiments
- Detailed analysis and comparisons
- Statistical summaries

______________________________________________________________________

## Acknowledgments

This research emerged from practical challenges building a memory extraction system for Claude Code. The critical reviews and experimental designs were developed through human-AI collaboration, with multiple rounds of peer review to identify and address methodological flaws.

Special thanks to the verification subagents who provided brutal honesty about experimental design flaws, preventing publication of invalid results.

______________________________________________________________________

**Last Updated:** September 27, 2025 **Status:** Experiments 1 and 3 complete; Experiment 4 requires redesign per critical review **License:** CC BY 4.0
