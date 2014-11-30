;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(global-set-key (kbd "<s-return>") 'cider-eval-buffer)

;; Yasnippets
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;; Zencoding
(global-set-key (kbd "C-s-e") 'zencoding-expand-line)

;; Sgml (html mode)
(global-set-key (kbd "M-s-.") 'sgml-close-tag)
(global-set-key (kbd "M-s-…") 'sgml-close-tag)

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
