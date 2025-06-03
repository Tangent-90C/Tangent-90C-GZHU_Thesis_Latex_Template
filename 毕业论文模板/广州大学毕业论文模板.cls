\NeedsTeXFormat{LaTeX2e} % 声明需要的 LaTeX 版本
\ProvidesClass{广州大学毕业论文模板}[2025/06/03 v1.4 广州大学毕业论文模板] % 定义文档类名称和版本

\RequirePackage{ifplatform}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置类和根据操作系统加载字体
% ========== 定义控制变量 ==========
\newcommand{\@pagestart}{摘要}                % 默认页码起始位置
\newcommand{\@pagenumpos}{R}                % 默认页码位置（右下角）
\newif\if@absolutepage   % 声明布尔变量（是否启用绝对页码）
\@absolutepagefalse      % 默认关闭绝对页码（相对页码模式）

\newif\if@CoverAsPage   % 声明布尔变量（封面是否算页数）
\@CoverAsPagefalse      % 默认封面不算页数

% ========== 声明选项 ==========
% 处理页码位置选项
\DeclareOption{页码位置=R}{\renewcommand{\@pagenumpos}{R}}
\DeclareOption{页码位置=C}{\renewcommand{\@pagenumpos}{C}}
\DeclareOption{页码位置=L}{\renewcommand{\@pagenumpos}{L}}

% 处理正文前页码选项
\DeclareOption{页码起始位置=封面}{\renewcommand{\@pagestart}{封面}}
\DeclareOption{页码起始位置=摘要}{\renewcommand{\@pagestart}{摘要}}
\DeclareOption{页码起始位置=目录}{\renewcommand{\@pagestart}{目录}}
\DeclareOption{页码起始位置=正文}{\renewcommand{\@pagestart}{正文}}

% 添加绝对页码选项（布尔值）
\DeclareOption{绝对页码}{\@absolutepagetrue}  % 开启绝对页码
\DeclareOption{相对页码}{\@absolutepagefalse} % 关闭绝对页码（默认）

% 添加封面是否算页数（布尔值）
\DeclareOption{封面算入页数}{\@CoverAsPagetrue}  % 开启绝对页码
\DeclareOption{封面不算入页数}{\@CoverAsPagefalse} % 关闭绝对页码（默认）

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


\LoadClass[12pt, a4paper]{article} % 这里设置的12pt字号没有用，会被后面的ctex宏包覆盖的
\RequirePackage[BoldFont,SlantFont,CJKchecksingle,AutoFakeBold=true, AutoFakeSlant=true]{xeCJK} % xeCJK的导入需要在ctex之前

\ifwindows
  \newcommand{\fontsetresult}{检测到是Windows系统，使用 fontset=windows}
  \RequirePackage[fontset=windows]{ctex} % 这个宏在导入时会覆盖默认字体大小为10.5pt，即五号字体，因此后面需要调整字体大小
\else
  \newcommand{\fontsetresult}{检测到非Windows系统，使用 fontset=none}
  \RequirePackage[fontset=none]{ctex} % 这个宏在导入时会覆盖默认字体大小为10.5pt，即五号字体，因此后面需要调整字体大小
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2025/05/02 更新，设置正文部分和参考文献部分的字体字号为12pt，即小四
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\AtBeginBibliography{
    \zihao{-4} % 这个指令也能设置字号为小四，即12pt，这个是ctex宏包的指令
    %\fontsize{12pt}{23pt}\selectfont % 这个也能设置字体行距，和上面二选一就行
    \setlength{\baselineskip}{23pt}  % 直接设置行距为 23pt
}
\AtBeginDocument{
    \zihao{-4} % 这个指令也能设置字号为小四，即12pt，这个是ctex宏包的指令
    %\fontsize{12pt}{23pt}\selectfont % 这个也能设置字体行距，和上面二选一就行
    \setlength{\baselineskip}{23pt}  % 直接设置行距为 23pt
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
\RequirePackage{amsmath, amsfonts, mathrsfs, latexsym}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{anyfontsize} % 支持任意字体大小
\usetikzlibrary{patterns,decorations.pathmorphing,calc}
\RequirePackage[bookmarksnumbered=true,  bookmarksopen=true, hyperindex, plainpages=false]{hyperref}
\providecommand{\U}[1]{\protect\rule{.1in}{.1in}}
%\defaultfontfeatures{Scale=MatchLowercase, Mapping=tex-text}
\RequirePackage{fancyhdr}
\RequirePackage{caption}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{changepage}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage[titles]{tocloft}
\RequirePackage{etoolbox}






%\headheight=10.26em
\setlength{\headheight}{0.59in}     %{0.39in}  % 页眉高度
%\setlength{\headsep}{10pt}     % 页眉与正文的间距
\setlength{\footskip}{0.69in}    % 页脚基线到页面底部的距离
% \setlength{\baselineskip}{23pt}  % 直接设置行距为 23pt % 这个设置在这没用了


\fancyhead[R]{}
\fancyhead[L]{}

\renewcommand{\headrulewidth}{0pt}
\renewcommand\refname{参考文献}
\renewcommand\indexname{索\hspace{1em}引}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\floatname{algorithm}{算法}



\renewcommand{\today}{\number\year 年\number\month 月\number\day 日}
\def\pgfsysdriver{pgfsys-dvipdfm.def}


\setcounter{tocdepth}{3}
\numberwithin{equation}{section}\numberwithin{figure}{section}\numberwithin{table}{section}
\renewcommand{\thefigure}{\thesection.\arabic{figure}}
\renewcommand{\thetable}{\thesection.\arabic{table}}
\allowdisplaybreaks%允许公式换页


\setlength{\parskip}{0em} % 设置段落间距
\setlength{\parindent}{2em} % 设置段落首行缩进


\def\@define@term#1{
	\expandafter\gdef\csname #1\endcsname##1{%
		\expandafter\gdef\csname @#1\endcsname{##1}}
	\csname #1\endcsname{}}

\@define@term{school}
\@define@term{xibie}
\@define@term{class}
\@define@term{major}
\@define@term{supervisor}
\@define@term{studentnumber}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Overleaf 支持的中文字体
% AR PL kaishuM Big5
% AR PL kaishuM GB
% AR PL Mingti2L Big5
% AR PL SungtiL GB
% AR PL UKai CN
% AR PL UKai HK
% AR PL UKai TW
% AR PL UKai TW MBE
% AR PL UMing CN
% AR PL UMing HK
% AR PL UMing TW
% AR PL UMing TW MBE
% BabelStone Han
% Droid Sans Fallback
% FandolFang
% FandolHei
% FandolKai
% FandolSong
% HanaMinA
% Noto Sans CJK HK
% Noto Sans CJK SC
% Noto Sans CJK TC
% Noto Sans Mono CJK HK
% Noto Sans Mono CJK SC
% Noto Sans Mono CJK TC
% Noto Serif CJK SC
% Noto Serif CJK TC
% UKIJ CJK
% WenQuanYi Micro Hei
% WenQuanYi Micro Hei Mono
% WenQuanYi Zen Hei
% WenQuanYi Zen Hei Mono
% WenQuanYi Zen Hei Sharp
% cwTeXFangSong
% cwTeXHeiBold
% cwTeXKai
% cwTeXMing
% cwTeXYen
% TW-Kai
% TW-Sung

% 设置默认字体 && 添加字体

\newcommand{\setfont}[6]{%
    \IfFileExists{#1}{%
        % 定义手动调用字体的宏
        \expandafter\newcommand\csname #4\endcsname{#2}
        \expandafter\def\expandafter\fontsetresult\expandafter{%
            \fontsetresult\newline
            检测到文件 #1 存在，已选择该字体作为 #3 字体，可使用 \textbackslash #4 \space 进行显示
        }%
    }{%
        % 如果字体文件不存在，使用缺省字体宏
        \expandafter\newcommand\csname #4\endcsname{#5}
        \expandafter\def\expandafter\fontsetresult\expandafter{%
            \fontsetresult\newline
            未检测到文件 #1，已使用缺省字体 #6 作为 #3 字体，可使用 \textbackslash #4 \space 进行显示
        }%
    }%
}

\ifwindows
    \expandafter\def\expandafter\fontsetresult\expandafter{%
            \fontsetresult\newline
            因为是Windows系统，跳过本地字体加载过程
        }
    
\else
    % 加载宋体
    \setfont
    {./fonts/SimSun.ttf}
    {\CJKfontspec[Path=./fonts/]{SimSun}}
    {SimSun}
    {songti}
    {\CJKfontspec{FandolSong}}
    {FandolSong}


    % 加载黑体
    \setfont
    {./fonts/SimHei.ttf}
    {\CJKfontspec[Path=./fonts/]{SimHei}}
    {SimHei}
    {heiti}
    {\CJKfontspec{FandolHei}}
    {FandolHei}
    
    % 加载楷体
    \setfont
    {./fonts/SimKai.ttf}
    {\CJKfontspec[Path=./fonts/]{SimKai}}
    {SimKai}
    {kaishu}
    {\CJKfontspec{FandolKai}}
    {FandolKai}

    % 加载楷体_GB2312
    \setfont
    {./fonts/KaiTi_GB2312.ttf}
    {\CJKfontspec[Path=./fonts/]{KaiTi_GB2312}}
    {KaiTi_GB2312}
    {kaishuGB}
    {\CJKfontspec{FandolKai}}
    {FandolKai}
\fi


\setmainfont{Times New Roman}
\newfontfamily{\NewRoman}{Times New Roman} %英文专用字体



\IfFileExists{./fonts/SimSun.ttf}{%
	\ifwindows
	\setCJKmainfont{SimSun}
	\setCJKmonofont{SimSun}
    \else
     \setCJKmainfont{SimSun}[Path=./fonts/, Extension=.ttf]% 设置缺省中文字体为宋体
    \setCJKmonofont{SimSun}[Path=./fonts/, Extension=.ttf]% 设置缺省等宽中文字体为宋体
    \fi
}{%
    % 如果字体文件不存在，使用overleaf内置字体
    \setCJKmainfont{FandolSong}
    \setCJKmonofont{FandolSong}
}



% 避免使用下面这种字体加载方式，因为它们不会自动处理加粗等操作
% \newfontfamily\heiti{SimHei}[Path=./fonts/]
% \newfontfamily\songti{SimSun}[Path=./fonts/]
% \newfontfamily\kaishu{SimKai}[Path=./fonts/]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 将目录中的引导点从细点点换成Word模板里的粗点点

\renewcommand\contentsname{\hfill {\normalfont\heiti\fontsize{18}{23}\selectfont 目录} \hfill}


\renewcommand{\cftaftertoctitle}{ \hfill \vskip 1em} % \vskip 1em是控制标题下方空白

\newcommand\mydot[1]{\scalebox{#1}{…}}
\renewcommand\cftdot{\mydot{1}} % change the size of dots
\renewcommand\cftdotsep{0} % change the space between dots

\titlecontents{section}
    [0pt]
    {\vspace{.5\baselineskip}}
    {\bfseries\thecontentslabel\quad}
    {\bfseries}
    {\hspace{.5em}\titlerule*[1em]{\cftdot}\contentspage}


% 设置目录的页码
\ifnum\strcmp{\@pagestart}{目录}=0
\pretocmd{\tableofcontents}%命令
{
  \SetupPageStyle
}%前缀代码
{}%如果成功
{}%如果失败
\fi


% 设置正文的页码
\ifnum\strcmp{\@pagestart}{正文}=0
\apptocmd{\tableofcontents}%命令
{
  \newpage
  \SetupPageStyle
}%前缀代码
{}%如果成功
{}%如果失败
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置算法Algorithm的注释
\renewcommand{\algorithmiccomment}[1]{\hfill $\triangleright$ #1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置lstlisting环境的，这个删掉关系不大

\lstset{escapechar=`,numbers=left
,extendedchars=false, escapeinside=`'
,basicstyle=\ttfamily
,backgroundcolor=\color[RGB]{245,245,244}
,keywordstyle=\bfseries\color[RGB]{130,0,0},identifierstyle=\bfseries\color[RGB]{0,0,130},numberstyle=\color[RGB]{41,41,255},commentstyle=\it\color[RGB]{130,130,130},stringstyle=\rmfamily\slshape\color[RGB]{255,0,0},showstringspaces=false,tabsize=4,texcl=true,frame=shadowbox,breaklines=true,float}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置页面格式

\RequirePackage[top=1in,bottom=1in,left=1.18in,right=1.02in]{geometry}
% 虽然教务处要求上下页边距为 2cm、左边距为 2.7cm、右边距为 2.5cm
% 但是学校发的模板的上下页边距为 1 in、左边距为 1.18 in、右边距为 1.02 in
\pagestyle{fancy}
\fancyhf{} % 清空默认的页眉和页脚

\newcommand{\SetupPageStyle}{
    \if@absolutepage
    \else
        \setcounter{page}{1}
    \fi
    \fancyfoot[\@pagenumpos]{\thepage} % 添加页码
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置章、节标题的字体

% 设置 section 标题格式
\titleformat{\section}
{\heiti\centering\fontsize{16pt}{\baselineskip}\selectfont} % 标题格式
{\thesection} % 编号
{1em}         % 编号与标题之间的间距
{}            % 标题后的额外内容

% 设置 section 标题下方的间距
\titlespacing*{\section}
{0pt} % 左侧缩进
{1\baselineskip} % 上方间距
{2\baselineskip} % 下方空 2 行



% 设置 subsection 标题格式
\titleformat{\subsection}
{\heiti\flushleft\fontsize{12pt}{\baselineskip}\selectfont} % 标题格式
{\thesubsection} % 编号
{1em}            % 编号与标题之间的间距
{}               % 标题后的额外内容

% 设置 subsection 标题下方的间距
\titlespacing*{\subsection}
{0pt} % 左侧缩进
{0.5\baselineskip} % 上方间距
{0.5\baselineskip} % 下方空 1 行


% 设置 subsubsection 标题格式
\titleformat{\subsubsection}
{\heiti\flushleft\fontsize{12pt}{\baselineskip}\selectfont} % 标题格式
{\thesubsubsection} % 编号
{1em}            % 编号与标题之间的间距
{}               % 标题后的额外内容

% 设置 subsubsection 标题下方的间距
\titlespacing*{\subsubsection}
{0pt} % 左侧缩进
{1\baselineskip} % 上方间距
{0\baselineskip} % 下方不空行

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义title头
\newcommand{\maketitleinfo}{

	\makeatletter
    
    \ifnum\strcmp{\@pagestart}{摘要}=0
        \SetupPageStyle
    \fi
    
	\begin{center}
		{
			\setlength{\parskip}{0pt}%
			\heiti\fontsize{16}{\baselineskip}\selectfont\linespread{1}
			\@title % 论文名称
            \\
        }
        { 
			\songti\fontsize{12}{23}\selectfont%
			\@major \hspace{1ex} \@class \hspace{1ex} \@author \\ % 专业班级 作者
			指导教师: \@supervisor \\ % 指导老师
			\vspace{2em}
		}
	\end{center}%
	\makeatother
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置图表文字
\DeclareCaptionFormat{custom}
{
    %\textbf{#1#2} \ {\songti\small #3}
    {\songti\fontsize{10.5pt}{23pt}\selectfont #1 \  #3}
}
\captionsetup{format=custom}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设置4个环境

% 定义中文摘要环境
\newenvironment{chineseabstract}
{\noindent{\heiti\fontsize{14}{23}\selectfont 摘要}\hspace{2em}} % 标题为“摘要”，加粗，下方留空
{\par\vspace{\baselineskip}}% 空一行 

% 定义中文关键词环境
\newenvironment{chinesekeywords}
{\noindent{\heiti\fontsize{14}{23}\selectfont 关键词}\hspace{2em}} % 标题为“关键词”
{\par\vspace{\baselineskip}}% 空一行 


% 定义英文摘要环境
\newenvironment{englishabstract}
{\noindent\textbf{\NewRoman\fontsize{14}{23}\selectfont ABSTRACT}\hspace{2em}
\begingroup
\NewRoman\setlength{\parindent}{4em}
} % 标题为“ABSTRACT”，加粗
{\endgroup
	\par\vspace{\baselineskip}}% 空一行 


% 定义英文关键词环境
\newenvironment{englishkeywords}
{\noindent\textbf{\NewRoman\fontsize{14}{23}\selectfont KEY WORDS}\hspace{2em}
\begingroup
\NewRoman
} % 标题为“KEY WORDS”
{\endgroup
\par
\vspace{\baselineskip} % 在论文里，这是最后一行了……
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义封面
\newcommand{\makecover}{
\ifnum\strcmp{\@pagestart}{封面}=0
    \SetupPageStyle
\fi

\if@CoverAsPage
\else
    \begin{titlepage}
\fi

\ifnum\strcmp{\@pagestart}{封面}=0
    \thispagestyle{fancy} % 启用页脚 
\fi


\begin{center}
	
\begin{textblock*}{2.35in}[0,0](2.99in,1.28in) % 绝对位置以英寸为单位
	\includegraphics[height=0.67in, width=2.35in]{./imgs/gzhu.jpg}\\
\end{textblock*}

%\vspace*{57pt}
\vspace*{67pt}
{\fontsize{26}{57}\selectfont\ \bf\kaishuGB{本\ \ 科\ \ 毕\ \ 业\ \ 论\ \ 文（设计）}}

%\vspace*{3.5cm}
\vspace*{3.7cm}

{
\begin{adjustwidth}{54pt}{0in}
    \fontsize{16}{24}\selectfont\kaishuGB % 指定字体为楷体三号
    \begin{tabular}{r@{}>{\centering\arraybackslash}p{3.80in}}
    
    	\ifx\@title\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 课题名称} & \@title\\%[-0.8ex]
    	\cline{2-2}
    	\fi
    	\ifx\@school\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 学\hfill 院} & \@school \\%[-0.8ex]
    	\cline{2-2}
    	\fi
    	\ifx\@xibie\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 系\hfill 别} & \@xibie \\%[-0.8ex]
    	\cline{2-2}
    	\fi
    	\ifx\@major\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 专\hfill 业} & \@major \\%[-0.8ex]
    	\cline{2-2}
    	\fi
    	\ifx\@class\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 班级名称} & \@class \\%[-0.8ex]
    	\cline{2-2}
    	\fi
    	\ifx\@author\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 学生姓名} & \@author \\%[-0.8ex]
    	\cline{2-2}
    	\fi
    	\ifx\@studentnumber\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 学\hfill 号} & \@studentnumber \\%[-0.8ex]
    	\cline{2-2}
    	\fi
    	\ifx\@supervisor\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 指导教师} & \@supervisor \\%[-0.8ex]
    	\cline{2-2}
    	\fi
    	\ifx\@date\@empty
    	\else
    	{\fontsize{18}{27}\selectfont 完成日期} & \@date \\%[-0.8ex]
    	\cline{2-2}
    	\fi
    \end{tabular}
\end{adjustwidth}
}

\vfill
{\fontsize{16}{24}\selectfont\kaishuGB{教\ 务\ 处\ 制}}
\vspace{2.5cm}

\end{center}

\if@CoverAsPage
\else
    \end{titlepage}
\fi

}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\endinput


