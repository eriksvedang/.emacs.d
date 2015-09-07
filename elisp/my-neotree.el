;; Neotree (IDE-style file view)
(require 'neotree)

(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'ascii)

(custom-set-faces
 '(neo-banner-face ((t . (:inherit shadow))) t)
 '(neo-header-face ((t . (:inherit shadow))) t)
 '(neo-root-dir-face ((t . (:inherit link-visited :underline nil))) t)
 '(neo-dir-link-face ((t . (:inherit dired-directory))) t)
 '(neo-file-link-face ((t . (:inherit default))) t)
 '(neo-button-face ((t . (:inherit dired-directory))) t)
 '(neo-expand-btn-face ((t . (:inherit button))) t))

(setq my-neo-font-size 160)

(custom-set-faces
 (set-face-attribute 'neo-banner-face      nil :height my-neo-font-size)
 (set-face-attribute 'neo-header-face      nil :height my-neo-font-size)
 (set-face-attribute 'neo-root-dir-face    nil :height my-neo-font-size)
 (set-face-attribute 'neo-button-face      nil :height my-neo-font-size)
 (set-face-attribute 'neo-file-link-face   nil :height my-neo-font-size)
 (set-face-attribute 'neo-dir-link-face    nil :height my-neo-font-size)
 (set-face-attribute 'neo-header-face      nil :height my-neo-font-size)
 (set-face-attribute 'neo-expand-btn-face  nil :height my-neo-font-size))

(add-hook 'neotree-mode-hook
	  (lambda ()
	    (set-window-fringes (selected-window) 30 0 nil)))

;; (set-window-fringes (selected-window) 0 0 nil)
;;  :box '(:line-width 12 :color "red" :style nil)

(provide 'my-neotree)
