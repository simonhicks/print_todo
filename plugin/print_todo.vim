if exists("g:loaded_print_todo_vim")
  finish
endif
let g:loaded_print_todo_vim = 1

if exists("g:print_todo_sync_folder")
  command! PrintTodos call print_todo#printTodos()
  nnoremap <space>pt :PrintTodos<CR>
endif

