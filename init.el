
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load 'config.org' and evaluate it (will emit 'config.el')
(require 'org)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

;; Local config
(require 'local)
