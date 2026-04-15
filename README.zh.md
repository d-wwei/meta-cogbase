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

| 底座 | 改变什么 |
|------|---------|
| [第一性原理](https://github.com/d-wwei/first-principles) | Agent 怎么**分析**——审计假设，拆到基本面，无约束重建 |
| [以终为始](https://github.com/d-wwei/what-is-good-job) | Agent 怎么**判断完成**——结果导向，有证据才算完 |
| [系统性思考](https://github.com/d-wwei/systems-thinking) | Agent 怎么**看结构**——反馈循环、杠杆点、涌现 |
| [矛盾论](https://github.com/d-wwei/dialectical-thinking) | Agent 怎么**处理对立**——识别矛盾网络，定位主要矛盾，综合超越 |
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

## 写进去就能生效吗？6 层干预框架

把 30 行规则写入 CLAUDE.md，Agent 就会遵守吗？

不一定。规则只是文字。Agent 在认知负荷高的时候会跳过规则——就像人在忙的时候会忘记检查清单。光靠"请遵守以下规则"是最弱的干预方式。

这就是为什么认知底座不只是一个 Markdown 文件。每个底座通过 `manifest.yml` 描述自己要在 6 个层级上分别做什么——从强到弱：

| 层级 | 机制 | 怎么保证生效 |
|------|------|------------|
| **L1 输出模板** | Agent 的输出里必须包含特定字段 | 结构性强制——不填就不完整，跳不过去 |
| **L2 Hook** | 在关键动作前自动注入提醒 | 环境设计——Agent 想跳过也会被拦住 |
| **L3 If-Then 触发器** | 识别到特定模式时自动触发动作 | 条件反射——匹配模式就执行，不靠自觉 |
| **L4 外部验证** | 派一个子 Agent 做对抗性审查 | 外部监督——自己查自己靠不住，换人查 |
| **L5 核心规则** | 少量最重要的规则常驻上下文 | 持续提醒——永远在视野里，但仍靠自觉 |
| **L6 Skill 参考** | 完整框架按需加载 | 最弱——Agent 需要主动去读 |

普通的 Skill 只在 L6 层工作——Agent 需要的时候才加载，用完就忘。认知底座从 L1 到 L6 全覆盖。最关键的规则用结构性强制（L1）和自动触发（L2-L3），而不是靠 Agent 自觉。

**类比：** L6 是贴在墙上的标语，L1 是焊在流水线上的限位器。标语靠人看，限位器靠物理结构——零件不到位，流水线自己就停了。

## 为什么需要认知内核

一个认知底座可以独立安装——每个底座自带 `install.sh`，直接写入 Agent 配置就能工作。

但当你装了 3 个、5 个、19 个底座的时候，三个问题出现了：

**1. 冲突。** 不同底座的 L1 输出字段可能重叠，L3 触发器可能矛盾。第一性原理说"拆到基本面"，系统性思考说"先看整体"——同一个问题，两条规则给出相反的方向。谁先谁后？

**2. 预算。** Agent 的上下文窗口是有限的。19 个底座全部加载 = 100+ 条规则同时生效。规则太多等于没有规则——Agent 的注意力被稀释，什么都记不住。需要有人管"此刻哪些规则最重要"。

**3. 6 层装配。** 每个底座的 manifest.yml 描述了它在 6 个层级上要做什么。但"描述"不等于"执行"——需要有人读 manifest，把 L1 字段写入输出模板，把 L2 hook 注册到平台，把 L3 触发器组装到运行时。

[Cognitive Kernel](https://github.com/d-wwei/cognitive-kernel) 就是做这三件事的：

- **冲突分析**——安装新底座时，自动检测与已安装底座的重叠、张力和冲突，给出解决方案
- **预算管理**——控制同时加载的核心规则数量（默认最多 4 个底座的 L5 规则），避免注意力稀释
- **6 层装配**——读取每个底座的 manifest.yml，把规则分发到正确的干预层级

没有 kernel 也能用认知底座（每个底座的 install.sh 会直接注入核心规则）。但有了 kernel，底座之间能协同工作而不是互相干扰。

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
