call NERDTreeAddMenuItem({
            \ 'text': '(f)Open File Manager',
            \ 'shortcut': 'f',
            \ 'callback': 'NERDTreeOpenFileManager'})

function! NERDTreeOpenFileManager()
    let treenode = g:NERDTreeFileNode.GetSelected()
    echo "==========================================================\n"
    echo "Complete the command to execute (add arguments etc):\n"
    let cmd = treenode.path.str({'escape': 1})

    if cmd != ''
        silent exec ':!PAHT=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin xdg-open ' . cmd . ' > /dev/null 2>&1'
        silent execute ':redraw!'
    else
        echo "Aborted"
    endif
endfunction
