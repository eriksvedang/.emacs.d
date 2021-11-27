;; ~ An experiment in self-sufficiency ~
;; This config has two restrictions:
;; 1. I can't look up anything on the internet.
;; 2. I can't install packages.
;; Let's see how far I get!

(tool-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 0)
(ido-mode 1)
(savehist-mode 1)
(setq initial-scratch-message "")
(modify-all-frames-parameters '((internal-border-width . 16)))
(add-to-list 'default-frame-alist '(font . "Fira Code-16"))
;;(set-face-attribute 'mode-line nil :box nil :background "#CCC")
(setq line-spacing 4)
(load-theme 'tango)
