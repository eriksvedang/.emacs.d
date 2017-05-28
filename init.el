;; Added by Package.el. This must come before configurations of installed packages.
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/my-themes")
(add-to-list 'load-path "~/.emacs.d/elisp")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'my-packages)
(require 'my-fix-defaults)
(require 'my-look-and-feel)
(require 'my-tabbar)
(require 'my-keys)
(require 'my-magit)
(require 'my-movelines)
(require 'my-smartparens)
(require 'my-powerline)
(require 'my-programming-modes)
(require 'my-org-mode)
(require 'my-neotree)
