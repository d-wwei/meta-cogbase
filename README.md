# meta-cogbase

认知底座的包管理器——给 AI agent 安装认知义体的一站式工具。

Package manager for cognitive bases — one-stop tool for installing cognitive prosthetics on AI agents.

## Quick Start

```bash
# One-line install (installs meta-cogbase + cognitive-kernel + cognitive-base-creator)
bash install.sh

# Then tell your AI agent:
/meta-cogbase list              # Browse available bases
/meta-cogbase search "reasoning" # Search by keyword
/meta-cogbase install first-principles  # Install a base
```

## What is a Cognitive Base?

A cognitive base is a meta-cognitive instruction set that changes **how** an AI agent thinks, not what it does. Each base is a set of files (protocol, skill reference, anti-patterns, examples) that get installed into an agent's configuration.

19 official bases are available covering core reasoning paradigms (first principles, systems thinking, dialectical thinking) and specialized cognitive tools (bayesian reasoning, inversion thinking, temporal wisdom, etc.).

## Commands

| Command | Description |
|---------|-------------|
| `/meta-cogbase list` | List available and installed bases |
| `/meta-cogbase search <query>` | Search bases by keyword |
| `/meta-cogbase install <name>` | Install a cognitive base |
| `/meta-cogbase uninstall <name>` | Uninstall a cognitive base |
| `/meta-cogbase update --check` | Check for updates |
| `/meta-cogbase update <name>` | Update a specific base |
| `/meta-cogbase registry add <url>` | Add a base source (GitHub repo, stars list, or custom) |
| `/meta-cogbase registry list` | List configured sources |
| `/meta-cogbase create <name>` | Create a new cognitive base |
| `/meta-cogbase status` | Show system status |

## Supported Platforms

- Claude Code
- Gemini CLI
- Codex CLI
- Cursor
- OpenCode
- OpenClaw

## Architecture

```
meta-cogbase (package manager)
  ↕ delegates install/uninstall to
cognitive-kernel (runtime: 6-layer intervention framework)
  ↕ reads manifests from
cognitive bases (19 official + community)
```

meta-cogbase handles **discovery, fetching, and versioning**. cognitive-kernel handles **installation, conflict analysis, and runtime execution**.

## Adding Sources

```
/meta-cogbase registry add https://github.com/someone/my-cognitive-base
/meta-cogbase registry add https://github.com/stars/username
```

## License

MIT
