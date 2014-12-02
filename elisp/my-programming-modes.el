;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(add-hook 'cider-repl-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "<s-return>") 'cider-eval-buffer)
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

;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

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
        (define-key rust-mode-map (kbd "C-c C-r") 'rust-save-compile-and-run)))

(provide 'my-programming-modes)
