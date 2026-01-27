# macOS Personal Configuration

这个项目用于存放个性化的 macOS Dotfiles 和应用列表。

为了确保安全性与透明度，本项目**不包含**自动执行脚本。请按照以下步骤手动检查并应用配置。

## 目录结构

- `apps/`: 应用安装列表 (`Brewfile`)
- `dotfiles/`: 配置文件 (例如 `.zshrc`)

## 手动配置指南

### 1. 安装 Homebrew & 应用

如果你还没有安装 [Homebrew](https://brew.sh/)，请先在终端运行官方安装命令：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

安装完成后，进入项目目录并安装 `apps/Brewfile` 中列出的所有软件：

```bash
cd /path/to/macos-personal-config
brew bundle --file=apps/Brewfile
```

### 2. 配置 Dotfiles

建议使用软链接将配置文件指向本仓库，这样你可以通过 Git 管理它们。

**配置 Zsh:**

```bash
# 1. (可选) 备份现有的 .zshrc
mv ~/.zshrc ~/.zshrc.backup

# 2. 创建软链接
ln -s $(pwd)/dotfiles/.zshrc ~/.zshrc

# 3. 重新加载配置
source ~/.zshrc
```

## 如何维护 Brewfile

当你在系统中手动安装或卸载了软件后，可以通过以下方式更新本项目中的 `Brewfile`：

### 方式一：自动导出当前系统配置 (推荐)

如果你希望 `Brewfile` 严格反映你当前系统安装的所有软件，可以使用 `dump` 命令覆盖现有的文件：

```bash
# 强制覆盖 apps/Brewfile (会备份旧文件)
brew bundle dump --force --file=apps/Brewfile
```

### 方式二：手动编辑

你也可以直接编辑 `apps/Brewfile` 文本文件。

- **添加软件**: 在文件中新增一行，例如 `brew "python"` 或 `cask "google-chrome"`。
- **删除软件**: 直接删除对应的行即可。

### 常用命令

*   `brew bundle check --file=apps/Brewfile`: 检查系统中是否缺失了 Brewfile 里列出的软件。
*   `brew bundle cleanup --file=apps/Brewfile`: (慎用) 卸载系统中存在但 Brewfile 中**没有**列出的软件。
