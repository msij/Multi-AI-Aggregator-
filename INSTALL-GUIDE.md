# Multi AI Aggregator 技能 - 完整安装指南

## 📦 安装方法

### 方法1: ZIP包安装（推荐）

1. **下载完整包**
   - 文件名: `multi-ai-aggregator-complete.zip`
   - 大小: 25KB
   - 包含所有必需文件

2. **解压安装**
```bash
# 解压到指定目录
unzip multi-ai-aggregator-complete.zip -d /tmp/multi-ai-aggregator

# 移动到技能目录
sudo cp -r /tmp/multi-ai-aggregator/* /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/

# 进入技能目录
cd /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/

# 安装依赖
pip3 install -r requirements.txt

# 测试安装
python3 test_skill.py
```

### 方法2: 快速安装脚本

```bash
# 运行快速安装脚本
curl -s https://raw.githubusercontent.com/your-username/multi-ai-aggregator-skill/quick-install.sh | bash
```

### 方法3: 手动安装

```bash
# 创建技能目录
sudo mkdir -p /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator

# 复制文件
sudo cp -r ./* /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/

# 安装依赖
pip3 install -r /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/requirements.txt

# 测试安装
cd /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/
python3 test_skill.py
```

## 🚀 使用方法

### 基本使用

```bash
# 查询多个AI模型
python3 main.py query "如何提高工作效率？"

# 指定模型
python3 main.py query "Python编程最佳实践" --models 豆包,千问

# 启动Web界面
python3 main.py web
# 访问: http://localhost:5000

# 查看历史记录
python3 main.py history

# 测试连接
python3 main.py test

# 查看帮助
python3 main.py --help
```

### OpenClaw集成

```bash
# 使用OpenClaw命令
openclaw multi-ai-aggregator query "如何提高工作效率？"
openclaw multi-ai-aggregator web
openclaw multi-ai-aggregator --help
```

## 🌟 技能特性

- 🔥 **多模型聚合**: 同时查询豆包、千问、元宝等AI平台
- 🌐 **网页自动化**: 自动化登录和访问各AI平台
- 📊 **智能整合**: 按质量和速度排序结果
- 🖥️ **Web界面**: 提供直观的查询界面
- 💻 **命令调用**: 支持命令行和对话交互
- ⚡ **并发处理**: 高效的异步查询机制
- 📝 **历史记录**: 自动保存查询结果
- 🔧 **配置灵活**: 可自定义AI模型和参数

## ⚙️ 配置文件

编辑 `config/multi-ai-aggregator.yaml`:

```yaml
# 基础配置
timeout: 30
max_retries: 3
delay_between: 2

# AI模型配置
models:
  豆包:
    enabled: true
    url: "https://www.doubao.com"
    element: "textarea.input-box"
    response_class: "div.response-box"
    weight: 1.0
  千问:
    enabled: true
    url: "https://qianwen.aliyun.com"
    element: "textarea.chat-input"
    response_class: "div.message-content"
    weight: 1.0
  元宝:
    enabled: true
    url: "https://api.yuanbao168.com/v1/chat"
    method: "POST"
    response_key: "answer"
    weight: 1.0

# 输出配置
output_format: "combined"  # combined / comparison / individual
save_results: true
result_dir: "./results"

# 界面配置
web_port: 5000
web_host: "localhost"
```

## 🔧 系统要求

### 必需软件
- Python 3.7+
- pip3

### 可选软件
- Chrome/Chromium 浏览器（用于网页自动化）
- ChromeDriver（用于网页自动化）

### 安装依赖
```bash
pip3 install selenium requests beautifulsoup4 lxml PyYAML aiohttp flask flask-cors
```

## 📊 输出示例

### 查询结果
```
🤖 开始查询多个AI模型...
✅ 查询完成，获得3个回答:

【豆包】
提高工作效率的方法包括时间管理、任务分解、工具使用等...

【千问】
效率提升的7个关键点：1. 设定明确目标；2. 优先级排序...

【元宝】
商业角度的高效工作建议：自动化重复任务...

🤖 整合结果:
[整合后的综合答案]
```

## 🚨 注意事项

### 使用限制
- 🚫 **法律风险**: 遵守各AI平台的使用条款
- ⚠️ **技术风险**: 网页结构变化可能导致抓取失败
- 🔒 **隐私安全**: 不要输入个人敏感信息
- 🔄 **维护**: 定期更新和维护以保持兼容性

### 故障排除

1. **依赖安装失败**
```bash
pip3 install --upgrade pip
pip3 install -r requirements.txt
```

2. **浏览器访问失败**
```bash
# 检查浏览器版本
google-chrome --version

# 更新ChromeDriver
brew upgrade chromedriver
```

3. **调试模式**
```bash
python3 main.py --debug query "测试问题"
```

## 📞 技术支持

如果遇到问题，请检查：
1. Python版本是否 >= 3.7
2. 依赖包是否正确安装
3. 网络连接是否正常
4. 浏览器版本是否兼容

## 🎯 快速开始

```bash
# 1. 安装
unzip multi-ai-aggregator-complete.zip
cd multi-ai-aggregator
pip3 install -r requirements.txt

# 2. 测试
python3 test_skill.py

# 3. 使用
python3 main.py query "如何提高工作效率？"
```

---

**版本**: 1.0.0  
**最后更新**: 2024-02-26  
**作者**: OpenClaw Community