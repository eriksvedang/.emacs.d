(require 'tabbar)
(tabbar-mode 0)

(defun my-tabbar-buffer-groups () ;; customize to show all normal files in one group
  "Returns the name of the tab group names the current buffer belongs to.
 There are two groups: Emacs buffers (those whose name starts with '*', plus dired buffers), and the rest."
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
	      ((eq major-mode 'dired-mode) "emacs")
	      (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;; Add text after buffers that has been modified (also add some spacing in the front to make it "centered")
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
    (if (buffer-modified-p (tabbar-tab-value tab))
      (concat " " (concat ad-return-value "* "))
      (concat " " (concat ad-return-value " ")))))

(defun on-saving-buffer ()
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

(defun on-modifying-buffer ()
  (set-buffer-modified-p (buffer-modified-p))
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

(defun after-modifying-buffer (begin end length)
  (set-buffer-modified-p (buffer-modified-p))
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

(add-hook 'after-save-hook 'on-saving-buffer)
(add-hook 'first-change-hook 'on-modifying-buffer)

(set-face-attribute
 'tabbar-default nil
 :background "white"
 :family "Menlo"
 :height 150)

(set-face-attribute
 'tabbar-modified nil
 :background "#DDD"
 :foreground "#09F"
 :box '(:line-width 5 :color "#DDD" :style nil))

(set-face-attribute
 'tabbar-selected nil
 :background "white"
 :foreground "black"
 :box '(:line-width 5 :color "white" :style nil))

(set-face-attribute
 'tabbar-selected-modified nil
 :background "white"
 :foreground "#09F"
 :box '(:line-width 5 :color "white" :style nil))

(set-face-attribute
 'tabbar-unselected nil
 :background "#DDD"
 :foreground "#888"
 :box '(:line-width 5 :color "#DDD" :style nil))
 
(set-face-attribute
 'tabbar-button nil
 :background "#FFF"
 :foreground "#000"
 :box '(:line-width 5 :color "white" :style nil))

(set-face-attribute
 'tabbar-separator nil
 :height 1.0
 :background "#FFF")
(setq tabbar-separator '(0.1))

(setq tabbar-use-images -1)
(setq tabbar-background-color "#DDD")

(setq
 tabbar-buffer-home-button (quote (("") ""))
 tabbar-scroll-left-button (quote (("") ""))  
 tabbar-scroll-right-button (quote (("") "")))

(global-set-key (kbd "<M-s-left>") 'tabbar-backward-tab)
(global-set-key (kbd "<M-s-right>") 'tabbar-forward-tab)

(defun switch-tabbar (num)
  (let* ((tabs (tabbar-tabs
                (tabbar-current-tabset)))
         (tab (nth
               (if (> num 0) (- num 1) (+ (length tabs) num))
               tabs)))
    (if tab (switch-to-buffer (car tab)))))

(global-set-key (kbd "s-§") 'tabbar-forward-group)
(global-set-key (kbd "s-1") (lambda () (interactive) (switch-tabbar 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (switch-tabbar 2)))
(global-set-key (kbd "s-3") (lambda () (interactive) (switch-tabbar 3)))
(global-set-key (kbd "s-4") (lambda () (interactive) (switch-tabbar 4)))
(global-set-key (kbd "s-5") (lambda () (interactive) (switch-tabbar 5)))
(global-set-key (kbd "s-6") (lambda () (interactive) (switch-tabbar 6)))
(global-set-key (kbd "s-7") (lambda () (interactive) (switch-tabbar 7)))
(global-set-key (kbd "s-8") (lambda () (interactive) (switch-tabbar 8)))
(global-set-key (kbd "s-9") (lambda () (interactive) (switch-tabbar 9)))
(global-set-key (kbd "s-0") (lambda () (interactive) (switch-tabbar -1)))

(global-set-key (kbd "s-w") (lambda ()
                              (interactive)
                              (kill-buffer (buffer-name))))

(provide 'my-tabbar)

