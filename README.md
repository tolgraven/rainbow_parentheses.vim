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
```

[k]: https://github.com/kien/rainbow_parentheses.vim

