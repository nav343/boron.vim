syntax keyword borTodos   TODO XX FIXME NOTE
syntax keyword borBoolean true false null
syntax match   borComment "\$.*$"

" Match language specific keywords
syntax keyword borKeywords
      \ let
      \ const
      \ func
      \ if
      \ else
      \ while

syntax keyword borNativeFn
      \ TIME
      \ writeFile
      \ readFile
      \ clearScr
      \ print
      \ typeof
      \ input
      \ getPass

" Match all Boron number types
syntax match borNumber "\v<\d+>"
syntax match borNumber "\v<\d+\.\d+>"
syntax match borFnCall "[a-zA-Z][a-zA-Z0-9_]*\([a-zA-Z0-9_]*\)"

syntax region borString start=/"/ skip=/\\"/ end=/"/ contains=borInterpolatedWrapper
syntax region borInterpolatedWrapper start="\v\\\(\s*" end="\v\s*\)" contained containedin=borString contains=borInterpolatedString
syntax match  borInterpolatedString "\v\w+(\(\))?" contained containedin=borInterpolatedWrapper

highlight default link borTodos               Todo
highlight default link borComment             Comment

highlight default link borString              String
highlight default link borInterpolatedWrapper Delimiter
highlight default link borNumber              Number
highlight default link borBoolean             Boolean

highlight default link borKeywords Keyword
highlight default link borNativeFn Boolean
highlight default link borFnCall   Function
