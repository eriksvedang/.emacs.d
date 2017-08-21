(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("159a8aa4dc9cdaa01494cf981321b01b288fcb4ad83e8efae34b678bf4e69ef0" "49127f203946032fdbd6734322dd35a69fc61ebad718f7f40f5349ba89dfcf3b" "dbf5887d0774d1d2c4df3ddd4cfa939221d3d2f83ce734f3d947dfbdc7f6311a" "4731fba1f5767e7239f06e6b87b39d2481b068711b0d635e9ed0e784d3f8676a" "7c02f4c003284d2cd5201736a570fca3129751377ba3b419448abe09bf5a7734" "6b96a998d7d7e44bbb37c691b966e6ae97385551483727dce9c8ac0cf3034fd7" "e2b1ad7d1bcc30bd1206e6ed4597dd6d8359042de500fd1499059a81a1335527" "dc54f1a56007c0448c6cb735ec66f4d7b7750052ff92153bb9a002991d5b3f77" "22d3ef3487b7982dd515e1bd3fec719429ef612c18f1da48bfc9fcec2babb9f5" "d153fb07a514bce409a75897043ecb93685a61db9029ee79766a0587b9989377" "2f3eaf2a83c5d0000322b7a2a19c726a1727041fefbbafa454cc44f2e9194fb1" "d3e3906e44cc4f0637fac04284c94eba785f49cfa4299d3f19628514d91af3ae" default)))
 '(global-visual-line-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-show-debug-tips nil)
 '(haskell-process-type (quote cabal-repl))
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.5)
 '(ns-alternate-modifier (quote meta))
 '(package-selected-packages
   (quote
    (all-the-icons shm swiper omnisharp omnisharp-mode nix-buffer nix-mode rust-mode flymake-easy flycheck avy company intero zencoding-mode web-mode undo-tree tuareg tabbar swift-mode smooth-scrolling sml-mode smex smartparens reveal-in-osx-finder restclient rainbow-mode rainbow-delimiters racket-mode racer powerline php-mode org-bullets nim-mode neotree multiple-cursors markdown-mode magit lua-mode js2-mode irony iedit idris-mode ido-ubiquitous goto-chg google-this glsl-mode gist fsharp-mode free-keys flymake-hlint flymake-cursor flycheck-rust find-file-in-project expand-region exec-path-from-shell elm-mode csharp-mode cider ace-window))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-banner-face ((t :inherit shadow)))
 '(neo-button-face ((t :inherit dired-directory)))
 '(neo-dir-link-face ((t :inherit dired-directory)))
 '(neo-expand-btn-face ((t :inherit button)))
 '(neo-file-link-face ((t :inherit default)))
 '(neo-header-face ((t :inherit shadow)))
 '(neo-root-dir-face ((t :inherit link-visited :underline nil)))
 '(org-done ((t (:foreground "#00AF7F" :weight bold))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#000" :height 1.25))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#000" :height 1.1))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#000" :height 1.0))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#000"))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#000"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#000"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#000"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#000"))))
 '(org-todo ((t (:foreground "#FF3F60" :weight bold)))))

(put 'narrow-to-region 'disabled nil)
