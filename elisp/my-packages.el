(setq package-enable-at-startup nil)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
             ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(setq the-packages
      '(
        use-package
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
        exec-path-from-shell ;; Fix the path on MacOS
        reveal-in-osx-finder
        google-this
        expand-region        ;; Select larger and larger region
        free-keys            ;; Show what key combinations that are not taken
        ace-window           ;; Select window with number keys
        swiper               ;; Better search in buffer

        powerline
        tabbar               ;; Sometimes tabs are useful
        neotree              ;; Sidebar
        all-the-icons        ;; Icons for Neotree, requires special fonts to be installed.

        magit
        gist                 ;; Send files to Github gist
        restclient           ;; Send web requests from a buffer
        circe                ;; IRC
        elfeed               ;; RSS-reader

        org-bullets          ;; Show nice icons in Org buffers
;;        org-present          ;; Show slides made in Org mode

        flymake-easy         ;; Helpers for easily building Emacs flymake checkers.
        flymake-cursor
        flymake-hlint

        flycheck             ;; Replacement for flymake
        flycheck-rust

        nix-mode
        nix-buffer           ;; "nix-shell for emacs"

        slime                ;; Common Lisp
        ;;intero               ;; Haskell mode that works well with Stack -- DEPRECATED!
        dante                ;; Alternative to Intero
        shm                  ;; Structured Haskell Mode (Paredit for Haskell)
        tuareg               ;; OCaml
        purescript-mode
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
        rjsx-mode            ;; JSX (used in React)
        web-mode             ;; Smart editing of HTML templates
        cc-mode              ;; C
        glsl-mode
        irony                ;; C++ autocomplete
        gud                  ;; GDB debugging
        cmake-mode
        yaml-mode
        )
      )

(mapcar (lambda (package)
          (if (package-installed-p package)
              nil
            (package-install package)))
        the-packages)

(provide 'my-packages)
