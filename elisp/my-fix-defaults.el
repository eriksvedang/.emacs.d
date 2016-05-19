;; A package for getting the PATH when starting emacs via OSX (not from terminal)
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Startup
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Little modes and fixes
(delete-selection-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)
(set-fringe-mode 0)
(hl-line-mode -1)
(global-auto-revert-mode 1) ;; change buffer automatically when file changes on disk
(auto-save-mode 0)

(setq ring-bell-function 'ignore)
(setq initial-scratch-message "")
(setq undo-limit 9999999)
(setq compilation-ask-about-save nil)
(setq make-backup-files nil)
(setq echo-keystrokes 0.1)
(setq-default indent-tabs-mode nil)

(setq ns-pop-up-frames nil) ;; open files in same frame (don't create new separate ones)

(defalias 'yes-or-no-p 'y-or-n-p)

(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(desktop-save-mode 1) ; reopen buffers from last session

(provide 'my-fix-defaults)
