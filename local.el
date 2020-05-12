(setq carp-mode-base-path "/Users/erik/Projects/Carp/emacs/")
(setq carp-mode-path (concat carp-mode-base-path "carp-mode.el"))
(setq inf-carp-mode-path (concat carp-mode-base-path "inf-carp-mode.el"))
(setq carp-flycheck-path (concat carp-mode-base-path "carp-flycheck.el"))

(when (file-exists-p carp-mode-path)
  (load carp-mode-path))

(when (file-exists-p inf-carp-mode-path)
  (load inf-carp-mode-path))

(when (file-exists-p carp-flycheck-path)
  (load carp-flycheck-path))
