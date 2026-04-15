# Installing meta-cogbase on Gemini CLI

## Automatic (Recommended)

```bash
bash install.sh
```

## Manual

1. Copy files to skill directory:
   ```bash
   mkdir -p ~/.gemini/skills/meta-cogbase/registry
   cp SKILL.md ~/.gemini/skills/meta-cogbase/
   cp manifest.yml ~/.gemini/skills/meta-cogbase/
   cp registry/official.yml ~/.gemini/skills/meta-cogbase/registry/
   ```

2. Install cognitive-kernel separately.

3. Initialize data directory:
   ```bash
   mkdir -p ~/.meta-cogbase/cache/{bases,sources}
   ```
