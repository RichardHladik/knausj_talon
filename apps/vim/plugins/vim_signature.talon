# You must install: https://github.com/kshenoy/vim-signature
app: vim
-

signature toggle: user.vim_normal_mode_exterm(":SignatureToggle\n")
signature refresh: user.vim_normal_mode_exterm(":SignatureRefresh\n")
mark here: user.vim_normal_mode_exterm("m,")
mark toggle: user.vim_normal_mode_exterm("m.")
mark remove: user.vim_normal_mode_exterm("m-")
mark next:  user.vim_normal_mode_exterm("]`")
mark last:  user.vim_normal_mode_exterm("[`")
