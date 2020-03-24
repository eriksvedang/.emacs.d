;; Carp
(add-to-list 'load-path "~/Projects/Carp/emacs")

(require 'carp-mode)
(require 'inf-carp-mode)
(require 'carp-flycheck)

(add-to-list 'auto-mode-alist '("\\.carp\\'" . carp-mode))

(add-hook 'carp-mode-hook
          (lambda ()
            (electric-pair-local-mode 0)
            (smartparens-mode 1)
            ;;(flycheck-mode 1)
            ))



;; Markdown
;; Fix annoying keybindings by overriding them
(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key (kbd "<M-right>") 'right-word)
        (local-set-key (kbd "<M-left>") 'left-word)
        (local-set-key (kbd "<M-S-right>") 'right-word)
        (local-set-key (kbd "<M-S-left>") 'left-word)))



;; Intero (Stack's Haskell mode) -- DEPRECATED!
;; (add-hook 'haskell-mode-hook 'intero-mode)

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  ;; OR:
  ;; (add-hook 'haskell-mode-hook 'flymake-mode)
  (add-hook 'haskell-mode-hook 'dante-mode)
  )

(setq dante-methods '(stack new-build bare-cabal bare-ghci))

(add-hook 'dante-mode-hook (lambda () (local-set-key (kbd "<C-c C-t>") 'dante-type-at)))

(add-hook 'haskell-mode-hook
          (lambda ()
            (interactive-haskell-mode 1)
            (smartparens-mode 1)
            (electric-pair-local-mode 0)))

(setq haskell-process-type 'stack-ghci)

;; Structured Haskell Mode
;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)

(add-hook 'structured-haskell-mode-hook
          (lambda ()
            (set-face-background 'shm-current-face "#efefef")
            (set-face-background 'shm-quarantine-face "#def")
            (define-key shm-map (kbd "M-(") nil) ;; These are bound to creating '{'
            (define-key shm-map (kbd "M-)") nil) ;; and '}' on my Swedish keyboard.
            (define-key shm-map (kbd "<deletechar>") nil) ;; Still wanna be able to delete chars
            (define-key shm-map (kbd "s-v") #'shm/yank)
            (define-key shm-map (kbd "M-y") #'shm/yank-pop)
            (define-key shm-map (kbd "M-e") #'shm/goto-parent-end)
            (define-key shm-map (kbd "M-q") #'shm/delete-indentation)
            (define-key shm-map (kbd "\"") nil)
            ;;(define-key shm-map (kbd ")") nil) ;; <- This messes up M-) which is bound to important things for this mode!
            ))

;; Default SHM shortcuts that are OK:
;; <RET> Runs the command bound to C-j in the docs, "newline-indent"
;; M-a   Goto parent (beginning)
;; M-k   Kill parent
;; M-r   Raise (replace parent with current expression)
;; C-k   Kill line (same as kill parent?)
;; M-)   Go to parent end
;; C-+   Add operand



;; Purescript
(add-hook 'purescript-mode-hook
          (lambda ()
            (turn-on-purescript-indentation)))



;; Idris
;;(add-hook 'idris-mode-hook 'turn-on-idris-simple-indent)
(add-hook 'idris-mode-hook (lambda ()
                             (eldoc-mode -1)
                             (modify-syntax-entry ?_ "w" idris-syntax-table) ; Underscore is part of words
                             ;; (modify-syntax-entry ?? "w" idris-syntax-table) ; Questionmark is part of words
                             ))

(add-hook 'idris-mode-hook 'smartparens-mode)



;; Agda
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string "agda-mode locate")))

;; (add-hook 'agda2-mode-hook (lambda ()
;;                              (set-face-attribute 'default nil
;;                                                  :family "DejaVu Sans Mono"
;;                                                  :height 170
;;                                                  :weight 'normal
;;                                                  :width  'normal)
;;                              (set-fontset-font "fontset-default"
;;                                                (cons (decode-char 'ucs #x2982)
;;                                                      (decode-char 'ucs #x2982))
;;                                                "STIX")))



;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
(define-key emacs-lisp-mode-map (kbd "<s-return>") 'eval-defun)
(define-key emacs-lisp-mode-map (kbd "C-c C-l") 'eval-buffer)



;; Scheme
(add-hook 'scheme-mode-hook 'smartparens-mode)
;;(define-key scheme-mode-map (kbd "<s-return>") 'scheme-send-definition)



;; Racket
(setq racket-program "/Applications/Racket/bin/racket")
(add-hook 'racket-mode-hook 'smartparens-mode)



;; Pie
(add-to-list 'auto-mode-alist '("\\.pie\\'" . racket-mode))
;; (font-lock-add-keywords 'racket-mode '(("Π" . font-lock-keyword-face)))
;; (font-lock-add-keywords 'racket-mode '(("->" . font-lock-keyword-face)))
(font-lock-add-keywords 'racket-mode '(("claim" . font-lock-keyword-face)))
(put 'claim 'racket-indent-function 1)


;; Lisp
(add-hook 'lisp-mode-hook
          '(lambda ()
             (smartparens-mode 1)
             (electric-pair-local-mode 0)
             (define-key lisp-mode-map (kbd "<s-return>") 'lisp-eval-defun)))

(setq inferior-lisp-program "/Users/erik/.nix-profile/bin/sbcl")
(slime-setup '(slime-fancy))

(add-hook 'slime-mode-hook
          '(lambda ()
             (smartparens-mode 1)
             (define-key lisp-mode-map (kbd "<s-return>") 'slime-eval-defun)))



;; Cider
(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'cider-mode-hook 'smartparens-mode)
(add-hook 'clojure-mode-hook 'smartparens-mode)

(add-hook 'clojure-mode-hook
      '(lambda ()
         (put-clojure-indent 'match 1)))

(add-hook 'cider-mode-hook
      '(lambda ()
         (electric-pair-local-mode 0)
         (define-key cider-mode-map (kbd "<s-return>") 'cider-eval-defun-at-point)))

(add-hook 'cider-repl-mode-hook
      '(lambda ()
         (electric-pair-local-mode 0)
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
        (electric-pair-local-mode 1)
        (define-key rust-mode-map (kbd "C-c C-r") 'rust-save-compile-and-run)
        (define-key rust-mode-map (kbd "C-c C-c") 'rust-save-compile)
        #'flycheck-mode))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

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
        (electric-pair-local-mode 1)
        (rainbow-mode 0) ;; treats #def as a color
        (disable-ligatures)
        (setq-default c-basic-offset 4)
        (c-set-style "cc-mode")
        (define-key c-mode-map (kbd "C-c C-c") 'compile-c)
        (define-key c-mode-map (kbd "C-c C-r") 'run-c)
        (define-key c-mode-map (kbd "s-r") 'run-c)
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
        (electric-pair-local-mode 1)
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
            (electric-pair-local-mode 1)
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
            (electric-pair-local-mode 1)
            (enable-ligatures)
            (setq-default c-basic-offset 4)
            (define-key swift-mode-map (kbd "C-c C-c") 'compile-swift)
            (define-key swift-mode-map (kbd "C-c C-r") 'run-swift)))



;; Pico-8
(add-to-list 'auto-mode-alist '("\\.p8\\'" . lua-mode))



;; Restclient
(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))



;; Ord emacs modes
(add-to-list 'load-path "~/Projects/Ord/emacs")
;; Ord Segment files
(require 'segment-mode)
;; Ord Dialogue files
(require 'dialogue-mode)
;; Ord Room files
(require 'room-mode)


(provide 'my-programming-modes)
