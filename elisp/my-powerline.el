;; Powerline (customize the 'mode line')
(require 'powerline)

(defun powerline-erik-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
				     
                                     (powerline-raw "[" mode-line 'l)
                                     (powerline-major-mode mode-line)
                                     (powerline-process mode-line)
                                     (powerline-raw "]" mode-line)
				     
                                     ;; (when (buffer-modified-p)
                                     ;;   (powerline-raw "[+]" mode-line))
                                     ;; (when buffer-read-only
                                     ;;   (powerline-raw "[RO]" mode-line))
                                     ;; (powerline-raw "[%z]" mode-line)
                                     ;; ;; (powerline-raw (concat "[" (mode-line-eol-desc) "]") mode-line)
                                     ;; (when (and (boundp 'which-func-mode) which-func-mode)
                                     ;;   (powerline-raw which-func-format nil 'l))
                                     ;; (when (boundp 'erc-modified-channels-object)
                                     ;;   (powerline-raw erc-modified-channels-object face1 'l))
                                     ;; (powerline-raw "[" mode-line 'l)
                                     ;; (powerline-minor-modes mode-line)
                                     ;; (powerline-raw "%n" mode-line)
                                     ;; (powerline-raw "]" mode-line)
				     
                                     (when (and vc-mode buffer-file-name)
                                       (let ((backend (vc-backend buffer-file-name)))
                                         (when backend
                                           (concat (powerline-raw "[" mode-line 'l)
                                                   (powerline-raw (format "%s/%s" backend (vc-working-revision buffer-file-name backend)))
                                                   (powerline-raw "]" mode-line)))))))
                          (rhs (list
				;;(powerline-raw '(10 "%i"))
				;;(powerline-raw global-mode-string mode-line 'r)
				(powerline-raw "%l," mode-line 'l)
				(powerline-raw (format-mode-line '(8 "%c")))
				(powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r)
				))
			  )
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

(powerline-erik-theme)

(set-face-attribute 'mode-line nil
    :foreground "#fff" :background "#ff3f60"
    :inverse-video nil
    :family "Menlo"
    :height 160
    :box '(:line-width 4 :color "#ff3f60" :style nil))

(set-face-attribute 'mode-line-inactive nil
    :foreground "gray60" :background "gray30"
    :inverse-video nil
    :box '(:line-width 4 :color "gray30" :style nil))

;(set-face-attribute 'mode-line nil :foreground "#fff" :background "#0072b2" :box nil)
;(set-face-attribute 'mode-line-inactive nil :foreground "#666" :background "#050000" :box nil)

(provide 'my-powerline)
