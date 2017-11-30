function EditNewFilename()
  let l:filename = input("filename: ")
  exec ':wincmd l'
  exec "edit " . l:filename
endfunction

call NERDTreeAddMenuItem({
  \ 'text': '(t)New with template',
  \ 'shortcut': 't',
  \ 'callback' : 'EditNewFilename' })
