[English](README.md) | [中文](README.zh.md)

# meta-cogbase

**Every AI agent is missing a layer.**

You've installed 100 skills on your agent. It can write code, analyze data, generate reports. Then you ask it a real question — "Should I take this job offer?" — and it gives you a pros-and-cons list that a college freshman could have written. You ask it to build a complete project plan, and it delivers 80% then says "Done!" You ask it to investigate a bug, and it glances at the logs and says "Probably a config issue" — without actually checking.

The skills aren't the problem. You could install 200 more and nothing changes. Because skills change **what** an agent can do. Nothing changes **how** it thinks.

## What Is a Cognitive Base?

A cognitive base is a set of meta-cognitive instructions that rewire an agent's default thinking patterns. Not a tool that activates in specific scenarios — a permanent change to how the agent approaches *every* task.

Think of it this way: **skills are recipes, cognitive bases are knife skills.** A hundred cookbooks let a chef make more dishes. But if the knife work is sloppy, everything is just a little off.

Each cognitive base is ~30 lines of core rules injected into the agent's constitutional config (`CLAUDE.md`, `AGENTS.md`, `system instruction`) — loaded on every conversation, every task, no trigger needed. Plus a full reference framework (~120 lines) for deep situations.

### One Base, Three Completely Different Scenarios

Take [First Principles](https://github.com/d-wwei/first-principles) — 30 lines of rules. Same base, applied to:

- **Life decision** ("Should I get an MBA?") — Instead of listing pros and cons, the agent decomposes MBA into four bundled products (credential signal, network, knowledge, career pause) and checks each independently. The real question becomes: is the credential signal hard currency in your target industry?
- **Business judgment** ("Should we raise funding now?") — Instead of analyzing "market timing," the agent spots the hidden assumption: that fundraising windows are "catch or miss." Then it reframes around the actual metric: are your numbers improving month-over-month?
- **Creative work** ("My book feels scattered") — Instead of a checklist of writing tips, the agent diagnoses: your chapters are wired in parallel (each self-powered) when they need to be in series (each feeding the next).

No skill was invoked. The agent's *thinking changed* — across domains it was never specifically trained for.

## 19 Bases, Different Cognitive Axes

Cognitive bases don't compete — they cover different axes, like an OS has file management, memory management, and process scheduling running simultaneously.

### Tier 5 — Core Reasoning Paradigms

| Base | What It Changes |
|------|----------------|
| [First Principles](https://github.com/d-wwei/first-principles) | How the agent **analyzes** — audit assumptions, decompose to fundamentals, reconstruct freely |
| [Results-Driven](https://github.com/d-wwei/what-is-good-job) | How the agent **evaluates completion** — outcome over activity, evidence over confidence |
| [Systems Thinking](https://github.com/d-wwei/systems-thinking) | How the agent **sees structure** — feedback loops, leverage points, emergent behavior |
| [Dialectical Thinking](https://github.com/d-wwei/dialectical-thinking) | How the agent **handles contradiction** — identify tensions, locate the principal one, synthesize beyond opposition |

### Tier 6 — Specialized Cognitive Tools

| Base | Axis |
|------|------|
| [Tacit Knowledge](https://github.com/d-wwei/tacit-knowledge) | Think like a 10-year practitioner, not a textbook |
| [Bayesian Reasoning](https://github.com/d-wwei/bayesian-reasoning) | Calibrated probability, not binary judgments |
| [Inversion Thinking](https://github.com/d-wwei/inversion-thinking) | Map failure modes first, then avoid them |
| [Attention Allocation](https://github.com/d-wwei/attention-allocation) | Find the ONE binding constraint, ignore the rest |
| [Second-Order Thinking](https://github.com/d-wwei/second-order-thinking) | Trace consequences 2-3 steps down the causal chain |
| [Cross-Domain Connector](https://github.com/d-wwei/cross-domain-connector) | Spot structural parallels across disciplines |
| [Double-Loop Learning](https://github.com/d-wwei/double-loop-learning) | Question the assumptions behind errors, not just the errors |
| [Frame Auditing](https://github.com/d-wwei/frame-auditing) | Detect which invisible frame you're reasoning inside |
| [Constraint as Catalyst](https://github.com/d-wwei/constraint-as-catalyst) | Turn limitations into innovation fuel |
| [Temporal Wisdom](https://github.com/d-wwei/temporal-wisdom) | Choose strategies where time is your ally |
| [Interactive Cognition](https://github.com/d-wwei/interactive-cognition) | Model others' thinking, manage information flow |
| [Motivation Audit](https://github.com/d-wwei/motivation-audit) | Audit motivational drivers before analysis |
| [Principled Action](https://github.com/d-wwei/principled-action) | Close the gap between knowing and doing |
| [Non-Attachment](https://github.com/d-wwei/non-attachment) | Stay free from any framework — including this one |
| [Conviction Override](https://github.com/d-wwei/conviction-override) | Override rational caution when obstacles are convention, not physics |

Install three, five, or all nineteen. They don't conflict — each one governs a different axis.

## meta-cogbase — The Integrated Solution

All the pieces exist. But until now, installing them meant cloning repos one by one, running individual scripts, manually tracking what's installed. That friction kills adoption.

**meta-cogbase packages the entire ecosystem into one install:**

| Component | What You Get |
|-----------|-------------|
| **cognitive-kernel** | The runtime — 6-layer intervention framework that installs, assembles, and enforces cognitive bases with conflict analysis |
| **cognitive-base-creator** | Generate new cognitive bases from any thinking framework |
| **19 official bases** | Ready-to-install catalog covering core reasoning + specialized cognition |
| **Package manager** | Search, install, update, uninstall bases. Add sources from GitHub repos or stars lists |

One install. Full capability.

## Quick Start

```bash
git clone https://github.com/d-wwei/meta-cogbase.git
cd meta-cogbase
bash install.sh
```

The installer auto-detects your AI agent platform (Claude Code, Gemini CLI, Codex CLI, Cursor, OpenCode, OpenClaw), installs meta-cogbase, cognitive-kernel, and cognitive-base-creator, and sets up the base catalog.

Then tell your agent:

```
/meta-cogbase list                        # See all 19 available bases
/meta-cogbase search "reasoning"          # Search by keyword
/meta-cogbase install first-principles    # Install a base
/meta-cogbase install results-driven      # Install another
/meta-cogbase status                      # Check what's installed
```

## Commands

| Command | What It Does |
|---------|-------------|
| `list` | Browse available and installed bases |
| `search <query>` | Find bases by keyword (name, description, tags) |
| `install <name>` | Fetch and install a base (auto-delegates to kernel if available) |
| `uninstall <name>` | Remove a base cleanly |
| `update --check` | See which bases have newer versions |
| `update <name>` | Update a specific base |
| `registry add <url>` | Add a source — GitHub repo, stars list, or custom registry |
| `registry list` | See configured sources |
| `create <name>` | Generate a new cognitive base (delegates to cognitive-base-creator) |
| `status` | System overview — installed bases, kernel status, sources |

## Discover More Bases

The official 19 are just the starting point. Add any GitHub source:

```
/meta-cogbase registry add https://github.com/someone/their-cognitive-base
/meta-cogbase registry add https://github.com/stars/username
```

Any repository with a `manifest.yml` is automatically recognized as a cognitive base.

## How It Works

```
meta-cogbase (package manager)
  │ search, fetch, version, manage sources
  │
  ├── delegates install/uninstall to ──→ cognitive-kernel (runtime)
  │                                       │ 6-layer intervention framework
  │                                       │ conflict analysis between bases
  │                                       │ budget management (max rules in context)
  │
  └── delegates creation to ──────────→ cognitive-base-creator
                                          │ generates complete base packages
                                          │ from any thinking framework
```

meta-cogbase is a SKILL.md instruction set — your agent reads it and executes the commands using its own capabilities (reading files, running git, managing configs). No external runtime, no dependencies beyond bash and git.

## Supported Platforms

Claude Code, Gemini CLI, Codex CLI, Cursor, OpenCode, OpenClaw.

The installer detects all available platforms and installs to each one automatically.

## License

MIT

## Links

- [Cognitive Base Creator](https://github.com/d-wwei/cognitive-base-creator) — Generate new bases
- [Cognitive Kernel](https://github.com/d-wwei/cognitive-kernel) — Runtime framework
- [Article: Every Agent Is Missing a Layer](https://github.com/d-wwei/cognitive-base-creator/blob/main/docs/article-zh.md) — Deep dive into why cognitive bases matter
