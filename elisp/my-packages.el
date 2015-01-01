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
     (if
	 (package-installed-p package)
         nil
         (package-install package)
       ;; (if (y-or-n-p (format "Package %s is missing. Install it? " package))
       ;;     (package-install package)
       ;;   package)
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
 'pretty-mode
 'smooth-scrolling
 
 'find-file-in-project
 'ace-jump-mode
 
 'magit
 'yasnippet
 'circe
 'restclient
 
 'haskell-mode
 'ghc
 'flymake-hlint
 
 'cider
 'rust-mode
 'zencoding-mode
 'elm-mode
 'swift-mode
 'js2-mode
 'glsl-mode
 'sml-mode
 'fsharp-mode)

(provide 'my-packages)
