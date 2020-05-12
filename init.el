
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Load 'config.org' and evaluate it (will emit 'config.el')
(require 'org)
(org-babel-load-file
 (expand-file-name "config.org" user-emacs-directory))
