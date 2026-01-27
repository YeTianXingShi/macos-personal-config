# =============================================================================
# Zsh Configuration File
# 优化布局 - Organized by Sisyphus
# =============================================================================

# -----------------------------------------------------------------------------
# 1. Environment Variables & Path (环境变量与路径)
# -----------------------------------------------------------------------------
# 确保 Homebrew 和 Node.js 路径优先
export PATH="/opt/homebrew/opt/node@24/bin:$PATH"
export PATH="/Users/xiangzhen/.opencode/bin:$PATH"

# 默认编辑器设置 (如果你安装了 micro 或 vim)
if command -v micro >/dev/null 2>&1; then
    export EDITOR='micro'
else
    export EDITOR='vim'
fi

# -----------------------------------------------------------------------------
# 2. Tool Initialization (工具初始化)
# -----------------------------------------------------------------------------

# --- Zoxide (智能目录跳转) ---
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# --- Fzf (模糊查找神器) ---
# 加载官方脚本
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fzf 默认选项 - 预览功能
# 使用 Bat 进行预览，带有行号和颜色
if command -v bat >/dev/null 2>&1; then
    export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
else
    export FZF_DEFAULT_OPTS="--preview 'cat {}'"
fi

# Fzf 搜索命令
# 使用 find 过滤掉 .git 和 node_modules
export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/.git/*' -not -path '*/node_modules/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# -----------------------------------------------------------------------------
# 3. Aliases (别名设置)
# -----------------------------------------------------------------------------

# --- Navigation & Listing (导航与列表) ---
# Zoxide 接管 cd
if command -v zoxide >/dev/null 2>&1; then
    alias cd="z"
fi

# Eza 替换 ls (更现代的文件列表)
if command -v eza >/dev/null 2>&1; then
    alias ls="eza --icons"
    alias ll="eza -lh --icons --git"   # 列表 + Git状态
    alias tree="eza --tree --icons"    # 树状图
else
    alias ll="ls -lh"
fi

# Bat 替换 cat (带高亮的文件查看)
if command -v bat >/dev/null 2>&1; then
    alias cat="bat"
fi

# --- Editors (编辑器) ---
# 仅当安装了 micro 时才映射，避免命令不存在错误
if command -v micro >/dev/null 2>&1; then
    alias vi='micro'
    alias vim='micro'
fi

# --- Shortcuts (快捷命令) ---
alias vz="vim ~/.zshrc"    # 快速编辑配置 (使用系统默认 vim，或者上面的别名)
alias sz="source ~/.zshrc" # 快速生效配置
