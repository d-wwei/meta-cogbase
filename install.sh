#!/usr/bin/env bash
set -euo pipefail

# ============================================================================
# meta-cogbase Installer — Package manager for cognitive bases
# Installs: meta-cogbase skill + cognitive-kernel + cognitive-base-creator
# Supports: Claude Code, Gemini CLI, Codex CLI, Cursor, OpenCode, OpenClaw
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_NAME="meta-cogbase"
BASE_TITLE="meta-cogbase"

# --- Dependency repos ---
KERNEL_REPO="https://github.com/d-wwei/cognitive-kernel.git"
CREATOR_REPO="https://github.com/d-wwei/cognitive-base-creator.git"

# --- Colors ---
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[0;33m'; BLUE='\033[0;34m'; NC='\033[0m'

log()     { echo -e "${BLUE}[INFO]${NC} $*"; }
success() { echo -e "${GREEN}[OK]${NC} $*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $*"; }
error()   { echo -e "${RED}[ERROR]${NC} $*" >&2; }

# ============================================================================
# Utility Functions
# ============================================================================


# ============================================================================
# Version Detection (for display purposes)
# ============================================================================

get_claude_code_version() {
    local ver
    ver=$(set +e +o pipefail; claude --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1; true)
    echo "${ver:-unknown}"
}

get_gemini_cli_version() {
    local ver
    ver=$(set +e +o pipefail; gemini --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1; true)
    if [[ -z "$ver" ]]; then
        ver=$(set +e +o pipefail; npm list -g @google/gemini-cli 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1; true)
    fi
    echo "${ver:-unknown}"
}

# ============================================================================
# Agent Detection
# ============================================================================

detect_claude_code() { command -v claude &>/dev/null || [[ -d "$HOME/.claude" ]]; }
detect_gemini_cli()  { command -v gemini &>/dev/null || [[ -d "$HOME/.gemini" ]]; }
detect_codex_cli()   { command -v codex &>/dev/null || [[ -d "$HOME/.codex" ]]; }
detect_cursor()      { [[ -d "$HOME/.cursor" ]] || [[ -d "$PWD/.cursor" ]]; }
detect_opencode()    { command -v opencode &>/dev/null || [[ -d "$HOME/.config/opencode" ]]; }
detect_openclaw()    { [[ -d "$HOME/.openclaw" ]]; }

detect_all() {
    local agents=()
    detect_claude_code && agents+=("claude-code")
    detect_gemini_cli  && agents+=("gemini-cli")
    detect_codex_cli   && agents+=("codex-cli")
    detect_cursor      && agents+=("cursor")
    detect_opencode    && agents+=("opencode")
    detect_openclaw    && agents+=("openclaw")
    echo "${agents[@]}"
}

# ============================================================================
# Skill Installation (copy SKILL.md + registry/ to skill dir)
# ============================================================================

install_skill_files() {
    local skill_dir="$1"
    mkdir -p "$skill_dir/registry"
    cp "$SCRIPT_DIR/SKILL.md" "$skill_dir/"
    cp "$SCRIPT_DIR/manifest.yml" "$skill_dir/"
    cp "$SCRIPT_DIR/registry/official.yml" "$skill_dir/registry/"
}

remove_skill_files() {
    local skill_dir="$1"
    [[ -d "$skill_dir" ]] && rm -rf "$skill_dir"
}

# ============================================================================
# Install Functions (per agent)
# ============================================================================

install_claude_code() {
    local config_dir="$HOME/.claude"
    local skill_dir="$config_dir/skills/$BASE_NAME"

    mkdir -p "$config_dir"
    install_skill_files "$skill_dir"

    local cc_ver; cc_ver=$(get_claude_code_version)
    success "Claude Code: $BASE_TITLE skill installed (v$cc_ver)"
}

install_gemini_cli() {
    local config_dir="$HOME/.gemini"
    local skill_dir="$config_dir/skills/$BASE_NAME"

    mkdir -p "$config_dir"
    install_skill_files "$skill_dir"

    local gc_ver; gc_ver=$(get_gemini_cli_version)
    success "Gemini CLI: $BASE_TITLE skill installed (v$gc_ver)"
}

install_codex_cli() {
    local config_dir="$HOME/.codex"
    local skill_dir="$config_dir/skills/$BASE_NAME"

    mkdir -p "$config_dir"
    install_skill_files "$skill_dir"

    success "Codex CLI: $BASE_TITLE skill installed"
}

install_cursor() {
    local config_dir
    if [[ -d "$PWD/.cursor" ]]; then
        config_dir="$PWD/.cursor"
    else
        config_dir="$HOME/.cursor"
    fi
    local skill_dir="$config_dir/skills/$BASE_NAME"

    mkdir -p "$config_dir"
    install_skill_files "$skill_dir"

    success "Cursor: $BASE_TITLE skill installed"
}

install_opencode() {
    local config_dir="$HOME/.config/opencode"
    local skill_dir="$config_dir/skills/$BASE_NAME"

    mkdir -p "$config_dir"
    install_skill_files "$skill_dir"

    success "OpenCode: $BASE_TITLE skill installed"
}

install_openclaw() {
    local config_dir="$HOME/.openclaw/workspace"
    local skill_dir="$config_dir/skills/$BASE_NAME"

    mkdir -p "$config_dir"
    install_skill_files "$skill_dir"

    success "OpenClaw: $BASE_TITLE skill installed"
}

# ============================================================================
# Uninstall Functions
# ============================================================================

uninstall_claude_code() {
    local skill_dir="$HOME/.claude/skills/$BASE_NAME"
    if [[ -d "$skill_dir" ]]; then
        remove_skill_files "$skill_dir"
        success "Claude Code: $BASE_TITLE uninstalled"
    else
        warn "Claude Code: $BASE_TITLE was not installed"
    fi
}

uninstall_gemini_cli() {
    local skill_dir="$HOME/.gemini/skills/$BASE_NAME"
    if [[ -d "$skill_dir" ]]; then
        remove_skill_files "$skill_dir"
        success "Gemini CLI: $BASE_TITLE uninstalled"
    else
        warn "Gemini CLI: $BASE_TITLE was not installed"
    fi
}

uninstall_codex_cli() {
    local skill_dir="$HOME/.codex/skills/$BASE_NAME"
    if [[ -d "$skill_dir" ]]; then
        remove_skill_files "$skill_dir"
        success "Codex CLI: $BASE_TITLE uninstalled"
    else
        warn "Codex CLI: $BASE_TITLE was not installed"
    fi
}

uninstall_cursor() {
    local skill_dir
    for d in "$PWD/.cursor/skills/$BASE_NAME" "$HOME/.cursor/skills/$BASE_NAME"; do
        if [[ -d "$d" ]]; then
            remove_skill_files "$d"
            success "Cursor: $BASE_TITLE uninstalled"
            return
        fi
    done
    warn "Cursor: $BASE_TITLE was not installed"
}

uninstall_opencode() {
    local skill_dir="$HOME/.config/opencode/skills/$BASE_NAME"
    if [[ -d "$skill_dir" ]]; then
        remove_skill_files "$skill_dir"
        success "OpenCode: $BASE_TITLE uninstalled"
    else
        warn "OpenCode: $BASE_TITLE was not installed"
    fi
}

uninstall_openclaw() {
    local skill_dir="$HOME/.openclaw/workspace/skills/$BASE_NAME"
    if [[ -d "$skill_dir" ]]; then
        remove_skill_files "$skill_dir"
        success "OpenClaw: $BASE_TITLE uninstalled"
    else
        warn "OpenClaw: $BASE_TITLE was not installed"
    fi
}

# ============================================================================
# Status Functions
# ============================================================================

status_check() {
    log "=== $BASE_TITLE Status ==="
    echo ""

    local agents
    agents=$(detect_all)

    if [[ -z "$agents" ]]; then
        warn "No supported AI agents detected"
        return 1
    fi

    for agent in $agents; do
        local skill_dir
        case "$agent" in
            claude-code) skill_dir="$HOME/.claude/skills/$BASE_NAME" ;;
            gemini-cli)  skill_dir="$HOME/.gemini/skills/$BASE_NAME" ;;
            codex-cli)   skill_dir="$HOME/.codex/skills/$BASE_NAME" ;;
            cursor)
                if [[ -d "$PWD/.cursor/skills/$BASE_NAME" ]]; then
                    skill_dir="$PWD/.cursor/skills/$BASE_NAME"
                else
                    skill_dir="$HOME/.cursor/skills/$BASE_NAME"
                fi
                ;;
            opencode)    skill_dir="$HOME/.config/opencode/skills/$BASE_NAME" ;;
            openclaw)    skill_dir="$HOME/.openclaw/workspace/skills/$BASE_NAME" ;;
        esac

        if [[ -d "$skill_dir" ]] && [[ -f "$skill_dir/SKILL.md" ]]; then
            success "$agent: installed"
        else
            log "$agent: not installed"
        fi
    done

    echo ""
    # Check dependencies (all platform paths)
    local kernel_found=false creator_found=false
    for dir in "$HOME/.claude/skills" "$HOME/.gemini/skills" "$HOME/.codex/skills" \
               "$HOME/.config/opencode/skills" "$HOME/.cursor/skills" "$HOME/.openclaw/workspace/skills"; do
        [[ -d "$dir/cognitive-kernel" ]] && kernel_found=true
        [[ -d "$dir/cognitive-base-creator" ]] && creator_found=true
    done

    if $kernel_found; then
        success "cognitive-kernel: installed"
    else
        warn "cognitive-kernel: not installed (install for advanced features)"
    fi

    if $creator_found; then
        success "cognitive-base-creator: installed"
    else
        warn "cognitive-base-creator: not installed"
    fi

    # Check meta-cogbase data dir
    if [[ -d "$HOME/.meta-cogbase" ]]; then
        success "Data directory: ~/.meta-cogbase/"
        if [[ -f "$HOME/.meta-cogbase/sources.yml" ]]; then
            local source_count
            source_count=$(grep -c '^ *- name:' "$HOME/.meta-cogbase/sources.yml" 2>/dev/null || echo "0")
            log "  Sources configured: $source_count"
        fi
        if [[ -f "$HOME/.meta-cogbase/installed.yml" ]]; then
            local installed_count
            installed_count=$(grep -c '^ *- name:' "$HOME/.meta-cogbase/installed.yml" 2>/dev/null || echo "0")
            log "  Bases installed: $installed_count"
        fi
    else
        log "Data directory: not initialized (will be created on first use)"
    fi
}

# ============================================================================
# Dependency Installation (kernel + creator)
# ============================================================================

install_dependency() {
    local name="$1" repo="$2"
    local tmp_dir="/tmp/meta-cogbase-dep-$name-$$"

    # Check if already installed on any platform
    for dir in "$HOME/.claude/skills/$name" "$HOME/.gemini/skills/$name" \
               "$HOME/.codex/skills/$name" "$HOME/.config/opencode/skills/$name" \
               "$HOME/.cursor/skills/$name" "$HOME/.openclaw/workspace/skills/$name"; do
        if [[ -d "$dir" ]] && [[ -f "$dir/SKILL.md" ]]; then
            success "$name: already installed"
            return 0
        fi
    done

    log "Installing $name..."
    if ! git clone --depth 1 "$repo" "$tmp_dir" 2>/dev/null; then
        warn "Failed to clone $name from $repo (check network)"
        return 1
    fi

    if [[ -f "$tmp_dir/install.sh" ]]; then
        chmod +x "$tmp_dir/install.sh"
        bash "$tmp_dir/install.sh" ${PASSTHROUGH_ARGS[@]+"${PASSTHROUGH_ARGS[@]}"}
    else
        warn "$name: no install.sh found"
    fi

    rm -rf "$tmp_dir"
}

# ============================================================================
# Initialize meta-cogbase data directory
# ============================================================================

init_data_dir() {
    local data_dir="$HOME/.meta-cogbase"

    if [[ -d "$data_dir" ]]; then
        log "Data directory already exists"
        return 0
    fi

    mkdir -p "$data_dir/cache/bases" "$data_dir/cache/sources"

    # Determine the skill dir path for official.yml reference
    local official_path=""
    for dir in "$HOME/.claude/skills/$BASE_NAME" "$HOME/.gemini/skills/$BASE_NAME" \
               "$HOME/.codex/skills/$BASE_NAME" "$HOME/.config/opencode/skills/$BASE_NAME" \
               "$HOME/.cursor/skills/$BASE_NAME" "$HOME/.openclaw/workspace/skills/$BASE_NAME"; do
        if [[ -f "$dir/registry/official.yml" ]]; then
            official_path="$dir/registry/official.yml"
            break
        fi
    done

    if [[ -z "$official_path" ]]; then
        # Fallback: use source dir
        official_path="$SCRIPT_DIR/registry/official.yml"
    fi

    cat > "$data_dir/sources.yml" << EOF
sources:
  - name: official
    type: built-in
    path: "$official_path"
EOF

    cat > "$data_dir/installed.yml" << EOF
installed: []
EOF

    success "Data directory initialized: $data_dir/"
}

# ============================================================================
# Main
# ============================================================================

MODE="auto"
ACTION="install"
CURRENT_AGENT=""
ALL_MODE=false
PASSTHROUGH_ARGS=()

while [[ $# -gt 0 ]]; do
    case "$1" in
        --inline)    MODE="inline"; PASSTHROUGH_ARGS+=("$1") ;;
        --status)    ACTION="status" ;;
        --uninstall) ACTION="uninstall" ;;
        --agent=*)   CURRENT_AGENT="${1#--agent=}" ;;
        --all)       ALL_MODE=true ;;
        --help|-h)   ACTION="help" ;;
        *)           PASSTHROUGH_ARGS+=("$1") ;;
    esac
    shift
done

if [[ "$ACTION" == "help" ]]; then
    echo "Usage: install.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --status        Show installation status"
    echo "  --uninstall     Remove meta-cogbase from all agents"
    echo "  --agent=NAME    Install to a specific agent (e.g., --agent=claude-code)"
    echo "  --all           Install to all detected agents without asking"
    echo "  --inline        Force inline mode (skip @ ref detection)"
    echo "  --help          Show this help"
    echo ""
    echo "This installer will:"
    echo "  1. Detect available AI agent platforms"
    echo "  2. Let you choose which platforms to install to"
    echo "  3. Install cognitive-kernel (if not already installed)"
    echo "  4. Install cognitive-base-creator (if not already installed)"
    echo "  5. Initialize ~/.meta-cogbase/ data directory"
    exit 0
fi

if [[ "$ACTION" == "status" ]]; then
    status_check
    exit 0
fi

# Detect agents
AGENTS_STR=$(detect_all)
AGENTS_ARRAY=($AGENTS_STR)

if [[ ${#AGENTS_ARRAY[@]} -eq 0 ]]; then
    error "No supported AI agents detected."
    error "Supported: Claude Code, Gemini CLI, Codex CLI, Cursor, OpenCode, OpenClaw"
    exit 1
fi

log "Detected ${#AGENTS_ARRAY[@]} agent(s):"
for i in "${!AGENTS_ARRAY[@]}"; do
    echo "  $((i+1)). ${AGENTS_ARRAY[$i]}"
done
echo ""

if [[ "$ACTION" == "uninstall" ]]; then
    log "=== Uninstalling $BASE_TITLE ==="
    for agent in "${AGENTS_ARRAY[@]}"; do
        case "$agent" in
            claude-code) uninstall_claude_code ;;
            gemini-cli)  uninstall_gemini_cli ;;
            codex-cli)   uninstall_codex_cli ;;
            cursor)      uninstall_cursor ;;
            opencode)    uninstall_opencode ;;
            openclaw)    uninstall_openclaw ;;
        esac
    done
    echo ""
    log "Note: cognitive-kernel and cognitive-base-creator are NOT uninstalled."
    log "To remove them, run their uninstallers separately."
    exit 0
fi

# === Determine which agents to install to ===

SELECTED_AGENTS=()

if [[ -n "$CURRENT_AGENT" ]]; then
    # Agent mode: auto-install to specified agent
    SELECTED_AGENTS+=("$CURRENT_AGENT")
    success "Auto-installing to current agent: $CURRENT_AGENT"

    # Ask about others if more detected
    OTHER_AGENTS=()
    for agent in "${AGENTS_ARRAY[@]}"; do
        [[ "$agent" != "$CURRENT_AGENT" ]] && OTHER_AGENTS+=("$agent")
    done

    if [[ ${#OTHER_AGENTS[@]} -gt 0 ]]; then
        if $ALL_MODE; then
            SELECTED_AGENTS+=("${OTHER_AGENTS[@]}")
        else
            echo ""
            log "Other agents detected:"
            for i in "${!OTHER_AGENTS[@]}"; do
                echo "  $((i+1)). ${OTHER_AGENTS[$i]}"
            done
            echo ""
            read -rp "Also install to these? Enter numbers (e.g., 1 3) or 'all' or 'none': " CHOICE
            if [[ "$CHOICE" == "all" ]]; then
                SELECTED_AGENTS+=("${OTHER_AGENTS[@]}")
            elif [[ "$CHOICE" != "none" && -n "$CHOICE" ]]; then
                for num in $CHOICE; do
                    local_idx=$((num - 1))
                    if [[ $local_idx -ge 0 && $local_idx -lt ${#OTHER_AGENTS[@]} ]]; then
                        SELECTED_AGENTS+=("${OTHER_AGENTS[$local_idx]}")
                    fi
                done
            fi
        fi
    fi

elif $ALL_MODE; then
    # --all flag: install to everything
    SELECTED_AGENTS=("${AGENTS_ARRAY[@]}")

elif [[ ${#AGENTS_ARRAY[@]} -eq 1 ]]; then
    # Only one agent: install directly
    SELECTED_AGENTS=("${AGENTS_ARRAY[0]}")

else
    # Terminal mode: let user choose
    echo "Which agents to install to?"
    echo "  Enter numbers separated by spaces (e.g., 1 3 5)"
    echo "  Or 'all' for all detected agents"
    echo ""
    read -rp "Your choice: " CHOICE
    if [[ "$CHOICE" == "all" ]]; then
        SELECTED_AGENTS=("${AGENTS_ARRAY[@]}")
    elif [[ -n "$CHOICE" ]]; then
        for num in $CHOICE; do
            local_idx=$((num - 1))
            if [[ $local_idx -ge 0 && $local_idx -lt ${#AGENTS_ARRAY[@]} ]]; then
                SELECTED_AGENTS+=("${AGENTS_ARRAY[$local_idx]}")
            fi
        done
    fi
fi

if [[ ${#SELECTED_AGENTS[@]} -eq 0 ]]; then
    error "No agents selected. Nothing to install."
    exit 1
fi

# === Install ===
log "=== Installing $BASE_TITLE ==="
echo ""

# Step 1: Install meta-cogbase skill on selected agents
log "Step 1/4: Installing $BASE_TITLE skill..."
INSTALLED=0
for agent in "${SELECTED_AGENTS[@]}"; do
    case "$agent" in
        claude-code) install_claude_code && INSTALLED=$((INSTALLED + 1)) ;;
        gemini-cli)  install_gemini_cli && INSTALLED=$((INSTALLED + 1)) ;;
        codex-cli)   install_codex_cli && INSTALLED=$((INSTALLED + 1)) ;;
        cursor)      install_cursor && INSTALLED=$((INSTALLED + 1)) ;;
        opencode)    install_opencode && INSTALLED=$((INSTALLED + 1)) ;;
        openclaw)    install_openclaw && INSTALLED=$((INSTALLED + 1)) ;;
    esac
done
echo ""

# Step 2: Install cognitive-kernel
log "Step 2/4: Checking cognitive-kernel..."
install_dependency "cognitive-kernel" "$KERNEL_REPO"
echo ""

# Step 3: Install cognitive-base-creator
log "Step 3/4: Checking cognitive-base-creator..."
install_dependency "cognitive-base-creator" "$CREATOR_REPO"
echo ""

# Step 4: Initialize data directory
log "Step 4/4: Initializing data directory..."
init_data_dir
echo ""

# Summary
echo "============================================"
success "$BASE_TITLE installed on $INSTALLED agent(s)"
echo ""
log "Next steps:"
log "  Tell your AI agent: /meta-cogbase list"
log "  Or: /meta-cogbase search <keyword>"
log "  Or: /meta-cogbase install <base-name>"
echo "============================================"
