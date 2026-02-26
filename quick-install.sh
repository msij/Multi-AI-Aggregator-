#!/bin/bash
# Multi AI Aggregator 快速安装脚本

set -euo pipefail

echo "🤖 Multi AI Aggregator 快速安装脚本"
echo "===================================="

# 检查Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 未安装，请先安装 Python3"
    exit 1
fi

# 检查pip
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 未安装，请先安装 pip3"
    exit 1
fi

echo "📥 安装Python依赖..."
pip3 install selenium requests beautifulsoup4 lxml PyYAML aiohttp flask flask-cors

echo "📦 创建技能目录..."
mkdir -p /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator

# 如果有ZIP文件，解压
if [ -f "multi-ai-aggregator-complete.zip" ]; then
    echo "📂 解压技能包..."
    unzip -q multi-ai-aggregator-complete.zip -d /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/
    rm -rf /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/__MACOSX 2>/dev/null || true
else
    echo "📂 手动复制文件..."
    # 这里需要手动复制文件
    echo "请手动将以下文件复制到 /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/ 目录："
    echo "  - SKILL.md"
    echo "  - main.py"
    echo "  - README.md"
    echo "  - requirements.txt"
    echo "  - install.sh"
    echo "  - config/multi-ai-aggregator.yaml"
    echo "  - lib/ai_aggregator.py"
    echo "  - lib/web_interface.py"
    echo ""
    echo "或者你可以直接从以下地址下载完整包："
    echo "  multi-ai-aggregator-complete.zip"
fi

# 创建可执行文件
echo "🔗 创建可执行文件..."
chmod +x /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/main.py

# 创建符号链接
if [ ! -L "/usr/local/bin/openclaw-multi-ai-aggregator" ]; then
    ln -sf "/usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/main.py" /usr/local/bin/openclaw-multi-ai-aggregator
    echo "✅ 创建命令行工具: /usr/local/bin/openclaw-multi-ai-aggregator"
fi

# 测试安装
echo "🧪 测试安装..."
cd /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator
python3 test_skill.py

echo ""
echo "✅ 安装完成！"
echo ""
echo "📖 使用方法:"
echo "  python3 main.py query \"如何提高工作效率？\""
echo "  python3 main.py web"
echo "  python3 main.py --help"
echo ""
echo "🔗 或使用OpenClaw命令:"
echo "  openclaw multi-ai-aggregator query \"如何提高工作效率？\""
echo "  openclaw multi-ai-aggregator web"