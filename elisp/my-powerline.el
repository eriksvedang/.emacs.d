;; Powerline (customize the 'mode line')
(require 'powerline)

(setq ns-use-srgb-colorspace nil) ;; DON'T MESS UP THE COLORS

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
                                     (powerline-raw " " face2)
                                     (funcall separator-left face2 face1)))
			  
			  (rhs (list (powerline-raw global-mode-string face1 'r)
				     (powerline-raw "%4l" face1 'r)
				     (powerline-raw ":" face1)
				     (powerline-raw "%3c" face1 'r)
				     (funcall separator-right face1 mode-line)
				     (powerline-raw "    ")
				     (powerline-raw "%8p" nil 'r)))
			  (center (list )))
		     (concat (powerline-render lhs)
			     (powerline-fill-center face1 (/ (powerline-width center) 2.0))
			     (powerline-render center)
			     (powerline-fill face1 (powerline-width rhs))
			     (powerline-render rhs))))))

  (if (eq system-type 'darwin)
      (setq powerline-text-height-hack 170)
    (setq powerline-text-height-hack 130))
    
  (set-face-attribute 'mode-line nil
                      :foreground "#FFF" ;; #0BF
                      :background "#271c4b" ;; #234
                      :box nil
                      :weight 'normal
                      :height powerline-text-height-hack)
  
  (set-face-attribute 'mode-line-buffer-id nil
                      :foreground "white"
                      :weight 'normal)
  
  (set-face-attribute 'powerline-active1 nil
                      :foreground "#271c4b" ;; gray50
                      :background "gray92")  ;; #ccc

  (set-face-attribute 'powerline-active2 nil
                      :foreground "white"
                      :background "#271c4b" ;; #00BF8F #567
                      :weight 'normal) 
  
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "gray90"
                      :background "gray70"
                      :box nil
                      :weight 'bold)
  
  (set-face-attribute 'powerline-inactive1 nil
                      :foreground "#aaa"
                      :background "gray92")

  (set-face-attribute 'powerline-inactive2 nil
                      :foreground "gray95"
                      :background "gray85") 
  )

(powerline-uber-theme)

(setq powerline-height 24)

(provide 'my-powerline)
