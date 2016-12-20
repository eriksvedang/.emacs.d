;; Theme and font
(load-theme 'Striptease)

;; Fix on Windows
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :height 140 :font "Consolas"))

;; Window size and position
(setq-default left-margin-width 0 right-margin-width 0)

;; Cursor
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)

;; Line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format (quote "%4d  "))

;; Tab indentation width
(setq default-tab-width 4)

;; Line Wrapping
(setq-default truncate-lines 1)
;;(setq-default global-visual-line-mode t)

;; Prettify (replace 'lambda' with the greek symbol, etc)
(global-prettify-symbols-mode -1)

;; Show matching parenthesis
(show-paren-mode 1)

;; Rainbow parens
(require 'rainbow-delimiters)
(defun activate-rainbow-hooks ()
  (interactive)
  (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode))
(activate-rainbow-hooks)

;; Show the color of hex colors inline
(add-hook 'lisp-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

;; Mouse wheel
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Smooth scrolling
(require 'smooth-scrolling)
(setq smooth-scroll-margin 5)

;; How many lines to keep the same when doing page up / page down
(setq next-screen-context-lines 10)

;; Ibuffer (buffer switcher)
(setq ibuffer-formats 
      '((mark modified read-only " "
              (name 30 30 :left :elide) ; change: 30s were originally 18s
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))

;; make ibuffer refresh automatically
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

;; ibuffer groups
(setq ibuffer-saved-filter-groups
      '(("home"
	 ("Magit" (name . "\*magit"))
	 ("Dired" (mode . dired-mode))
	 ("Emacs" (or (mode . help-mode)
		      (name . "\*"))))))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-show-empty-filter-groups nil)

;; Ido (autocompletion in the minibuffer)
(ido-mode 1)
(ido-ubiquitous 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-case-fold  t)

;; Smex (Ido completition for M-x menu)
(global-set-key (kbd "M-x") (lambda ()
                              (interactive)
                              (or (boundp 'smex-cache)
                                  (smex-initialize))
                              (global-set-key [(meta x)] 'smex)
                              (smex)))

;; Undo Tree
(undo-tree-mode 1)
(global-set-key (kbd "C-x C-z") 'undo-tree-visualize)

;; Auto complete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "<C-escape>") 'company-search-mode)
(setq company-tooltip-align-annotations t)
(setq company-minimum-prefix-length 3)
(setq company-idle-delay 0.4)

;; Turn off backend that makes Carp repl hang: (WTF?!)
(setq company-backends
      '(company-elisp
        ;;company-semantic ;; <- problematic?!
        company-capf ;; problematic?!
        (company-dabbrev-code company-gtags company-etags company-keywords)
        company-files
        company-dabbrev))

;; Find file in project (git repo)
(require 'find-file-in-project)
(global-set-key (kbd "s-p") 'find-file-in-project)
(setq ffip-patterns
      '("*.html" "*.org" "*.txt" "*.md" "*.el" "*.idr"
	"*.clj" "*.cljs" "*.py" "*.rb" "*.js" "*.pl"
	"*.sh" "*.erl" "*.hs" "*.ml" "*.css" "*.elm" "*.carp"
	"*.h" "*.c" "*.cpp" "*.cs" "*.m" "*.rs" "*.glsl"))
(setq ffip-prune-patterns (cons "*/CMakeFiles/*" ffip-prune-patterns))

;; Flycheck
(add-hook 'rust-mode-hook #'flycheck-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Iedit (edit all occurences of a word in the buffer at the same time)
;; Must start manually with (iedit-mode)
;; Shortut: C-; (when on a word)

;; Flymake Cursor (show flymake help at cursor)
(custom-set-variables
 '(help-at-pt-timer-delay 0.5)
 '(help-at-pt-display-when-idle '(flymake-overlay)))

;; Function for finding out info about font at cursor
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; Clock
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
;; (display-time)

;; Ligature hack
(defun enable-ligatures ()
  (interactive)
  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                 (36 . ".\\(?:>\\)")
                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                 ;;(42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)") ;; This messes up triple stars in Org mode (***)
                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                 (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                 (48 . ".\\(?:x[a-zA-Z]\\)")
                 (58 . ".\\(?:::\\|[:=]\\)")
                 (59 . ".\\(?:;;\\|;\\)")
                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                 (91 . ".\\(?:]\\)")
                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                 (94 . ".\\(?:=\\)")
                 (119 . ".\\(?:ww\\)")
                 (123 . ".\\(?:-\\)")
                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                 (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)"))))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            `([,(cdr char-regexp) 0 font-shape-gstring])))))

(defun disable-ligatures ()
  (interactive)
  (let ((alist '((33 . "")
                 (35 . "") 
                 (36 . "") 
                 (37 . "")
                 (38 . "") 
                 (43 . "") 
                 (45 . "") 
                 (46 . "") 
                 (47 . "") 
                 (48 . "") 
                 (58 . "") 
                 (59 . "") 
                 (60 . "") 
                 (61 . "") 
                 (62 . "") 
                 (63 . "") 
                 (91 . "") 
                 (92 . "") 
                 (94 . "") 
                 (119 . "")
                 (123 . "")
                 (124 . "")
                 (126 . ""))))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            `([,(cdr char-regexp) 0 font-shape-gstring])))))

(enable-ligatures)

;; -> <- => >>= << >> /= == >- -<

(provide 'my-look-and-feel)
