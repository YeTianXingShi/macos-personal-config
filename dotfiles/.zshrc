# =============================================================================
# Zsh Configuration File
# 完整优化版 - Optimized by Sisyphus
# =============================================================================

# -----------------------------------------------------------------------------
# 1. Environment Variables & Path (环境变量与路径)
# -----------------------------------------------------------------------------

# 🔧 Homebrew 环境变量 (CRITICAL - 必须在最前面)
eval "$(/opt/homebrew/bin/brew shellenv)"

# 🐍 Python 路径
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"

# 📦 Node.js 路径
export PATH="/opt/homebrew/opt/node@24/bin:$PATH"

# 🤖 OpenCode CLI
export PATH="/Users/xiangzhen/.opencode/bin:$PATH"

# 👤 用户本地二进制文件
export PATH="/Users/xiangzhen/.local/bin:$PATH"

# 📂 XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# 🌍 Locale 设置
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# 📜 历史记录优化
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$HOME/.zsh_history"
setopt SHARE_HISTORY           # 多个终端共享历史
setopt HIST_IGNORE_DUPS        # 忽略重复命令
setopt HIST_IGNORE_SPACE       # 忽略以空格开头的命令

# 🔧 默认编辑器
if command -v micro > /dev/null 2>&1; then
    export EDITOR='micro'
else
    export EDITOR='vim'
fi

# -----------------------------------------------------------------------------
# 2. Tool Initialization (工具初始化)
# -----------------------------------------------------------------------------

# --- Zoxide (智能目录跳转) ---
if command -v zoxide > /dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# --- Fzf (模糊查找神器) ---
if command -v fzf > /dev/null 2>&1; then
    # 键绑定 (Ctrl+R 历史搜索, Ctrl+T 文件搜索)
    [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
    # 自动补全
    [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# Fzf 默认选项 - 预览功能
if command -v bat > /dev/null 2>&1; then
    export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
else
    export FZF_DEFAULT_OPTS="--preview 'cat {}'"
fi

# Fzf 搜索命令 (排除 .git 和 node_modules)
export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/.git/*' -not -path '*/node_modules/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# -----------------------------------------------------------------------------
# 3. Aliases (别名设置)
# -----------------------------------------------------------------------------

# --- Navigation & Listing (导航与列表) ---
if command -v zoxide > /dev/null 2>&1; then
    alias cd="z"
fi

# Eza 替换 ls (更现代的文件列表)
if command -v eza > /dev/null 2>&1; then
    alias ls="eza --icons"
    alias ll="eza -lh --icons --git"   # 列表 + Git 状态
    alias la="eza -lah --icons --git"  # 包含隐藏文件
    alias tree="eza --tree --icons"    # 树状图
else
    alias ll="ls -lh"
    alias la="ls -lah"
fi

# Bat 替换 cat (带语法高亮)
if command -v bat > /dev/null 2>&1; then
    alias cat="bat"
fi

# --- Editors (编辑器) ---
if command -v micro > /dev/null 2>&1; then
    alias vi='micro'
    alias vim='micro'
fi

# --- Shortcuts (快捷命令) ---
alias vz="vim ~/.zshrc"         # 快速编辑配置
alias sz="source ~/.zshrc"      # 快速重载配置

# --- Git 快捷方式 ---
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gd="git diff"

# --- 系统工具 ---
alias cls="clear"               # 清屏
alias ..="cd .."                # 快速返回上级目录
alias ...="cd ../.."
alias ....="cd ../../.."

# --- 开发工具快捷方式 ---
alias python="python3"          # Python 主命令 (兼容性)
alias py="python3"              # Python 快捷方式
alias pip="pip3"                # pip 主命令 (兼容性)
alias ipy="python3 -m IPython"  # IPython (如果安装)
alias serve="python3 -m http.server"  # 快速 HTTP 服务器

# -----------------------------------------------------------------------------
# 4. Additional Settings (额外设置)
# -----------------------------------------------------------------------------

# 自动 cd (输入目录名直接跳转)
setopt AUTO_CD

# 更智能的补全
autoload -Uz compinit && compinit

# 大小写不敏感的补全
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# 补全菜单
zstyle ':completion:*' menu select

# 颜色支持
autoload -U colors && colors
