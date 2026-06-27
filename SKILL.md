---
name: awesome-agent-memorybase
description: Awesome Agent MemoryBase — ClaudeCode + Codex dual-agent memory bank. Project state machine tracking, 5-section Handoff protocol, archive & workflow extraction, knowledge base with auto-classification, session-log system. Triggers: "初始化记忆库"/"新建项目"/"归档项目"/"Handoff"/"记忆库状态"/"添加入知识库".
argument-hint: [action] [project-name]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob
---

# Awesome Agent MemoryBase — Dual-Agent Memory Bank

> ClaudeCode thinks + executes. Codex reviews + tests. From idea to archive, every step traceable.

This file is the **master protocol + router**. Sub-protocols live in `skills/harness-*/SKILL.md`.

---

## Agent Division (v2.0)

| ClaudeCode | Codex |
|---|---|
| Brainstorm, design, plan | Code review, find bugs, fix bugs |
| Write code, modify files, debug | Independent testing, security audit |
| Project archive, workflow extraction | Done Criteria verification |
| Knowledge base ingestion & maintenance | File migration verification |
| Generate Codex review instructions | Adversarial review |

**Core principle**: Maker and checker must be separate. ClaudeCode owns "what & how." Codex owns "is it right."

---

## Routing Table

| User Says | Invokes | Pre-condition |
|---|---|---|
| "初始化记忆库" / "init harness" | `harness-init` | None (entry point) |
| "新建项目 X" / "new project X" | `harness-new-project` | Already init'd |
| "归档项目 X" / "archive X" | `harness-archive` | Project in Review state |
| "Handoff X" / "交接 X" | `harness-handoff` | Project in progress |
| "记忆库状态" / "status" / "看板" | `harness-status` | Any time |
| "添加入知识库" / "加入知识库" | Read `08_知识库/SCHEMA.md` + ingest workflow | Memory Base exists |
| "知识库健康检查" / "knowledge base lint" | Lint rules in `08_知识库/SCHEMA.md` | Knowledge base exists |

### Codex Compatibility

Natural language triggers for Codex:
- `初始化记忆库` → `skills/harness-init/SKILL.md`
- `新建项目 X` → `skills/harness-new-project/SKILL.md`
- `归档项目 X` → `skills/harness-archive/SKILL.md`
- `Handoff X` → `skills/harness-handoff/SKILL.md`
- `记忆库状态` → `skills/harness-status/SKILL.md`

---

## Core Protocols

### Codex Handoff (5-Section Mandatory)

| # | Section | Content |
|---|---|---|
| 1 | File Whitelist | `git diff --name-only`. Codex MUST NOT explore beyond. |
| 2 | Context Kit | Change summary + callgraph + test status + known risks |
| 3 | Review Dimensions | correctness / security / race / business logic ONLY. Not style/lint/format. |
| 4 | Sub-agent Cap | Default = 3. Exceeding needs written justification. |
| 5 | Output Format | Brief <300 words + detailed analysis to project record |

### Simple Task Bypass

Skip Codex review when ALL of: 1 file + 50 lines + no new imports/dependencies. OR pure docs (.md/.txt no code). OR pure config (passed schema/lint).

ALWAYS needs Codex: auth / authorization / encryption / DB migration / payment / billing / eval / exec / subprocess / .env / secrets / CI workflow.

### Session-Log

After every code change, immediately append to `memory/session-log-YYYY-MM-DD.md`:
- `## ClaudeCode:` block — what changed, what files, verification results
- `## Codex:` block — review findings, test results
- Facts only. What changed, what passed, what's next. Why goes to project records.

### Knowledge Base Ingest

When user says "添加入知识库":
1. Read `08_知识库/SCHEMA.md` for the operation protocol
2. Two-step CoT: Analyze (domain, entities, concepts, claims, relationships) → Generate (pages, update index.md, append log.md)
3. Auto-classify into correct domain via decision tree
4. Quality: plain language + analogies (easy to understand). Exhaustive extraction + source preservation + contradiction marking (no key knowledge loss).

### Darwin Ratchet

Every harness-rules file ends with a Ratchet footer. Each modification must be better than or equal to the previous version. Degradation is forbidden.

---

## Three Iron Rules

1. **Authenticity**: Never fabricate completed tasks, test results, or file paths. Mark uncertain as "unconfirmed."
2. **No overwrite without backup**: Workflows and tech stacks are append-only. Deletion requires user confirmation.
3. **Mark uncertainty**: "Unconfirmed" is better than fabrication.

---

## Project State Machine

```
Idea -> Spec -> Task Plan -> Execution -> Test -> Review -> Archive -> Workflow Extraction
```

No skipping states. Codex primarily in Execution/Test/Review/Archive. ClaudeCode owns front and end.

---

## Directory Structure

```
Memory Base/
├── 00_总索引/          Rules, Skill Index, Agent roles
├── 01_项目记录/        Projects by category (webapp/app/skills/media/other)
├── 02_工作流沉淀/      Reusable workflows by domain
├── 03_Skill产物/       Skill outputs
├── 04_归档项目/        Completed projects with summaries
├── 06_评估与优化/      Agent quality evaluation
├── 07_模板库/          Standardized templates
├── 08_知识库/          Knowledge base with auto-classification
└── memory/             Session-logs, preferences, rules
```

---

## Installation

```bash
git clone https://github.com/ietigerjue/awesome-agent-memorybase.git
cd awesome-agent-memorybase
bash install.sh          # Claude Code only
bash install.sh --all    # Claude Code + Codex
```

After install, open ClaudeCode/Codex in any directory and say "初始化记忆库" to begin.
