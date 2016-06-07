(setq package-enable-at-startup nil)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(setq the-packages
      '(
        multiple-cursors
        smartparens
        rainbow-delimiters
        rainbow-mode
        undo-tree
        smex ;; better help in minibuffer
        ido-ubiquitous ;; ido mode for everything
        company
        smooth-scrolling
        find-file-in-project
        avy
        iedit
        exec-path-from-shell
        reveal-in-osx-finder
        google-this
        
        powerline
        tabbar
        neotree
        
        magit
        gist
        restclient

        org-bullets
        
        flycheck
        flymake-easy
        flymake-cursor
        flycheck-rust
        flymake-hlint

        haskell-mode
        ghc ;; this is actually ghc-mod
        tuareg ;; OCaml
        idris-mode
        elm-mode
        sml-mode
        fsharp-mode
        cider
        racket-mode
        nim-mode
        csharp-mode
        rust-mode
        racer ;; rust auto complete
        php-mode
        lua-mode
        swift-mode
        markdown-mode
        zencoding-mode ;; html & css
        js2-mode
        web-mode
        cc-mode ;; C
        glsl-mode
        irony ;; c++ autocomplete
        gud) ;; gdb debugging
      )

(mapcar (lambda (package)
                 (if (package-installed-p package)
                     nil
                   (package-install package)))
               the-packages)

(provide 'my-packages)
