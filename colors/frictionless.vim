" Original Author:    Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Current Maintainer: JC Delay <jcd.delay@gmail.com>
" Source Repository:  https://github.com/JcDelay/vim-frictionless

" Initialization {{{
	set background=dark

	hi clear
	if exists('syntax_on')
		syntax reset
	endif

	let g:colors_name = 'frictionless'

	if ! has('gui_running')
		if &t_Co != 256
			echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'

			finish
		endif
	endif
" }}}
" Color dictionary parser {{{
	function! s:ColorDictParser(color_dict)
		for [group, group_colors] in items(a:color_dict)
			exec 'hi ' . group
				\ . ' ctermfg=' . (group_colors[0] == '' ? 'NONE' :       group_colors[0])
				\ . ' ctermbg=' . (group_colors[1] == '' ? 'NONE' :       group_colors[1])
				\ . '   cterm=' . (group_colors[2] == '' ? 'NONE' :       group_colors[2])
				\
				\ . '   guifg=' . (group_colors[3] == '' ? 'NONE' : '#' . group_colors[3])
				\ . '   guibg=' . (group_colors[4] == '' ? 'NONE' : '#' . group_colors[4])
				\ . '     gui=' . (group_colors[5] == '' ? 'NONE' :       group_colors[5])
		endfor
	endfunction
" }}}

"	   | Highlight group                |  CTFG |  CTBG |    CTAttributes | || |   GUIFG |    GUIBG |   GUIAttributes |
"	   |--------------------------------|-------|-------|-----------------| || |---------|----------|-----------------|
call s:ColorDictParser({
	\   'Normal'                      : [    253,    233,               '',      'ffffff',  '000000',               '']
	\ , 'Visual'                      : [    240,    253,               '',      '585858',  'dadada',               '']
	\
	\ , 'Cursor'                      : [     '',     '',               '',      'ffffff',  'dd4010',               '']
	\ , 'lCursor'                     : [     '',     '',               '',      'ffffff',  '89b6e2',               '']
	\
	\ , 'CursorLine'                  : [     '',    236,               '',            '',  '3a3a3a',               '']
	\ , 'CursorLineNr'                : [    231,    237,               '',      'ffffff',  '585858',               '']
	\ , 'CursorColumn'                : [    231,    234,               '',      'ffffff',  '3a3a3a',               '']
	\
	\ , 'Folded'                      : [    249,    234,               '',      'b2b2b2',  '1c1c1c',               '']
	\ , 'FoldColumn'                  : [    243,    234,               '',      '767676',  '1c1c1c',               '']
	\ , 'SignColumn'                  : [    231,    233,               '',      'ffffff',  '121212',               '']
	\ , 'ColorColumn'                 : [      '',   234,               '',            '',  '262626',               '']
	\
	\ , 'StatusLine'                  : [    231,    236,        'reverse',      'ffffff',  '303030',        'reverse']
	\ , 'StatusLineNC'                : [    244,    232,               '',      '808080',  '080808',               '']
	\
	\ , 'LineNr'                      : [    243,    234,               '',      '767676',  '262626',               '']
	\ , 'VertSplit'                   : [    240,     '',               '',      '585858',  '1c1c1c',               '']
	\
	\ , 'WildMenu'                    : [    196,    231,               '',      'ff0000',  'ffffff',               '']
	\ , 'Directory'                   : [    143,     '',               '',      'afaf5f',        '',               '']
	\ , 'Underlined'                  : [    130,     '',               '',      'af5f00',        '',               '']
	\
	\ , 'Question'                    : [     74,     '',               '',      '5fafd7',        '',               '']
	\ , 'MoreMsg'                     : [    214,     '',               '',      'ffaf00',        '',               '']
	\ , 'WarningMsg'                  : [    202,     '',               '',      'ff5f00',        '',               '']
	\ , 'ErrorMsg'                    : [    196,     '',               '',      'ff0000',        '',               '']
	\
	\ , 'Comment'                     : [    243,    233,               '',      '767676',  '121212',               '']
	\ , 'vimCommentTitleLeader'       : [    250,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentTitle'             : [    250,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentString'            : [    245,    233,               '',      '8a8a8a',  '121212',               '']
	\
	\ , 'TabLine'                     : [    231,    238,               '',      'ffffff',  '444444',               '']
	\ , 'TabLineSel'                  : [    255,     '',               '',      'eeeeee',        '',               '']
	\ , 'TabLineFill'                 : [    240,    238,               '',      '585858',  '444444',               '']
	\ , 'TabLineNumber'               : [    160,    238,               '',      'd70000',  '444444',               '']
	\ , 'TabLineClose'                : [    245,    238,               '',      '8a8a8a',  '444444',               '']
	\
	\ , 'SpellCap'                    : [    231,     31,               '',      'ffffff',  '0087af',               '']
	\
	\ , 'SpecialKey'                  : [    239,     '',               '',      '4e4e4e',        '',               '']
	\ , 'NonText'                     : [     88,     '',               '',      '870000',        '',               '']
	\ , 'MatchParen'                  : [    231,     25,               '',      'ffffff',  '005faf',               '']
	\
	\ , 'Constant'                    : [    137,     '',               '',      'af875f',        '',               '']
	\ , 'Special'                     : [    150,     '',               '',      'afd787',        '',               '']
	\ , 'Identifier'                  : [     66,     '',               '',      '5f8787',        '',               '']
	\ , 'Statement'                   : [    186,     '',               '',      'd7d787',        '',               '']
	\ , 'PreProc'                     : [    247,     '',               '',      '9e9e9e',        '',               '']
	\ , 'Type'                        : [     67,     '',               '',      '5f87af',        '',               '']
	\ , 'String'                      : [    143,     '',               '',      'afaf5f',        '',               '']
	\ , 'Number'                      : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Define'                      : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Error'                       : [    208,    124,               '',      'ff8700',  'af0000',               '']
	\ , 'Function'                    : [    179,     '',               '',      'd7af5f',        '',               '']
	\ , 'Include'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'PreCondit'                   : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Keyword'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Search'                      : [    231,    131,               '',      '000000',  'ffff5f',      'underline']
	\ , 'Title'                       : [    231,     '',               '',      'ffffff',        '',               '']
	\ , 'Delimiter'                   : [    246,     '',               '',      '949494',        '',               '']
	\ , 'StorageClass'                : [    187,     '',               '',      'd7d7af',        '',               '']
	\ , 'Operator'                    : [    180,     '',               '',      'd7af87',        '',               '']
	\
	\ , 'TODO'                        : [    228,     94,               '',      'ffff87',  '875f00',               '']
	\
	\ , 'SyntasticWarning'            : [    220,     94,               '',      'ffff87',  '875f00',               '']
	\ , 'SyntasticError'              : [    202,     52,               '',      'ffff87',  '875f00',               '']
	\
	\ , 'Pmenu'                       : [    248,    240,               '',      'a8a8a8',  '585858',               '']
	\ , 'PmenuSel'                    : [    253,    245,               '',      'dadada',  '8a8a8a',               '']
	\ , 'PmenuSbar'                   : [    253,    248,               '',      'dadada',  'a8a8a8',               '']
	\
	\ , 'phpEOL'                      : [    245,     '',               '',      'dadada',        '',               '']
	\ , 'phpStringDelim'              : [     94,     '',               '',      '875f00',        '',               '']
	\ , 'phpDelimiter'                : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'phpFunctions'                : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'phpBoolean'                  : [    172,     '',               '',      'd78700',        '',               '']
	\ , 'phpOperator'                 : [    215,     '',               '',      'ffaf5f',        '',               '']
	\ , 'phpMemberSelector'           : [    138,     '',               '',      'af8787',        '',               '']
	\ , 'phpParent'                   : [    227,     '',               '',      'ffff5f',        '',               '']
	\
	\ , 'PHPClassTag'                 : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPInterfaceTag'             : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPFunctionTag'              : [    222,     '',               '',      'ffd787',        '',               '']
	\
	\ , 'pythonDocString'             : [    240,    233,               '',      '585858',  '121212',               '']
	\ , 'pythonDocStringTitle'        : [    245,    233,               '',      'dadada',  '121212',               '']
	\ , 'pythonRun'                   : [     65,     '',               '',      '5f875f',        '',               '']
	\ , 'pythonBuiltinObj'            : [     67,     '',               '',      '5f87af',        '',               '']
	\ , 'pythonSelf'                  : [    250,     '',               '',      'bcbcbc',        '',               '']
	\ , 'pythonFunction'              : [    179,     '',               '',      'd7af5f',        '',               '']
	\ , 'pythonClass'                 : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'pythonExClass'               : [    130,     '',               '',      'af5f00',        '',               '']
	\ , 'pythonException'             : [    130,     '',               '',      'af5f00',        '',               '']
	\ , 'pythonOperator'              : [    186,     '',               '',      'd7d787',        '',               '']
	\ , 'pythonPreCondit'             : [    152,     '',               '',      'afd7d7',        '',               '']
	\ , 'pythonDottedName'            : [    166,     '',               '',      'd75f00',        '',               '']
	\ , 'pythonDecorator'             : [    124,     '',               '',      'af0000',        '',               '']
	\
	\ , 'PythonInterfaceTag'          : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonClassTag'              : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'PythonFunctionTag'           : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonVariableTag'           : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PythonMemberTag'             : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'CTagsImport'                 : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsClass'                  : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'CTagsFunction'               : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsGlobalVariable'         : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'CTagsMember'                 : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'xmlTag'                      : [    149,     '',               '',      'afd75f',        '',               '']
	\ , 'xmlTagName'                  : [    250,     '',               '',      'bcbcbc',        '',               '']
	\ , 'xmlEndTag'                   : [    209,     '',               '',      'ff875f',        '',               '']
	\
	\ , 'cssImportant'                : [    166,     '',               '',      'd75f00',        '',               '']
	\
	\ , 'DiffAdd'                     : [    112,     22,               '',      '87d700',  '005f00',               '']
	\ , 'DiffChange'                  : [    220,     94,               '',      'ffd700',  '875f00',               '']
	\ , 'DiffDelete'                  : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'DiffText'                    : [    220,     94,        'reverse',      'ffd700',  '875f00',        'reverse']
	\
	\ , 'diffLine'                    : [     68,     '',               '',      '5f87d7',        '',               '']
	\ , 'diffFile'                    : [    242,     '',               '',      '6c6c6c',        '',               '']
	\ , 'diffNewFile'                 : [    242,     '',               '',      '6c6c6c',        '',               '']
\ })

hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete

hi link ModeMsg            Normal
