# Multi AI Aggregator (多AI模型聚合)

[![Python](https://img.shields.io/badge/Python-3.7+-blue.svg)](https://python.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-orange.svg)](#)
[![Status](https://img.shields.io/badge/Status-Stable-brightgreen.svg)](#)

[![中文](https://img.shields.io/badge/Language-中文-red.svg)](README.md) 
[![English](https://img.shields.io/badge/Language-English-blue.svg)](README.en.md)

---

🤖 一个强大的OpenClaw技能，支持同时调用豆包、千问、元宝等多个AI模型，智能整合回答结果。

## 🚀 核心特性

| 特性 | 描述 |
|------|------|
| 🔥 **多模型聚合** | 同时查询豆包、千问、元宝等AI平台 |
| 🌐 **网页自动化** | 自动化登录和访问各AI平台 |
| 📊 **智能整合** | 按质量和速度排序结果 |
| 🖥️ **Web界面** | 提供直观的查询界面 |
| 💻 **命令调用** | 支持命令行和对话交互 |
| ⚡ **并发处理** | 高效的异步查询机制 |
| 📝 **历史记录** | 自动保存查询结果 |
| 🔧 **配置灵活** | 可自定义AI模型和参数 |

## 📦 快速安装

### 环境要求

- **Python**: 3.7+
- **pip**: 包管理器
- **Chrome/Chromium**: 可选（用于网页自动化）

### 安装步骤

#### 方法1: 一键安装（推荐）

```bash
# 下载并运行快速安装脚本
curl -s https://raw.githubusercontent.com/your-username/multi-ai-aggregator-skill/quick-install.sh | bash
```

#### 方法2: ZIP包安装

```bash
# 1. 下载完整包
wget https://github.com/your-username/multi-ai-aggregator-skill/releases/download/v1.0.0/multi-ai-aggregator-complete.zip

# 2. 解压
unzip multi-ai-aggregator-complete.zip

# 3. 进入目录
cd multi-ai-aggregator

# 4. 安装依赖
pip3 install -r requirements.txt

# 5. 测试安装
python3 test_skill.py
```

#### 方法3: Git克隆

```bash
# 克隆仓库
git clone https://github.com/your-username/multi-ai-aggregator-skill.git
cd multi-ai-aggregator-skill

# 安装依赖
pip3 install -r requirements.txt

# 测试安装
python3 test_skill.py
```

## 🎯 使用方法

### 基本用法

```bash
# 查询多个AI模型
python3 main.py query "如何提高工作效率？"

# 指定查询的AI模型
python3 main.py query "Python编程最佳实践" --models 豆包,千问

# 启动Web界面
python3 main.py web
# 访问: http://localhost:5000

# 查看历史记录
python3 main.py history

# 测试连接
python3 main.py test

# 清除缓存
python3 main.py clear

# 查看配置
python3 main.py config

# 版本信息
python3 main.py version

# 帮助信息
python3 main.py --help
```

### OpenClaw集成

```bash
# 使用OpenClaw命令
openclaw multi-ai-aggregator query "如何提高工作效率？"
openclaw multi-ai-aggregator web
openclaw multi-ai-aggregator --help
```

### Web界面使用

1. 启动Web界面：`python3 main.py web`
2. 浏览器访问：`http://localhost:5000`
3. 输入问题并选择AI模型
4. 查看实时查询结果

### 对话交互（OpenClaw）

```
你: 用多个AI帮我分析这个项目前景
OpenClaw: 🤖 正在同时查询豆包、千问、元宝AI模型...
[获得三个AI的分析结果]

你: 把这些分析整合一下
OpenClaw: 📊 整合完成！以下是综合分析...
```

## ⚙️ 配置详解

### 配置文件结构

编辑 `config/multi-ai-aggregator.yaml`：

```yaml
# 基础配置
timeout: 30                    # 请求超时时间（秒）
max_retries: 3                 # 最大重试次数
delay_between: 2               # 模型间延迟（秒）

# AI模型配置
models:
  豆包:
    enabled: true              # 是否启用此模型
    url: "https://www.doubao.com"  # 模型URL
    element: "textarea.input-box"   # 输入框CSS选择器
    response_class: "div.response-box"  # 回答区域CSS选择器
    weight: 1.0                # 权重（用于结果排序）
    description: "擅长中文创作、对话"
  
  千问:
    enabled: true
    url: "https://qianwen.aliyun.com"
    element: "textarea.chat-input"
    response_class: "div.message-content"
    weight: 1.0
    description: "技术问题、代码生成"
  
  元宝:
    enabled: true
    url: "https://api.yuanbao168.com/v1/chat"
    method: "POST"             # API请求方法
    response_key: "answer"     # API响应字段
    weight: 1.0
    description: "商业分析、文案创作"

# 输出配置
output_format: "combined"       # 输出格式：combined/comparison/individual
save_results: true             # 是否保存结果
result_dir: "./results"        # 结果保存目录

# 界面配置
web_port: 5000                 # Web界面端口
web_host: "localhost"          # Web界面主机
```

### 环境变量配置

```bash
# 无头模式（推荐用于服务器环境）
export AI_BROWSER_HEADLESS=1

# 超时设置
export AI_TIMEOUT=30

# 最大重试次数
export AI_MAX_RETRIES=3

# 日志级别
export AI_LOG_LEVEL=INFO
```

## 📊 输出格式详解

### 整合格式 (combined)

```bash
🤖 开始查询多个AI模型...
✅ 查询完成，获得3个回答:

【豆包】
提高工作效率的方法包括时间管理、任务分解、工具使用等...
* 建议：使用番茄工作法，合理规划时间
* 推荐：使用任务管理软件

【千问】
效率提升的7个关键点：
1. 设定明确目标
2. 优先级排序（四象限法则）
3. 减少 multitasking
4. 定期休息
5. 使用自动化工具
6. 学会说"不"
7. 持续学习

【元宝】
商业角度的高效工作建议：
• 自动化重复任务：使用RPA工具
• 流程优化：BPR方法
• 团队协作：项目管理工具
• 数据分析：基于决策的工作方式

🤖 整合结果:
[整合后的综合答案，包含各模型的精华内容]
```

### 对比格式 (comparison)

```bash
=== 豆包 ===
提高工作效率的方法包括时间管理、任务分解、工具使用等...

=== 千问 ===
效率提升的7个关键点：1. 设定明确目标；2. 优先级排序...

=== 元宝 ===
商业角度的高效工作建议：自动化重复任务...
```

### 单独格式 (individual)

```bash
1. 【豆包】
   响应时间: 5.2秒
   回答: 提高工作效率的方法包括...

2. 【千问】   响应时间: 4.8秒
   回答: 效率提升的7个关键点...

3. 【元宝】
   响应时间: 3.5秒
   回答: 商业角度的高效工作建议...
```

## 🛠️ 系统要求

### 必需软件

```bash
# Python 3.7+
python3 --version

# pip3
pip3 --version
```

### 依赖包安装

```bash
# 基础依赖
pip3 install selenium requests beautifulsoup4 lxml PyYAML aiohttp flask flask-cors

# 开发依赖（可选）
pip3 install pytest black flake8 mypy
```

### 可选软件（网页自动化）

```bash
# macOS
brew install --cask google-chrome
brew install chromedriver

# Ubuntu
sudo apt-get install google-chrome-stable
sudo apt-get install chromium-chromedriver
```

### Docker支持

```bash
# 构建Docker镜像
docker build -t multi-ai-aggregator .

# 运行Docker容器
docker run -p 5000:5000 multi-ai-aggregator
```

## 🔧 高级功能

### 批量查询

```bash
# 批量查询多个问题
cat > questions.txt << EOF
如何提高工作效率？
Python编程最佳实践
市场分析报告
创业项目建议
EOF

python3 -c "
import asyncio
from main import MultiAIAggregatorSkill

async def batch_query():
    skill = MultiAIAggregatorSkill()
    with open('questions.txt', 'r', encoding='utf-8') as f:
        questions = f.readlines()
    
    for question in questions:
        question = question.strip()
        if question:
            result = await skill.query_ai_models(question)
            print(f'问题: {question}')
            print(f'结果: {result.get(\"combined_result\", \"\")[:200]}...')
            print('-' * 50)

asyncio.run(batch_query())
"
```

### 结果分析

```bash
# 分析查询结果
python3 -c "
import json
from datetime import datetime

def analyze_results(filename):
    with open(filename, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    print(f'问题: {data[\"query\"]}')
    print(f'时间: {datetime.fromtimestamp(data[\"timestamp\"])}')
    print(f'模型: {\", \".join(data[\"models\"])}')
    print(f'成功数: {len([r for r in data[\"responses\"] if r[\"status\"] == \"success\"])}')
    print(f'总响应时间: {sum(r[\"response_time\"] for r in data[\"responses\"]):.1f}秒')

analyze_results('results/query_1234567890.json')
"
```

### 自定义模型

```python
# 添加自定义AI模型
from main import MultiAIAggregatorSkill

class CustomMultiAIAggregator(MultiAIAggregatorSkill):
    def query_custom_model(self, query: str):
        """实现自定义模型查询逻辑"""
        # 这里添加自定义模型的实现
        pass
    
    async def query_multiple_models(self, query: str, models: list):
        # 添加自定义模型
        if "自定义模型" in models:
            await self.query_custom_model(query)
        
        return await super().query_multiple_models(query, models)
```

## 🐛 故障排除

### 常见问题及解决方案

#### 1. 依赖安装失败

```bash
# 更新pip
pip3 install --upgrade pip

# 重新安装依赖
pip3 install -r requirements.txt

# 使用国内镜像源
pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/
```

#### 2. 浏览器访问失败

```bash
# 检查浏览器版本
google-chrome --version

# 检查ChromeDriver版本
chromedriver --version

# 更新ChromeDriver
# macOS
brew upgrade chromedriver

# Ubuntu
sudo apt-get update
sudo apt-get install chromium-chromedriver
```

#### 3. 网页元素定位失败

```bash
# 检查页面结构
# 1. 打开浏览器开发者工具 (F12)
# 2. 切换到 Elements 标签
# 3. 找到输入框和回答区域的CSS选择器
# 4. 更新配置文件中的选择器

# 示调试命令
python3 -c "
from selenium import webdriver
driver = webdriver.Chrome()
driver.get('https://www.doubao.com')
input_element = driver.find_element('css selector', 'textarea.input-box')
print(f'输入框定位: {input_element.tag_name}')
driver.quit()
"
```

#### 4. 网络连接问题

```bash
# 测试网络连接
ping www.doubao.com
ping qianwen.aliyun.com

# 设置代理（如果需要）
export HTTP_PROXY=http://proxy.example.com:8080
export HTTPS_PROXY=http://proxy.example.com:8080
```

### 调试模式

```bash
# 开启调试模式
python3 main.py --debug query "测试问题"

# 详细日志
export AI_LOG_LEVEL=DEBUG
python3 main.py query "测试问题"

# 查看日志文件
tail -f /usr/local/lib/node_modules/openclaw/skills/multi-ai-aggregator/multi_ai_aggregator.log
```

### 性能优化

```bash
# 调整并发数
export AI_CONCURRENT_LIMIT=2

# 增加超时时间
export AI_TIMEOUT=60

# 启用缓存
export AI_CACHE_ENABLED=1
```

## 📋 开发指南

### 项目结构

```
multi-ai-aggregator-skill/
├── README.md                 # 项目说明
├── SKILL.md                  # OpenClaw技能说明
├── LICENSE                   # MIT许可证
├── main.py                   # 技能主文件
├── requirements.txt          # 依赖包列表
├── test_skill.py            # 测试脚本
├── install.sh               # 安装脚本
├── .gitignore               # Git忽略文件
├── config/
│   └── multi-ai-aggregator.yaml  # 配置文件
├── lib/
│   ├── ai_aggregator.py     # 核心聚合工具
│   └── web_interface.py     # Web界面
└── results/                 # 结果存储目录
```

### 开发环境设置

```bash
# 克隆仓库
git clone https://github.com/your-username/multi-ai-aggregator-skill.git
cd multi-ai-aggregator-skill

# 创建虚拟环境
python3 -m venv venv
source venv/bin/activate

# 安装开发依赖
pip install -r requirements.txt
pip install pytest black flake8 mypy

# 运行测试
python3 -m pytest tests/

# 代码格式化
black .

# 代码检查
flake8 .
mypy .
```

### 添加新AI模型

1. **更新配置文件**:
```yaml
models:
  新模型:
    enabled: true
    url: "https://new-ai.example.com"
    element: "textarea.query"
    response_class: "div.response"
    weight: 1.0
    description: "新AI模型的描述"
```

2. **实现查询逻辑**:
```python
# 在 ai_aggregator.py 中添加
def query_new_model(self, query: str) -> AIResponse:
    try:
        # 实现具体的查询逻辑
        response = requests.post(
            "https://new-ai.example.com/api/chat",
            json={"query": query},
            timeout=self.config.get("timeout", 30)
        )
        
        if response.status_code == 200:
            result = response.json()
            return AIResponse(
                platform="新模型",
                response=result.get("answer", ""),
                timestamp=time.time(),
                status="success",
                response_time=3.0
            )
    except Exception as e:
        self.logger.error(f"新模型查询失败: {e}")
    
    return AIResponse(
        platform="新模型",
        response="",
        timestamp=time.time(),
        status="failed",
        response_time=0.0
    )
```

### 测试新模型

```bash
# 测试单个模型
python3 main.py test --models 新模型

# 查询测试
python3 main.py query "测试问题" --models 新模型
```

## 🤝 贡献指南

我们欢迎任何形式的贡献！

### 如何贡献

1. **Fork 本仓库**
2. **创建特性分支**: `git checkout -b feature/AmazingFeature`
3. **提交更改**: `git commit -m 'Add some AmazingFeature'`
4. **推送分支**: `git push origin feature/AmazingFeature`
5. **打开 Pull Request**

### 代码规范

- 使用 Black 进行代码格式化
- 遵循 PEP 8 编码规范
- 添加适当的注释和文档
- 编写测试用例

### 提交规范

```
feat: 新功能
fix: 修复bug
docs: 文档更新
style: 代码格式化
refactor: 代码重构
test: 测试相关
chore: 构建或辅助工具变动
```

## 📈 性能监控

### 查询性能统计

```python
# 查询性能分析
python3 -c "
import json
import os
from pathlib import Path

def analyze_performance():
    results_dir = Path('results')
    response_times = []
    
    for file in results_dir.glob('query_*.json'):
        with open(file, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        for resp in data.get('responses', []):
            response_times.append(resp['response_time'])
    
    if response_times:
        print(f'平均响应时间: {sum(response_times)/len(response_times):.2f}秒')
        print(f'最慢响应时间: {max(response_times):.2f}秒')
        print(f'最快响应时间: {min(response_times):.2f}秒')
        print(f'总查询次数: {len(response_times)}')

analyze_performance()
"
```

### 内存使用监控

```bash
# 监控内存使用
python3 -c "
import psutil
import os

process = psutil.Process(os.getpid())
memory_info = process.memory_info()
print(f'内存使用: {memory_info.rss / 1024 / 1024:.2f} MB')
"
```

## 📄 许可证

本项目基于 [MIT 许可证](LICENSE) 开源。

## 🤝 支持

- 📧 **提交 Issue**: [GitHub Issues](https://github.com/your-username/multi-ai-aggregator-skill/issues)
- 💬 **讨论**: [GitHub Discussions](https://github.com/your-username/multi-ai-aggregator-skill/discussions)
- 📖 **文档**: [Wiki](https://github.com/your-username/multi-ai-aggregator-skill/wiki)
- 🐛 **Bug报告**: [Bug Tracker](https://github.com/your-username/multi-ai-aggregator-skill/issues/new)

## 🌟 Star History

如果这个项目对你有帮助，请给它一个 Star ⭐

[![Star History](https://starchart.cc/your-username/multi-ai-aggregator-skill.svg)](https://starchart.cc/your-username/multi-ai-aggregator-skill)

## 📝 更新日志

### v1.0.0 (2024-02-26)
- 🎉 **初始版本发布**
- ✅ 支持豆包、千问、元宝三个AI模型
- ✅ 实现网页自动化和API调用
- ✅ 提供命令行和Web界面
- ✅ 支持结果智能整合
- ✅ 完善的配置管理系统
- ✅ 历史记录保存功能
- ✅ 完善的错误处理机制

### 计划中的功能
- [ ] 支持更多AI模型（ChatGPT、Claude等）
- [ ] 添加API密钥认证
- [ ] 实现结果质量评分
- [ ] 添加批量查询功能
- [ ] 支持多语言查询
- [ ] 添加缓存机制
- [ ] 移动端适配

---

**Made with ❤️ by [Your Name](https://github.com/your-username)**

<div align="center">

[![GitHub followers](https://img.shields.io/github/followers/your-username?style=social)](https://github.com/your-username)
[![Twitter](https://img.shields.io/twitter/follow/your-username?style=social)](https://twitter.com/your-username)

</div>
