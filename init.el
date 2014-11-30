(add-to-list 'load-path "~/.emacs.d/elisp")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'my-fix-defaults)
(require 'my-packages)
(require 'my-look-and-feel)
(require 'my-tabbar)
(require 'my-keys)
(require 'my-powerline)
(require 'my-programming-modes)

