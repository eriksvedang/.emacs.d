(setq org-support-shift-select t)
(setq org-src-fontify-natively t)

(defun my-insert-bullet ()
  (interactive)
  (indent-for-tab-command)
  (insert "- [ ] "))

(global-set-key (kbd "C-c §") 'my-insert-bullet)

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(let* ((base-font-color  (face-foreground 'default nil 'default))
       (headline         `(:inherit default :weight bold :foreground ,base-font-color)))
  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline))))
                          `(org-level-7 ((t (,@headline))))
                          `(org-level-6 ((t (,@headline))))
                          `(org-level-5 ((t (,@headline))))
                          `(org-level-4 ((t (,@headline))))
                          `(org-level-3 ((t (,@headline :height 1.0))))
                          `(org-level-2 ((t (,@headline :height 1.1))))
                          `(org-level-1 ((t (,@headline :height 1.25))))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-bullets-bullet-list
      '(
        "●"
        "○"
        "◉"
        "✸"
        ))

(provide 'my-org-mode)
