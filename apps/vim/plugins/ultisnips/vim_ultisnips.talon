tag: user.vim
-
tag(): user.snippets
tag(): user.ultisnips
(reload|refresh) snippets: user.vim_normal_mode_exterm(":call UltiSnips#RefreshSnippets()\n")
add snippets: user.vim_normal_mode_exterm(":UltiSnipsAddFiletypes \n")
#show file snippets: user.vim_normal_mode_exterm(":call UltiSnips#SnippetsInCurrentScope()\n")
#show all file snippets: user.vim_normal_modE_exterm(":call UltiSnips#SnippetsInCurrentScope(1)\n")
#snip next: key(ctrl-j)
#snip last: key(ctrl-k)
