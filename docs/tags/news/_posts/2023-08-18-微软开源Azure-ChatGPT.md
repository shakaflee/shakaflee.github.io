---
layout: post
title: 微软开源Azure ChatGPT
date: 2023-08-18 06:03:00 +0800
excerpt: 专为企业打造的安全版ChatGPT
tag: news
cover: /assets/images/posts/100091.png
description: 微软开源Azure ChatGPT！专为企业打造的安全版ChatGPT
permalink: /100091
---


# 微软开源Azure ChatGPT



ChatGPT在全球火爆出圈后，数据安全、用户隐私等难题成为其实现场景化落地、技术发展的绊脚石。多数企业希望将ChatGPT应用在实际业务中，但碍于数据安全一直处于犹豫、观望状态。

现在，为了帮助企业安全、可靠地在业务流程中应用ChatGPT，微软开源了Azure ChatGPT。（开源地址：https://github.com/imartinez2/azurechatgpt）

Azure ChatGPT的功能与ChatGPT基本一样，支持各种文本/代码生成、提取摘要、总结文本等。其最大亮点是支持企业本地部署（底层还需用到微软Azure云），数据、网络通信完全由企业自己把控，实现内部闭环使用避免将核心数据泄露给外部机构。

注意：微软此前的https://github.com/microsoft/azurechatgpt链接已经下架，上面是备用链接。


> Azure ChatGPT简单介绍

保护企业数据的绝对安全，是微软推出Azure ChatGPT的最大初衷。

数据隐私：Azure ChatGPT内置数据隐私保护功能，并且不会与OpenAI分享任何数据。

网络控制：Azure ChatGPT提供更精细的网络流量控制，可以在内部网络中使用，并通过企业级安全协议进行增强。

也就是说，可以不使用公共网络传输数据，避免将数据泄露给第三方机构。

支持微调：企业可以通过自有数据，例如，法律、销售、医疗等对Azure ChatGPT进行微调，更好地贴合实际业务实现更大的商业价值。


技术方面，Azure ChatGPT使用了以下技术进行构建。

Node.js 18：开源、跨平台的JavaScript运行时环境。

Next.js 13：使用户能够通过扩展最新的React功能，以创建全栈 Web 应用程序。

NextAuth.js：Next.js13的可配置身份验证框架。

LangChain JS：构建AI应用程序的人工智能编排层。

AI SDK开源库：可简化在Next.js和JavaScript上构建对话式UI。

Tailwind CSS：是一个实用程序优先的 CSS 框架，提供了一系列预定义的类，可用于通过混合和匹配来设置每个元素的样式。

shadcn/ui：使用 Radix UI 和 Tailwind CSS 构建的可重用组件。

Azure Cosmos DB：用于存储聊天历史记录的完全托管平台即服务 (PaaS) NoSQL 数据库

Azure应用服务：完全托管的PaaS平台，用于托管 Web 应用程序、REST API和移动后端。