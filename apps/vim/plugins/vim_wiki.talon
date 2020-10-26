# See https://github.com/vimwiki/vimwiki/
tag: user.vim_wiki

# In general calls need to use something like this: `:execute "normal
# \<Plug>NiceCenterCursor"`, since the wiki relies on `<leader>`. You can see
# the mappings with `:nmap` or similar.
# XXX - add scope for when a wiki is actually open
# XXX - consider switching to `key` isntead of wiki

-

###
# Global Vim Wiki Commands - Callable even when outside a wiki
###

# Main wiki commands
go wiki:
    user.vim_command_mode_exterm(':execute "normal \<Plug>VimwikiIndex"\n')
go wiki tabbed:
    user.vim_command_mode_exterm(':execute "normal \<Plug>VimwikiTabIndex"\n')
go wiki <number_small>:
    user.vim_command_mode_exterm(':execute "normal <C-U>call vimwiki#diary#make_note({number_small})"\n')
list wikis:
    user.vim_command_mode_exterm(':execute "normal \<Plug>VimwikiUISelect"\n')
wiki rename:
    user.vim_command_mode_exterm(':execute "normal <C-U>call vimwiki#diary#make_note({number_small})"\n')
wiki delete:
    user.vim_command_mode_exterm(':execute "normal <C-U>call vimwiki#diary#make_note({number_small})"\n')

# Diary Commands
go diary:
    user.vim_command_mode_exterm(':execute "normal \<Plug>VimwikiDiaryIndex"\n')
diary new:
    user.vim_command_mode_exterm(':execute "normal \<Plug>VimwikiMakeDiaryNote"\n')
diary new tab:
    user.vim_command_mode_exterm(':execute "normal \<Plug>VimwikiTabMakeDiaryNote"\n')
diary last:
    user.vim_command_mode_exterm(':execute "normal \<Plug>VimwikiMakeYesterdayDiaryNote"\n')
diary next:
    user.vim_command_mode_exterm(':execute "normal \<Plug>VimwikiMakeTomorrowDiaryNote"\n')

wiki help:
    user.vim_command_mode_exterm(':help vimwiki')
wiki help commands:
    user.vim_command_mode_exterm(':help vimwiki-commands')

###
# Internal Vim Wiki Commands
#
# Only accessible when operating inside of a wiki file
###

wiki link:
    user.vim_command_mode(":VimwikiFollowLink\n")
wiki back:
    user.vim_command_mode(":VimwikiGoBackLink\n")
wiki split link:
    user.vim_command_mode(":VimwikiVSplitLink\n")
wiki tab link:
    user.vim_command_mode(":VimwikiTabnewLink\n")
wiki next link:
    user.vim_command_mode(":VimwikiNextLink\n")

# Convenience for when you aren't directly on the link
go [next] link:
    user.vim_command_mode(":VimwikiNextLink\n")
    user.vim_command_mode(":VimwikiFollowLink\n")
wiki last link:
    user.vim_command_mode(":VimwikiPrevLink\n")
wiki go to:
    user.vim_command_mode(":VimwikiGoto ")
wiki rename:
    user.vim_command_mode(":VimwikiRenameFile ")
wiki next task:
    user.vim_command_mode(":VimwikiNextTask\n")
# XXX - todo HTML stuff
wiki toggle:
    user.vim_command_mode(":VimwikiToggleListItem\n")
wiki toggle reject:
    user.vim_command_mode(":VimwikiToggleRejectedListItem\n")

# XXX - right, left, etc
# wiki list right:
#     user.vim_command_mode(":VimwikiListChangeLevel >>\n")
# wiki list left:
#     user.vim_command_mode(":VimwikiListChangeLevel <<\n")

wiki search:
    user.vim_command_mode(":VimwikiSearch ")
wiki find links:
    user.vim_command_mode(":VimwikiBacklinks\n")

wiki table:
    user.vim_command_mode(":VimwikiTable\n")
wiki <number_small> by <number_small> table:
    user.vim_command_mode(":VimwikiTable {number_small_1} {number_small_2}\n")
wiki <number_small> table:
    user.vim_command_mode(":VimwikiTable {number_small}\n")
wiki move call left:
    user.vim_command_mode(":VimwikiTableMoveColumnLeft\n")
wiki move call right:
    user.vim_command_mode(":VimwikiTableMoveColumnRight\n")

wiki generate links:
    user.vim_command_mode(":VimwikiGenerateLinks")
wiki generate diary links:
    user.vim_command_mode(":VimwikiDiaryGenerateLinks\n")
# :VimwikiDiaryNextDay - redundant? See global diary next
# :VimwikiDiaryPrevDay - redundant? See global diary last
wiki talk:
    user.vim_command_mode(":VimwikiTOC\n")
wiki check links:
    user.vim_command_mode(":VimwikiCheckLinks\n")
wiki rebuild tags:
    user.vim_command_mode(":VimwikiRebuildTags\n")
wiki search tags:
    user.vim_command_mode(":VimwikiSearchTags\n")
wiki generate tag links:
    user.vim_command_mode(":VimwikiGenerateTagLinks\n")

###
# VimWiki Syntax
#
# TODO - Start from 5. Wiki syntax in :help vimwiki
###
