%
% Sébastien Mariaux
% La classe.
% Inspiré de la classe "classe_amu" d'Aix Marseille Université (v0.2, 01/07/2012)

%----------------------------------------------------------------------------------------
%	DÉFINITION DE CLASSE ET PARAMÈTRES
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Classe_Seba}[2016/02/20 Classe personnelle]
\LoadClass[a4paper,12pt, twoside, openright]{book}


%----------------------------------------------------------------------------------------
%	EXTENSIONS - PACKAGES DE BASE
%----------------------------------------------------------------------------------------
\RequirePackage[T1]{fontenc}			%% fontes de caractère
\RequirePackage[utf8]{inputenc}			%% format d'encodage
\RequirePackage{lmodern}				%% fontes latin modern
\RequirePackage{lipsum}					%% lorem ipsum (exemple)
\makeatletter
\RequirePackage{lscape}                 %% Format paysage
\RequirePackage{longtable}              %% Longs tableaux
\RequirePackage{appendix}               %% Annexes
\RequirePackage{todonotes}
\RequirePackage{amsmath}                %% Mathématiques
\RequirePackage{color, colortbl}        %% Couleurs
\RequirePackage{tcolorbox}              %% background color
\RequirePackage{arydshln }              %% Ligne pointillées dans les tableaux
\RequirePackage{scrextend}              %% Marges locales
\RequirePackage{graphicx}               %% To use rotatebox
\RequirePackage{wasysym}                %% \checked
\RequirePackage{coffee4}

%----------------------------------------------------------------------------------------
%	METADONNEES
%----------------------------------------------------------------------------------------
\newcommand{\titrethese}{Les organisations de l’Économie Sociale et Solidaire face aux
enjeux écologiques : stratégies de communication et d’action
environnementale}
\newcommand{\auteurthese}{Sébastien \textsc{Mariaux}}
\newcommand{\DR}{Emmanuelle \textsc{Reynaud}}
\newcommand{\motscles}{ESS, Twitter, environnement, Developpement durable}


%----------------------------------------------------------------------------------------
%	BIBLIOGRAPHIE
%----------------------------------------------------------------------------------------
\RequirePackage[french]{babel}		%% typographie française
\RequirePackage{csquotes}			%% guillemet

%NB : toujours garder dans le dossier les fichiers apa.bbx, apa.cbx

\PassOptionsToPackage{
    backend=biber,						%% default backend of biblatex
    maxcitenames=2,						%% list names max
    sorting=nyt,						%% sort by name, year, title
    style=apa,					    	%% apa citation scheme
    date = year,						%% format date : uniquement l'année
    backref=true,						%% back references (cf. p.)
    doi=false,							%% DOI n'apparait pas dans la biblio
    url=false,							%% Idem URL
    isbn=false,						    %% Idem issn etc.
    }{biblatex}
    \RequirePackage{biblatex}

\DefineBibliographyExtras{french}{\renewcommand*\mkbibnamefamily[1]{#1}} %Enlève les majuscules des auteurs cités dans le texte
\DeclareLanguageMapping{french}{french-apa}	    % Commande préalable pour utilisation APA French
%Les commandes à utiliser dans le texte sont \parencite{} et \textcite{}

\renewcommand{\bibfont}					%% bibliography font
             {\usefont{T1}{bch}{m}{n}\selectfont}


%----------------------------------------------------------------------------------------
%	FORMAT DE LA THESE
%----------------------------------------------------------------------------------------

\RequirePackage[titles]{tocloft}		%% TOC LOF LOT
\RequirePackage{setspace}				%% modification de l'interligne
\setcounter{secnumdepth}{3}				%% profondeur des sections numérotées

\RequirePackage[top=2.5cm, bottom=2.5cm,left=2.5cm , right=2.5cm]{geometry}	%% marges
\renewcommand{\baselinestretch}{1.5}    %% Interligne
\usepackage{fancyhdr}					%% Fancy header
\pagestyle{fancy}						%% style de page
\rhead{\nouppercase{\leftmark}}
\fancyhead[L]{}
\fancyhead[C]{}
% \let\cleardoublepage\clearpage 			% Suppression des pages blanches
\setlength{\parindent}{0cm}             % Suppression des indentations en début de paragraphe


%----------------------------------------------------------------------------------------
%	TABLE OF CONTENT
%----------------------------------------------------------------------------------------
\setcounter{tocdepth}{5}				%% profondeur des sections dans la table des matières
\RequirePackage{shorttoc}               %% Permet d'avoir une TOC moins détaillée
\RequirePackage{minitoc}                %% Tables des matières intermédiaires

\addto\captionsfrench{
  \renewcommand{\contentsname} {Table des matières détaillée}  %% Titre de la table des matières
  \renewcommand{\mtctitle}{}                    %% Titre des plans de chapitre
}

\tocloftpagestyle{plain}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % ... for parts
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % ... for chapters
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % ... for sections

%\renewcommand{\cftchapfont}{\bfseries}
%\renewcommand{\cftchappagefont}{\bfseries}
\renewcommand{\cftchappresnum}{Chapitre } %Nom des chapitres dans la TOC
\renewcommand{\cftchapaftersnum}{ : }
\renewcommand{\cftchapnumwidth}{6em}


\renewcommand{\cftpartpresnum}{Partie }
\renewcommand{\cftpartaftersnum}{- }

%----------------------------------------------------------------------------------------
%	PERSONNALISATION DES ENVIRONNEMENTS
%----------------------------------------------------------------------------------------
\RequirePackage{float}				%% définit les objets flottants tels que les figures et tableaux
\RequirePackage{caption}			%% légendes des figures
\RequirePackage{array,
	multirow,
	tabularx}						%% amélioration des tableaux
\floatplacement{figure}{H}			%% placer une figure là où elle a été appelée

%%%Encadrés
    \floatstyle{plaintop}
    \newfloat{encadre}{thp}{lop}
    \floatname{encadre}{Encadré}
    \tcbset{
    center title,
    left=0pt,
    right=0pt,
    top=0pt,
    bottom=0pt,
    colback=gray!5,
    colframe=black,
    width=\dimexpr\textwidth\relax,
    enlarge left by=0mm,
    boxsep=5pt,
    arc=0pt,outer arc=0pt,
    }

%%% Itemize et puces
    \renewcommand{\FrenchLabelItem}{\textbullet}

%%% Tableaux

    %Personnalisation de TABULARX

        \def\tabularxcolumn#1{m{#1}}
        \newcolumntype{L}{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}X}
        \newcolumntype{K}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
        \newcolumntype{R}{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}X}
        \newcolumntype{S}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
        \newcolumntype{C}{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}X}
        \newcommand{\head}[1]{\multicolumn{1}{|C}{\bfseries#1}}
        \newcommand{\finalhead}[1]{\multicolumn{1}{|C|}{\bfseries#1}}
        \addto\captionsfrench{\renewcommand{\tablename}{Tableau}}


%%% Hypothèses
	\usepackage{ntheorem}
	\newtheorem{hyp}{Proposition}
	\newtheorem{subhyp}{Proposition}
   		\renewcommand\thesubhyp{\thehyp\alph{subhyp}}
 	%Les hypothèses sont encadrées par \begin{hyp} et \end{hyp}
 	%sous hypothèses sont encadreées par \begin{subhyp} et \end{subhyp} ; pour la toute première il faut mettre :
		%\stepcounter{hyp}
		%\setcounter{subhyp}{0}
		%ensuite pour chaque première sous hyp : \setcounter{subhyp}{0}

%----------------------------------------------------------------------------------------
%	FORMAT DU PDF
%----------------------------------------------------------------------------------------

\RequirePackage{pdfpages}				%% insertion de pdf
\RequirePackage{hyperref}				%% pdf interactifs
\usepackage[]{bookmark}					%% pdf bookmark
\pdfminorversion=5						%% tell pdflatex to generate PDF in version 1.4
\pdfobjcompresslevel 0					%% compression des objets
\pdfcompresslevel 0						%% compression du PDF

\hypersetup{
	%backref=true,						%% ajout de liens
	%pagebackref=true,					%% dans bibliographie
    hyperindex=true,					%% dans index
	colorlinks=true,					%% colorise liens
	breaklinks=true,					%% retour à la ligne (si lien trop long)
	urlcolor= blue,						%% couleur hyperliens
    citecolor=blue,						%% couleur liens bibliographie
	linkcolor= black,					%% couleur liens internes
	%bookmarks=true,						%% signets Acrobat
    bookmarksopen=false,				%% signets repliés par défaut
    linktocpage=false,					%% lien numéro de page dans TOC
%% métadonnées :
	pdftitle={\titrethese},
	pdfauthor={\auteurthese},
	pdfsubject={\titrethese},
	pdfkeywords = {\motscles}
}


%----------------------------------------------------------------------------------------
%	COMMANDES PERSONNALISÉES
%----------------------------------------------------------------------------------------
%\allsectionsfont{\usefont{T1}{qhv}{b}{n}} %% font

\newcommand{\citit}[1]{\emph{\og~#1~\fg{}}}
\newcommand{\cit}[1]{\og~#1~\fg{}}
% \newcommand{\citit}[1]{\emph{«#1»}}
% \newcommand{\cit}[1]{«~#1~»}
\def\siecle#1{\textsc{\romannumeral #1}\textsuperscript{e}~siècle}

% Acronymes
%% On utilise le package acro.
%% Les acronymes s'utilisent avec la commande \ac{nom_acro}

	%\usepackage[makeindex]{glossaries}	% Ensures that all acronyms are defined once
	%	\let\oldnewacronym\newacronym
	%	\newcommand*{\provideacronym}[3]{%
	% 	\ifglsentryexists{#1}{%
	% 	}{%
	%   	\oldnewacronym{#1}{#2}{#3}%
	%	 }%
	% les acronymes sont définis dans le fichier acro.sty
	% pour les utiliser : commande \gls{ ou \Gls{}
	%\newglossary{abbrev}{abs}{abo}{List of Abbreviations}

	%\makeglossaries

\RequirePackage{acro}

%\renewcommand{\thefootnote}				%% format de numérotation des notes de bas de page
%             {\alph{footnote}}

\newcommand{\sources}{\colorbox{yellow}{***SOURCES***}}        %% Flag missing sources
\newcommand{\modif}{\colorbox{pink}{***PARAGRAPHE MODIFIÉ OU AJOUTÉ*** \\}}  %% Flag modifs récentes
\newcommand{\revoir}{\colorbox{orange}{A revoir...}}        %% Flag uncomplete stuff
\newcommand{\incomplet}{\colorbox{blue}{Partie à rédiger / compléter... \\}}        %% Flag uncomplete stuff
\newcommand{\transition}{\begin{center}***\end{center}}     %% Display '***'' for transitions
\newcommand{\reynaud}[1]{\colorbox{purple}{~#1~\\}}
\newcommand{\whitepage}{\newpage \markboth{}{} \strut}


%----------------------------------------------------------------------------------------
%	TWEET RENDERING
%----------------------------------------------------------------------------------------
