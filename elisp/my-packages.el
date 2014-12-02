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
			  'haskell-mode
			  'ghc
			  'yasnippet
			  'cider
			  'rainbow-mode
			  'smartparens
			  'company
			  'powerline
			  'zencoding-mode
			  'tabbar
			  'smex
			  'undo-tree
			  'find-file-in-project
			  'restclient
			  'ido-ubiquitous
			  'ace-jump-mode
			  'circe
			  )

(provide 'my-packages)
