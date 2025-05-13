#!/bin/bash

# 检查是否为root用户
if [ "$(id -u)" -ne 0 ]; then
    echo "请使用sudo运行此脚本"
    exit 1
fi

# 复制补全脚本
echo "安装git-gh-complete补全脚本..."
cp git-gh-complete /etc/bash_completion.d/
chmod +x /etc/bash_completion.d/git-gh-complete

# 添加到bashrc
echo "配置自动加载..."
if ! grep -q "source /etc/bash_completion.d/git-gh-complete" ~/.bashrc; then
    echo "source /etc/bash_completion.d/git-gh-complete" >> ~/.bashrc
fi

# 立即生效
source /etc/bash_completion.d/git-gh-complete

echo "安装完成！现在可以尝试: git clone https://github.com/<用户>/<仓库前缀><按Tab>"
