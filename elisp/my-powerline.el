;; Powerline (customize the 'mode line')
(require 'powerline)

(setq ns-use-srgb-colorspace nil) ;; DON'T MESS UP THE COLORS

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
                             (powerline-render rhs))))))

  ;; old röd: #ff3f60

  (set-face-attribute 'mode-line nil
		      :foreground "#fff" :background "#ff3377"
		      :inverse-video nil
		      :family "Hasklig"
		      :height 170
		      :box '(:line-width 3 :color "#ff3377" :style nil))

  (set-face-attribute 'mode-line-inactive nil
		      :foreground "gray90" :background "gray60"
		      :inverse-video nil
		      :box '(:line-width 3 :color "gray60" :style nil)))



(defun powerline-uber-theme ()
  "uber"
  (interactive)
  (setq-default mode-line-format
		'("%e"
		  (:eval
		   (let* ((active (powerline-selected-window-active))
			  (mode-line (if active 'mode-line 'mode-line-inactive))
			  (face1 (if active 'powerline-active1 'powerline-inactive1))
			  (face2 (if active 'powerline-active2 'powerline-inactive2))
			  (separator-left (intern (format "powerline-%s-%s"
							  (powerline-current-separator)
							  (car powerline-default-separator-dir))))
			  (separator-right (intern (format "powerline-%s-%s"
							   (powerline-current-separator)
							   (cdr powerline-default-separator-dir))))
			  (lhs (list (powerline-raw " %* " nil 'l)
				     ;; (powerline-buffer-size nil 'l)
				     (powerline-buffer-id nil 'l)
				     (powerline-raw " ")
				     (funcall separator-left mode-line face1)
				     (powerline-narrow face1 'l)
				     (powerline-vc face1)

				     (powerline-raw " " face1)
					(funcall separator-left face1 face2)
					(when (boundp 'erc-modified-channels-object)
					  (powerline-raw erc-modified-channels-object face2 'l))
					(powerline-major-mode face2 'l)
					(powerline-process face2)
					;; (powerline-raw " :" face2)
					;; (powerline-minor-modes face2 'l)
					(powerline-raw " " face2)
					(funcall separator-left face2 face1)))
			  
			  (rhs (list (powerline-raw global-mode-string face1 'r)
				     (powerline-raw "%4l" face1 'r)
				     (powerline-raw ":" face1)
				     (powerline-raw "%3c" face1 'r)
				     (funcall separator-right face1 mode-line)
				     (powerline-raw "    ")
				     (powerline-raw "%8p" nil 'r)
				     ;;(powerline-hud face2 face1)
				     ))
			  (center (list )))
		     (concat (powerline-render lhs)
			     (powerline-fill-center face1 (/ (powerline-width center) 2.0))
			     (powerline-render center)
			     (powerline-fill face1 (powerline-width rhs))
			     (powerline-render rhs))))))

  (set-face-attribute 'mode-line nil
              :foreground "#0CF" ;; 0C3
              :background "#000000"
	      ; :box '(:line-width 1 :color "#000" :style nil)
	      :box nil
              :weight 'normal
	      :height 170
	      )
  
  (set-face-attribute 'mode-line-buffer-id nil
              :foreground "white"
              :weight 'normal
	      )
  
  (set-face-attribute 'powerline-active1 nil
              :foreground "gray20"
              :background "gray80") ;; gray80

  (set-face-attribute 'powerline-active2 nil
	      :foreground "white"
	      :background "#00BF8F" ;; #0CF / #FF3377 / #567 / #0C8
	      :weight 'normal) 
  
  (set-face-attribute 'mode-line-inactive nil
              :foreground "gray90"
              :background "gray65"
              :box nil
              :weight 'bold)
  (set-face-attribute 'powerline-inactive1 nil
              :foreground "#aaa"
              :background "gray80")
  (set-face-attribute 'powerline-inactive2 nil
              :foreground "#ccc"
              :background "#eee")
  
  )


;;(powerline-erik-theme)
(powerline-uber-theme)

(provide 'my-powerline)
