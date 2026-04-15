# Installing meta-cogbase on Claude Code

## Automatic (Recommended)

```bash
bash install.sh
```

This installs meta-cogbase as a skill, plus cognitive-kernel and cognitive-base-creator.

## Manual

1. Copy files to skill directory:
   ```bash
   mkdir -p ~/.claude/skills/meta-cogbase/registry
   cp SKILL.md ~/.claude/skills/meta-cogbase/
   cp manifest.yml ~/.claude/skills/meta-cogbase/
   cp registry/official.yml ~/.claude/skills/meta-cogbase/registry/
   ```

2. Install cognitive-kernel separately (see its repo).

3. Initialize data directory:
   ```bash
   mkdir -p ~/.meta-cogbase/cache/{bases,sources}
   ```

## Usage

In Claude Code, type `/meta-cogbase` followed by any command:
```
/meta-cogbase list
/meta-cogbase install first-principles
```
