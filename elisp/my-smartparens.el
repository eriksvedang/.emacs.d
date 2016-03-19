(require 'smartparens)

(define-key sp-keymap (kbd "C-)") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-(") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-)") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-M-(") 'sp-backward-barf-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)
(define-key sp-keymap (kbd "C-M-<backspace>") 'sp-unwrap-sexp)

(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)
(define-key sp-keymap (kbd "C-M-j") 'sp-join-sexp)
(define-key sp-keymap (kbd "C-M-s") 'sp-split-sexp)

(define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)

;; Disable automatic pairing for these characters:
(sp-pair "'" nil :actions :rem)
(sp-pair "\"" nil :actions :rem)
(sp-pair "\\\"" nil :actions :rem)

(provide 'my-smartparens)
