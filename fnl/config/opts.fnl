(require-macros :laurel.macros)

(g! :mapleader " ")
(g! :maplocalleader ",")

(set! :number true)
(set! :relativenumber true)
(set! :ruler false)
(set! :showmode false)

(set! :mouse "a")
(set! :mousescroll "ver:1,hor:2")
(set! :switchbuf "usetab")
(set! :undofile true)
(set! :clipboard "unnamedplus")
(set! :shada "'100,<50,s10,:1000,/100,@100,h")
(set! :swapfile false)

(vim.cmd "filetype plugin indent on")
(when (not= (vim.fn.exists "syntax_on") 1) (vim.cmd "syntax enable"))

(set! :breakindent true)
(set! :breakindentopt "list:-1")
(set! :colorcolumn "+1")
(set! :cursorline true)
(set! :linebreak true)
(set! :list true)
(set! :pumheight 10)
(set! :shortmess "CFOSWaco")
(set! :signcolumn "yes")
(set! :splitbelow true)
(set! :splitkeep "screen")
(set! :splitright true)
(set! :winborder "single")
(set! :wrap false)
(set! :laststatus 0)
(set! :scrolloff 999)
(set! :cursorlineopt "screenline,number")
(set! :fillchars "eob: ,fold:╌")
(set! :listchars "extends:…,nbsp:␣,precedes:…,tab:  ")
(set! :foldlevel 10)
(set! :foldmethod "indent")
(set! :foldnestmax 10)
(set! :foldtext "")

(set! :autoindent true)
(set! :expandtab true)
(set! :formatoptions "rqnl1j")
(set! :ignorecase true)
(set! :incsearch true)
(set! :infercase true)
(set! :shiftwidth 4)
(set! :smartcase true)
(set! :smartindent true)
(set! :spelllang "en,pt")
(set! :spelloptions "camel")
(set! :tabstop 4)
(set! :virtualedit "block")
(set! :complete "kspell")
(set! :completeopt "menuone,noselect,fuzzy,nosort")

(local diagnostic_opts
  {:signs {:priority 9999 :severity {:min "WARN" :max "ERROR"}}
   :underline {:severity {:min "HINT" :max "ERROR"}}
   :virtual_lines false
   :virtual_text {:current_line true :severity {:min "ERROR" :max "ERROR"}}
   :update_in_insert false})

(vim.diagnostic.config diagnostic_opts)
