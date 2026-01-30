# OpenCode MCP 服务配置

本目录配置了三个核心 MCP (Model Context Protocol) 服务，用于增强 OpenCode 的功能。

## 已安装的 MCP 服务

### 1. 📁 Filesystem MCP
**功能**: 高级文件系统操作
- 文件批量管理和重命名
- 目录监控和同步
- 文件内容搜索和分析
- 模板生成

**配置**:
```json
"filesystem": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-filesystem", "/Users/xiangzhen"]
}
```

**应用场景**:
- "批量重命名所有 .backup 文件"
- "监控 dotfiles 目录变化"
- "查找包含 TODO 的所有文件"

---

### 2. 🐙 GitHub MCP
**功能**: GitHub 仓库操作
- 创建和管理 Pull Requests
- 查看和操作 Issues
- 检查 CI/CD 状态
- 仓库搜索和分析

**配置**:
```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "env": {
    "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_TOKEN}"
  }
}
```

**环境变量**: 
- `GITHUB_TOKEN` 在 `~/.zshrc` 中配置

**应用场景**:
- "创建 PR 合并这些改动到 main 分支"
- "查看 macos-personal-config 仓库的最近 Issues"
- "检查最新 commit 的 CI 状态"

---

### 3. 🧠 Memory MCP
**功能**: 持久化记忆和上下文管理
- 跨会话记住用户偏好
- 记录常用命令和配置模式
- 提高对话连贯性
- 知识图谱构建

**配置**:
```json
"memory": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-memory"]
}
```

**应用场景**:
- "记住我的 Python 项目总是用 venv + pip"
- "我的 Git 提交风格是 Conventional Commits"
- 自动记忆常用配置路径和模式

---

## 安装说明

### 全局安装（已完成）
```bash
npm install -g \
  @modelcontextprotocol/server-filesystem \
  @modelcontextprotocol/server-github \
  @modelcontextprotocol/server-memory
```

### 验证安装
```bash
npm list -g --depth=0 | grep modelcontextprotocol
```

---

## 安全注意事项

⚠️ **GitHub Token 安全**:
- Token 存储在 `~/.zshrc` 中，**不要提交到 Git**
- 在新机器上需要手动配置 `GITHUB_TOKEN` 环境变量
- 可以通过 `gh auth token` 获取当前 token

---

## 使用示例

### Filesystem MCP
```
"帮我把所有 .js 文件中的 console.log 替换为 logger.debug"
"查找所有包含 TODO 的文件并生成清单"
"批量重命名 src/ 目录下的 .jsx 文件为 .tsx"
```

### GitHub MCP
```
"查看我的所有未关闭的 Issues"
"创建一个 PR，标题是 'feat: add MCP services'"
"检查最近的 commit 是否通过了 CI"
```

### Memory MCP
```
"记住我喜欢用 pnpm 而不是 npm"
"记住这个项目的数据库连接字符串格式"
"我的代码风格偏好是什么？"
```

---

## 故障排除

### MCP 服务启动失败
```bash
# 检查服务是否正确安装
npx -y @modelcontextprotocol/server-filesystem --help

# 检查 GitHub Token
echo $GITHUB_TOKEN

# 重新加载 shell 配置
source ~/.zshrc
```

### GitHub MCP 认证失败
```bash
# 验证 GitHub 认证
gh auth status

# 重新登录
gh auth login
```

---

## 更新日期
2026-01-30
