# AI Harness — ClaudeCode + Codex 双 Agent 执行控制系统

> 把 ClaudeCode（想）和 Codex（做）的协作变成可追溯、可回滚、可复用的工程系统。

## 一句话

在你的项目文件夹旁边放一个 Memory Base，Agent 自动追踪每个项目的状态机、记录每次决策、在 Agent 之间无缝交接、完成后归档总结并沉淀工作流。

## 解决了什么问题

| 没有 Harness | 有了 Harness |
|---|---|
| Agent 忘记上次做到哪了 | 项目记录文件追踪每个状态 |
| Codex 额度用完项目停工 | Handoff 协议无缝接力 |
| 完成的项目经验丢失 | 归档总结 + 工作流沉淀 |
| 不确定 Agent 做了什么 | 执行日志 + 回滚点 |
| 技术栈重复调研 | 技术栈积累，一次记录永久复用 |

## 核心概念

```
Idea → Spec → Task Plan → Execution → Test → Review → Archive → Workflow Extraction
  ↑                            ↑          ↑         ↑
  ClaudeCode 负责              Codex 负责          ClaudeCode 审查
```

- **一个项目一个文件**：双 Agent 的记录写在一起，谁做了什么都清楚
- **三条铁律**：不捏造、不覆盖不删除、不确定就标记"未确认"
- **10 个 Done Criteria**：项目完成前逐一检查，不把"计划完成"当作"项目完成"

## 快速开始

### 1. 安装

```bash
git clone https://github.com/<your-username>/ai-harness.git
cd ai-harness
bash install.sh --all   # 同时安装到 ClaudeCode 和 Codex
```

### 2. 初始化记忆库

打开 ClaudeCode 或 Codex，在你想放记忆库的目录说：

```
初始化记忆库
```

Agent 会问你：
- 记忆库放哪里？
- 你的工作领域？（如：交易、副业、学校）
- Agent 使用习惯？（双 Agent / 单 Agent）

然后自动创建完整的目录结构和种子文件。

### 3. 新建项目

```
新建项目 我的WebApp
```

Agent 会问项目类型和领域，然后创建项目记录文件。

### 4. 日常工作流

- **ClaudeCode**：脑暴 → 方案设计 → 任务拆解 → 生成 Codex 执行指令
- **Codex**：按 TASK 执行 → 更新项目记录 → 测试 → 修复
- **Handoff**：额度用完/上下文不足时自动交接

### 5. 归档

```
归档项目 我的WebApp
```

Agent 自动：总结历史 → 生成 Mermaid 流程图 → 沉淀工作流 → 记录技术栈 → 更新全部索引

## 目录结构

```
Memory Base/
├── 00_总索引/          ← 规则和索引
├── 01_项目记录/        ← 每个项目一个文件
│   ├── 交易/
│   ├── 副业/
│   └── 学校/
├── 02_工作流沉淀/      ← 可复用模式
├── 03_Skill产物/       ← Skill 输出
├── 04_归档项目/        ← 已完成项目
├── 05_可回溯记录/      ← 日志/决策/变更
├── 07_模板库/          ← 标准化模板
└── 99_迁移记录/
```

## License

MIT
