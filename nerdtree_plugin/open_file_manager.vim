call NERDTreeAddMenuItem({
            \ 'text': '(f)Open File Manager',
            \ 'shortcut': 'f',
            \ 'callback': 'NERDTreeOpenFileManager'})

function! NERDTreeExecFile()
    let treenode = g:NERDTreeFileNode.GetSelected()
    echo "==========================================================\n"
    echo "Complete the command to execute (add arguments etc):\n"
    let cmd = treenode.path.str({'escape': 1})

    if cmd != ''
        exec ':!xdg-open ' . cmd
    else
        echo "Aborted"
    endif
endfunction
