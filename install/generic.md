# Installing meta-cogbase on Any AI Agent

## Requirements

- An AI agent that supports skill/plugin files (SKILL.md)
- bash, curl, git available in the agent's environment

## Steps

1. Run the installer:
   ```bash
   bash install.sh
   ```
   The installer auto-detects supported agents (Claude Code, Gemini CLI, Codex CLI, Cursor, OpenCode, OpenClaw).

2. If your agent is not auto-detected, manually copy the skill files to your agent's skill directory:
   ```bash
   mkdir -p <agent-skill-dir>/meta-cogbase/registry
   cp SKILL.md <agent-skill-dir>/meta-cogbase/
   cp manifest.yml <agent-skill-dir>/meta-cogbase/
   cp registry/official.yml <agent-skill-dir>/meta-cogbase/registry/
   ```

3. Initialize the data directory:
   ```bash
   mkdir -p ~/.meta-cogbase/cache/{bases,sources}
   ```

4. Instruct your agent to read `SKILL.md` for available commands.

## How It Works

meta-cogbase is a SKILL.md instruction set. Your agent reads the instructions and executes commands (git clone, file management, etc.) using its own capabilities. No special runtime is needed — only bash and git.
