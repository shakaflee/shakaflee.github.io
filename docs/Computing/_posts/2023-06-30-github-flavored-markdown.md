---
title: Github Flavored Markdown
date: 2023-06-30 09:00:00 +0800
---

## Basic formatting on Github 

### 1. heading

use one to six `#` before text, the more `#` you use, the small size your heading.

**Code Sample**:

```
# heading 1
## heading 2
### heading 3
```

### 2. styling text

to indicate emphasis, use 

**Code Sample**:

```
- **bold**
- *Italic* or _Italic_
- ~~strickthrough~~
- normal <sub>subscript</sub>
- normal <sup>supperscript</sup>
- ***all bold and italic***
- **bold and nested _italic_**
```

**will produce:**

- **bold**
- *Italic* or _Italic_
- ~~strickthrough~~
- normal <sub>subscript</sub>
- normal <sup>supperscript</sup>
- ***all bold and italic***
- **bold and nested _italic_**

### 3. quoting text

use symbol `>` before your text

**Code Sample**:

```
>this is quote
```

**will produce:**
 
>this is quote

### 4. quoting code

use single backkicks to call out,like: 

**Code Sample**:

```
this is a `code` sentence.
```

**will produce:**

this is a `code` sentence.

use triple backkicks to format text into a distince block, like:

**Code Sample**:

````
```
this is a code sentence.
```
````

**will produce:**

```
this is a code sentence.
```

**Note 1**: text in quote will not change.

**Note 2**: to show ```` ``` ```` above,I use 4 `` ` `` outer here. which I found at [Creating and highlighting code blocks.](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks)

**Note 3**: to show `` ` ``in Note 2, fist enter 2 `` ` `` followed with **a space** , then enter `` ` `` followed with **a space**, end with 2 `` ` ``, this is same to ```` ``` ```` but use 4 `` ` `` not 2.

### 5. supported color mode 

use single backkicks to quote color to display the color.

**Code Sample**:

```
like this `rgb(25,26,145)`
```

**will produce:**


`rgb(25,26,145)`


**Fail** to show here because this is only work for online github issue,pull request and discussion.

### 6. Links

create a an inline link by wrapping link text in `[]`,and then use `()` wrapping the URL.

**Code Sample**:

```
This is link to [Github basic writing and formatting pages](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).
```

**will produce:**

This is link to [Github basic writing and formatting pages](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

### 7. section links

As github will use heading to auto build a table, you can just link directly to section by click the table list item, and also by hovering over on a section heading to expose the link.

e.g I want to link to section 6. Links, so I'll code like this:

```
link to this post [section 6](#6-links)
```

**will produce**:

link to this post [section 6](#6-links)

**Note** replace blank with `-`.

### 8. relative link

**Code Sample**:

```
this link to [index.html](/index.html)
```

**will produce:**

this link to [index.html](/index.html)

**Note 1**: this file is in root dir which is same as this README.md location, if they are not, use `/` or `.` or type dir name to indicate.

### 9. Images

use a `!` to indicate here is an image, and use `[]` to wrap alt text, use `()`to link the image source.


**Code Sample**:

```
![logo of computing post](/assets/images/icon-computing.webp#width-half)
```

**will produce:**

![logo of computing post](/assets/images/icon-computing.webp#width-half)

**Note 1**: no space between file name, which I learned from this png file name, note there I use a `-` to link.

**Note 2**: the last `#width-half` is not needed here, you can ignore it, I put it here because I want the img's width is 50% which I code in styles.css

### 10. specifying an image theme

use a HTML `<picture>` element and `prefers-color-scheme`.

**Code Sample**:

```
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/25423296/163456776-7f95b81a-f1ed-45f7-b7ab-8fa810d529fa.png#width-half">
  <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png#width-half">
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png#width-half">
</picture>
```

**will produce:**

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/25423296/163456776-7f95b81a-f1ed-45f7-b7ab-8fa810d529fa.png#width-half">
  <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png#width-half">
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png#width-half">
</picture>

### 11. lists

use `*` or `-` for **unordered list**.

use number for **ordered list**.

### 12. nested list

**Code Sample**:

```
1. this is first 
   - second
   - third
     - fouth
```

**will produce:**

1. this is first 
   - second
   - third
     - fouth
  
use Tab for indent and Shift + Tab for dedent.

### 13. task list

preface a hyphen `-` and space followd by `[ ]`,to mark a task as completed use `[x]`.
 
**Code Sample**:
 
 ```
 - [x] this is done.
 - [ ] this is **not** done.
 - [ ] \(use `\` when begin with parenthesis)
 ```
 
**will produce:**
 
 - [x] this is done.
 - [ ] this is **not** done.
 - [ ] \(use `\` when begin with parenthesis)

### 14. mention people and team

use @

### 15. refer issue or request

use #

### 16. refer external resource

just use link.

### 17. upload assets

just drag and drop, select from your browser

### 18. use emoji

use with `:` followed by emojicode,and use `Tab` or `Enter` to complete.

**Code Sample**:
 
```
this is :+1
``` 

**will produce:**
 
this is 👍

**Note** this may not work if you are not edit on Github webpage as it work only on Github.

### 19. paragraphs

create a new para by leaving a blank line between lines of text.

### 20. footnote

**note**:foot note will always show at the bottome of markdown so no need worry about where you put footnoot.

**Code Sample**:

```
1. here is footnote[^1].

2. here is another footnote[^2].

[^1]:the first footnote, **note** with 2 space after `.`.  
[^2]:Every new line should be prefixed with 2 spaces,so **note** this line end with two space after `.`.  This allows you to have a footnote with multiple lines, **note** this line end with two space after `.` too.  third line.  
```

**will produce:**

1. here is footnote[^1].

2. here is another footnote[^2].

[^1]:the first footnote, **note** with 2 space after `.`.  
[^2]:Every new line should be prefixed with 2 spaces,so **note** this line end with two space after `.`.  This allows you to have a footnote with multiple lines, **note** this line end with two space after `.` too.  third line. 

**Fail** to show here cause I don't edit on Github online.

### 21. hiding content with comment

use HTML comment

**Code Sample**:

```
<!-- this content will not appear in the rendered markdown -->
```

**will produce:**

<!-- this content will not appear in the rendered markdown -->

Of course you will see **Nothing** here, but actually I do put the code here.

### 22. ignore markdown formatting

use \\

**Code Sample**:

```
let's rename \*old name\* to \*new name\*
```
**will produce:**

let's rename \*old name\* to \*new name\*

More info about this can [check here.](https://daringfireball.net/projects/markdown/syntax#backslash)



## Advanced formatting on github 


### 1. create a table

use pipe `|`, hyphens `-`, colons `:`

- `|` for seperate column;
- `-` for create table header;
- `:` for aligh text for that column;

**Code Sample**:

```
| header 1|header 2|header 3|
|:---|:---:|---:|
|cell 1,this will **align left**|cell 2,**align center**|cell3,**align right**|
|cell 4,no worry about each cell txet length|cell 5|cell 6|
```

**will produce:**

| header 1|header 2|header 3|
|:---|:---:|---:|
|cell 1,this will **align left**|cell 2,**align center**|cell3,**align right**|
|cell 4,no worry about each cell text length|cell 5|cell 6|

**Note 1**: you can format text in table too, there at least 3 `-` to create a header.

### 2. create a collapsed section

this will only show content when user click to see.

use `<details>` block,

**Code Sample**:

```html
<details><summary>click to show more</summary>

#### this will hide.

</details>
```

**will produce:**

<details><summary>click to show more</summary>

#### this will hide.

</details>

**note 1**: if there is no `<summary>` tag then `click to show more` will be content, not the title.

### 3. create code block

as mentioned in [basic writing formatting on gihub - quote code](#4-quoting-code),use 3 `` ` `` to fence.

and add a language for Syntax highlighting.

**Code Sample**:

````
```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```
````

**will produce:**

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

github will detect the language.

### 4. links to code
for a permanent link to code, [click to see the way](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-a-permanent-link-to-a-code-snippet).

for link to a markdown file with no render,use `?plain=1` at the end of the url,and with `#L` you can link to a certain line.
