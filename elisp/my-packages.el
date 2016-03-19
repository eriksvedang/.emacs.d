(setq package-enable-at-startup nil)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Don't show y-or-no-p when installing package?
(setq just-say-yes t)

;; Auto install packages
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not"
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (package-install package)
       (if (or just-say-yes (y-or-n-p (format "Package %s is missing. Install it? " package)))
           (package-install package)
         package)))
   packages))

(ensure-package-installed
 'multiple-cursors
 'smartparens
 'rainbow-delimiters
 'rainbow-mode
 'undo-tree
 'smex ;; better help in minibuffer
 'ido-ubiquitous ;; ido mode for everything
 'company
 'smooth-scrolling
 'find-file-in-project
 'avy
 'iedit
 'exec-path-from-shell
 
 'powerline
 'tabbar
 'neotree
 
 'magit
 'gist
 'restclient
 
 'flycheck
 'flymake-easy
 'flymake-cursor
 'flycheck-rust
 'flymake-hlint

 'haskell-mode
 'ghc ;; this is actually ghc-mod
 'tuareg ;; OCaml
 'idris-mode
 'elm-mode
 'sml-mode
 'fsharp-mode
 'cider
 'racket-mode
 'nim-mode
 'csharp-mode
 'rust-mode
 'racer ;; rust auto complete
 'php-mode
 'lua-mode
 'swift-mode
 'markdown-mode
 'zencoding-mode ;; html & css
 'cc-mode ;; C
 'glsl-mode
 'irony ;; c++ autocomplete
 'gud ;; gdb debugging
 )

(provide 'my-packages)
