---
layout: post
title: 开源文本生成代码模型Code Llama发布
date: 2023-08-25 05:26:00 +0800
excerpt: 可商业化，最强开源文本生成代码模型
tag: news
cover: /assets/images/posts/100094.png
description: 可商业化，最强开源文本生成代码模型！Code Llama重磅发布
permalink: /100094
---


# 开源文本生成代码模型Code Llama发布



8月25日凌晨，全球社交、科技巨头Meta（Facebook、Instagram等母公司）在官网正式开源了，文本生成代码模型Code Llama。（开源地址：https://github.com/facebookresearch/codellama）

据悉，Code Llama是基于Meta前不久发布的，最强开源大语言模型Llama 2之上开发而成，提供基础代码、专门针对Python开发和基于自然语言指令微调的，70亿、130亿、340亿三种参数模型。允许企业、个人开发者使用此模型，进行商业化。

Meta表示，Code Llama在代码任务上的表现，优于目前所有开源代码模型。Code Llama支持 Python、C++、Java、PHP、Typescript (Javascript)、C#和Bash等主流编程语言，可根据自然文本或代码直接生成代码。


> Code Llama简单介绍

Code Llama是基于Llama 2大语言模型，再通过特定代码数据预训练、微调而成。除了支持文本或代码生成代码之外，还可用于代码的调试并支持目前所有主流开发语言。

Code Llama提供70亿、130亿和340亿三种参数模型，每个模型都使用了5000亿tokens代码数据训练而成。基础模型和指令模型经过了中间填充文本 (FIM) 功能的训练，允许将代码插入到现有代码中，这意味着它们可以支持开箱即用的代码完成任务。



Code Llama 模型提供了高达100,000 个上下文标记的稳定生成。所有模型均在 16,000 个标记的序列上进行训练，并在最多100,000 个标记的输入上显示出改进。

这意味着，开发人员在进行大型代码模型测试、调优时，可以将其全部输入到Code Llama中进行测试。


Code Llama还针对Python编程推出了Code Llama Python模型。是在 Python 代码的 1000亿标记上进行微调。

Python是代码生成方面最具基准测试的语言，并且Python 和 PyTorch 在AI 社区中发挥着重要作用，所以，推出了针对Python的代码模型。



Code Llama - Instruct 是 Code Llama 针对自然文本指令微调的模型，该模型支持自然文本输入和输出。

如果你想使用文本生成代码，Meta建议你使用该模型，因为Code Llama - Instruct已经过数据微调理解自然文本更好并且生成的代码更符合开发人员要求。



资源消耗方面，70亿参数模型可在单个GPU上运行。340亿参数模型可返回最佳结果并提供更好的编程辅助，但资源消耗更大。



所以，对于个人开发者、中小型企业来说，70亿、130亿参数的模型效率更高、资源消耗更少，适合低延迟的任务，例如，进行实时代码开发。

> Code Llama性能评测

为了针对现有解决方案测试 Code Llama 的性能，Meta使用了两个流行的编码基准：HumanEval 和 Mostly Basic Python 编程 (MBPP)。

HumanEval 测试模型根据文档字符串完成代码的能力，MBPP测试模型根据描述编写代码的能力。

测试结果显示，Code Llama的表现优于开源、特定代码的Llama，并且优于 Llama 2。例如，Code Llama 340亿参数模型在 HumanEval上得分为 53.7%，在 MBPP 上得分为 56.2%，与ChatGPT性能相当。

