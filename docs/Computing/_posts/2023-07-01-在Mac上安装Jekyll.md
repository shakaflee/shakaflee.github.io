---
title: 在Mac上安装Jekyll
date: 2023-07-01 18:00:00 +0800
---

## 什么是Jekyll，它可以做什么

Jekyll是一个软件应用，一个静态内容生成器。你可以用它搭建自己的网站，并且可以更改网站的内容，外观，动态效果等。

Jekyll官方的[安装文档](https://jekyllrb.com/docs/)。

另外介绍一个[中文版jekyll网站](https://jekyllcn.com/)，这个网站是网友翻译的中文版本。

## 安装前的准备工作

我的电脑信息如下：

```
操作系统：macOS Monterey 12.5.1
终端(terminal)：zsh 5.8.1 (x86_64-apple-darwin21.0)
代码编辑器：Visual Studio Code 1.79.2
```

[下载Visual Studio Code](https://code.visualstudio.com/)或者使用[Homebrew进行安装](/computing/2023/07/01/国内安装和使用Homebrew.html)都可以。

### step 01: 检查预装软件

根据官方说明，在安装jekyll以前需要预先安装以下软件：

* Ruby 版本 >= 2.5.0 
* Gem
* GCC
* Make

先在终端检查是否已经安装了，办法是输入相应的命令，跟上一个 `--version`，如果返回版本信息说明已经安装了；如果返回找不到命令就说明还没安装，自己用Homebrew安装一个就好.

代码如下：

{% include copycode.html %}
```
ruby --version
gem --version
gcc --version
make --version
```

以下是我在自己电脑上检查的结果（苹果应该都内置了这些软件）

![check pre-installed application](/assets/images/install-jekyll/001.png)

### step 02: 安装新版ruby

Ruby是红宝石的意思，是编程语言的名字。Ruby语言的logo就是一颗红宝石。

Ruby语言源文件的后缀是.rb。

rake是Ruby语言的类make程序。可以在其中定义任务和源码依赖。make的意思是构造，就是说把编程语言写的代码构造成一个完整的程序，让我们可以直接使用。

rake = r(uby’s m)ake 看到了吗，本来应该是make，但是ruby语言开头是r，所以是rake。

就像make有Makefile文件一样，rake有对应的Rakefile。

它们都属于构建工具的范畴。

| 编程语言 | 构建工具名称 | 构建工具配置文件 |
| :---:|:---:|:---:|
| C | Make | Makefile |
| Ruby | Rake| Rakefile |


为了将Jekyll这个工具安装在我们的电脑上，我们需要有ruby这个语言环境，因为jekyll就是用ruby写的，所以我们需要安装ruby。

按照Jekyll官网在[安装页](https://jekyllrb.com/docs/installation/macos/)的说明， **不建议**使用苹果自带的Ruby，需要自己重新安装新版的Ruby，因为苹果自带的版本是旧版本，所以按照说明我先安装最新版本的Ruby。

这里我的操作和官网介绍的不一样，因为我自己已经按照官网的说明操作了一遍，中间遇到了一些问题，我不知道是因为在国内的原因还是其他的原因，反正是没法正确安装软件，所以我介绍一个更简单但实用的办法。我们用Homebrew直接安装最新的ruby。

{% include copycode.html %}
```
brew install ruby
```

这会安装最新版本的ruby到我们电脑上。

![install ruby](/assets/images/install-jekyll/002.png)

打开如下文件路径："/Users/username"，这里把username换成你自己的，找到这个文件".zshrc"，它是隐藏文件，因此你需要按"command + shift + ."打开隐藏文件，如果没有看到这个文件，创建一个，然后把以下内容拷贝进去，保存。

{% include copycode.html %}
```
eval "$(/opt/homebrew/bin/brew shellenv)"

# 设置 Homebrew
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"

# 设置 ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
```

可以看到最后一句就是我设置的ruby到环境变量里，之前的那些是安装Homebrew的时候添加的，理论上你的`.zshrc`文件应该和我的一样，因为你也是先安装了Homebrew，用它安装ruby，那么我们的这个文件就该保持一致。

### step 03: 替换RubyGems为国内源

gem是宝石的意思，能够很容易想到跟Ruby红宝石同处一系。

gem是Ruby的包管理系统，命令是`gem`，包名后缀也是`.gem`。还记得我之前说的Homebrew吗，它是Mac OS的软件包管理器，通过这个比较你应该可以想象到gem是个啥了：有很多用ruby这个语言写的程序包或者软件，gem就是用来管理这些程序包的。所以，从这点来讲，用ruby这个语言写的jekyll程序，也需要用gem来管理（下载，安装，更新和卸载等）。

**注意**：gem对应的文件是gemspec。Gemfile和gem无关，它其实是bundler的配置文件名称。


gem的一些用法如下:

```
gem -v #gem版本 
gem update #更新所有包 
gem update --system #更新RubyGems软件 
gem install rake #安装rake,从本地或远程服务器 
gem install rake --remote #安装rake,从远程服务器 
gem install watir -v(或者--version) 1.6.2#指定安装版本的 
gem uninstall rake #卸载rake包 
gem list d #列出本地以d打头的包 
gem query -n ''[0-9]'' --local #查找本地含有数字的包 
gem search log --both #从本地和远程服务器上查找含有log字符串的包 
gem search log --remote #只从远程服务器上查找含有log字符串的包 
gem search -r log #只从远程服务器上查找含有log字符串的包 
gem help #提醒式的帮助 
gem help install #列出install命令 帮助 
gem help examples #列出gem命令使用一些例子 
gem build rake.gemspec #把rake.gemspec编译成rake.gem 
gem check -v pkg/rake-0.4.0.gem #检测rake是否有效 
gem cleanup #清除所有包旧版本，保留最新版本 
gem contents rake #显示rake包中所包含的文件 
gem dependency rails -v 0.10.1 #列出与rails相互依赖的包
gem environment #查看gem的环境
```

 
gem这个软件应该是苹果内置好的，因为苹果系统自带了一个旧版本的ruby，那么gem应该是与之配套的，就不用再下载了，多说一句，安装ruby后gem是自动安装的，所以它一定存在。

rubygem在国外，直接下载非常慢，我们可以换成国内源，这样更快。

{% include copycode.html %}
```
gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
```

然后可以输入命令`gem sources -l`查看当前ruby的源是不是替换过后的；

截图示例：

![replace rubygems source](/assets/images/install-jekyll/003.png)

### step 04: 安装Bundler


bundler是Ruby应用的外部依赖管理工具。我说下自己的理解，用编程语言写的软件，在运行时不是说能够独立运行，还是要电脑自己的系统给予一些支持才能够正常运行。bundler就是ruby这门语言写的应用所需要的外部依赖管理工具。

bundle是另一个gem，是用来解决”把bundler误拼写称bundle”的问题，唯一功能就是安装bundler，使两者是同一个意思，起同样的作用而不报错，简而言之就是用户在输入命令的时候容易把最后一个`r`字母省略掉没输入造成错误，所以就有了这么一个东西。

Gemfile文件描述执行相关Ruby应用需要的外部依赖gem，包含源、gem名称、gem版本等信息。

执行bundle install时，bundle会读取Gemfile文件并一次性安装所有依赖的gem。


和上边说的gem一样，它也应该是苹果系统内置好的，因为它和ruby,gem都是在一起才能发挥作用，检查方法一样，输入 `bundle -v`，这里注意不是`bundle --version`（它不支持这个长命令），我自己的查询结果如下：

![check bundle version](/assets/images/install-jekyll/004.png)

说明这个软件是有的，就不用再下载了，如果你自己是没有这个软件的，那么就用gem下载就好了，在终端输入：`gem install bundler`，这里说下为什么是用gem安装，因为bundle本身就是用ruby写的程序，按照上边的gem这一节说的，你就理解了。


## 安装Jekyll

准备工作已经完了，我们就开始安装Jekyll吧，如上文所说，它是用ruby写的一个程序，那么我们就用ruby的包管理工具gem来安装它，在终端输入：`gem install jekyll`，结果如下：

```
xdl@xdldeMacBook-Air ~ % gem install jekyll
# 这里我省略了一些中间的下载和安装内容
Done installing documentation for webrick, unicode-display_width, terminal-table, safe_yaml, rouge, forwardable-extended, pathutil, mercenary, liquid, kramdown, kramdown-parser-gfm, ffi, rb-inotify, rb-fsevent, listen, jekyll-watch, google-protobuf,sass-embedded, jekyll-sass-converter, concurrent-ruby, i18n, http_parser.rb, eventmachine, em-websocket, colorator, public_suffix, addressable, jekyll after 9 seconds
28 gems installed

A new release of RubyGems is available: 3.4.10 → 3.4.12!
Run `gem update --system 3.4.12` to update your installation.
```

到这里就说明已经安装完成jekyll了。

如果没有提示你更新gem，你就不用继续这后一步的更新了。

这里提示我说让我更新gem，所以我就继续更新下。

```
xdl@xdldeMacBook-Air ~ % gem update --system 3.4.12
# 这里我省略了一些中间的下载和安装内容
If you do not wish to install this documentation in the future, use the
--no-document flag, or set it as the default in your ~/.gemrc file. See
'gem help env' for details.

RubyGems system software updated
```

到这里就说明我也完成了gem的更新。

至此，我们就完成了安装Jekyll这个过程，并且换成了国内源，这样以后管理相应的gem软件包也就方便多了。

## 额外的总结

最后我加上[官方的一些总结](https://jekyllrb.com/docs/ruby-101/)，你不用知道，但如果想要了解的话可以再看看，毕竟后边用起那些命令的时候你就知道为啥是这样子了。

1. Jekyll这个软件是用ruby这门编程语言写的；
2.  Gems
	
	Gems就是你要放到自己的ruby语言想关的项目中的代码，它起到的是管理程序包的作用，打包好的gems也可以分享给其他人。
	jekyll就是一个gem, 后边我们使用的jekyll的各种插件也是一个个的gem。看到这里有点眉目了没，程序就是这样，一个大的程序是由各种小的程序关联到一起，然后发挥我们想要的功能。所以我们使用gems就是管理各个gem，只是gems的命令就是`gem`，这就是为啥我安装jekyll的命令就是：`gem install jekyll`。
3. gemfile
	
	gemfile文件就是你的网站使用的一系列gem，都在这个文件里体现，每个jekyll搭建的网站都有一个gemfile文件，就在你网站的主文件夹里。你的网站要实现各个功能，就由实现各个功能的小程序（gem)来构成,gemfile就把要用到这些gem写到自己的内容里。
4. Bundler
	
	Bundler本身也是一个小程序（gem)，它的作用就是安装你的gemfile这个文件里写的各个小程序(gem)。所以你可以看到它的用法经常是：
	
	```
	bundle install
	bundle exec jekyll serve
	```




  






