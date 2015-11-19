(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(setq just-say-yes t)

;; Auto install packages
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not"
  (mapcar
   (lambda (package)
     (if
	 (package-installed-p package)
         nil
         (package-install package)
	 (if (or just-say-yes (y-or-n-p (format "Package %s is missing. Install it? " package)))
           (package-install package)
         package)
       ))
   packages))

(ensure-package-installed
 'multiple-cursors
 'smartparens
 'rainbow-delimiters
 'rainbow-mode
 'tabbar
 'undo-tree
 'smex
 'ido-ubiquitous
 'powerline
 'company
 'smooth-scrolling
 'find-file-in-project
 'avy
 'highlight-numbers
 'exec-path-from-shell
 'gist
 
 'magit
 'circe
 'restclient
 'ses
 'neotree
 
 'flycheck
 'flymake-easy
 'flymake-cursor
 'flycheck-rust
 'flymake-hlint

 'haskell-mode
 'ghc ;; this is actually ghc-mod!
 'idris-mode
 'tuareg
 'markdown-mode
 'cider
 'rust-mode
 'racer
 'zencoding-mode
 'elm-mode
 'swift-mode
 'glsl-mode
 'sml-mode
 'fsharp-mode
 'csharp-mode
 'nim-mode
 'php-mode
 'cc-mode
 'irony ;; c++ autocomplete
 'gud
 'racket-mode)

(provide 'my-packages)
