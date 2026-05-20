# DeepSeek WeChat Roleplay

基于 [CowAgent](https://github.com/zhayujie/CowAgent) 引擎的 AI 角色扮演机器人，接入**企业微信智能机器人**，使用 **DeepSeek** 模型，支持长期记忆、知识库、技能系统等 Agent 能力。

## 功能特性

- **角色扮演** — 自定义角色设定，可针对不同群聊配置不同角色
- **长期记忆** — 自动记忆对话内容，支持关键词/向量检索，记得你是谁
- **知识库** — 自动整理结构化知识，构建知识图谱
- **技能系统** — 支持安装和自定义技能（联网搜索、图片生成等）
- **企业微信接入** — WebSocket 长连接，无需公网 IP
- **多模型支持** — DeepSeek V4、MiniMax、Claude、Gemini 等

## 快速开始

### 1. 环境准备

- Python 3.7 ~ 3.13
- 企业微信智能机器人（长连接模式）

### 2. 安装依赖

```bash
pip install -r requirements.txt
pip install -r requirements-optional.txt   # 推荐
```

### 3. 配置密钥

本项目使用**环境变量**管理密钥，不会将密钥提交到 GitHub。

复制 `.env.template` 为 `.env`，填入你的密钥：

```bash
copy .env.template .env
```

编辑 `.env` 文件：

```env
# DeepSeek API Key（必需）
DEEPSEEK_API_KEY=sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# 企业微信智能机器人凭证（必需）
WECOM_BOT_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
WECOM_BOT_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

**如何获取？**
- DeepSeek API Key：[DeepSeek 平台](https://platform.deepseek.com/api_keys)
- 企业微信智能机器人：企业微信后台 → 新建智能机器人 → 选择"长连接模式"

### 4. 运行

双击 `start.bat`，或在终端执行：

```bash
python app.py
```

启动后可在 Web 控制台 `http://localhost:9899` 管理模型、记忆、通道等。

## 角色配置

角色设定文件存放在 `wrokSpace/` 目录中，可通过 Agent 系统自动管理。如需预设角色，修改 `wrokSpace/` 下的系统提示词文件。

## 项目结构

```
E:.
├── app.py                    # 主入口
├── config.py                 # 配置模块
├── config.json               # 基本配置（不含密钥）
├── .env                      # 密钥配置（不提交到 Git）
├── .env.template             # 密钥配置模板
├── start.bat                 # Windows 启动脚本
├── agent/                    # Agent 引擎
├── channel/                  # 消息通道
├── common/                   # 通用工具
├── plugins/                  # 插件系统
└── wrokSpace/                # 工作空间（记忆、知识库、技能）
```

## 密钥安全

- `.env` 已加入 `.gitignore`，不会提交到仓库
- `config.json` 中不包含任何 API 密钥
- 系统启动时，环境变量会覆盖 `config.json` 中的对应配置

支持的密钥环境变量：

| 环境变量 | 对应配置 | 说明 |
|---------|---------|------|
| `DEEPSEEK_API_KEY` | deepseek_api_key | DeepSeek API 密钥 |
| `WECOM_BOT_ID` | wecom_bot_id | 企微机器人 Bot ID |
| `WECOM_BOT_SECRET` | wecom_bot_secret | 企微机器人 Secret |
| `MODEL` | model | 模型名称（可选） |

## 相关文档

- [CowAgent 官方文档](https://docs.cowagent.ai/)
- [CowAgent GitHub](https://github.com/zhayujie/CowAgent)
