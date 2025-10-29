(require-macros :laurel.macros)

(augroup! :formatoptions-autocmd
  (au! :FileType #(vim.cmd "setlocal formatoptions-=c formatoptions-=o")))
