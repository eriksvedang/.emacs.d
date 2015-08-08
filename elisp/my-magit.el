(require 'magit)

(setq magit-last-seen-setup-instructions "1.4.0")

;; Got a warning on startup about setting this variable:
(setq magit-auto-revert-mode nil)
(setq magit-push-always-verify nil)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)	  
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'my-magit)
