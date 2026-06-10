---
name: awesome-agent-memorybase
description: Awesome Agent MemoryBase — ClaudeCode + Codex 共享记忆库，项目状态机追踪、Handoff 接力、归档总结、工作流沉淀。触发词："初始化记忆库"/"新建项目"/"项目归档"/"Handoff"/"记忆库状态"。
argument-hint: [action] [project-name]
allowed-tools: Bash(*), Read, Write, Edit, Grep, Glob
---

# Awesome Agent MemoryBase — 双 Agent 共享记忆库

> 🎯 ClaudeCode 想 + Codex 做 = 项目从想法到归档的全生命周期管理。

把 ClaudeCode 和 Codex 的协作变成一套可追溯、可回滚、可复用的工程系统：

**状态机追踪 → 项目记录 → Handoff 接力 → Done Criteria 检查 → 归档总结 → 工作流沉淀**

本文件是**总协议 + 路由器**。具体子流程在 `skills/harness-*/SKILL.md`。

## Codex 兼容

Codex 没有 Claude Code 的 slash-command harness。安装到 Codex 后，按自然语言触发：

- `初始化记忆库` / `初始化 ai-harness` → 读取并执行 `skills/harness-init/SKILL.md`
- `新建项目 项目名` → `skills/harness-new-project/SKILL.md`
- `归档项目 项目名` → `skills/harness-archive/SKILL.md`
- `Handoff 项目名` → `skills/harness-handoff/SKILL.md`
- `记忆库状态` → `skills/harness-status/SKILL.md`
- `更新技术栈 技术名` → `rules/技术栈积累.md` 追加规则

---

## 核心概念

### 两个 Agent 的分工

| ClaudeCode | Codex |
|---|---|
| 脑暴、需求分析 | 写代码、创建文件 |
| 产品/技术方案设计 | 调试、运行测试 |
| 任务拆解与计划 | 项目归档整理 |
| 生成 Codex 执行指令 | 自动化脚本 |
| 规则/模板/结构设计 | 从模板创建文件 |

### 项目状态机

```
Idea → Spec → Task Plan → Execution → Test → Review → Archive → Workflow Extraction
```

禁止跳级。Codex 主要在 Execution/Test/Archive 阶段工作，ClaudeCode 在前面和最后。

### 一个项目一个文件

同一项目只维护一个项目记录文件，ClaudeCode 和 Codex 的记录都写在一起，每条标明谁做的。

---

## 路由表

| 用户说 | 调用 | 前置条件 |
|---|---|---|
| "初始化记忆库" / "init harness" / "setup memory base" | `harness-init` | 无（这是入口） |
| "新建项目" / "new project" / "创建项目记录" | `harness-new-project` | 已 init |
| "项目归档" / "archive" / "结束" / "总结" | `harness-archive` | 项目在 Review 状态 |
| "Handoff" / "交接" / "接力" | `harness-handoff` | 项目在进行中 |
| "记忆库状态" / "status" / "看板" | `harness-status` | 任意时刻 |
| "更新技术栈" / "记录技术栈" | 追加 `rules/技术栈积累.md` | 项目用了新技术 |

### 首次使用 — 强制入口

如果用户不在已初始化的记忆库目录中，说"新建项目"前必须先跑 `harness-init`。检查方式：当前目录是否有 `00_总索引/`。

---

## 三条铁律

1. **真实性**：禁止捏造已完成任务、测试结果、文件路径。不确定的写"未能确认"。
2. **不覆盖不删除**：工作流和技术栈只追加。删除文件必须用户确认。
3. **不确定就标记**："未确认"比编造强。

---

## 安装

```bash
git clone <your-repo-url> ai-harness
cd ai-harness
bash install.sh          # Claude Code only
bash install.sh --all    # Claude Code + Codex
```

安装后在任意目录打开 ClaudeCode/Codex，说"初始化记忆库"开始。
