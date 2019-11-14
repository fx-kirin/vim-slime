
if !exists("g:slime_dispatch_ipython_pause")
  let g:slime_dispatch_ipython_pause = 100
end

function! _EscapeText_python(text)
  if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1
    return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--\n"]
  else
    let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
    let no_empty_lines = substitute(a:text, empty_lines_pat, "", "g")
    let dedent_pat = '\(^\|\n\)\zs'.matchstr(no_empty_lines, '^\s*')
    let dedented_lines = substitute(no_empty_lines, dedent_pat, "", "g")
    let except_pat = '\(elif\|else\|except\|finally\)\@!'
    let add_eol_pat = '\n\s[^\n]\+\n\zs\ze\('.except_pat.'\S\|$\)'
    let modified_text = substitute(dedented_lines, add_eol_pat, "\n", "g")
    if modified_text[:3] == 'for ' && modified_text[-2:-2] == ':'
      return  substitute(modified_text[4:-3], ' in ', ' = next(iter(', '') . '))' . "\n"
    else
      return modified_text
    end
  end
endfunction

