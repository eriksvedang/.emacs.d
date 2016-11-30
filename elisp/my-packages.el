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
        undo-tree ;; show a graph of edits that can be undone
        smex ;; better help in minibuffer
        ido-ubiquitous ;; ido mode for everything
        company ;; auto completion
        smooth-scrolling ;; not quite true
        find-file-in-project ;; looks in current git repo and show all source files
        avy ;; jump to position in buffer
        iedit ;; edit all in scope
        exec-path-from-shell
        reveal-in-osx-finder
        google-this
        expand-region ;; select larger and larger region
        free-keys ;; show what key combinations that are not taken
        ace-window ;; select window with number keys
        
        powerline
        tabbar ;; sometimes tabs are useful
        
        magit
        gist ;; send files to Github gist
        restclient ;; Send web requests from a buffer

        org-bullets ;; show nice icons in Org buffers
        
        flycheck
        flymake-easy
        flymake-cursor
        flycheck-rust
        flymake-hlint

        intero ;; Haskell mode that works well with Stack
        tuareg ;; OCaml
        idris-mode
        elm-mode
        sml-mode ;; Standard ML
        fsharp-mode
        cider ;; Clojure
        racket-mode
        csharp-mode
        rust-mode
        racer ;; Rust auto complete
        php-mode
        lua-mode
        swift-mode
        markdown-mode
        zencoding-mode ;; HTML & CSS
        js2-mode ;; Javascript
        web-mode ;; Smart editing of HTML templates
        cc-mode ;; C
        glsl-mode
        irony ;; C++ autocomplete
        gud) ;; GDB debugging
      )

(mapcar (lambda (package)
          (if (package-installed-p package)
              nil
            (package-install package)))
        the-packages)

(provide 'my-packages)
