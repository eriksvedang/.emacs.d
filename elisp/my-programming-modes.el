;; Carp
(add-to-list 'auto-mode-alist '("\\.carp\\'" . clojure-mode))

(setq inferior-lisp-program "carp-inferior")
;;(setq inferior-lisp-program "lein repl")

;; (setq inferior-lisp-load-command)
;;(define-key clojure-mode-map "\C-x\C-e" 'lisp-eval-last-sexp)

;; (add-hook 'clojure-mode-hook
;;           (lambda ()))



;; Markdown

;; Fix annoying keybindings by overriding them
(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "<M-right>") 'right-word)
	    (local-set-key (kbd "<M-left>") 'left-word)
	    (local-set-key (kbd "<M-S-right>") 'right-word)
	    (local-set-key (kbd "<M-S-left>") 'left-word)))



;; Haskell
(require 'haskell-mode)
(require 'haskell-interactive-mode)

(custom-set-variables
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-show-debug-tips nil)
 '(haskell-process-log t)
 '(haskell-process-auto-import-loaded-modules t)
  )

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;;(add-hook 'haskell-mode-hook 'flymake-hlint-load)

(define-key haskell-mode-map (kbd "C-c C-j") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c C-s") 'haskell-sort-imports)

;; Reminder: Prev / next in REPL: M-p / M-n

(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "s-.") 'haskell-mode-jump-to-def)
;;(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

(defun my-cabal-run ()
  "Run the Cabal project."
  (interactive)
  (haskell-process-do-cabal "run"))

(define-key haskell-mode-map (kbd "C-c C-r") 'my-cabal-run)

;; Ghc-mod
;; (autoload 'ghc-init "ghc" nil t)
;; (autoload 'ghc-debug "ghc" nil t)
;; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))



;; Idris
;;(add-hook 'idris-mode-hook 'turn-on-idris-simple-indent)
(add-hook 'idris-mode-hook (lambda () (eldoc-mode -1)))

;; Right now, adding a hook disables all keys for idris mode
;; Sadly this makes it hard to automatically disable company mode for idris
;; which makes the buffer hang at times when it fails to do some crap...
;; UPDATE: Is this true anymore..? Keys seem to be working now.



;; Agda
;; (load-file (let ((coding-system-for-read 'utf-8))
;; 	     (shell-command-to-string "agda-mode locate")))



;; Pilsner
;;(setenv "PILSNER_LIB" "/users/erik/Projects/Pilsner/lisp/")
;;(setenv "PILSNER_LIB" "/users/erik/Documents/C/Pilsner/lisp/")
;;(setq inferior-lisp-program "pilsner")



;; Lisp
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(define-key emacs-lisp-mode-map (kbd "<s-return>") 'eval-defun)


;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'smartparens-mode)
(add-hook 'clojure-mode-hook 'smartparens-mode)

(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (put-clojure-indent 'match 1)))

(add-hook 'cider-mode-hook
	  '(lambda ()
	     (electric-pair-mode 0)
	     (define-key cider-mode-map (kbd "<s-return>") 'cider-eval-defun-at-point)))

(add-hook 'cider-repl-mode-hook
	  '(lambda ()
	     (electric-pair-mode 0)
	     (local-set-key (kbd "<M-up>") 'cider-repl-previous-input)
	     (local-set-key (kbd "<M-down>") 'cider-repl-next-input)))

(setq cider-repl-use-clojure-font-lock t)
(setq cider-prompt-save-file-on-load 'always-save)


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
(add-hook 'html-mode-hook 'zencoding-mode)



;; Elm
(add-hook 'elm-mode-hook
	  (lambda ()
	    (elm-indent-mode 0)
            (haskell-indent-mode 1)
            ;;(elm-indentation-mode 1)
            ))



;; Rust
(defun internal-rust-save-compile-run (cargo-cmd non-cargo-cmd)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "Cargo.toml")))
    (if project-dir
  	(progn (setq default-directory project-dir)
  	       (compile cargo-cmd))
      (compile
       (format non-cargo-cmd 
  	       (buffer-file-name)
  	       (file-name-sans-extension (buffer-file-name)))))))

(defun rust-save-compile-and-run ()
  (interactive)
  (internal-rust-save-compile-run "cargo run" "rustc %s ; %s"))

(defun rust-save-compile ()
  (interactive)
  (internal-rust-save-compile-run "cargo build" "rustc %s"))

(add-hook 'rust-mode-hook
	  (lambda ()
	    (electric-pair-mode 1)
	    (define-key rust-mode-map (kbd "C-c C-r") 'rust-save-compile-and-run)
	    (define-key rust-mode-map (kbd "C-c C-c") 'rust-save-compile)))

;; Racer (rust auto completion)
(setq racer-cmd (concat (getenv "RACER_PATH") "/target/release/racer"))
(setq racer-rust-src-path (getenv "RUST_SRC_PATH"))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)



;; C
(defun compile-c ()
  (interactive)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "makefile")))
    (if project-dir
	(progn (setq default-directory project-dir)
	       (compile (format "make")))
      (message "Can't find makefile"))))

(defun run-c ()
  (interactive)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "makefile")))
    (if project-dir
	(progn (setq default-directory project-dir)
	       (compile (format "make run")))
      (message "Can't find makefile"))))

(add-hook 'c-mode-hook
	  (lambda ()
	    (electric-pair-mode 0)
	    (define-key c-mode-map (kbd "C-c C-c") 'compile-c)
	    (define-key c-mode-map (kbd "C-c C-r") 'run-c)
	    (define-key c-mode-map (kbd "C-c C-f") 'ff-find-other-file)
            (define-key c-mode-map (kbd "M-n") 'next-error)
            (define-key c-mode-map (kbd "M-p") 'previous-error)))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (electric-pair-mode 0)
	    (define-key c++-mode-map (kbd "C-c C-c") 'compile-c)
	    (define-key c++-mode-map (kbd "C-c C-r") 'run-c)
	    (define-key c++-mode-map (kbd "C-c C-f") 'ff-find-other-file)))

(add-hook 'c++-mode-hook 'irony-mode)

;; (setenv LIBCLANG_LIBRARY "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/")
;; (setenv LIBCLANG_INCLUDE_DIR "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;; Pico-8
(add-to-list 'auto-mode-alist '("\\.p8\\'" . lua-mode))


(provide 'my-programming-modes)
