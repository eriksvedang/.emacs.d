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

;; Move out and to the right: ( | ) => ( ) |
(define-key sp-keymap (kbd "C-M-i") 'sp-up-sexp)

;; Move out and to the left: ( | ) => | ( )
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)

;; Move down right: | ( ) => ( | )
(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)

;; Move down left: ( ) | => ( | )
(define-key sp-keymap (kbd "C-M-c") 'sp-backward-down-sexp)

;; Move right: ( a | b c ) => ( a b | c )
(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)

;; Move left: ( a b | c ) => ( a | b c )
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

;; Move left to outmost paren ( ( | ) ) => | ( ( ) )
(define-key sp-keymap (kbd "C-M-a") 'beginning-of-defun)

(defun my-end-of-defun ()
  (interactive)
  (end-of-defun)
  (left-char))

;; Move right to outmost paren ( ( | ) ) => ( ( ) ) |
(define-key sp-keymap (kbd "C-M-e") 'my-end-of-defun)

;; Disable automatic pairing for these characters:
(sp-pair "'" nil :actions :rem)
(sp-pair "\"" nil :actions :rem)
(sp-pair "\\\"" nil :actions :rem)

(provide 'my-smartparens)
