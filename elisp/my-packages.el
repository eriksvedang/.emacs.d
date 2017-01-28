(setq package-enable-at-startup nil)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(setq the-packages
      '(
        multiple-cursors
        smartparens          ;; Slurp and barf
        rainbow-delimiters   ;; Colorful parens
        rainbow-mode         ;; Highlight colors in code
        undo-tree            ;; Show a graph of edits that can be undone
        smex                 ;; Better help in minibuffer
        ido-ubiquitous       ;; Ido mode for everything
        company              ;; Auto completion
        smooth-scrolling     ;; Not quite true
        find-file-in-project ;; Looks in current git repo and show all source files
        avy                  ;; Jump to position in buffer
        iedit                ;; Edit all in scope
        exec-path-from-shell
        reveal-in-osx-finder
        google-this
        expand-region        ;; Select larger and larger region
        free-keys            ;; Show what key combinations that are not taken
        ace-window           ;; Select window with number keys
        swiper               ;; Better search in buffer
        
        powerline
        tabbar               ;; Sometimes tabs are useful
        
        magit
        gist                 ;; Send files to Github gist
        restclient           ;; Send web requests from a buffer

        org-bullets          ;; Show nice icons in Org buffers
        
        flycheck
        flymake-easy
        flymake-cursor
        flycheck-rust
        flymake-hlint

        nix-mode
        nix-buffer           ;; "nix-shell for emacs"

        intero               ;; Haskell mode that works well with Stack
        tuareg               ;; OCaml
        idris-mode
        elm-mode
        sml-mode             ;; Standard ML
        fsharp-mode
        cider                ;; Clojure
        racket-mode
        csharp-mode
        omnisharp            ;; Auto completion server for .NET languages
        rust-mode
        racer                ;; Rust auto complete
        php-mode
        lua-mode
        swift-mode
        markdown-mode
        zencoding-mode       ;; HTML & CSS
        js2-mode             ;; Javascript
        web-mode             ;; Smart editing of HTML templates
        cc-mode              ;; C
        glsl-mode
        irony                ;; C++ autocomplete
        gud)                 ;; GDB debugging
      )

(mapcar (lambda (package)
          (if (package-installed-p package)
              nil
            (package-install package)))
        the-packages)

(provide 'my-packages)
