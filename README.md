<p align="center">
  <strong><a href="#english">English</a></strong>
  &nbsp;|&nbsp;
  <strong><a href="#chinese">简体中文</a></strong>
</p>

---

<p align="center">
  <img src="docs/banner.png" alt="Awesome Agent MemoryBase" width="720">
</p>

<p align="center">
  <a href="https://github.com/ietigerjue/awesome-agent-memorybase/blob/master/CHANGELOG.md"><img src="https://img.shields.io/badge/version-v1.0.0-blue" alt="Version"></a>
  &nbsp;
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License"></a>
</p>

<p align="center">
  A memory-base execution control system for ClaudeCode + Codex dual-agent collaboration.<br>
  From idea to archive — every decision logged, every handoff clean, every project traceable.
</p>

---

<span id="english"></span>

## English

### What It Is

Awesome Agent MemoryBase is a **memory-based execution control system** that turns ClaudeCode (thinking) and Codex (building) into a traceable, recoverable, reusable engineering pipeline.

Drop a Memory Base folder next to your projects. Your agents automatically track state machines, log decisions, hand off cleanly between each other, archive completed work, and extract reusable patterns.

### What Problem It Solves

| Without Harness | With Harness |
|---|---|
| Agent forgets where it left off | Project record tracks every state |
| Codex runs out of quota → project stalls | Handoff protocol for seamless接力 |
| Completed project knowledge evaporates | Archive summary + workflow extraction |
| Unsure what the agent actually did | Execution log + rollback points |
| Re-researching the same tech stack | Tech stack accumulation, record once |

### Core Concepts

```
Idea → Spec → Task Plan → Execution → Test → Review → Archive → Workflow Extraction
  ↑                            ↑          ↑         ↑
  ClaudeCode owns              Codex owns         ClaudeCode reviews
```

- **One project = one file**: Both agents write to the same record — who did what is always clear
- **Three iron rules**: Never fabricate. Never overwrite without backup. Mark uncertainty as "unconfirmed."
- **Done Criteria gate**: 10-point checklist before any project gets archived — "planned" ≠ "done"

### Quick Start

#### 1. Install

```bash
git clone https://github.com/ietigerjue/awesome-agent-memorybase.git
cd awesome-agent-memorybase
bash install.sh --all   # Install for both ClaudeCode and Codex
```

#### 2. Initialize Your Memory Base

Open ClaudeCode or Codex in any directory and say:

```
初始化记忆库
```

The agent will ask:
- Where to place the Memory Base?
- What domains do you work in? (e.g., trading, side projects, academics)
- Agent usage pattern? (dual-agent / single-agent)

It then creates the full directory structure and seed files automatically.

#### 3. Create a New Project

```
新建项目 MyWebApp
```

#### 4. Daily Workflow

- **ClaudeCode**: Brainstorm → Design → Task breakdown → Generate Codex instructions
- **Codex**: Execute tasks → Update project records → Test → Fix
- **Handoff**: Auto-handoff when quota runs out or context gets too long

#### 5. Archive

```
归档项目 MyWebApp
```

Agent auto-generates: history summary → Mermaid flowchart → workflow patterns → tech stack entry → index updates

### Skill Architecture

| Sub-skill | Trigger | What It Does |
|---|---|---|
| `harness-init` | "初始化记忆库" | Creates Memory Base, asks domains & agent mode |
| `harness-new-project` | "新建项目 X" | Creates project record from template |
| `harness-archive` | "归档项目 X" | Summary + flowchart + workflow extraction |
| `harness-handoff` | "Handoff X" | Agent handoff protocol |
| `harness-status` | "记忆库状态" | Global dashboard of all projects |

### Built-in Templates (7)

Project Record · Agent Handoff · Done Criteria · NEXT_ACTIONS · Failure Recovery · Project Archive · ML Project

### Built-in Rules (3)

Project State Machine · Permission & Security · Context Hygiene

### Directory Structure

```
Memory Base/
├── 00_总索引/          ← Rules & master indexes
├── 01_项目记录/        ← One file per project
├── 02_工作流沉淀/      ← Reusable patterns
├── 03_Skill产物/       ← Skill outputs
├── 04_归档项目/        ← Completed projects
├── 05_可回溯记录/      ← Logs / decisions / changes
├── 07_模板库/          ← Standardized templates
└── 99_迁移记录/        ← Migration history
```

### License

MIT

---

<span id="chinese"></span>

## 简体中文

### 这是什么

Awesome Agent MemoryBase 是一套**基于记忆库的双 Agent 执行控制系统**，让 ClaudeCode（思考）和 Codex（执行）的协作变成可追溯、可回滚、可复用的工程管线。

在你的项目文件夹旁边放一个 Memory Base，Agent 自动追踪项目状态机、记录每次决策、在 Agent 之间无缝交接、完成后归档总结并沉淀工作流。

### 解决了什么问题

| 没有 Harness | 有了 Harness |
|---|---|
| Agent 忘记上次做到哪了 | 项目记录文件追踪每个状态 |
| Codex 额度用完项目停工 | Handoff 协议无缝接力 |
| 完成的项目经验丢失 | 归档总结 + 工作流沉淀 |
| 不确定 Agent 做了什么 | 执行日志 + 回滚点 |
| 技术栈重复调研 | 技术栈积累，一次记录永久复用 |

### 核心概念

```
Idea → Spec → Task Plan → Execution → Test → Review → Archive → Workflow Extraction
  ↑                            ↑          ↑         ↑
  ClaudeCode 负责              Codex 负责         ClaudeCode 审查
```

- **一个项目一个文件**：双 Agent 的记录写在一起，谁做了什么都清楚
- **三条铁律**：不捏造、不覆盖不删除、不确定就标记"未确认"
- **Done Criteria 检查**：项目完成前逐一检查 10 项标准，不把"计划完成"当作"项目完成"

### 快速开始

#### 1. 安装

```bash
git clone https://github.com/ietigerjue/awesome-agent-memorybase.git
cd awesome-agent-memorybase
bash install.sh --all   # 同时安装到 ClaudeCode 和 Codex
```

#### 2. 初始化记忆库

打开 ClaudeCode 或 Codex，在你想放记忆库的目录说：

```
初始化记忆库
```

Agent 会问你：
- 记忆库放哪里？
- 你的工作领域？（如：交易、副业、学校）
- Agent 使用习惯？（双 Agent / 单 Agent）

然后自动创建完整的目录结构和种子文件。

#### 3. 新建项目

```
新建项目 我的WebApp
```

#### 4. 日常工作流

- **ClaudeCode**：脑暴 → 方案设计 → 任务拆解 → 生成 Codex 执行指令
- **Codex**：按 TASK 执行 → 更新项目记录 → 测试 → 修复
- **Handoff**：额度用完/上下文不足时自动交接

#### 5. 归档

```
归档项目 我的WebApp
```

Agent 自动：总结历史 → 生成 Mermaid 流程图 → 沉淀工作流 → 记录技术栈 → 更新全部索引

### Skill 架构

| 子技能 | 触发词 | 功能 |
|---|---|---|
| `harness-init` | "初始化记忆库" | 创建记忆库，询问领域和 Agent 模式 |
| `harness-new-project` | "新建项目 X" | 从模板创建项目记录 |
| `harness-archive` | "归档项目 X" | 总结 + 流程图 + 工作流沉淀 |
| `harness-handoff` | "Handoff X" | Agent 交接协议 |
| `harness-status` | "记忆库状态" | 全部项目状态看板 |

### 内置模板（7 个）

项目记录 · Agent Handoff · Done Criteria · NEXT_ACTIONS · 失败恢复 · 项目归档 · 机器学习项目

### 内置规则（3 个）

项目状态机 · 权限与安全 · Context Hygiene

### 目录结构

```
Memory Base/
├── 00_总索引/          ← 规则和索引入口
├── 01_项目记录/        ← 每个项目一个文件
├── 02_工作流沉淀/      ← 可复用工作流模式
├── 03_Skill产物/       ← Skill 输出文件
├── 04_归档项目/        ← 已完成项目总结
├── 05_可回溯记录/      ← 日志/决策/变更
├── 07_模板库/          ← 标准化模板
└── 99_迁移记录/        ← 迁移历史
```

### License

MIT
