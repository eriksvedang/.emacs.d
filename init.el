;; Use kind of large GC threshold to increase loading speed
(setq gc-cons-threshold (* 1024 1024 128))

;; Temporarily disable file-name-handler-alist for faster loading
(let ((file-name-handler-alist nil))

  (package-initialize)

  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file)

  ;; Load 'config.org' and evaluate it (will emit 'config.el')
  (require 'org)
  (org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

  )

;; Restore kinda low GC threshold to avoid stutter during normal usage
(setq gc-cons-threshold (* 1024 1024 8))
