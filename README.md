# Git GitHub 仓库自动补全工具

## 功能说明
本工具为Git命令添加GitHub仓库URL的Tab自动补全功能，当输入部分GitHub仓库URL时，按Tab键可自动补全完整的仓库URL。

## 安装方法

1. 确保已安装依赖：
```bash
sudo apt-get install -y bash-completion jq
```

2. 运行安装脚本：
```bash
sudo ./install.sh
```

3. 重新加载bash配置：
```bash
source ~/.bashrc
```

## 配置方法

1. 编辑配置文件：
```bash
vim ~/.git-gh-complete.conf
```

2. 取消注释并设置GitHub Token（推荐）：
```bash
GITHUB_TOKEN="your_personal_access_token"
```

3. 其他可选配置：
- RATE_LIMIT_WARN: API速率限制警告阈值
- MAX_REPOS: 每次补全返回的最大仓库数
- DEBUG: 启用调试输出

## 使用方法

1. 基本使用：
```bash
git clone https://github.com/<用户名>/<仓库前缀><按Tab键>
```

2. 示例：
```bash
git clone https://github.com/linuxdeepin/dde<按Tab>
# 可能显示：
# dde-dock/    dde-session-shell/    dde-shell/
```

## 注意事项

1. 需要联网访问GitHub API
2. GitHub API有速率限制：
   - 未认证: 60请求/小时
   - 使用Token: 5000请求/小时
3. 仅支持GitHub仓库的clone操作
4. 敏感配置（如Token）存储在~/.git-gh-complete.conf

## 卸载方法

1. 删除补全脚本：
```bash
sudo rm /etc/bash_completion.d/git-gh-complete
```

2. 从~/.bashrc中删除相关行
