# shakaflee.github.io

edit here will show on my webpage 2022-10-13 01:37

## Learning: Basic writing and formatting on github 
2022-10-14 18:12:00

### 1. heading
use one to six `#` before text, the more `#` you use, the small size your heading.

**on github, two or more heading you use, github will automatically generate a table of content which help you navagate quickly.**

### 2. styling text
to indicate emphasis, use 
- **bold**
- *Italic* or _Italic_
- ~~strickthrough~~
- normal<sub>subscript</sub>
- normal<sup>supperscript</sup>,
- ***all bold and italic***
- **bold and nested _italic_**

### 3. quoting text
use symbol `>` before your text
 
>this is quote

### 4. quoting code
use single backkicks to call out,like: this is a `code` sentence.

use triple backkicks to format text into a distince block, like:
```
this is a code sentence.
```
**Note**: text in quote will not change,**Note** this.

### 5. supported color mode (only in issue,pull request and discussion)
use single backkicks to quote color to display the color.

like this `rgb(25,26,145)`

Fail to show here because like I mentioned above, this is only for issue,pull request and discussion.

### 6. Links
create a an inline link by wrapping link text in `[]`,and then use `()` wrapping the URL.

This is link to [Github basic writing and formatting pages]([https://github.com](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax))

### 7. section links
juse hovering over on a section heading to expose the link.

### 8. relative link(in github)
```
this link to [404.md](404.md)
```
which will look like this:

this link to [404.md](404.md)

### 9. Images
use a `!` to indicate here is a image, and use `[]` to wrap alt text, use `()`to link the image source.

```
![cute cat](images/cute-cat.png)
```
![cute cat](images/cute-cat.png)

**Note**: no space between file name, which I learned from this png file name.

### 10. specifying a theme an image is shown on
use a HTML `<picture>` element and `prefers-color-scheme`.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/25423296/163456776-7f95b81a-f1ed-45f7-b7ab-8fa810d529fa.png">
  <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
</picture>

### 11. lists
use `*` or `-` for **unordered list**.

use number for **ordered list**.

### 12. nested list(use `Tab` for indent and `Shift + Tab` for dedent)
```
1. this is first 
   - second
   - third
     - fouth
```
1. this is first 
   - second
   - third
     - fouth
  
### 13. task list
 preface a hyphen `-` and space followd by `[ ]`,to mark a task as complete use `[x]`.
 
 ```
 - [x] this is done.
 - [ ] this is **not** done.
 - [ ] \(use `\` when begin with parenthesis `\`)
 ```
 - [x] this is done.
 - [ ] this is **not** done.\
 - [ ] \(use `\` when begin with parenthesis `\`)

### 14. mention people and team (use `@`)

### 15. reference issue and pull request (use `#`)

### 16. reference external resource(Not learned)

### 17. upload assets(just drag and drop, select from your browser)

### 18. use emoji
use with `:` followed by emojicode,and use `Tab` or `Enter` to complete.

```
this is :+1
```
this is 👍

### 19. paragraphs
create a new para by leaving a blank line between lines of text.

### 20. footnote
**note**:foot note will always show at the bottome of markdown so no need worry about where you put footnoot.

```
here is footnote[^1].

here is another footnote[^2].

[^1]:my ref(**note** with 2 space after `]`).
[^2]:Every new line should be prefixed with 2 spaces,so **note** this line end with two space after `.`.  
This allows you to have a footnote with multiple lines, **note** this line end with two space after `.` too.  
third line.
```
here is footnote[^1].

here is another footnote[^2].


[^1]:my ref(**note** with 2 space after `]`).
[^2]:Every new line should be prefixed with 2 spaces,so **note** this line end with two space after `.`.  
This allows you to have a footnote with multiple lines, **note** this line end with two space after `.` too.  
third line.

### 21. hiding content with comment
use HTML comment
```
<!-- this content will not appear in the rendered markdown -->
```
<!-- this content will not appear in the rendered markdown -->

### 22. ignore markdown formatting(use `\`)
```
let's rename \*old name\* to \*new name\*
```
let's rename \*old name\* to \*new name\*

### 23. disable markdown rendering when you view a markdown file by clicing `<>` at the top of the file, so you can view source.

## end this learning here.


