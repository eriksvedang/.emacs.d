;; Haskell
(require 'haskell-mode)
(require 'haskell-interactive-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(custom-set-variables
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t))

(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(defun my-cabal-run ()
  "Run the Cabal project."
  (interactive)
  (haskell-process-do-cabal "run"))

(define-key haskell-mode-map (kbd "C-c C-r") 'my-cabal-run)

;; C-c C-l    Load file into repl
;; C-c C-.    Sort imports

;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
;;(autoload 'ghc-debug "ghc" nil t)


;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(add-hook 'cider-mode-hook
	  (lambda ()
	    (local-set-key (kbd "<s-return>") 'cider-eval-buffer)))

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
  (if (locate-dominating-file (buffer-file-name) "Cargo.toml")
      (compile "cargo run")
    (compile
     (format "rustc %s ; %s"
	     (buffer-file-name)
	     (file-name-sans-extension (buffer-file-name))))))

(add-hook 'rust-mode-hook
	  (lambda ()
	    (flycheck-mode)
	    (define-key rust-mode-map (kbd "C-c C-r") 'rust-save-compile-and-run)))

(provide 'my-programming-modes)
