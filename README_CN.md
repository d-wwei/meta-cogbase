# meta-cogbase

认知底座的包管理器——给 AI agent 安装认知义体的一站式工具。

## 快速开始

```bash
# 一键安装（同时安装 meta-cogbase + cognitive-kernel + cognitive-base-creator）
bash install.sh

# 然后告诉你的 AI agent：
/meta-cogbase list              # 浏览可用的认知底座
/meta-cogbase search "推理"      # 按关键词搜索
/meta-cogbase install first-principles  # 安装一个底座
```

## 什么是认知底座？

认知底座是一种元认知指令集，改变 AI agent **怎么思考**，而不是做什么。每个底座包含一组文件（协议、技能参考、反模式、示例），安装到 agent 的配置中。

目前有 19 个官方底座，涵盖核心推理范式（第一性原理、系统性思考、矛盾论）和专用认知工具（概率思维、逆向思考、和时间做朋友 等）。

## 命令

| 命令 | 说明 |
|------|------|
| `/meta-cogbase list` | 列出可用和已安装的底座 |
| `/meta-cogbase search <关键词>` | 按关键词搜索底座 |
| `/meta-cogbase install <名称>` | 安装一个认知底座 |
| `/meta-cogbase uninstall <名称>` | 卸载一个认知底座 |
| `/meta-cogbase update --check` | 检查更新 |
| `/meta-cogbase update <名称>` | 更新指定底座 |
| `/meta-cogbase registry add <URL>` | 添加底座来源（GitHub 仓库、stars 列表等） |
| `/meta-cogbase registry list` | 列出已配置的来源 |
| `/meta-cogbase create <名称>` | 创建新的认知底座 |
| `/meta-cogbase status` | 显示系统状态 |

## 支持的平台

- Claude Code
- Gemini CLI
- Codex CLI
- Cursor
- OpenCode
- OpenClaw

## 架构

```
meta-cogbase（包管理器）
  ↕ 委托安装/卸载给
cognitive-kernel（运行时：6层干预框架）
  ↕ 读取 manifest 来自
认知底座（19 个官方 + 社区贡献）
```

meta-cogbase 负责**发现、获取和版本管理**。cognitive-kernel 负责**安装、冲突分析和运行时执行**。

## 添加来源

```
/meta-cogbase registry add https://github.com/someone/my-cognitive-base
/meta-cogbase registry add https://github.com/stars/username
```

支持四种来源类型：
- **GitHub 仓库**：自动检测仓库中的 manifest.yml
- **GitHub Stars 列表**：过滤含 manifest.yml 的 starred 仓库
- **自定义 YAML**：任何符合 registry schema 的 URL
- **官方源**：内置 19 个底座

## 许可证

MIT
