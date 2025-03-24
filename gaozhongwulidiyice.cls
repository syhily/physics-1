\ProvidesClass{gaozhongwulidiyice}
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{fix-cm}
\ProcessOptions\relax
\LoadClass[openany,twoside,scheme=chinese,fontset=none]{ctexbook}


% ----------------------------------------------------------
% 基本设置
% ----------------------------------------------------------

% 页面、版心
\RequirePackage{geometry}
\geometry
{
    paperheight=280mm,
    paperwidth=210mm,
    top=23mm,
    bottom=23mm,
    left=25mm,
    right=25mm,
    %bindingoffset=8mm,
    footskip=10mm
}

% 英文字体
\setmainfont{XITS}

% 中文字体，使用方正书宋、黑体、楷体、仿宋四种免费字体，采用思源字体作为书宋和黑体粗体
\setCJKmainfont{LXGW WenKai GB}
[
    BoldFont={Alimama DongFangDaKai},
    ItalicFont={Source-KeynoteartHans}
]
\setCJKsansfont{Source Han Sans HW SC}
[
    BoldFont={Source Han Sans HW SC Bold}
]
\setCJKmonofont{LXGW WenKai MONO GB}


% 数理书籍实心句号
\catcode`\。=13
\def 。{．}  % {\symbol{65294}}

% 汉字效果，着重号等
\RequirePackage{CJKfntef}

% ----------------------------------------------------------
% 版式
% ----------------------------------------------------------
\RequirePackage{linegoal}
\newlength\goalindent
\newcommand\hindentpar[1]{%
    \setlength\goalindent{\dimexpr\linewidth-\linegoal\relax}%
    \hangindent\goalindent%
    #1}
% PDF 整页
\RequirePackage{pdfpages}

% 版式风格
\RequirePackage{fancyhdr}

% plain 版式，章标题页
\fancypagestyle{plain}
{
    \fancyhf{}
    \fancyhead[RO,LE]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
% heading 版式，正文普通页
\fancypagestyle{heading}
{
    \fancyhf{}
    \fancyhead[LO]{\zihao{6}\underline{高中物理第一册}}
    \fancyhead[RE]{\zihao{6}\underline{\leftmark}}
    \fancyhead[RO,LE]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
% foreword 版式，前言、目录、序等页
\fancypagestyle{foreword}
{
    \fancyhf{}
    \fancyfoot[RO,LE]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% 章节标题
\ctexset
{
    chapter=
     {
      nameformat=\zihao{4}\bfseries,
      aftername=\vspace{0.7em}\break,
      titleformat=\zihao{3},
      beforeskip=1em,
      afterskip=2em,
     },
    section=
     {
      format=\zihao{4}\bfseries,
      beforeskip=1.2em,
      afterskip=1em,
     },
    subsection=
        {
            format=\zihao{-4}\bfseries,
            beforeskip=1em,
            afterskip=0.8em,
        },
    subsubsection=
        {
            format=\zihao{5}\bfseries,
            beforeskip=1em,
            afterskip=0.8em,
        },
}

% 目录
\RequirePackage[subfigure]{tocloft}
\tocloftpagestyle{foreword}
\renewcommand{\contentsname}
{ \bfseries\zihao{3}\hfill\makebox[5em][s]{目录}\hfill\vspace{-1em} }
\renewcommand{\cftchapfont}{\bfseries\zihao{-5}}
\renewcommand{\cftsecfont}{\bfseries\zihao{-5}}
\renewcommand{\cftsubsecfont}{\bfseries\zihao{-5}}
\renewcommand{\cftdot}{\ensuremath{\cdots}}
\renewcommand{\cftdotsep}{0}
\renewcommand{\cftchapdotsep}{0}
\cftbeforetoctitleskip=2em
\cftaftertoctitleskip=6em
\cftbeforechapskip=-0.14em
\cftbeforesecskip=-0.14em

% 思考题，按节处理
\newcounter{question}[chapter]
\newcommand{\question}{\stepcounter{question}\par\thequestion .}
\newenvironment{questions}
{
    \refstepcounter{section}
    \addcontentsline{toc}{section}{思考题}
    \setcounter{question}{0}
    \begin{center}\textsf{\makebox[5em][s]{思考题}}\end{center}

}
{ \normalfont }

% 习题，按节处理
\newcounter{exercise}[chapter]
%\newcommand{\exercise}{\stepcounter{exercise}\noindent\theexercise .}
\newenvironment{exercises}
{%
    \refstepcounter{section}
    \addcontentsline{toc}{section}{习题}
    \setcounter{exercise}{0}
    \begin{center}\textbf{\makebox[5em][s]{\zihao{4}习题}}
    \end{center}
}
{ \normalfont }

% ----------------------------------------------------------
% 数学排版
% ----------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{mathtools}
% align 需要

% 公式缩进
%\setlength{\mathindent}{0em}
% 公式按节编号
\numberwithin{equation}{chapter}

% 行距调整
\RequirePackage{zhlineskip}
\SetMathEnvironmentSinglespace{1.05}

% 符号
\RequirePackage{yhmath}
\RequirePackage[mathrm=sym,warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}
%\RequirePackage{scalerel}

% 数学字体
\setmathfont{XITS Math}[StylisticSet=8] % 直立积分符号

\RequirePackage{etoolbox}
% 公式前导文本， align 环境
\newif\if@gather@prefix
\preto\place@tag@gather
{%
    \if@gather@prefix
        \iftagsleft@
            \kern-\gdisplaywidth@
            \rlap{\gather@prefix}%
            \kern\gdisplaywidth@
        \fi
    \fi
}
\appto\place@tag@gather
{%
    \if@gather@prefix
        \iftagsleft@\else
            \kern-\displaywidth
            \rlap{\gather@prefix}%
            \kern\displaywidth
        \fi
    \fi
    \global\@gather@prefixfalse
}
\preto\place@tag
{%
    \if@gather@prefix
        \iftagsleft@
            \kern-\gdisplaywidth@
            \rlap{\gather@prefix}%
            \kern\displaywidth@
        \fi
    \fi
}
\appto\place@tag
{%
    \if@gather@prefix
        \iftagsleft@\else
            \kern-\displaywidth
            \rlap{\gather@prefix}%
            \kern\displaywidth
        \fi
    \fi
    \global\@gather@prefixfalse
}
\def\math@cr@@@align
{%
    \ifst@rred\nonumber\fi
    \if@eqnsw \global\tag@true \fi
    \global\advance\row@\@ne
    \add@amps\maxfields@
    \omit
    \kern-\alignsep@
    \if@gather@prefix\tag@true\fi
    \iftag@
        \setboxz@h{\@lign\strut@{\make@display@tag}}%
        \place@tag
    \fi
    \ifst@rred\else\global\@eqnswtrue\fi
    \global\lineht@\z@
    \cr
}
\newcommand*{\beforetext}[1]
{%
    \ifmeasuring@\else
        \gdef\gather@prefix{#1}%
        \global\@gather@prefixtrue
    \fi
}

% 向量格式
\renewcommand{\vec}[1]{{\symbfsf {#1}}}
% 求导符号
%\RequirePackage{fixdif}
\newcommand{\dif}{\mathop{}\!\symrm{d}}
%\newcommand{\dif}{\d}
% 数学模式连字符
\mathchardef\mathdash="2D

% 数学常数
\newcommand{\e}{\mathrm e}

% 例、解、讨论
\newcounter{example}[chapter]
\newcommand{\example}{\stepcounter{example}【例~\theexample】\quad}
\newcommand{\solution}{\textsf{解}\quad}
\newcommand{\resolve}{\solution}
\newcommand{\discussion}{\heiti 讨论~\normalfont}

% ----------------------------------------------------------
% 页面元素
% ----------------------------------------------------------

% 书签、链接
\RequirePackage{hyperref}
\hypersetup
{
    hidelinks,
    colorlinks=true,
    allcolors=black,
    pdfstartview=Fit,
    breaklinks=true,
    bookmarksnumbered=true,
    pdftitle=高中物理第一册,
    %pdfpagelabels=true
}
\RequirePackage{bookmark}

% 摘录
\RequirePackage
[
    leftmargin=2em,
    rightmargin=2em,
    font={fangsong},
    vskip=0pt
]
{quoting}

% 图形
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{wrapfig}

% 表格
\RequirePackage{tabularray}
%\UseTblrLibrary{amsmath}
\UseTblrLibrary{siunitx}
\UseTblrLibrary{booktabs}
% 自定义格式
\NewColumnType{Z}[1][]{Q[co=1,si,#1]}

% 图表标题
\RequirePackage{caption}
\DeclareCaptionFormat{table}{\heiti\zihao{-5}#1#2#3}
\captionsetup[table]
{%
    position=above,
    format=hang,
    font=small,
    skip=0.5em,
    labelsep=space
}
\captionsetup[figure]
{%
    position=below,
    format=hang,
    font=small,
    skip=0.5em,
    labelsep=space
}

% ----------------------------------------------------------
% 注释
% ----------------------------------------------------------
% 星号脚注
\newcommand\sbfootnote[1]{%
    \begingroup
    \renewcommand\thefootnote{\fnsymbol{footnote}}
    \footnote{#1}%
    \addtocounter{footnote}{-1}%
    \endgroup
}

% 重排校注
\RequirePackage{endnotes}
\renewcommand{\notesname}{\makebox[6em][s]{重排校注}}
\renewcommand{\theenmark}{[\theendnote]}
\newcommand{\errnote}[2]{%
    \stepcounter{endnote}\label{err:\theendnote}%
    \addtoendnotes{\makebox[2em][r]{\theenmark}~ #1： #2（第\!\,\pageref{err:\theendnote}页）}%
    \marginpar{$^{\theenmark}$}%
    #1%
}

\usepackage{zhlineskip}

% ----------------------------------------------------------
% 自定义命令
% ----------------------------------------------------------
% 旧式正切余切函数名 tan cot tanh coth arctan arccot
\newcommand{\sh}{\operatorname{sh}}
\newcommand{\ch}{\operatorname{ch}}
\renewcommand{\th}{\operatorname{th}}
\newcommand{\tg}{\operatorname{tg}}
\newcommand{\ctg}{\operatorname{ctg}}
\newcommand{\tgh}{\operatorname{tgh}}
\newcommand{\ctgh}{\operatorname{ctgh}}
\newcommand{\arctg}{\operatorname{arctg}}
\newcommand{\arcctg}{\operatorname{arcctg}}

% 龟壳括号，又称六角括号
\newcommand{\lbr}{\ensuremath{\lbrbrak}}
\newcommand{\rbr}{\ensuremath{\rbrbrak}}
\newcommand{\lhbrak}{\ensuremath{\lbrbrak}}
\newcommand{\rhbrak}{\ensuremath{\rbrbrak}}