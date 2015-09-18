# Print\_Todo.vim

**TL;DR;** This plugin adds a command to aggregate todo items from disperate sources into a single
list. It only really makes sense as a part of my pure vim GTD-esque workflow. Message me if you're
interested in hearing about my workflow. Otherwise, use this at your own peril!

## What's it for?

I track todos using a combination of my [markdown plugin](https://github.com/simonhicks/mdpp), my
[workflow plugin](https://github.com/simonhicks/workflow.vim) and my [todo
plugin](https://github.com/simonhicks/todo.vim). The result of that is that my todo list is
scattered across lots of files, in two different file formats. The advantage of that is that the
todo item lives inline with all of the relevant context for that task. The downside is of course
that they're scattered all over the place.

This plugin solves that problem by adding a `:PrintTodos` command (and an associated `<space>pt`
binding) to echo an aggregated list of all of my todos across all of my files (grouped by file).

## Usage

If you really want to use this, then just set `g:print_todo_sync_folder` to a directory which
contains all of your `.todo` and `.md` files and then run `:PrintTodos` or `<space>pt` to see the
aggregated list.

## Warning

The list is generated by grepping the `.todo` files for `[ ] ` and grepping the `.md` files for `#+
\*TODO \*` (the formats used by the two plugins I mentioned above). If you don't have todo files
using those formats, the plugin won't do anything.