;; Idris
;;(add-hook 'idris-mode-hook 'turn-on-idris-simple-indent)
;; Right now, adding a hook disables all keys for idris mode
;; Sadly this makes it hard to automatically disable company mode for idris
;; which makes the buffer hang at times when it fails to do some crap...

;; Haskell
(require 'haskell-mode)
(require 'haskell-interactive-mode)

(custom-set-variables
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-log t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-show-debug-tips nil)
  )

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'flymake-hlint-load)

(define-key haskell-mode-map (kbd "C-c C-j") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c C-s") 'haskell-sort-imports)

;; Prev / next in REPL: M-p / M-n

(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
(define-key haskell-mode-map (kbd "s-.") 'haskell-mode-jump-to-def)

(defun my-cabal-run ()
  "Run the Cabal project."
  (interactive)
  (haskell-process-do-cabal "run"))

(define-key haskell-mode-map (kbd "C-c C-r") 'my-cabal-run)



;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'smartparens-mode)
(add-hook 'clojure-mode-hook 'smartparens-mode)

(add-hook 'cider-mode-hook
	  '(lambda ()
	     (define-key cider-mode-map (kbd "<s-return>") 'cider-eval-defun-at-point)))

(add-hook 'cider-repl-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "<M-up>") 'cider-repl-previous-input)
	     (local-set-key (kbd "<M-down>") 'cider-repl-next-input)))

(setq cider-repl-use-clojure-font-lock t)

;; Yasnippets
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;; Zencoding
(add-hook 'zencoding-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-e") 'zencoding-expand-line)))

;; Sgml (html mode)
(add-hook 'sgml-mode-hook
	  (lambda ()
	    (local-set-key (kbd "M-s-.") 'sgml-close-tag)
	    (local-set-key (kbd "M-s-…") 'sgml-close-tag)))
(add-hook 'sgml-mode-hook 'smartparens-mode)
(add-hook 'html-mode-hook 'smartparens-mode)



;; Elm
(add-hook 'elm-mode-hook
	  (lambda ()
	    (elm-indent-mode 0)
            (haskell-indent-mode 1)
            ;;(elm-indentation-mode 1)
            ))



;; Rust
(defun rust-save-compile-and-run ()
  (interactive)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "Cargo.toml")))
    (if project-dir
	(progn (setq default-directory project-dir)
	       (compile "cargo run"))
      (compile
       (format "rustc %s ; %s"
	       (buffer-file-name)
	       (file-name-sans-extension (buffer-file-name)))))))

(add-hook 'rust-mode-hook
	  (lambda ()
	    (flycheck-mode)
	    (define-key rust-mode-map (kbd "C-c C-r") 'rust-save-compile-and-run)))

(provide 'my-programming-modes)


;; C
(defun compile-c ()
  (interactive)
  (save-buffer)
  (compile (format "make")))

(defun run-c ()
  (interactive)
  (save-buffer)
  (compile (format "make run")))

(add-hook 'c-mode-hook
	  (lambda ()
	    (define-key c-mode-map (kbd "C-c C-c") 'compile-c)
	    (define-key c-mode-map (kbd "C-c C-r") 'run-c)))
