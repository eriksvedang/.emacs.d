(require 'neotree)
(require 'all-the-icons)

(setq neo-theme 'icons)
(setq neo-window-width 30)
(setq neo-window-fixed-size t)
(setq neo-smart-open t) ;; open in folder of current buffer
(setq neo-mode-line-type 'default)
(setq neo-show-updir-line nil)

(add-hook 'neotree-mode-hook
          (lambda ()
            (setq truncate-lines 1)))

(global-set-key [f8] 'neotree-toggle)

(provide 'my-neotree)


