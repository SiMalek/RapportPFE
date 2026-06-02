\usepackage{capt-of}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{isetpfe}[2025/06/01 ISET Rades PFE LaTeX Class]

\RequirePackage{ifthen}

\newboolean{isBinomal}
\setboolean{isBinomal}{false}
\DeclareOption{isBinomal}{\setboolean{isBinomal}{true}}

\ProcessOptions\relax

\LoadClass[12pt,a4paper,oneside,openany]{book}
\usepackage[a4paper,margin=2cm]{geometry}

\addtolength{\headheight}{2.5pt}

\brokenpenalty=10000

\renewcommand\floatpagefraction{0.8}

%% Disable hyphenation
\usepackage[none]{hyphenat}

%% Section spacing (native LaTeX, compatible with minitoc)
\makeatletter
\renewcommand{\section}{\@startsection{section}{1}{3mm}{12pt}{8pt}{\normalfont\Large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{6mm}{12pt}{8pt}{\normalfont\large\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{8mm}{12pt}{6pt}{\normalfont\normalsize\bfseries}}
\makeatother

% 1.5 line spacing
\usepackage{setspace}
\setstretch{1.6}
\emergencystretch=3em

\setlength{\parindent}{8mm}

%%% header/footer
\RequirePackage{fancyhdr}
\RequirePackage{xspace}

%================ Languages ================%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english,french]{babel}

\frenchsetup{LowercaseSuperscripts=false,StandardLists=true}
\usepackage{csquotes}
\usepackage[backend=biber, language=auto, style=ieee, sorting=none]{biblatex}

%============== List customization ==============%
\usepackage{enumitem}
\usepackage{amssymb}

%================= Colors =================%
\usepackage[table]{xcolor}
\definecolor{pghGreen}{RGB}{30,110,50}
\definecolor{pghGrey}{RGB}{100,100,100}

%================= Minitoc ==================%
\usepackage[french]{minitoc}
\mtcsettitle{minitoc}{Plan}
\setcounter{minitocdepth}{2}
\mtcsetrules{minitoc}{off}
\mtcsetoffset{minitoc}{-1.0em}

\usepackage{multirow}
% Helper: raggedright minipage for use inside \multirow cells
\newcommand{\mrcell}[2]{\begin{minipage}[t]{#1}\raggedright #2\end{minipage}}

%% Minitoc section filtering
\newcommand{\filterminitoc}[1]{#1}
\renewcommand{\thesection}{\csname filterminitoc \endcsname{\arabic{chapter}.}\arabic{section}}
\newcommand{\minitocsection}{\begingroup\renewcommand{\filterminitoc}[1]{}\minitoc\endgroup}

%=============== Chapter headings ===============%
\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1.2ex \hfill \kern \z@}

\def\@makechapterhead#1{
    \vspace*{30\p@}%
    {\parindent \z@ \centering \reset@font
        {\color{pghGreen}\thickhrulefill}\quad
        \scshape\bfseries\textit{\@chapapp{}  \thechapter}
        \quad {\color{pghGreen}\thickhrulefill}
        \par\nobreak
        \vspace*{10\p@}%
        \interlinepenalty\@M
        {\color{pghGreen}\hrule}
        \vspace*{10\p@}%
        \Huge \bfseries #1 \par\nobreak
        \par
        \vspace*{10\p@}%
        {\color{pghGreen}\hrule}
        \vskip 25\p@
    }
    \minitocsection
    \thispagestyle{empty}%
    \vspace{15pt}
    \clearpage
}
\def\@makeschapterhead#1{\hbox{%
    \huge\hbox{\textbf{#1}}%
}\par\vskip 1cm}

%============== Captions ==============%
\usepackage{caption}
\captionsetup[table]{
  labelfont=bf,
  labelsep=colon,
  name=Tableau,
  justification=justified,
  singlelinecheck=false,
  skip=\medskipamount}

\captionsetup[figure]{
  labelfont=bf,
  labelsep=colon,
  name=Figure,
  justification=centering,
  singlelinecheck=false,
  skip=\medskipamount}

%%%%% Fancyhdr
\fancyhf{}
\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\footrulewidth}{0.3pt}
\pagestyle{fancy}
\lhead{\nouppercase{\leftmark}}
\rfoot{\centering \thepage}

%=============== Page Styles ===============%
\fancypagestyle{frontmatter}{%
  \fancyhf{}%
  \renewcommand{\footrulewidth}{0.3pt}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyfoot[r]{\footnotesize \thepage}%
}

\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\footrulewidth}{0.3pt}
  \renewcommand{\headrulewidth}{0pt}
  \fancyfoot[c]{\footnotesize \thepage}
}

\fancypagestyle{cover}{
  \fancyhf{}
  \renewcommand{\footrulewidth}{0pt}
  \renewcommand{\headrulewidth}{0pt}
}

% graphics
\usepackage{graphicx}
\usepackage{graphics}
\usepackage{float}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

\usepackage{array}
\setlength{\extrarowheight}{0pt}
\renewcommand{\arraystretch}{1.3}

%================== required packages ===================%
\usepackage{tcolorbox}
\usepackage{afterpage}
\usepackage{longtable}
\usepackage{etoolbox}
\AtBeginEnvironment{longtable}{\sloppy}
\AtBeginEnvironment{tabular}{\sloppy}
\usepackage{pifont}
\usepackage{ragged2e}
\usepackage{pdflscape}
\usepackage{rotating}
\usepackage{wrapfig}

% Image path
\graphicspath{{./img/}}

\renewcommand{\thesubsubsection}{\alph{subsubsection})}

% ---- new commands ----
\input{tpl/new_commands}

\selectlanguage{french}
