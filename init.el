(setq gc-cons-threshold (* 1024 1024 128))

(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load 'config.org' and evaluate it (will emit 'config.el')
(require 'org)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
