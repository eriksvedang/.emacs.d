(add-to-list 'custom-theme-load-path "~/.emacs.d/my-themes")
(add-to-list 'load-path "~/.emacs.d/elisp")

(setq custom-file "~/.emacs.d/custom.el")

(require 'my-fix-defaults)
(require 'my-packages)
(require 'my-look-and-feel)
(require 'my-tabbar)
(require 'my-keys)
(require 'my-magit)
(require 'my-movelines)
(require 'my-smartparens)
(require 'my-powerline)
(require 'my-circe)
(require 'my-programming-modes)

(load custom-file)

