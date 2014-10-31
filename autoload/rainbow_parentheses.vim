"==============================================================================
"  Description: Rainbow colors for parentheses, based on rainbow_parenthsis.vim
"               by Martin Krischik and others.
"==============================================================================

let s:default_colors = {
\   'dark': [
\     ['yellow',  'orange1'     ],
\     ['green',   'yellow1'     ],
\     ['cyan',    'greenyellow' ],
\     ['magenta', 'green1'      ],
\     ['red',     'springgreen1'],
\     ['yellow',  'cyan1'       ],
\     ['green',   'slateblue1'  ],
\     ['cyan',    'magenta1'    ],
\     ['magenta', 'purple1'     ]
\   ],
\   'light': [
\     ['darkyellow',  'orangered3'    ],
\     ['darkgreen',   'orange2'       ],
\     ['blue',        'yellow3'       ],
\     ['darkmagenta', 'olivedrab4'    ],
\     ['red',         'green4'        ],
\     ['darkyellow',  'paleturquoise3'],
\     ['darkgreen',   'deepskyblue4'  ],
\     ['blue',        'darkslateblue' ],
\     ['darkmagenta', 'darkviolet'    ]
\   ]
\ }

function! rainbow_parentheses#activate()
  let max = get(g:, 'rainbow#max_level', 16)
  let colors = get(g:, 'rainbow#colors', s:default_colors)[&background]

  for level in range(1, max)
    let [c, g] = colors[(level - 1) % len(colors)]
    execute printf('hi rainbowParensShell%d ctermfg=%s guifg=%s', max - level + 1, c, g)
  endfor
  call s:regions(max)

  augroup rainbow_parentheses
    autocmd!
    autocmd ColorScheme,Syntax * call rainbow_parentheses#activate()
  augroup END
  let b:rainbow_max_level = max
endfunction

function! rainbow_parentheses#deactivate()
  if exists('b:rainbow_max_level')
    for level in range(1, b:rainbow_max_level)
      execute 'hi clear rainbowParensShell'.level
    endfor
    augroup rainbow_parentheses
      autocmd!
    augroup END
    augroup! rainbow_parentheses
    unlet b:rainbow_max_level
  endif
endfunction

function! rainbow_parentheses#toggle()
  if exists('b:rainbow_max_level')
    call rainbow_parentheses#deactivate()
  else
    call rainbow_parentheses#activate()
  endif
endfunction

function! s:regions(max)
  let pairs = get(g:, 'rainbow#pairs', [['(',')']])
  for level in range(1, a:max)
    let cmd = 'syntax region rainbowParens%d matchgroup=rainbowParensShell%d start=/%s/ end=/%s/ contains=%s'
    let children = extend(['TOP'], map(range(level, a:max), '"rainbowParens".v:val'))
    for pair in pairs
      let [open, close] = map(copy(pair), 'escape(v:val, "[]/")')
      execute printf(cmd, level, level, open, close, join(children, ','))
    endfor
  endfor
endfunction

