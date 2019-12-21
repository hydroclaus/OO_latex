目录
=================
   * [介绍](#介绍)
   * [预安装](#预安装)
      * [第一步: 安装 Python 3](#第一步-安装-python-3)
      * [第二步: 安装 ghostscript](#第二步-安装-ghostscript)
      * [第三步: 安装 PDFCrop](#第三步-安装-pdfcrop)
      * [第四步: 安装 PDFLatex](#第四步-安装-pdflatex)
         * [MacTex](#mactex)
         * [BasicTeX](#basictex)
   * [手动设置](#手动设置)
      * [下载并移动文件](#下载并移动文件)
      * [操作方法](#操作方法)
   * [感谢](#感谢)

在 OmniOutliner 中使用 Latex
========
[![LICENSE](https://img.shields.io/cran/l/devtools)](https://github.com/Hephaest/OO_latex/blob/master/LICENSE)
[![Python](https://img.shields.io/badge/Python-3.8.1-%237000FF.svg)](https://www.python.org/downloads/release/python-381/)
[![OS](https://img.shields.io/badge/OS-macOS%2010.14.6-%237060FF)](https://support.apple.com/kb/DL2015?locale=en_US&viewlocale=en_US)
[![OmniOutliner](https://img.shields.io/badge/OmniOutliner-5.5.2-important)](http://www.omnigroup.com/releasenotes/omnioutliner-mac)

中文 | [English](README.md)

<p align="center"><img src ="images/demo.gif" width = "600px"></p>

# 介绍
本仓库介绍了一种可以在 OmniOutliner 中显示 Latex 生成的公式的方法，OmniOutliner 到目前为止并没有原生的解决方法。这篇指南会引导您一步一步配置环境，尤其是没有任何编程背景的朋友们。您唯一需要注意的一点是这项功能能使用的前提是在 `macOS X` 操作系统的环境下。
# 预安装
为了确保 Latex 生成的结果能够在您的 OmniOutliner 中成功显示，您需要安装以下几个安装包。
## 第一步: 安装 Python 3
虽然当前 macOS X 下自带的版本还是 `Python 2.7` 。但是众所周知自 [2020](https://pythonclock.org/) 年后官方将不再维护 `Python 2.7` 了。鉴于这种情况，您需要安装一个版本在 3.+ 之上的 Python 解释器。如果您电脑上还没有相对应的 Python 版本的话，不妨[点击这里开始下载](https://www.python.org/ftp/python/3.8.1/python-3.8.1-macosx10.9.pkg) `Python 3.8.1`。
## 第二步: 安装 ghostscript
`ghostscript` 是一个对 `PDFCrop` 不可或缺的包。如果您的电脑上还没有安装过这个包的话，不妨[点击这里开始下载](https://pages.uoregon.edu/koch/Ghostscript-9.50.pkg)。
## 第三步: 安装 PDFCrop
正如 [**Eric Doviak**](http://pdfcrop.sourceforge.net/) 所说:
> PDFCrop 是一个 Perl 脚本，可裁剪 PDF 页面的空白边距并重新缩放它们以适合标准尺寸的纸张。它使印刷的页面更具吸引力！
如果您的电脑上还没有安装过这个包的话，不妨[点击这里开始下载][Click here to download](https://github.com/Hephaest/OO_latex/raw/master/downloads/pdfcrop_v0.4b.tar.gz)。 安装完后，将压缩包解压并把程序移动到合适的文件夹里 (比如我把文件存在 `Users` 的路径之下)。或者，你可以通过 root 权限将 `pdfcrop` 移动到 `/usr/local/bin/` 目录之下。然后，把程序重命名为 `pdfcrop` 并打开终端以输入以下命令:
```terminal
cd "your path for this folder"
sudo su
chmod 755 pdfcrop
```
## 第四步: 安装 PDFLatex
根据 [StackExchange](https://superuser.com/questions/1038612/where-do-i-get-the-pdflatex-program-for-mac) 上的经验分享，目前有两种主流的方式用于安装 `pdflatex` 到 macOS X。 

### MacTex
第一个是 `MacTex`。MacTex 是官方[推荐的](https://www.latex-project.org/get/) 针对 macOS X 的 Latex 免费软件。然而，该文件的大小超过 4 G，这样的安装要求对于这个小功能而言显然是大材小用了。但是如果您是 Latex 爱好者，请进行享受 MacTex 带来的愉快体验！

如果您的电脑上还没有安装过这个包的话，不妨[点击这里开始下载](http://tug.org/cgi-bin/mactex-download/MacTeX.pkg) 或者您是 [brew](https://brew.sh/) 用户的话，您可以在终端输入下方的指令以安装程序：
```terminal
brew cask install mactex
```
### BasicTeX
另外一个是 `BasicTeX`。BasicTeX 也提供了 `pdflatex` 的安装并且由于它没有 GUI 的功能所以程序总体要比 MacTex 小很多。

我没有试过这种方式，但是如果您是 [brew](https://brew.sh/) 用户的话，您可以在终端输入下方的指令尝试安装：
```terminal
brew cask install basictex
```
# Manual Settings
In addition to the above four steps, there are also a few steps we need to take.
## Download and Move
Firstly, please download `OO_latex.scpt` and `create_latex_pdf.py` from this repository. 

Secondly, move the file `OO_latex.scpt` to `~/Library/Application Scripts/com.omnigroup.OmniOutliner5` (Hint: this folder has been hided, you can use `Go` from Finder and search this path to find this file). 

The functions of this script are (quote from **Claus Haslauer**):
- gets content of note of selected row
     this should be a latex - math command
- passes the string of this content to a python script
     that generates a pdf of the latex string
- pastes a pdf of your latex string at the end of the selected row (not the note, the note stays there, found to be useful for future reference)

Thirdly, move the file `create_latex_pdf.py` to `~/Documents/OmniOutliner5/` (if not exists create a folder).

Finally, open an OmniOutliner file, click `View → Customize Toolbar...`, then you can find your script as shown in the following screenshot.

<p align="center"><img src ="images/toolbar.png" width = "400px"></p>

## How to use
Congratulations! You have successfully achieved this function. In the future, the only thing you need to do is write your Latex equation code in the **Note** section and about 3 seconds later you can see the result in the corresponding heading.

<p align="center"><img src ="images/equation.png" width = "600px"></p>

# Acknowledgement
This guide was written based on the works from [Yu Wang](https://github.com/wyhitcs/Latex_in_OO) and [Claus Haslauer](https://github.com/clausTue/OO_latex).
