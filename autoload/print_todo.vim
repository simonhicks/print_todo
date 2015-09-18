if exists("g:loaded_print_todo_vim_autoload")
  finish
endif
let g:loaded_print_todo_vim_autoload = 1

function! s:parseTodoLine(prefix, line)
  let parts = split(a:line, ':')
  let path = parts[0]
  let todo = substitute(parts[1], a:prefix, '', '')
  return [path, todo]
endfunction

function! s:addTodo(files, path, todo)
  if !has_key(a:files, a:path)
    let a:files[a:path] = []
  endif
  call add(a:files[a:path], a:todo)
endfunction

function! s:findTodos(dir, prefix, fileIncludeGlob)
  let lines = split(system("grep -r '".escape(a:prefix, '#')."' --include '".a:fileIncludeGlob."' ".a:dir), "\n")
  let todoFiles = {}
  for line in lines
    let parsed = s:parseTodoLine(a:prefix, line)
    call s:addTodo(todoFiles, substitute(parsed[0], fnamemodify(a:dir, ':p'), '', ''), parsed[1])
  endfor
  return todoFiles
endfunction

function! s:todosInTodoFiles()
  return s:findTodos(g:print_todo_sync_folder, '\[ \] ', '*todo')
endfunction

function! s:todosInMarkdownFiles()
  return s:findTodos(g:print_todo_sync_folder, '##* *TODO *', '*.md')
endfunction

function! s:todos()
  return extend(s:todosInTodoFiles(), s:todosInMarkdownFiles())
endfunction

function! print_todo#printTodos()
  let todos = s:todos()
  for path in keys(todos)
    echom "--------------------------------------------------------------------------------"
    echom " "
    echom path
    echom substitute(path, '.', '=', 'g')
    echom " "
    for todo in todos[path]
      echom '- '.todo
    endfor
    echom " "
  endfor
  echom "--------------------------------------------------------------------------------"
endfunction
