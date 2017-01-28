;; Carp
(add-to-list 'load-path "~/Documents/Carp/emacs")
(add-to-list 'load-path "~/Projects/Carp/emacs")

(require 'carp-mode)
(require 'inf-carp-mode)

(add-to-list 'auto-mode-alist '("\\.carp\\'" . carp-mode))
(setq inferior-lisp-program "carp-inferior")
(add-hook 'carp-mode-hook 'smart-parens-mode)



;; Markdown
;; Fix annoying keybindings by overriding them
(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "<M-right>") 'right-word)
	    (local-set-key (kbd "<M-left>") 'left-word)
	    (local-set-key (kbd "<M-S-right>") 'right-word)
	    (local-set-key (kbd "<M-S-left>") 'left-word)))


;; Intero (Stack's Haskell mode)
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'intero-mode-hook 'smartparens-mode)


;; Idris
;;(add-hook 'idris-mode-hook 'turn-on-idris-simple-indent)
(add-hook 'idris-mode-hook (lambda () (eldoc-mode -1)))



;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
(define-key emacs-lisp-mode-map (kbd "<s-return>") 'eval-defun)
(define-key emacs-lisp-mode-map (kbd "C-c C-k") 'eval-buffer)



;; Scheme
(add-hook 'scheme-mode-hook 'smartparens-mode)
;;(define-key scheme-mode-map (kbd "<s-return>") 'scheme-send-definition)



;; Lisp
(add-hook 'lisp-mode-hook
	  '(lambda ()
	     (electric-pair-mode 0)
	     (define-key lisp-mode-map (kbd "<s-return>") 'lisp-eval-defun)))



;; Cider
(add-hook 'cider-mode-hook 'eldoc-mode)
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
(setq cider-repl-display-help-banner nil)



;; Zencoding (expand abbreviated tags to full html)
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
            (haskell-indent-mode 1)))



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


;; C#
(add-hook 'csharp-mode-hook
          (lambda ()
            (setq omnisharp-server-executable-path "/Users/erik/Projects/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
            (define-key csharp-mode-map (kbd "M-.") 'omnisharp-go-to-definition)
            (define-key csharp-mode-map (kbd "s-r") 'omnisharp-rename)
            (add-to-list 'company-backends 'company-omnisharp)))


;; C
(defun compile-c ()
  (interactive)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "makefile")))
    (if project-dir
	(progn (setq default-directory project-dir)
	       (compile (format "make")))
      (compile (format "clang %s -O0 -g -o %s" (buffer-name) (file-name-sans-extension (buffer-name)))))))

(defun run-c ()
  (interactive)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "makefile")))
    (if project-dir
	(progn (setq default-directory project-dir)
	       (compile (format "make run")))
    (compile (format "./%s" (file-name-sans-extension (buffer-name)))))))

;; Focus on the compiler output window so it's easier to close with 'q'
;; Not a good idea unfortunately since you can't run the code with C-c C-r when not focused on source.
;; (defadvice compile-c (after move-point-to-new-window activate)
;;   (other-window 0))

(add-hook 'c-mode-hook
	  (lambda ()
	    (electric-pair-mode 1)
        (rainbow-mode 0) ;; treats #def as a color
        (disable-ligatures)
        (setq-default c-basic-offset 4)
        (c-set-style "cc-mode")
	    (define-key c-mode-map (kbd "C-c C-c") 'compile-c)
	    (define-key c-mode-map (kbd "C-c C-r") 'run-c)
	    (define-key c-mode-map (kbd "C-c C-f") 'ff-find-other-file)))

;; C++
(defun compile-cpp ()
  (interactive)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "makefile")))
    (if project-dir
	(progn (setq default-directory project-dir)
	       (compile (format "make")))
      (compile (format "clang++ -std=c++11 %s -O0 -g -o %s" (buffer-name) (file-name-sans-extension (buffer-name)))))))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (electric-pair-mode 1)
        (rainbow-mode 0) ;; treats #def as a color
        (disable-ligatures)
        (setq-default c-basic-offset 4)
        (c-set-style "cc-mode")
	    (define-key c++-mode-map (kbd "C-c C-c") 'compile-cpp)
	    (define-key c++-mode-map (kbd "C-c C-r") 'run-c)
	    (define-key c++-mode-map (kbd "C-c C-f") 'ff-find-other-file)))

(add-hook 'c++-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; etags (for navigation)
(defun generate-etags ()
  (interactive)
  (shell-command "find . -type f -iname \"*.[chS]\" | xargs etags -a"))



;; Objective C
(add-hook 'objc-mode-hook
          (lambda ()
            (electric-pair-mode 1)
            (disable-ligatures)
            (setq-default c-basic-offset 4)
            (c-set-style "cc-mode")))



;; Swift
(defun compile-swift ()
  (interactive)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "Package.swift")))
    (if project-dir
	(progn (setq default-directory project-dir)
	       (compile (format "swift build")))
    (compile (format "swift %s" (buffer-name) (file-name-sans-extension (buffer-name)))))))

(defun run-swift ()
  (interactive)
  (save-buffer)
  (let ((project-dir (locate-dominating-file (buffer-file-name) "Project.swift")))
    (if project-dir
        (error "Can't run swift projects at the moment.")
    (compile (format "swift %s" (buffer-name) (file-name-sans-extension (buffer-name)))))))

(add-hook 'swift-mode-hook
          (lambda ()
            (electric-pair-mode 1)
            (enable-ligatures)
            (setq-default c-basic-offset 4)
            (define-key swift-mode-map (kbd "C-c C-c") 'compile-swift)
            (define-key swift-mode-map (kbd "C-c C-r") 'run-swift)))



;; Pico-8
(add-to-list 'auto-mode-alist '("\\.p8\\'" . lua-mode))



;; Restclient
(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))



(provide 'my-programming-modes)
