;; Damnit, path!
(let ((paths (mapcar (lambda (i) (concat (getenv "HOME") "/" i))
                     '("bin" ".cabal/bin"))))
  (setenv "PATH" (apply 'concat
                        (append (mapcar (lambda (i) (concat i ":")) paths)
                                (list (getenv "PATH")))))
  (dolist (path paths) (when (file-directory-p path)
                         (add-to-list 'exec-path path))))

(add-to-list 'exec-path "~/bin")

;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Startup
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;; (set-frame-parameter nil 'fullscreen 'fullboth)

;; Little modes and fixes
(delete-selection-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)
(set-fringe-mode 0)
(hl-line-mode -1)

(setq ring-bell-function 'ignore)
(setq initial-scratch-message "")
(setq undo-limit 3600)
(setq compilation-ask-about-save nil)
(setq make-backup-files nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

(provide 'my-fix-defaults)
