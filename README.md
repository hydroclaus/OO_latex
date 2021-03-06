Table of Contents
=================
   * [Introduction](#introduction)
   * [Prerequisites](#prerequisites)
      * [Step 1: Install Python 3 ](#step-1-install-python-3)
      * [Step 2: Install ghostscript](#step-2-install-ghostscript)
      * [Step 3: Install PDFCrop](#step-3-install-pdfcrop)
      * [Step 4: Install PDFLatex](#step-4-install-pdflatex)
         * [MacTex](#mactex)
         * [BasicTeX](#basictex)
   * [Manual Settings](#manual-settings)
      * [Download and Move](#download-and-move)
      * [How to use](#how-to-use)
   * [Acknowledgement](#acknowledgement)

Latex in OmniOutliner
========
[![LICENSE](https://img.shields.io/cran/l/devtools)](https://github.com/Hephaest/OO_latex/blob/master/LICENSE)
[![Python](https://img.shields.io/badge/Python-3.8.1-%237000FF.svg)](https://www.python.org/downloads/release/python-381/)
[![OS](https://img.shields.io/badge/OS-macOS%2010.14.6-%237060FF)](https://support.apple.com/kb/DL2015?locale=en_US&viewlocale=en_US)
[![OmniOutliner](https://img.shields.io/badge/OmniOutliner-5.5.2-important)](http://www.omnigroup.com/releasenotes/omnioutliner-mac)

English | [中文](README_CN.md)

Last updated on `2019/12/21`

<p align="center"><img src ="images/demo.gif" width = "600px"></p>

# Introduction
This repository introduces an easy way to display Latex equations in OmniOutliner since itself doesn't provide this service.
This guide will help you successfully configure environment settings step by step. The only thing you need to note is that this works only in the operating system of `macOS X`.
# Prerequisites
To be able to successfully use Latex in OmniOutliner on your macOS X system, you must install the following packages.
## Step 1: Install Python 3
Although the current system already has `Python 2.7`. However, as we have known, `Python 2.7` will be no longer maintained by [2020](https://pythonclock.org/). Given that, you need to install a Python interpreter whose version number must be 3.+ above. [Click here to download](https://www.python.org/ftp/python/3.8.1/python-3.8.1-macosx10.9.pkg) 3.8 if you haven't any 3.+ Python.
## Step 2: Install ghostscript
`ghostscript` is a package for `PDFCrop`. [Click here to download](https://pages.uoregon.edu/koch/Ghostscript-9.50.pkg) if you don't have this package.
## Step 3: Install PDFCrop
As [**Eric Doviak**](http://pdfcrop.sourceforge.net/) said:
> PDFCrop is a Perl script that crops the white margins of PDF pages and rescales them to fit a standard size sheet of paper. It makes the printed pages far more attractive to read!

[Click here to download](https://github.com/Hephaest/OO_latex/raw/master/downloads/pdfcrop_v0.4b.tar.gz) if you don't have this package. After installation, decompress the compressed package to the suitable folder (e.g., for me is the folder under the directory of `Users`). Alternatively, you could (as root) copy `pdfcrop` to `/usr/local/bin/`. Then, rename the folder name as `pdfcrop` and open the terminal and enter the following commands:
```terminal
cd "your path for this folder"
sudo su
chmod 755 pdfcrop
```
## Step 4: Install PDFLatex
According to the [StackExchange](https://superuser.com/questions/1038612/where-do-i-get-the-pdflatex-program-for-mac), there are 2 ways to install `pdflatex` to macOS X. 

### MacTex
The first one is `MacTex`. MacTex is the [recommended](https://www.latex-project.org/get/) Latex software for macOS X. However, the size of this package is over 4 G, which is quite big for this small function. But if you are a Latex fan, please enjoy MacTex!

[Click here to download](http://mirror.ctan.org/systems/mac/mactex/mactex-20190508.pkg) if you want this package or enter the following command in the terminal if you have already installed [brew](https://brew.sh/).
```terminal
brew cask install mactex
```
### BasicTeX
Another one is called `BasicTeX`. BasicTeX also provides `pdflatex` and only uses a smaller storage size as it doesn't have GUI.

You can only download it if you have already installed [brew](https://brew.sh/). Please enter the following command in the terminal:
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
Congratulations! You have successfully achieved this function. In the future, the only thing you need to do is write your Latex equation code in the **Note** section and click that purple icon. About 3 seconds later you can see the result in the corresponding heading. The figure is shown as follows.

<p align="center"><img src ="images/equation.png" width = "600px"></p>

# Acknowledgement
This guide was written based on the works from [Yu Wang](https://github.com/wyhitcs/Latex_in_OO) and [Claus Haslauer](https://github.com/clausTue/OO_latex).
