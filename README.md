
# AutoLayout

自动布局的Demo，几乎把自动布局里面所有的东西都覆盖：

1、2个ViewCtrl实现一模一样的效果。一个为图形化工具 storyboard/xib 实现自动布局，一个为代码自动布局。代码布局里面每一个属性，每一个方法的参数 都写了注释，总结配套的公式 和 Visual Format Language 语法总结 以及 官方学习链接

2、Supporting Files 文件夹里面包含一些基本的约束图方便理解，还包含此Demo的效果的所有约束图叫“Demo约束图.png”，可以结合此图来理解代码布局部分，非常简单

- - -

## Markdown 实用小技巧

[TOC]
> Markdown 是一种轻量级的「标记语言」，目前也被越来越多的写作爱好者、撰稿者广泛使用。请不要被「标记」、「语言」所迷惑，Markdown 的语法十分简单，常用的标记符号也不超过十个，这种相对于更为复杂的 HTML 标记语言来说，Markdown 可谓是十分轻量，学习成本也不需要太多，且一旦熟悉这种语法规则，会有一劳永逸的效果。

>>这里列举的都是**除了Markdown标准语法**外一些平时不多见的小技巧，非常实用，可以先学习标准语法再把这个作为补充，如下技巧大多是利用 Markdown 兼容部分 HTML 标签的特性来完成，不一定在所有网站和软件里都完全支持，主要以 GitHub 支持为准，客户端MWeb 和 CSDN编辑器 是支持的。

### 精准跳转文中任意位置
1. 在**目标位置前一行**添加标签 `<span id=""/>`，id值随便写，保持全文唯一性就行，跳转就是靠id识别。
2. 在跳转发起的地方设置跳转链接，格式为 `[显示文字](#第1步的id号)`

*示例代码：*

	<span id="twhp"/>	 <!-- 添加在目标位置 图文混排 前一行 -->
	[图文混排](#twhp)	  <!-- 设置在链接点击的发起地方 -->
	
*示例效果：*

点击 [图文混排](#twhp) 就可以跳转了

### 行首缩进

直接在 Markdown 里用空格和 Tab 键缩进在渲染后会被忽略掉，需要借助 HTML 转义字符在行首添加空格来实现，`&ensp;` 代表半角空格，`&emsp;` 代表全角空格。

*示例代码：*

```
&emsp;&emsp;春天来了，又到了万物复苏的季节。
```

*示例效果：*

&emsp;&emsp;春天来了，又到了万物复苏的季节。

### 字体-字号-颜色-背景色
Markdown本身不支持修改字体、字号与颜色等功能，但是因为Markdown兼容HTML语法，所以我们可以使用HTML标签来设置。

* **face**		表示字体；
* **color**		表示颜色，可取十六进制的值；
* **size** 		表示字号，但是要注意<font color=red>取值范围是 1 - 7</font>，浏览器的默认值是 3；
* **bgcolor**	表示背景颜色，需借助 table, tr, td 等表格标签来使用；

*示例代码：*

```
<font face="微软雅黑">我是微软雅黑</font>
颜色是<font color=red>红色</font>
字号为<font color=#0099ff size=7>7号</font>
<table><tr><td bgcolor=orange>背景色是：orange</td></tr></table>
```
*示例效果：*

<font face="微软雅黑">我是微软雅黑</font>
颜色是<font color=red>红色</font>
字号为<font color=#0099ff size=7>7号</font>

### 分割线
可以在一行中用 **3** 个以上的`*` 或 `-` 或 `_`来建立一个分隔线，行内不能有其他东西，为了兼容其他平台，可以在符号中间插入空格。

*示例代码：*

```
* * *
- - -
_ _ _
```
*示例效果：*

* * *
- - -
_ _ _

<span id="twhp"/>
### 图文混排

使用 `<img>` 标签来贴图，然后指定 `align` 属性。

*示例代码：*

```
<img align="right" src="http://ow1zq9frr.bkt.clouddn.com/00.jpg"/>

这是一个示例图片。

图片显示在 N 段文字的右边。

N 与图片高度有关。

刷屏行。

刷屏行。

到这里应该不会受影响了，本行应该延伸到了图片的正下方，所以我要足够长才能确保不同的屏幕下都看到效果。

```

*示例效果：*

<img align="right" src="http://ow1zq9frr.bkt.clouddn.com/00.jpg"/>

这是一个示例图片。

图片显示在 N 段文字的右边。

N 与图片高度有关。

刷屏行。

刷屏行。

到这里应该不会受影响了，本行应该延伸到了图片的正下方，所以我要足够长才能确保不同的屏幕下都看到效果。

### 控制图片大小和位置

标准的 Markdown 图片标记 `![]()` 无法指定图片的大小和位置，只能依赖默认的图片大小，默认居左。

而有时候源图太大想要缩小一点，或者想将图片居中，就仍需要借助 HTML 的标签来实现了。图片居中可以使用 `<div>` 标签加 `align` 属性来控制，图片宽高则用 `width` 和 `height` 来控制。

*示例代码：*

```
图片默认显示效果：
![](http://ow1zq9frr.bkt.clouddn.com/00.jpg)

加以控制后的效果：
<div align="center"><img width="60" height="80" src="http://ow1zq9frr.bkt.clouddn.com/00.jpg"/></div>
```

*示例效果：*

* 图片默认显示效果：

![](http://ow1zq9frr.bkt.clouddn.com/00.jpg)

* 加以控制后的效果：

<div align="center"><img width="60" height="80" src="http://ow1zq9frr.bkt.clouddn.com/00.jpg"/></div>

<br />

* 还可以**只设置**图片的**宽度`或者`高度**来达到等比缩放的目的：

```
<div align="center"><img width="100" src="http://ow1zq9frr.bkt.clouddn.com/00.jpg"/></div>
```

<div align="center"><img width="100" src="http://ow1zq9frr.bkt.clouddn.com/00.jpg"/></div>

### 在表格单元格里换行

在表格单元格里换行用 HTML 里的 `<br />` 实现。

*示例代码：*

```
| Header1 | Header2                               |
|---------|---------------------------------------|
| item 1  | 1\. one<br /> 2\. two<br /> 3\. three |
```

*示例效果：*

| Header1 | Header2 |
| --- | --- |
| item 1 | 1\. one<br /> 2\. two<br /> 3\. three |
<br />

另外**多列表格**的表示方式还可以简写，<font color=red>可以去掉前后2个竖线`|`</font>

*示例代码：*

```
Header1 | Header2
--- | ---
item 1 | 1\. one
item 2 | 2\. two
```

*示例效果：*

Header1 | Header2
--- | ---
item 1 | 1\. one
item 2 | 2\. two

### 使用 Emoji
先看看 [Emoji介绍](http://mp.weixin.qq.com/s?__biz=MzIzMjk2NDAxNg==&mid=100000127&idx=1&sn=5b9527e7b19f0adb1960452b10c42806&chksm=688daba05ffa22b610a8180fc344c40f62083882a41e7a28edb86c68e8ea487017fe639bf748)，再看下面的使用方式：

1. 复制/粘贴，可以到 [Get Emoji](http://getemoji.com/) 选中一个 Emoji 贴在自己的文档即可；
2. 输入法输入 Emoji，现在很多输入法都支持 Emoji输入。Mac OS下在编辑框里直接按快捷键 `command+control+空格` 就可以；
3. 通过码点输入 Emoji。以 HTML 网页为例，将码点 `U+1F600` 写成 HTML 实体的形式 十六进制`&#x1F600;` 或 十进制`&#128512;` 就可以插入网页；
	
	>2010年，Unicode 开始为 Emoji 分配码点。也就是说，现在的 Emoji 符号就是一个文字，它会被渲染为图形。截止 2017年8月17，列入 Unicode 的 Emoji 共有2623个。
	
	使用小技巧，从 [Full Emoji List v5.0](http://www.unicode.org/emoji/charts/full-emoji-list.html) 查询 Emoji 的 Unicode 码点`U+1F602`，把`U+`换成`&#x`后在最后再加`;`就行了，就是以十六进制的方式来表示：
	码点为`U+1F602`，十六进制表示为`&#x1F602;` 展示为 &#x1F602;
	码点为`U+1F4C5`，十六进制表示为`&#x1F4C5;` 展示为 &#x1F4C5;
	码点为`U+1F60F`，十六进制表示为`&#x1F60F;` 展示为 &#x1F60F;

### 脚注（Footnote）

标准语法为 `[^keyword]`，keyword随意，保证唯一就行。

*示例代码：*

```
Markdown到底是什么？[^footnote1]
```

*示例效果：*

Markdown到底是什么？[^footnote1]

### 使用LaTex数学公式

1. LaTeX语法，[MathJax 基础教程](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)

	<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default">
	\\(\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}\\)
	12
	$$\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$$
	34
	$\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$
	</script>

	* **行内公式** 用 `$` 开头结尾：`$x - y$` 展示为 $x - y$
	* **行间公式** 用 `$$` 开头结尾：
		`$$x - y$$` 展示为 \\(x - y\\)
		`$$x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$$` 展示为 \\(x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}\\)
	
	* **除法** 用 `\frac`

		`$\frac ab$` 展示为 $\frac ab$
	
	* **指数** 用 `^` 加相应字符来实现：

		`$x^{2}$` 展示为 $x^{2}$
		`$e^{-\alpha t}$` 展示为 $e^{-\alpha t}$
	
	* **下标** 用 `_` 加相应字符来实现：
	
		`$a_{1}$` 展示为 $a_{1}$
		`$a^{3}_{ij}$` 展示为 $a^{3}_{ij}$
		`$\int_a^b f(x)$` 展示为 $\int_a^b f(x)$
		`$e^{x^2} \neq {e^x}^2$` 展示为 $e^{x^2} \neq {e^x}^2$
		
	* **平方根** 用 `\sqrt`，n 次方根为 `\sqrt[n]`，方根符号的大小由 LaTeX 自动调整，也可用 `\surd` 仅给出符号：
	
		`$\sqrt{x}$` 展示为 $\sqrt{x}$
		`$\sqrt{ x^{2}+\sqrt{y} }$` 展示为 $\sqrt{ x^{2}+\sqrt{y} }$
		`$\sqrt[3]{2}$` 展示为 $\sqrt[3]{2}$
		`$\surd[x^2 + y^2]$` 展示为 $\surd[x^2 + y^2]$
	
	* **上下水平线** 用 `\overline` 和 `\underline`
	
		`$\overline{m+n}$` 展示为 $\overline{m+n}$
		`$\underline{m+n}$` 展示为 $\underline{m+n}$
	
	* **上下水平大括号** 用 `\overbrace` 和 `\underbrace`
	
		`$\overbrace{ a+b+\cdots+z }^{26}$` 展示为 $\overbrace{ a+b+\cdots+z }^{26}$
		`$\underbrace{ a+b+\cdots+z }_{26}$` 展示为 $\underbrace{ a+b+\cdots+z }_{26}$
	
	* **求和** $\sum$ 用 `\sum`
		`$\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$` 展示为 $\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$
		`$$\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$$` 展示为 \\(\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}\\)
		
		<font color=red>右键上面公式有惊喜（语言选中文再看看）</font>

2. 贴图方式。如果没法使用<font color=red>非图片</font>方式来优雅地展示数学公式，还可以使用贴图方式，以下是一种比较方便的贴图方案：

	1. [在线 LaTeX 公式编辑器](https://www.codecogs.com/latex/eqneditor.php) 网页上部的输入框里输入 LaTeX 公式，比如 `$$x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$$`；

	2. 在网页下部拷贝 URL Encoded 的内容，比如以上公式生成的是 `https://latex.codecogs.com/png.latex?%24%24x%3D%5Cfrac%7B-b%5Cpm%5Csqrt%7Bb%5E2-4ac%7D%7D%7B2a%7D%24%24`；

    	![latex-w400](http://ow1zq9frr.bkt.clouddn.com/latex-img.png)

	3. 在文档需要的地方使用以上 URL 贴图
	
		*示例代码：*
		
	    ```
	    ![](https://latex.codecogs.com/png.latex?%24%24x%3D%5Cfrac%7B-b%5Cpm%5Csqrt%7Bb%5E2-4ac%7D%7D%7B2a%7D%24%24)
	    ```
	
	    *示例效果（贴图）：*
	    
	    ![](http://ow1zq9frr.bkt.clouddn.com/png.latex)
	    
- - -

### 特殊符号输出

使用HTML标签和实体输出特殊符号，懂行的直接跳过，不熟悉的可以参考，比如：
使用 `n<sup>2</sup>=n+1` 显示为 n<sup>2</sup>=n+1
使用 `a=log<sub>2</sub>b` 显示为 a=log<sub>2</sub>b

| 显示结果 | 描述 | 实体名称 | 实体编号 |
| :-- | :-- | :-- | :-- |
| ¢ | 美分 | `&cent;` | `&#162;` |
| £ | 英镑 | `&pound;` | `&#163;` |
| ¥ | 日圆 | `&yen;` | `&#165;` |
| § | 章节 | `&sect;` | `&#167;` |
| © | 版权 | `&copy;` | `&#169;` |
| ® | 注册商标 | `&reg;` | `&#174;` |
| × | 乘号 | `&times;` | `&#215;` |
| ÷ | 除号 | `&divide;` | `&#247;` |
| √ | 平方根 | `&radic;` | `&#8730;` |
| ƒ | f with hook | `&fnof;` | `&#402;` |
| ° | 度&deg; | `&deg;` | `&#176;` |
| ² | 上标&sup2; | `&sup2;` | `&#178;` |
| ³ | 上标&sup3; | `&sup3;` | `&#179;` |
| ¹ | 上标&sup1; | `&sup1;` |
| ¶ | 段落符号 | `&para;` |
| ∞ | 无限大符号 | `&infin;` |
| ∠ | 角度符号 | `&ang;` |
| ∫ | 积分符号 | `&int;` |
| + | 加号 | `&plus;` |
| − | 减号 | `&minus;` |
| ± | 正负符号 | `&plusmn;` |
| ≠ | 不等于符号 | `&ne;` |
| ≡ | 恒等符号 | `&equiv;` |
| ≤ | 小于等于符号 | `&le;` |
| ≥ | 大于等于符号 | `&ge;` |
| ⊥ | 垂直符号 | `&perp;` |
| ½ | 二分之一符号 | `&frac12;` |
| ¼ | 四分之一符号 | `&frac14;` |
| ¾ | 四分之三符号 | `&frac34;` |
| ‰ | 千分符号 | `&permil;` |
| π | 圆周率符号 | `&pi;` |
| τ | Tau符号 | `&tau;` |
| α | Alpha符号 | `&alpha;` |
| β | Bata符号 | `&beta;` |
| γ | Gamma符号 | `&gamma;` |
| Δ | Delta符号 | `&Delta;` |
| θ | Theta符号 | `&theta;` |
| λ | Lambda符号 | `&lambda;` |
| Σ | Sigma符号 | `&Sigma;` |
| ™ | 商标符号 | `&trade;` |
| € | 欧元符号 | `&euro;` |


更多特殊符号参考（以下互补）：
[博客](http://blog.csdn.net/html5_/article/details/21639475)
W3School [HTML 4.01 符号实体](http://www.w3school.com.cn/tags/html_ref_symbols.html) 
站长工具 [HTML特殊符号表](http://tool.chinaz.com/Tools/htmlchar.aspx)

[^footnote1]: Markdown 是一种方便记忆、书写的**纯文本标记语言**，用户可以使用这些标记符号<font color=red>以最小的输入代价生成极富表现力的文档</font>，目前它已经成为**世界上最大的技术分享网站 GitHub 和技术问答网站 StackOverFlow 、世界上最流行的博客平台WordPress和大型CMS如Joomla、Drupal**的御用书写格式，当然CSDN博客、简书都支持。








