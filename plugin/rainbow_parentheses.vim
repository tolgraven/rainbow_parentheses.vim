"==============================================================================
"  Description: Rainbow colors for parentheses, based on rainbow_parenthsis.vim
"               by Martin Krischik and others.
"==============================================================================

command! -bang RainbowParentheses
  \   if empty('<bang>')
  \|   call rainbow_parentheses#activate()
  \| else
  \|   call rainbow_parentheses#deactivate()
  \| endif

