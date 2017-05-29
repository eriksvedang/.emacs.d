(require 'neotree)
(require 'all-the-icons)

(setq neo-theme 'icons)
(setq neo-window-width 30)
(setq neo-window-fixed-size nil)
(setq neo-smart-open t) ;; open in folder of current buffer
(setq neo-mode-line-type 'custom)
(setq neo-mode-line-format "HEJSAN")

(defun fix-neotree-pwd (node)
  "Pretty-print pwd in neotree"
  (let ((project-name (file-name-nondirectory (substring node 0 (1- (length node)))))
        (faces '(neo-root-dir-face)))
    (when t
      (push 'variable-pitch faces))
    (if (display-graphic-p)
        (insert
         (concat (propertize "" 'face `(:inherit (,@faces)))
                 ;; (all-the-icons-octicon "repo"
                 ;;                        :height 300
                 ;;                        :face 'neo-root-dir-face
                 ;;                        :v-adjust -0.5)
                 (propertize " " 'face 'neo-root-dir-face))))
    (insert (propertize project-name 'face `(:inherit (,@faces))))
    (insert (propertize "!\n" 'face 'neo-root-dir-face))
    ))

(advice-add #'neo-buffer--insert-root-entry :override #'fix-neotree-pwd)

(add-hook 'neotree-mode-hook
          (lambda ()
            (setq truncate-lines 1)))

(global-set-key [f8] 'neotree-toggle)

(provide 'my-neotree)


