(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d507a1a88da980c8e2ca87f1ce122b186e8ebba47e03f2eed19cad8cfc472691" "f464b02a2186c72fcfd1571eb055e3692436d4674de0aec803e4d63978279106" "0a59878fb9407845f4cbc8548aa693e61897989f8a375c501a215efe5d762f22" "ae5b2ccf83a69e804052f6315f300ff6e0d968194abcfe5fcdd326a8807f14e2" "0c5b28806af5b07fc93a64b9a089a57646ff6f2b58f5b53852c12c394433d1de" default))))

;; Damnit, path!
(let ((paths (mapcar (lambda (i) (concat (getenv "HOME") "/" i))
                     '("bin" ".cabal/bin"))))
  (setenv "PATH" (apply 'concat
                        (append (mapcar (lambda (i) (concat i ":")) paths)
                                (list (getenv "PATH")))))
  (dolist (path paths) (when (file-directory-p path)
                         (add-to-list 'exec-path path))))
(getenv "PATH")

;; UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Package manager
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Auto install packages
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not"
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

(ensure-package-installed 'rainbow-delimiters
			  'magit
			  'multiple-cursors
			  'rust-mode
			  'flycheck-rust
			  'haskell-mode
			  'ghc
			  'yasnippet
			  'cider
			  'org
			  'rainbow-mode
			  'smartparens
			  'company
			  'powerline
			  'zencoding-mode
			  'tabbar
			  'smex
			  'undo-tree
			  'idle-highlight-mode
			  'find-file-in-project
			  'restclient
			  'ido-ubiquitous
			  'ace-jump-mode)

;; Startup
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;(set-frame-parameter nil 'fullscreen 'fullboth)

;; Paths
(add-to-list 'exec-path "~/bin")

;; Theme and font
(load-theme 'Striptease)
(set-face-attribute 'default nil :height 160)
(let ((font "Monaco"))
  (when (member font (font-family-list))
    (set-face-attribute 'default nil :font font)))

;; Window size and position
(setq-default left-margin-width 0 right-margin-width 0)
;(set-frame-position (selected-frame) 0 0)

;; Cursor
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)

;; Line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format " %d  ")

;; Rainbow parens
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Highlight instances of the same symbol
(idle-highlight-mode 1)

;; Ace jump!
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Mouse wheel
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 10) ;; keyboard scroll one line at a time

;; Move lines up and down
(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))
 
(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))
   
(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))
 
(global-set-key (kbd "C-s-<up>") 'move-text-up)
(global-set-key (kbd "C-s-<down>") 'move-text-down)

;; Little modes and fixes
(delete-selection-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 0)
(setq ring-bell-function 'ignore)
(show-paren-mode 0)
(add-hook 'prog-mode-hook 'rainbow-mode)
(setq initial-scratch-message "")
(setq undo-limit 3600)
(setq compilation-ask-about-save nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(hl-line-mode 0)

(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

;; Ido
(ido-mode 1)
(ido-ubiquitous 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

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

;; Fix meta
;; (setq mac-option-key-is-meta 0)
;; (setq mac-option-modifier nil)

;; Let me write these characters, plx
(global-set-key (kbd "M-8") "[")
(global-set-key (kbd "M-9") "]")
(global-set-key (kbd "M-(") "{")
(global-set-key (kbd "M-)") "}")

;; Find file in project (git repo)
(require 'find-file-in-project)
(global-set-key (kbd "s-p") 'find-file-in-project)
(setq ffip-patterns
      '("*.html" "*.org" "*.txt" "*.md" "*.el"
	"*.clj" "*.cljs" "*.py" "*.rb" "*.js" "*.pl"
	"*.sh" "*.erl" "*.hs" "*.ml" "*.css"
	"*.c" "*.cpp" "*.cs" "*.m"))

;; Misc keyboard shortcuts
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C--") 'pop-global-mark)
(global-set-key (kbd "C-i") 'imenu)

;; Home/End keyboard shortcuts
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
   Move point to the first non-whitespace character on this line.
   If point was already at that position, move point to beginning of line."
  (interactive "^") ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [s-left] 'smart-beginning-of-line)
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)

(global-set-key [s-right] 'end-of-line)
(define-key global-map [end] 'end-of-line)
(global-set-key (kbd "C-e") 'end-of-line)

(global-set-key [s-up] 'beginning-of-buffer)
(global-set-key [s-down] 'end-of-buffer)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(global-set-key (kbd "<s-return>") 'cider-eval-buffer)

;; Yasnippets
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;; Tabbar
(require 'tabbar)
(tabbar-mode 0)

(defun my-tabbar-buffer-groups () ;; customize to show all normal files in one group
  "Returns the name of the tab group names the current buffer belongs to.
 There are two groups: Emacs buffers (those whose name starts with '*', plus dired buffers), and the rest."
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
	      ((eq major-mode 'dired-mode) "emacs")
	      (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;; Add text after buffers that has been modified (also add some spacing in the front to make it "centered")
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
    (if (buffer-modified-p (tabbar-tab-value tab))
      (concat " " (concat ad-return-value "*"))
      (concat " " (concat ad-return-value " ")))))

(defun on-saving-buffer ()
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

(defun on-modifying-buffer ()
  (set-buffer-modified-p (buffer-modified-p))
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

(defun after-modifying-buffer (begin end length)
  (set-buffer-modified-p (buffer-modified-p))
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

(add-hook 'after-save-hook 'on-saving-buffer)
(add-hook 'first-change-hook 'on-modifying-buffer)

(set-face-attribute
 'tabbar-default nil
 :background "white"
 :family "Menlo"
 :height 150)

(set-face-attribute
 'tabbar-modified nil
 :background "#DDD"
 :foreground "#09F" 
 :box '(:line-width 6 :color "#DDD" :style nil))

(set-face-attribute
 'tabbar-selected nil
 :background "white"
 :foreground "black"
 :box '(:line-width 6 :color "white" :style nil))

(set-face-attribute
 'tabbar-unselected nil
 :background "#DDD"
 :foreground "#888"
 :box '(:line-width 6 :color "#DDD" :style nil))
 
(set-face-attribute
 'tabbar-button nil
 :background "#FFF"
 :foreground "#000"
 :box '(:line-width 6 :color "white" :style nil))

(set-face-attribute
 'tabbar-separator nil
 :height 1.0
 :background "#FFF")
(setq tabbar-separator '(0.1))

(setq tabbar-use-images -1)
(setq tabbar-background-color "#DDD")

(setq
 tabbar-buffer-home-button (quote (("") ""))
 tabbar-scroll-left-button (quote (("") ""))  
 tabbar-scroll-right-button (quote (("") "")))

(global-set-key (kbd "<M-s-left>") 'tabbar-backward-tab)
(global-set-key (kbd "<M-s-right>") 'tabbar-forward-tab)

(defun switch-tabbar (num)
  (let* ((tabs (tabbar-tabs
                (tabbar-current-tabset)))
         (tab (nth
               (if (> num 0) (- num 1) (+ (length tabs) num))
               tabs)))
    (if tab (switch-to-buffer (car tab)))))

(global-set-key (kbd "s-§") 'tabbar-forward-group)
(global-set-key (kbd "s-1") (lambda () (interactive) (switch-tabbar 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (switch-tabbar 2)))
(global-set-key (kbd "s-3") (lambda () (interactive) (switch-tabbar 3)))
(global-set-key (kbd "s-4") (lambda () (interactive) (switch-tabbar 4)))
(global-set-key (kbd "s-5") (lambda () (interactive) (switch-tabbar 5)))
(global-set-key (kbd "s-6") (lambda () (interactive) (switch-tabbar 6)))
(global-set-key (kbd "s-7") (lambda () (interactive) (switch-tabbar 7)))
(global-set-key (kbd "s-8") (lambda () (interactive) (switch-tabbar 8)))
(global-set-key (kbd "s-9") (lambda () (interactive) (switch-tabbar 9)))
(global-set-key (kbd "s-0") (lambda () (interactive) (switch-tabbar -1)))

(global-set-key (kbd "s-w") (lambda ()
                              (interactive)
                              (kill-buffer (buffer-name))))

;; Powerline (customize the 'mode line')
(require 'powerline)

(defun powerline-erik-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
                                     (powerline-raw "[" mode-line 'l)
                                     (powerline-major-mode mode-line)
                                     (powerline-process mode-line)
                                     (powerline-raw "]" mode-line)
                                     (when (buffer-modified-p)
                                       (powerline-raw "[+]" mode-line))
                                     (when buffer-read-only
                                       (powerline-raw "[RO]" mode-line))
                                     (powerline-raw "[%z]" mode-line)
                                     ;; (powerline-raw (concat "[" (mode-line-eol-desc) "]") mode-line)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-raw "[" mode-line 'l)
                                     (powerline-minor-modes mode-line)
                                     (powerline-raw "%n" mode-line)
                                     (powerline-raw "]" mode-line)
                                     (when (and vc-mode buffer-file-name)
                                       (let ((backend (vc-backend buffer-file-name)))
                                         (when backend
                                           (concat (powerline-raw "[" mode-line 'l)
                                                   (powerline-raw (format "%s / %s" backend (vc-working-revision buffer-file-name backend)))
                                                   (powerline-raw "]" mode-line)))))))
                          (rhs (list (powerline-raw '(10 "%i"))
                                     (powerline-raw global-mode-string mode-line 'r)
                                     (powerline-raw "%l," mode-line 'l)
                                     (powerline-raw (format-mode-line '(10 "%c")))
                                     (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r))))
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

(powerline-erik-theme)

(set-face-attribute 'mode-line nil
    :foreground "#fff" :background "#ff3f60"
    :inverse-video nil
    :family "Menlo"
    :box '(:line-width 6 :color "#ff3f60" :style nil))

(set-face-attribute 'mode-line-inactive nil
    :foreground "gray60" :background "gray30"
    :inverse-video nil
    :box '(:line-width 6 :color "gray30" :style nil))

;(set-face-attribute 'mode-line nil :foreground "#fff" :background "#0072b2" :box nil)
;(set-face-attribute 'mode-line-inactive nil :foreground "#666" :background "#050000" :box nil)

;; Smartparens
(add-hook 'prog-mode-hook 'smartparens-mode)
(global-set-key (kbd "C-S-h") 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-S-j") 'sp-backward-barf-sexp)
(global-set-key (kbd "C-S-k") 'sp-forward-barf-sexp)
(global-set-key (kbd "C-S-l") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-S-a") 'sp-join-sexp)
(global-set-key (kbd "C-S-s") 'sp-split-sexp)
(global-set-key (kbd "C-S-d") 'sp-kill-sexp)
(global-set-key (kbd "C-S-f") 'sp-splice-sexp)
(global-set-key (kbd "C-S-n") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-S-m") 'sp-end-of-sexp)

;; Zencoding
(global-set-key (kbd "C-s-e") 'zencoding-expand-line)

;; Sgml (html mode)
(global-set-key (kbd "C-s-.") 'sgml-close-tag)

;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; Rust
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

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

;; Minor mode to ensure key map
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap")
(require 'multiple-cursors)
(define-key my-keys-minor-mode-map (kbd "s-d") 'mc/mark-next-like-this)
(define-key my-keys-minor-mode-map (kbd "C-c C-l") 'mc/edit-lines)
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map) 
(my-keys-minor-mode 1)

;; Notes
;; C+g       Cancel
;; C+x C+e   Evaluate form
;; C+x k     Kill buffer
;; C+x 1     Close other buffer
;; C+x 2     Split window up/down
;; C+x 3     Split window left/right
;; C+x 0     Close current buffer
;; C+x b     Open another buffer
;; C+x C+b   Open fancy buffer menu
;; M+x       Run command
;; C+s /C+r  Interactive search
;; i         Mark for installation
;; u         Unmark
;; x         Install selected (execute)
;; C+n       Next line
;; C+p       Prev line
;; C+h k     Describe keyboard shortcut
;; C+h a     Search for a word and get help for it
;; q         close "pane" (what's the real word?)

;; Commands (run with M-x)
;; package-list-packages  Lists packages
;; eval-buffer            Evaluate the current buffer
;; eww                    Web browser!

;; Magit
;; s to stage files
;; c c to commit (type the message then C-c C-c to actually commit)
;; b b to switch to another branch
;; P P to do a git push
;; F F to do a git pull

;; Questions
;; How to not go back to beginning of line with home key (only beginning of statement)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
