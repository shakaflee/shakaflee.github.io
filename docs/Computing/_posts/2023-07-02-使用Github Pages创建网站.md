---
title: 使用Github Pages创建个人网站
date: 2023-07-02 09:00:00 +0800
---

这篇文章旨在让没有编程基础的人也可以搭建自己的个人网站，预期需要的时间在一个下午左右，建议通过实践进行学习。

## 基础知识

本文假设你对版本控制、Git和GitHub知之甚少。如果你了解HTML和CSS的基础知识会很有帮助，因为我们将直接使用这些语言。我们还会使用一点Markdown，但你不需要一定会这些东西，因为我们会一步步讲解。文中用到的代码都可以直接复制，也可以直接[Fork this repo](https://github.com/shakaflee/shakaflee.github.io)。

### Git, Github, Github Pages 是什么

一言概之就是：Git是你在本地电脑上的一个工具，可以控制文件的版本；Git Hub 和 Github Pages 是你可以把这些文件进行在线存储的地方。

### Git

Git是一个追踪任何时候文件变动情况的版本控制工具，举个例子可以更好的理解它。假设我们现在有一篇文章，我们可能会修修改改，一般的做法是每次改动后我们都另存为一份其他名字的文章进行备份，这样不断重复，可能最后这个文章有上百次变动的记录，我们也有上百个文件了，而这其中到底有哪些变化，我们也不记得了。Git就可以解决这个问题，从头到尾我们都在同一篇文章里进行修改，不用另存为，但是通过Git我们可以查看任何时候这篇文章发生了哪些变化，是增加了还是减少了内容，具体内容是什么，是由谁改动的，在什么时候进行操作的，都可以看到。我们要是发现这次变动有误，还可以进行回滚，也就是回到以前任何时候的文件状态。

所以，我们可以理解为Git就是一个可以让我们执行**回退**动作的软件。

Git本身是一个命令行工具，需要对应的一些知识，但我们这里用它的桌面图形应用--[GitHub Desktop](https://desktop.github.com/)，根据自己的电脑系统进行选择，安装后完成登录，就可以使用了。需要注意的是它是全英文的，不过本身我们要用到的功能就很简单，后边我会进行演示。你也可以使用Homebrew进行安装，具体方法可参考[国内安装和使用Homebrew](/computing/2023/07/01/国内安装和使用Homebrew.html)。

### Github

一个可以免费存放电子文件的网站，比如我们刚才说的那篇文章，就可以放到Github上进行存储，你想想每次你在本地电脑上编辑了内容，Git都会记录做了哪些变动，然后你把这篇文章放到Github上，这样不管是你，还是别人，都可以看到你更新后的记录，这对团队合作非常有用，最开始这个网站就是用来给程序员进行团队合作写代码用的，但是它的功能也支持我们这样的简单使用。

试想有这样一个场景：你在办公室的电脑上写了一份文件，你把它上传到了Github，然后你回家了，还是可以通过直接到Github网站上浏览文件，现在你想做些变动，你通过家里的电脑，直接用Git把这份文件复制(clone)到你电脑上，完成改动后，直接再上传到Github，这样你第二天在办公室看到的就是更新后的文件了，也是通过Git，直接与Github保持同步就行，这样就完成了不同时间，不同地点，都能让工作持续进行。现在，把个人进行延伸，有一万个人，你们在世界的各个角落，有着不同的作息时间，但是你们要完成同一个项目的编辑，用这种方式，你们所有人都可以看到其他人的最新成果，并在其他人的成果之上继续更新，不断重复这个过程，整个团队就完成了这个项目。

### Github Pages

Github提供的网页托管（委托管理）服务，刚才我们说了Github是一个托管电子文件的网站，Github pages就是一个具体的细分，专门对网页进行托管。这就是我们这篇文章标题的由来。

Github Pages内置了一个静态网站生成工具，叫Jekyll，我们后边会详细介绍。这里解释下静态网站生成(static site generator),所谓的静态网站就是网站的内容是不会发生动态变化的，每次都是从源文件里读取内容，展现给浏览者就结束了，相对应的动态网站就是说浏览者看到的内容是动态变化的，最简单的例子就是那些购物网站，像京东，淘宝，他们会根据你的浏览记录给你实时推荐相关商品，或者是抖音，快手这类网站，给你推荐类似的短视频，这就是在服务器端由服务器不断生成内容然后发送到浏览器端给你看，而静态网站是服务器直接把内容一次性发送给你，在你的浏览过程中不会再实时生成新的内容给你。

### HTML, CSS, JavaScript 是什么

网站是由一个个的网页组成，而网页是由三块构成：网页的内容（HTML），网页的样式（CSS)，网页的动态效果（JavaScript)。

### HTML

HTML (HyperText Markup Language) ：一种浏览器可以识别的标记语言，网站的内容就由这些语言进行标记，然后浏览器渲染成我们看到的样子，比如一句话，它的表达方式就是 `<p>这是一句话。</p>`，p 代表英文段落的意思（paragragh)。你在网页上看到的所有内容，就是以这样的方式写给浏览器看的。

### CSS

有了网页内容，还有这些内容的呈现式，比如这段文字的字体大小，颜色，放在网页的什么位置，简单讲就是网站的外观，它的表达方式是` p { font-size: 16px;}`。这就是说段落这个元素的字体大小是16像素。

### JavaScript

你点击了网站上的一个按钮，它开始播放视频或者变换样式，这种动态效果就由JavaScript写的内容来控制，所以说它控制网站的动态效果。

## 我对程序的理解

每个应用都是由程序构成的，这些由代码写出来的程序由电脑控制运行，程序的目的就是简化人的工作，让电脑自动完成事情。从这点出发，我认为程序应该是这样子：

* 专一：为一个目的写一段程序，这个程序应该很简短，它只是为了一个特别的功能写就的，不实现其他任何功能；
* 组合：一个应用有各个功能，我要做的事情就是把有不同功能的程序片段进行组合，让他们实现我想要的效果；
* 复用：写的程序，应该可以被其他需要相同功能的程序引用，这是我理解的避免重复造轮子。

## 开始创建网站

**说明**：可以不使用任何本地的软件，应用或者命令之类的东西，只要有个浏览器能登录Github这个网站，你就可以完成我们的所有操作。但不建议这样做，因为如果只是为了尝试，你在线测试是没有问题的，但如果想要完整的搭建过程，你应该经历的是：本地搭建——本地测试——在线部署——得到反馈——本地搭建...。这样，我认为可以持续健康的运营好这个网站，因为如果是一个商业运营的网站，你肯定想自己先测试没有问题了，再呈现给用户，而不是直接上线，出现问题了再来修补。

### step 01: 在Github上创建repo

首先，你应该已经登录了[Github](https://github.com/new)，这意味着你已经创建了自己的账号。

新建一个仓库，仓库名字为：`username.github.io`。将`username`替换为你自己的Github用户名，我的用户名是shakaflee，所以我写的是`shakaflee.github.io`，完了之后点击右下角绿色的Create repository按钮进行创建。

![create new repo](/assets/images/github-pages/001.png)

### step 02: 安装并配置 Visual Studio Code

visual-studio-code是一个代码编辑器（文档写作），集成了非常丰富的功能，我们可以到[官网下载安装](https://code.visualstudio.com/),也可使用Homebrew进行安装。

我这里使用第二种方法进行安装，但你完全可以使用第一种方法到官网下载安装。

{% include copycode.html %}
```
brew install visual-studio-code
```

效果如下：

![brew install visual-studio-code](/assets/images/github-pages/002.png)

首次打开效果：

![first open visual-studio-code](/assets/images/github-pages/003.png)

我们处理下语言问题，安装一个中文简体插件，点击扩展栏，输入`chinese`，安装这个中文插件，会提示我们切换语言需要重启后生效，我们允许就行。

![install lang pulgin visual-studio-code](/assets/images/github-pages/004.png)


### step 03: 安装并配置Github Desktop

前边说了[Git](#git)是来追踪文件的变化并进行各种同步，原本这是一个命令行工具，但是现在官方也提供了图形操作应用--[Github Desktop](https://desktop.github.com/)来进行操作。你可以直接在官网下载应用，也可以使用Homebrew进行安装，这里我就直接到官网下载安装了。

安装好应用后登录自己的账号，应该会直接同步，这时我们选择克隆我们的这个仓库。

![clone repo from github](/assets/images/github-pages/013.png)

可以自己决定要把这个仓库放到自己的本地电脑哪个位置。

![locate local repo](/assets/images/github-pages/014.png)

然后选择在Visual Studio Code中打开这个文件夹。


### step 04: 编辑网站配置文件

4.1 首先我们创建一个名为docs的子文件夹，**以后所有内容都放在这个文件夹下进行管理**。

4.2 然后我们创建一个名为_config.yml的文件并编辑内容，这个文件用来管理网站的配置信息，如网站标题，描述，默认选项等，你可以根据自己的需要修改各项参数。

{% include copycode.html %}
```yml
title: shakaflee # 网站的标题，自己改
description: >- # 网站的描述内容，自己改下边的内容，注意这里开头是有空格的，不能忽略。
  learn, live, fun.
markdown: kramdown # 网站使用的markdown解析器

# 这里是一些自定义设置
# 我这样设置是因为我要给属于这两个页面下的posts添加一个图标，
# 在这里设置后就不用在每个posts里再单独进行设置，
# 还记得我对程序的理解里的最后一条原则吗：复用。
# 另外有个laytou:"post"，这个是说只要在这个文件路径下的文档，都属于post这个样式；

defaults:
  -
    scope:
      path: ""
      type: "posts"
    values:
      toc: true
  - 
    scope:
      path: "Computing/_posts"
    values:
      icon-img: "/assets/images/icon-computing.webp"
      layout: "post"
  - 
    scope:
      path: "Finance/_posts"
    values:
      icon-img: "/assets/images/icon-finance.webp"
      layout: "post"
```

截图示例：

![edit _config.yml](/assets/images/github-pages/008.png)

4.3 创建并编辑名为.gitignore的文件，文件内容如下：

{% include copycode.html %}
```
_site/
```

截图示例：

![edit .gitignore](/assets/images/github-pages/015.png)

这个文件的作用是告诉Git哪些文件或者文件夹内的内容不要追踪，因为_site这个文件下的内容都是我们后期本地测试相关的数据，是自动生成的，与上线的内容无关，所以不用追踪。

4.4 创建并编辑名为Gemfile（没有扩展名）的文件，文件内容如下：

{% include copycode.html %}
```
source 'https://gems.ruby-china.com/'

gem 'github-pages'

gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]

gem "webrick", "~> 1.8"

```

截图示例：

![edit Gemfile](/assets/images/github-pages/016.png)

这个文件的内容是说我们需要从这个数据源获取有关`github-pages`这个小程序相关的内容。

**注意**: 这里的内容是适配我们在国内，本地电脑上进行测试。如果是直接放到Github上去，或者直接在线编辑（不进行本地测试），那么内容可以更简单，具体为：

{% include copycode.html %}
```
source 'https://rubygems.org'

gem 'github-pages'
```

这是因为国内访问rubygems.org这个网站很慢，所以我们使用中国的镜像站，但是你按照这两种去做，在线的版本应该都可以，只是说第一个是本地，在线都行。

至此，我们的网站配置相关的信息就编辑结束了，理论上这个几个文件的内容不会再做频繁变更了。

### step 05: 编辑网站_data文件

虽然说我们没有使用数据库，但是我们仍然可以创建一些数据文件，来让后期的数据管理更加简便，也许你暂时不明白这样的做的意义或者说优势，就先照做吧，后期你会明白的。

在docs文件夹下创建一个名为_data的文件夹，这个文件夹的内容包括我们以后会使用到的各个数据。

在_data文件夹下创建一个名为navigation.yml的文件，这个文件的内容是储存我们网站的导航栏的信息，文件内容如下：

{% include copycode.html %}
```yml
- name: Computing
  link: /Computing.html
- name: Finance
  link: /Finance.html
```

截图示例：

![edit navigation.yml](/assets/images/github-pages/017.png)

### step 06: 编辑网站_includes文件


6.1 首先在docs文件夹下创建一个名为_includes的文件夹，在该文件夹下创建一个名为navigation.html的文件，这样做的好处在于以后要用到导航栏的网页，都可以直接引用就行，文件内容如下：

{% include copycode.html %}
```html
{% raw %}
<nav>
    
    <!-- 添加一个logo -->
    <a href="/" class="logo-link">
      <img src="/assets/images/logo.png" alt="Logo" class="logo-img">
    </a>

    <!-- 添加导航栏的各个页面 -->
    {% for item in site.data.navigation %}
      <a href="{{ item.link }}">{{ item.name }}</a>
    {% endfor %}   
    
</nav>
{% endraw %}
```

截图示例：

![edit navigation.html](/assets/images/github-pages/018.png)

这里解释下两段代码：第一段是添加一个图形logo，我们后边会说；第二段代码使用了我们刚刚在_data文件夹下的创建的navigation.yml这个文件的内容，要使用的时候，就按照`site.data.navigation`这种写法就行。

6.2 在_includes文件夹下创建一个名为copycode.html的文件，这个文件的内容是为了给你现在看到的这种代码框添加一个复制功能创建的，你要是不需要，就忽略，文件内容如下：

{% include copycode.html %}
```html
<div class="code-header">
    <button class="copy-code-button">
      Copy
    </button>
</div>
```

截图示例：

![edit copycode.html](/assets/images/github-pages/019.png)

6.3 在_includes文件夹下创建一个名为toc.html的文件，这个文件的内容是为了给posts创建一个导航栏（toc: table of content),这个文件起到生成导航栏的作用，但不是生成相应的HTML，文件内容太长，你直接复制这个文件到你自己的文件夹下吧。

截图示例：

![edit toc.html](/assets/images/github-pages/020.png)

6.4 在_includes文件夹下创建一个名为sidebar.html的文件，这个文件的内容是为了给posts创建一个导航栏，生成相应的HTML，文件内容如下：

{% include copycode.html %}
```html
{% raw %}
{% if page.toc %}
  <aside class="sidebar">
    <div class="sidebar-content">
      {% include toc.html html=content %}
    </div>
  </aside>
{% endif %}
{% endraw %}
```

截图示例：

![edit sidebar.html](/assets/images/github-pages/021.png)

这里我们就是通过include这个语法调用了toc.html这个文件的内容，来生成post的目录相关的html。

### step 07: 编辑网站_layouts文件

在docs文件夹下创建一个名为_layouts的文件夹，这个文件夹的内容包括我们以后会使用到的各个页面的样式。


7.1 创建并编辑名为default.html的文件，文件内容如下：

{% include copycode.html %}
```html
{% raw %}
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>shakaflee | {{ page.title }}</title>
    <meta name="viewport" content="width=device-width">
    <meta name="description" content="{{ site.description }}" />
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon">

  </head>
  <body>
    <header>
      <!-- to add content-->
    </header>

    {% include navigation.html %}

    <main>

      {{ content }}

    </main>

    <footer>
      <!-- to add content-->
    </footer>
  </body>
</html>
{% endraw %}
```

截图示例：

![edit default.html](/assets/images/github-pages/022.png)

解释一下上边的代码：

* 首先，一个良好的HTML内容应该是易于阅读的，所以一些基本的元素应该在正确的位置体现，比如这里，首先是<html>这个根元素，然后是<head>元素，存放有关网站的基本信息，但是对用户不可见的内容，但是如搜索引擎，或者服务器，它们会读取的信息。
* \<body> 元素内的内容是对用户可见的内容，可以看到在这里我先放了navigation的内容，因为我想让网站的每个页面都有相同的导航栏，然后在\<main>这个元素里放置了content，也就是网页的主体内容。
* content：这个标志是说其他引用default.html这个文件的内容会被放到这里。


7.2 创建并编辑名为page.html的文件，文件内容如下：

{% include copycode.html %}
```html
{% raw %}
---
layout: default
---

<div class="page-post">

  {% assign posts = site.posts | where: 'categories', page.title %}
  {% for post in posts %}
    <a class ="page-post-item" href="{{ post.url }}">
      <img class = "page-post-item-img" src="{{ post.icon-img }}">
      <div class="page-post-item-text">
        <p>{{ post.title }}</p>
      </div>
    </a>
  {% endfor %}

</div>
{% endraw %}
```

截图示例：

![edit page.html](/assets/images/github-pages/023.png)

注意这里的开头是两段`---`符号构成的内容，这个是Jekyll设置的一种方式，叫做front-matter，有这个标志就是告诉jekyll要解析这个文件。

在这里我们申明了样式是继承自default.html的内容，然后把其他内容注入到default.html这个文件的content部分。

我在这里写的内容是为了后边各个不同分类博文的一个聚集。比如，我写的博文有两个分类，一个是Computing,一个是Finance，所以会有这样两个页面，分类属于Computing的博文会出现在Computing这个页面下，分类属于Finance的博文会出现在Finance这个页面下，这是根据我自己的需要这样写的，你可以根据自己的情况进行调整。

同时在这里，你应该也看出来了为什么在[step 05: 编辑网站_data文件](#step-05-编辑网站_data文件)中我要那样设置了吧。

7.3 创建并编辑名为post.html的文件，文件内容如下：

{% include copycode.html %}
```html
{% raw %}
---
layout: default
---

<div class="post-content">
    {% include sidebar.html %}
    <article>
        {{ content }}
    </article>
</div>

<script src="/assets/scripts/copycode.js"></script>
{% endraw %}
```

截图示例：

![edit post.html](/assets/images/github-pages/024.png)

可以看到，在这里我引用了sidebar.html这个文件，因为原计划就是要在博文里放置一个目录栏，最下边有个\<script>，这个的作用是加载代码框的复制功能。

至此，我们所有的页面样式就设置完毕了。

### step 08: 编辑网站assets文件

我们的网站会使用到一些自己的资源，比如我在这篇文章里用到的图片，我们网站的样式文件（css），或者说复制代码这个功能涉及到的JavaScript代码。我们把他们通通放到一个文件夹中去，要使用哪个就直接引用就好。

在docs文件夹下创建一个名为assets的文件夹，这个文件夹的内容包括我们以后会使用到的各项资源。

在assets文件夹下分别创建三个文件夹，名字分别为：images, css, scripts，用来存放各自相关的内容，比如，你在default.html这个文件的<head>部分看到有这么一句：\<link rel="stylesheet" href="/assets/css/styles.css">，现在知道它是样式表的意思，并且在/assets/css/styles.css这个路径下了吧。当然我们这里还没讲如何创建样式表，不过你知道这句的意思是什么就行，而且，你以后测试的时候，可以自己把这句的路径故意写错，这样浏览器就找不到样式表了，你就可以看看没有样式表的情况下，你的网站看起来是什么样。

8.1 在/assets/css/下，创建一个名为styles.css的文件，文件内容比较大，你直接把这个文件从我那里复制下吧.

截图示例：

![edit styles.css](/assets/images/github-pages/025.png)

这里涉及一些基本的css知识，我就不展开讲了，因为我也不怎么会，后期再一起学习吧。

8.2 在/assets/scripts/下，创建一个名为codecopy.js的文件，文件内容为：

{% include copycode.html %}
```javascript
// This assumes that you're using Rouge; if not, update the selector
const codeBlocks = document.querySelectorAll('.code-header + .highlighter-rouge');
const copyCodeButtons = document.querySelectorAll('.copy-code-button');

copyCodeButtons.forEach((copyCodeButton, index) => {
  const code = codeBlocks[index].innerText;

  copyCodeButton.addEventListener('click', () => {
    // Copy the code to the user's clipboard
    window.navigator.clipboard.writeText(code);

    // Update the button text visually
    const { innerText: originalText } = copyCodeButton;
    copyCodeButton.innerText = 'Copied!';

    // (Optional) Toggle a class for styling the button
    copyCodeButton.classList.add('copied');

    // After 2 seconds, reset the button to its initial UI
    setTimeout(() => {
      copyCodeButton.innerText = originalText;
      copyCodeButton.classList.remove('copied');
    }, 2000);
  });
});

```

截图示例：

![edit codecopy.js](/assets/images/github-pages/026.png)

从名字应该也看出来，它就是实现可以复制代码块这个功能，具体到每个代码，我也不懂，反正就是拿来能用，而且没有外链，不用担心有病毒。

8.3 这里再说下图片，比如我这篇文章里要用到的图片，我就把他们放到/assets/images/下边，比如有一张001.png的图片，要用它的时候，就直接跟上链接地址：/assets/images/001.png 就可以了。

### step 09: 编辑网站各个页面的index.html

每个页面都需要有自己的首页(也叫home，或者index页面)，比如打开一个网站，呈现的第一个页面，或者是打开这个网站的二级页面等，都需要有对应的index.html，而我们使用jekyll的一个优势在于，我们可以继续用markdown来写内容，jekyll会自己把相应的md文件转为html。

9.1 在docs/下创建一个index.md文件，我希望用户一打开我的网站，除了顶部的导航栏，就可以看到6篇最新的博文，所以我编辑的内容是：

{% include copycode.html %}
```
{% raw %}
---
layout: default
title: Home
---

<div class="index-h2">
  <h2> Recent 6 posts</h2>
</div>

<div class="page-post">

  {% for post in site.posts limit:6 %}
    <a class ="page-post-item" href="{{ post.url }}">
      <img class = "page-post-item-img" src="{{ post.icon-img }}">
      <div class="page-post-item-text">
        <p>{{ post.title }}</p>
      </div>
    </a>
  {% endfor %}

</div>
{% endraw %}
```

截图示例：

![edit index.md](/assets/images/github-pages/027.png)

9.2 在docs/下创建Computing.md，这个页面是用户打开Computing这个页面后看到的内容，文件内容如下：

{% include copycode.html %}
```
{% raw %}
---
layout: page
title: Computing
---

{{ content}}
{% endraw %}
```

截图示例：

![edit Computing.md](/assets/images/github-pages/028.png)

可以看到内容很简单，原因在于我们在之前已经写好了page这个样式，现在直接使用就好。

9.3 在docs/下创建Finance.md，这个页面是用户打开Finance这个页面后看到的内容，文件内容如下：

{% include copycode.html %}
```
{% raw %}
---
layout: page
title: Finance
---

{{ content}}
{% endraw %}
```

截图示例：

![edit Finance.md](/assets/images/github-pages/029.png)

与Computing的内容差不多，除了title。

9.4 在docs/下创建404.md，这个页面是用户打开一些不存在的页面，或者页面已消失后给用户呈现的内容，你可以自由发挥，我编辑的文件内容如下：

{% include copycode.html %}
```
{% raw %}
---
layout: default
title: 404 Page
permentlink: /404.html
---

# 404

很抱歉，这个页面不存在或者被删除了，[点击回到主页](/)
{% endraw %}
```

截图示例：

![edit 404.md](/assets/images/github-pages/030.png)

9.5 在docs/下创建about.md，这个页面是用来向访问者展示与网站相关的信息的，我就不提供了，因为我不打算要，你可以自己根据情况决定写什么。

到这里，我们就把页面相关的内容写完了，因为我只是两个页面（Computing和Finance），所以我就写了着两个相关的，如果你要创建更多页面：

1. 在_data文件夹下编辑navigation.yml这个文件；
2. 在docs文件夹下创建相应的markdown文档。


### step 10: 编辑网站posts

网站的主体架构我们已经写完了，接下来就是自己写自己的博文就好了，这里说明几点，首先，如果不分类，或者自己手动分类，那么就创建一个docs/_posts文件夹，在这个文件夹内写你的博文就行，有几点需要注意：

* post的名字必须是：YYYY-MM-DD-title-of-your-post.md，jekyll使用这种日期作为你的post的url；
* post的front matter一定是如下内容：

```
{% raw %}
---
title: 你的文章标题
date: YYYY-MM-DD HH-MM-SS +0000 # 日期，时间，时区，中国是 +0800
layout: post
category: 分类 # 这是单个分类
categories: 分类1 分类2 分类3... # 这是多个分类，以空格区分
variable: ... # 还可以自己定义一些变量，到时可以用 post.variable引用
---
{% endraw %}
```

我说下我自己的操作，我因为有两个分类，Computing 和 Finance。

所以我创建了docs/Computing/_posts/ 和 docs/Finance/_posts/这两个文件夹，以后我写了有关Computing的post，我就放到/Computing/_posts/ 这个文件夹下，它会自动给所有这个文件夹下的博文都打上一个分类为Computing的标签，这样我就不用在post的front matter里再去单独写了，这是一个用文件夹来给post打标签的方法，如果你想给他们两个标签，你就嵌套两层文件夹，比如说，你要给一些文章打上 cat1 和 cat2 的标签，你就这样创建：docs/cat1/cat2/_post/，这样就可以达成目的，可以有很多标签，对应的你创建多级文件夹就行。

Jekyll会以post里边的front matter为准，比如说我有篇文章在/Computing/_posts/ 下，理论上就该分类为Computing，但是如果我在post的front matter里自己又写了：category: Finance，那么这篇文章就会分类为Finance，覆盖掉原本的文件夹分类。

我这里就把这篇文章放到Computing/_posts/下了。

截图示例：

![create file dir](/assets/images/github-pages/031.png)

### step 11: 添加一些细节

11.1 添加网站logo，在[编辑网站_includes文件](#step-06-编辑网站_includes文件)中有一段navigation.html，里边我们提到了logo，也就是说我想让网站的首页是一张图片，而不是文字的Home(如果我要这么做，我直接在_data/navigation.yml中添加一个home就行了)，首先可以去[flaticon](https://www.flaticon.com/)免费下载自己喜欢的图片，一般大小选择64*64px就可以了，我这里选择了一个海豚的图片，下载好后放到/assets/images/logo.png就可以了。

11.2 添加ico，我们在浏览器打开一个网页的时候，会看到标签栏的左侧出现一个小图标，那就是ico，大小我选的是32*32px，同样的海豚图片，当然你也可以用不同的图片。下载好后放到/assets/images/favicon.ico就可以了。

截图示例：

![add icon and logo ](/assets/images/github-pages/032.png)

可以看到还有一个名为github-pages的子文件夹，那是我存放这篇文章所有图片的地方，用文件夹好区分一些；还有两个webp格式的图片，那是给Computing和Finance这两种博文准备的图片。

### step 12: 本地测试

现在我们网站架构建设好了，内容也有了，我们就进行测试。

在你的Mac电脑上打开终端，可以使用聚焦（快捷键：command + 空格），输入`终端`或者`terminal`进行查询，打开，输入命令：`brew install ruby`，先安装最新版本的ruby，注意这里的前提是已经安装过Homebrew。

![brew install ruby](/assets/images/github-pages/009.png)

切换目录到docs所在的位置（复制文件路径的快捷键：option+ command + c)，可以使用命令`cd`进行目录切换，接着输入命令：`bundle install` 安装各种依赖项。

![cd to docs dir](/assets/images/github-pages/010.png)

这一步完成之后，你可以注意到docs/下出现了一个名叫Gemfile.lock的文件，这个文件的内容就是安装了所有需要的小程序及其依赖项。

我们接着继续输入命令：`bundle exec jekyll serve`

![terminal jekyll serve](/assets/images/github-pages/011.png)

在浏览器输入网址：http://127.0.0.1:4000，预览整个网站。

![view website locally](/assets/images/github-pages/012.png)

我们可以点进去看看文章的内容页：

![view website locally](/assets/images/github-pages/033.png)

### step 13: 在线发布

我们预览网站没有问题后，就可以发布内容到Github Pages去了。

打开Github Desktop，我们在Summary处填写此次的信息，比如我这里就写：第一次提交docs/下全部文件，然后点击下方蓝色的commit to main.

![commit to main](/assets/images/github-pages/034.png)

在弹出来的对话框里，我们选择新建一个分支，名字为gh-pages,这样我们以后就用这个分支来作为我们的网站内容来源，点击蓝色的Create New Branch.

![create gh-pages branch](/assets/images/github-pages/035.png)

填写Summary后，选择右侧蓝色的发布（Publish branch），这样我们的内容就都同步到Github网站上去了。

![publish branch](/assets/images/github-pages/036.png)

然后我们就可以打开浏览器到github看看效果了。

![github website](/assets/images/github-pages/037.png)

可以看到我们本地的所有文件都已经同步过去了，现在我们进行在线设置，让这个分支成为我们的在线网站内容来源。

点击图里的Settings这个选项，然后选择左侧的Pages选项，

![settings pages](/assets/images/github-pages/038.png)

在Build and deployment下可以看到问我们内容来源，默认的是Deploy from a branch,我们就是这样的，所以不用改。

在branch下，我们因为就一个gh-pages分支，所以也是默认，文件夹选择我们/docs，这是我们自己创建的，然后点击save就可以了。

![branch deploy](/assets/images/github-pages/039.png)

刷新这个页面，可以看到已经可以访问了，点击visit site就可以看看在线效果了，有时候需要几分钟才能刷新出来内容，所以如果看不到就稍微等一下：

![ready to visit](/assets/images/github-pages/040.png)

最终的在线效果如图：

![view on github](/assets/images/github-pages/041.png)

以后要做的事情就是更新文章就行了，可以在线直接编辑，也可以本地编辑好后，用同样的方法同步到github就可以了，Github会自动同步你的内容到你的网站。

Have fun.

