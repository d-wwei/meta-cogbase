<!-- Synced with README.md as of 2026-04-15 -->

[English](README.md) | [中文](README.zh.md)

# meta-cogbase

**所有 Agent 都缺了一层。**

你给 Agent 装了写作 Skill、分析 Skill、设计 Skill。它能帮你写周报，能帮你做竞品分析，能帮你出设计稿。然后你问它："我该不该去读 MBA？"——它给你列了一堆利弊，读完还是不知道答案。你让它写一份完整方案，它做了 80% 就说"搞定了"。你让它查一个问题，它看了一眼说"可能是配置问题"——什么都没查。

Skill 装了 100 个，问题还是同一类。因为所有 Skill 都在解决"做什么"。没有 Skill 在解决"怎么想"。

## 什么是认知底座

认知底座是一种直接改变 Agent 思维方式的指令集。不是一个被调用的工具——是对 Agent 默认思维模式的永久改写。

**Skill 是菜谱，认知底座是刀工。** 一百本菜谱让厨师能做更多的菜，但刀工不行，做什么都差那么一点。

每个认知底座是 ~30 行核心规则，写入 Agent 的宪法级配置（`CLAUDE.md`、`AGENTS.md`、`system instruction`）——每次对话、每个任务都在生效，不需要触发条件。同时提供 ~120 行完整框架，供复杂场景深度参考。

### 一个底座，三个完全不同的场景

以[第一性原理](https://github.com/d-wwei/first-principles)为例——30 行规则，三个场景：

- **人生决策**（"该不该读 MBA？"）—— 不列利弊，而是拆解：MBA 是四样东西捆绑销售（学历信号、人脉、知识、暂停键），除了学历信号，其他三样都有成本低一个数量级的替代方案。真正的问题变成：学历信号在你的目标行业里是硬通货吗？
- **商业判断**（"该不该融资？"）—— 不分析"市场时机"，而是指出"融资窗口"这个概念里藏着一个假设。回到基本面：核心指标是在变好还是走平？
- **内容创作**（"书写到中间散了"）—— 不给写作技巧清单，而是诊断：你的章节是并联电路（各自供电），需要改成串联（每章输出喂给下一章）。

没有人调用任何 Skill。Agent 的思维方式本身变了——面对任何问题，它的第一反应不再是"我知道什么"，而是"这个框架里藏着什么假设"。

## 19 个底座，不同的认知轴线

底座之间不冲突——它们管的是不同的事。就像操作系统同时有文件系统、内存管理和进程调度，各管各的。

### Tier 5 — 核心推理范式

| 底座 | 改变什么 |
|------|---------|
| [第一性原理](https://github.com/d-wwei/first-principles) | Agent 怎么**分析**——审计假设，拆到基本面，无约束重建 |
| [以终为始](https://github.com/d-wwei/what-is-good-job) | Agent 怎么**判断完成**——结果导向，有证据才算完 |
| [系统性思考](https://github.com/d-wwei/systems-thinking) | Agent 怎么**看结构**——反馈循环、杠杆点、涌现 |
| [矛盾论](https://github.com/d-wwei/dialectical-thinking) | Agent 怎么**处理对立**——识别矛盾网络，定位主要矛盾，综合超越 |

### Tier 6 — 专用认知工具

| 底座 | 轴线 |
|------|------|
| [默会知识](https://github.com/d-wwei/tacit-knowledge) | 像十年老手一样思考，不像教科书 |
| [概率思维](https://github.com/d-wwei/bayesian-reasoning) | 校准的概率分布，不是非黑即白 |
| [逆向思考](https://github.com/d-wwei/inversion-thinking) | 先画失败地图，然后避开 |
| [提纲挈领](https://github.com/d-wwei/attention-allocation) | 找到此刻唯一的瓶颈，忽略其余 |
| [二阶思维](https://github.com/d-wwei/second-order-thinking) | 沿因果链追 2-3 步，识别非预期后果 |
| [跨学科思考](https://github.com/d-wwei/cross-domain-connector) | 发现不同学科间的结构同构 |
| [双环思考](https://github.com/d-wwei/double-loop-learning) | 不只修正错误，质疑产生错误的假设 |
| [隐含假设审计](https://github.com/d-wwei/frame-auditing) | 识别你在哪个不可见的框架里推理 |
| [以约求变](https://github.com/d-wwei/constraint-as-catalyst) | 把限制变成创新催化剂 |
| [和时间做朋友](https://github.com/d-wwei/temporal-wisdom) | 选择让时间成为放大器的策略 |
| [知彼](https://github.com/d-wwei/interactive-cognition) | 建模他人的思考，管理信息流 |
| [正心诚意](https://github.com/d-wwei/motivation-audit) | 分析之前先审查动机 |
| [知行合一](https://github.com/d-wwei/principled-action) | 消除知与行之间的断裂 |
| [认知去蔽](https://github.com/d-wwei/non-attachment) | 不与任何框架合一——包括这个 |
| [信念驱动](https://github.com/d-wwei/conviction-override) | 障碍是惯例不是物理定律时，用信念覆盖理性评估 |

装三个、五个、全部十九个都行。它们不冲突——每个管一根轴线。

## meta-cogbase — 集成解决方案

所有零件都已经存在。但在此之前，安装它们意味着逐个 clone 仓库、逐个跑 install.sh、手动记录装了什么。这种摩擦会杀死所有好东西。

**meta-cogbase 把整个生态打包成一次安装：**

| 组件 | 你获得什么 |
|------|-----------|
| **cognitive-kernel** | 运行时——6 层干预框架，负责安装、组装、冲突分析、运行时执行 |
| **cognitive-base-creator** | 从任意思维框架生成新的认知底座 |
| **19 个官方底座** | 现成的目录，覆盖核心推理 + 专用认知 |
| **包管理器** | 搜索、安装、更新、卸载底座。从 GitHub 仓库或 stars 列表发现更多底座 |

一次安装，全部能力。

## 快速开始

```bash
git clone https://github.com/d-wwei/meta-cogbase.git
cd meta-cogbase
bash install.sh
```

安装脚本自动检测你的 AI agent 平台（Claude Code、Gemini CLI、Codex CLI、Cursor、OpenCode、OpenClaw），安装 meta-cogbase、cognitive-kernel 和 cognitive-base-creator，配置底座目录。

然后告诉你的 Agent：

```
/meta-cogbase list                        # 看看有哪 19 个底座
/meta-cogbase search "推理"                # 按关键词搜索
/meta-cogbase install first-principles    # 装一个
/meta-cogbase install results-driven      # 再装一个
/meta-cogbase status                      # 看看装了什么
```

## 命令

| 命令 | 做什么 |
|------|-------|
| `list` | 浏览可用和已安装的底座 |
| `search <关键词>` | 按名称、描述、标签搜索 |
| `install <名称>` | 获取并安装底座（有 kernel 时自动冲突分析） |
| `uninstall <名称>` | 干净卸载 |
| `update --check` | 查看哪些底座有新版本 |
| `update <名称>` | 更新指定底座 |
| `registry add <URL>` | 添加来源——GitHub 仓库、stars 列表、自定义注册表 |
| `registry list` | 查看已配置的来源 |
| `create <名称>` | 创建新底座（委托 cognitive-base-creator） |
| `status` | 系统概览——已装底座、kernel 状态、来源数 |

## 发现更多底座

官方 19 个只是起点。添加任何 GitHub 来源：

```
/meta-cogbase registry add https://github.com/someone/their-cognitive-base
/meta-cogbase registry add https://github.com/stars/username
```

任何包含 `manifest.yml` 的仓库都会被自动识别为认知底座。

## 工作原理

```
meta-cogbase（包管理器）
  │ 搜索、获取、版本管理、来源管理
  │
  ├── 委托安装/卸载给 ──→ cognitive-kernel（运行时）
  │                         │ 6 层干预框架
  │                         │ 底座间冲突分析
  │                         │ 上下文预算管理
  │
  └── 委托创建给 ─────→ cognitive-base-creator
                            │ 从任意思维框架
                            │ 生成完整底座包
```

meta-cogbase 本身是一个 SKILL.md 指令集——你的 Agent 读了它就知道怎么执行所有命令。不需要额外运行时，只需要 bash 和 git。

## 支持的平台

Claude Code、Gemini CLI、Codex CLI、Cursor、OpenCode、OpenClaw。

安装脚本自动检测所有可用平台，逐一安装。

## 许可证

MIT

## 链接

- [Cognitive Base Creator](https://github.com/d-wwei/cognitive-base-creator) — 生成新底座
- [Cognitive Kernel](https://github.com/d-wwei/cognitive-kernel) — 运行时框架
- [文章：所有 Agent 都缺了一层](https://github.com/d-wwei/cognitive-base-creator/blob/main/docs/article-zh.md) — 深度解析认知底座为什么重要
