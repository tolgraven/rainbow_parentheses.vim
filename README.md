# ~~Better~~ Much simpler Rainbow Parentheses

A heavily-rewritten fork of [kien/rainbow_parentheses.vim][k].

- Simpler commands and configuration
- Automatic color extraction
- Adjusts itself when color scheme is changed

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'junegunn/rainbow_parentheses.vim'
```

## Commands

```vim
" Activate
:RainbowParentheses

" Deactivate
:RainbowParentheses!

" Toggle
:RainbowParentheses!!

" Activate it by default
autocmd VimEnter * RainbowParentheses
```

## Customization

```vim
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" By default, colors will be picked from the current color scheme
" To override this behavior, define g:rainbow#colors as follows
" (The colors in the example were taken from VimClojure)
let g:rainbow#colors = {
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
```

[k]: https://github.com/kien/rainbow_parentheses.vim

