(setq package-enable-at-startup nil)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(setq the-packages
      '(
        multiple-cursors
        smartparens ;; slurp and barf
        rainbow-delimiters ;; colorful parens
        rainbow-mode ;; highlight colors in code
        undo-tree
        smex ;; better help in minibuffer
        ido-ubiquitous ;; ido mode for everything
        company ;; auto completion
        smooth-scrolling
        find-file-in-project
        avy ;; jump to position in buffer
        iedit
        exec-path-from-shell
        reveal-in-osx-finder
        google-this
        expand-region ;; select larger and larger region
        free-keys ;; show what key combinations that are not taken
        ace-window ;; select window with number keys
        
        powerline
        tabbar
        
        magit
        gist
        restclient ;; Send web requests from a buffer

        org-bullets
        
        flycheck
        flymake-easy
        flymake-cursor
        flycheck-rust
        flymake-hlint

        haskell-mode
        ghc ;; this is actually ghc-mod
        intero ;; Haskell mode that works well with Stack
        tuareg ;; OCaml
        idris-mode
        elm-mode
        sml-mode
        fsharp-mode
        cider ;; Clojure
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
