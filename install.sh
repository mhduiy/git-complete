#!/bin/bash

# 复制补全脚本到系统目录（需要sudo）
echo "安装git-gh-complete补全脚本..."
sudo cp git-gh-complete /etc/bash_completion.d/
sudo chmod +x /etc/bash_completion.d/git-gh-complete

# 创建配置文件（当前用户目录）
CONFIG_FILE="$HOME/.git-gh-complete.conf"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "创建示例配置文件: $CONFIG_FILE"
    cp git-gh-complete.conf.example "$CONFIG_FILE" || {
        echo "错误: 无法创建配置文件 $CONFIG_FILE" >&2
        exit 1
    }
    chmod 600 "$CONFIG_FILE"
    echo "请编辑 $CONFIG_FILE 并设置您的GitHub Token"
else
    echo "配置文件已存在: $CONFIG_FILE"
fi

# 添加到bashrc
echo "配置自动加载..."
if ! grep -q "source /etc/bash_completion.d/git-gh-complete" ~/.bashrc; then
    echo "source /etc/bash_completion.d/git-gh-complete" >> ~/.bashrc
    echo "已添加到 ~/.bashrc"
fi

# 立即生效
source /etc/bash_completion.d/git-gh-complete 2>/dev/null || {
    echo "请重新打开终端或运行: source ~/.bashrc"
}

echo "安装完成！现在可以尝试: git clone https://github.com/<用户>/<仓库前缀><按Tab>"
